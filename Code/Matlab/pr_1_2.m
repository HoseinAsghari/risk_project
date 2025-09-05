 clc;clear all;
[components_descending_order_sensivity,sensivity_formula,sensivity_value]=birnbaums(5,50000,240);
[components_descending_order_criticality,criticality_formula,criticality_value,hp,f]=criticality(5,sensivity_formula,sensivity_value,50000,240);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
temp=sensivity_value(components_descending_order_sensivity);
i=1;
j=i;
k=1;
n=length(components_descending_order_sensivity);
r=cell(n,1);
if(temp(1)==temp(2))
while(1)
    x=temp(i);
    if(j<16)
    if (j>1 && x~=temp(j+1) && x==temp(j-1))
        r(k,1)={components_descending_order_sensivity(i:j,1)'};
        j=j+1;
        i=j;
        k=k+1;
    elseif(j>1 && x~=temp(j+1)  && x~=temp(j-1))
        r(k,1)={components_descending_order_sensivity(i:j,1)'};
        j=j+1;
        i=j;
        k=k+1;
    
    else
        j=j+1;
    end
    elseif(j==16)
             r(k,1)={components_descending_order_sensivity(i:j,1)'};       
            break;
     end
        
    
     
end
else
    r(1,1)={components_descending_order_sensivity(1,1)};
        j=2;
        i=j;
        k=2;
        while(1)
    x=temp(i);
    if(j<16)
    if (j>1 && x~=temp(j+1) && x==temp(j-1))
        r(k,1)={components_descending_order_sensivity(i:j,1)'};
        j=j+1;
        i=j;
        k=k+1;
    elseif(j>1 && x~=temp(j+1)  && x~=temp(j-1))
        r(k,1)={components_descending_order_sensivity(i:j,1)'};
        j=j+1;
        i=j;
        k=k+1;
    
    else
        j=j+1;
    end
    elseif(j==16)
             r(k,1)={components_descending_order_sensivity(i:j,1)'};       
            break;
    end
        end
end

equal_value_components_descending_order_sensivity=r;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
temp=sensivity_value(components_descending_order_criticality);
i=1;
j=i;
k=1;
n=length(components_descending_order_criticality);
r=cell(n,1);

if(temp(1)==temp(2))
while(1)
    x=temp(i);
    if(j<16)
    if (j>1 && x~=temp(j+1) && x==temp(j-1))
        r(k,1)={components_descending_order_criticality(i:j,1)'};
        j=j+1;
        i=j;
        k=k+1;

    elseif(j>1 && x~=temp(j+1)  && x~=temp(j-1))
        r(k,1)={components_descending_order_criticality(i:j,1)'};
        j=j+1;
        i=j;
        k=k+1;
   
    
    else
        j=j+1;
    end
    elseif(j==16)

             r(k,1)={components_descending_order_criticality(i:j,1)'};       
            break;
     end
        
    
     
end
else
    r(1,1)={components_descending_order_criticality(1,1)};
        j=2;
        i=j;
        k=2;
        while(1)
    x=temp(i);
    if(j<16)
    if (j>1 && x~=temp(j+1) && x==temp(j-1))
        r(k,1)={components_descending_order_criticality(i:j,1)'};
        j=j+1;
        i=j;
        k=k+1;

    elseif(j>1 && x~=temp(j+1)  && x~=temp(j-1))
        r(k,1)={components_descending_order_criticality(i:j,1)'};
        j=j+1;
        i=j;
        k=k+1;
   
    
    else
        j=j+1;
    end
    elseif(j==16)

             r(k,1)={components_descending_order_criticality(i:j,1)'};       
            break;
     end
        
    
     
end
end

equal_value_components_descending_order_criticality=r;



