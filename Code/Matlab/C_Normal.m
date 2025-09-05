function [x_design,beta_final,pf]=C_Normal(gx_Id , m_x,Cx,beta_initial,tolerance , number_iteration)

beta=sym('beta','real');
[gx_details]=Limit_State(gx_Id);
x=gx_details.x;
y=gx_details.y;
z=gx_details.z;
g_x=gx_details.g_x;

[v,lm]=eig(Cx);
Xy=v*y;
g_y=subs(g_x,x,Xy);
mu=(v'*m_x);
sig=sqrt(diag(lm));


% transfer to standard space
number_rv=length(x);
A=diag(sig);
B=mu;
Yz=A*z+B ; % original space to std normal space

g_z=subs(g_y,y,Yz);

for ii=1:number_rv
    dg(ii)=diff(g_z,z(ii));
end

alpha_initial=sqrt(1/number_rv).*ones(number_rv,1);

for it=1:number_iteration
    it
    z_initial=alpha_initial.*beta_initial;
    x_initial=vpa(A*z_initial +B);
    dg_z=zeros(number_rv,1);
    for ii=1:number_rv
        dg_z(ii)=subs(dg(ii),z,z_initial);
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
    x_design = A*z_design + B;
    beta_final=beta_new;
    pf=normcdf(-beta_final,0,1);
end