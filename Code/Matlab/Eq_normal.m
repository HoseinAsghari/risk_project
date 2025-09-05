function [mu_eq , sigma_eq]=Eq_normal(X_star,mu,sigma,Id)
if Id==1 % normal 
    mu_eq=mu;
    sigma_eq=sigma;
end
if Id==2 % log normal 
    dx=sigma/mu;
    sigma_lnx=sqrt(log(dx^2 + 1));
    x_bar=mu*exp(-(sigma_lnx^2)/2);
    mu_eq=X_star*(1-log(X_star)+log(x_bar)) ;
    sigma_eq=X_star*sigma_lnx;
end
if Id==3 % gamma
    help=icdf('Normal',gamcdf(X_star,(mu/sigma)^2,((sigma)^2)/mu),0,1);
    sigma_eq= normpdf(help,0,1)/gampdf(X_star,(mu/sigma)^2,((sigma)^2)/mu);
    mu_eq=X_star - sigma_eq*help;
end
end