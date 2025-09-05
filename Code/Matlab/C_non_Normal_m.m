function [z_design,x_design,beta_final,alpha_initial,pf,g_z]=C_non_Normal(gx_Id , m_x,Cx,beta_initial,ind,tolerance , number_iteration)

beta=sym('beta','real');
[gx_details]=Limit_State(gx_Id);
x=gx_details.x;
y=gx_details.y;
z=gx_details.z;
g_x=gx_details.g_x;

% decoupling using eigen analysis
[~,indices] = sort(diag(cx),'ascend'); % Sort the eigenvalues and get the permutation indices
[v,lm]=eig(cx);
lm = lm(indices,indices); % Reorder the diagonal elements of D
v = v(:,indices); % Reorder the columns of V using the same indices

Xy=v*y;
mu=(v'*m_x);
sigma=sqrt(diag(lm));

number_rv=length(x);
for i=1:number_rv
    if (mu(i)<0 && (ind(i)==2 || ind(i)==3))
        v(:,i)=-1*v(:,i);
    end
end
mu=(v'*m_x);
sigma=sqrt(diag(lm));
g_y=subs(g_x,x,Xy);
% performance function in standard normal space and its derivations:

A=diag(sigma);
B=mu;

% rackwitts algorithm
yz=A*z+B ; % original space to std  space


alpha_initial=sqrt(1/number_rv).*ones(number_rv,1);

for it=1:number_iteration
    it
    z_initial=alpha_initial.*beta_initial;

    % convert to equivalent standard normal :

    y_sp =A*z_initial + B;
    mu_mod=zeros(number_rv,1);
    sigma_mod=zeros(number_rv,1);
    for ii=1:number_rv
        [meq,seq]=Eq_normal(y_sp(ii),mu(ii),sigma(ii),ind(ii));
        mu_mod(ii)=meq;
        sigma_mod(ii)=seq;
    end
    A_mod=diag(sigma_mod);
    B_mod=mu_mod;
    yz=A_mod*z+B_mod ; % original space to std normal space
    g_z=subs(g_y,y,yz);
    
    for ii=1:number_rv
        dg(ii,1)=diff(g_z,z(ii));
    end

    dg_z=zeros(number_rv,1);
    for ii=1:number_rv
        dg_z(ii,1)=subs(dg(ii),z,z_initial);
    end

    alpha_new= -dg_z./(norm(dg_z,2));
    z_new =alpha_new.*beta;

    g_z_new=subs(g_z,z,z_new);

    b_root=double(solve(g_z_new));
    beta_new=min(abs(b_root));
    error=abs(beta_new - beta_initial);
    beta_initial=beta_new;
    alpha_initial=alpha_new;
    if error<=tolerance
        break
    end
    z_design=alpha_new.*beta_new;
    y_design = A_mod*z_design + B_mod;
    x_design=v*y_design;
    beta_final=beta_new;
    pf=normcdf(-beta_final);
end