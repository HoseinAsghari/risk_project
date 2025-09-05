function [components_descending_order,sensivity_formula,sensivity_value]=birnbaums(RBD_Id,time,test_interval)
syms t tau ;
[hp_details]=RBD(RBD_Id);
x=hp_details.x;
v=hp_details.v;
hp=hp_details.hp;
number_rv=length(x);
for ii=1:number_rv
    sensivity_formula(ii,1)=diff(hp,x(ii));
end
for ii=1:number_rv
    dh_v(ii,1)=subs(sensivity_formula(ii),x,v);
end

for ii=1:number_rv
    dh_v(ii,1)=vpa(subs(dh_v(ii),[t,tau],[time,test_interval]));
  
end
sensivity_value=dh_v;
[~,i]=sort(dh_v,"descend");
components_descending_order=i;
end