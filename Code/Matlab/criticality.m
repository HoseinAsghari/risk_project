function [components_descending_order,criticality_formula,criticality_value,hp_value,f_value]=criticality(RBD_Id,sensivity_formula,sensivity_value,time,test_interval)
syms t tau ;
[hp_details]=RBD(RBD_Id);
x=hp_details.x;
v=hp_details.v;
hp=hp_details.hp;
f=hp_details.f;
hp_value=subs(hp,x,v);
number_rv=length(x);
for ii=1:number_rv
    criticality_formula(ii,1)=sensivity_formula(ii)*(1-x(ii))/(1-hp);
    temp(ii,1)=sensivity_value(ii)*(1-v(ii))/(1-hp_value);
    temp(ii,1)=vpa(subs(temp(ii),[t,tau],[time,test_interval]));
   
end
criticality_value=temp;
[~,i]=sort(temp,"descend");
components_descending_order=i;
hp_value=vpa(subs(hp_value,[t,tau],[time,test_interval]));
f_value=vpa(subs(subs(f,x,v),[t,tau],[time,test_interval]));

end