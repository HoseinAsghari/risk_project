function RBD(RBD_Id)

if RBD_Id==1
    # Define symbolic variables
    @variables t x11(t) x12(t) x13(t) x14(t) x15(t) x21(t) x22(t) x23(t) x24(t) x25(t) x26(t) x31(t) x32(t) x33(t) x34(t) x35(t) ;
    @variables X11 X12 X13 X14 X15 X21 X22 X23 X24 X25 X26 X31 X32 X33 X34 X35 ;

    # Define component reliability functions (exponential distributions)
    x11(t)=exp(-0.001*t);
    x12(t)=exp(-0.0055*t);
    x13(t)=exp(-0.0059*t);
    x14(t)=exp(-0.0022*t);
    x15(t)=exp(-0.001*t);
    x21(t)=exp(-0.00005*t);
    x22(t)=exp(-0.00005*t);
    x23(t)=exp(-0.00005*t);
    x24(t)=exp(-0.00001*t);
    x25(t)=exp(-0.00005*t);
    x26(t)=exp(-0.1*t);
    x31(t)=exp(-0.001*t);
    x32(t)=exp(-0.01*t);
    x33(t)=exp(-0.000001*t);
    x34(t)=exp(-0.01*t);
    x35(t)=exp(-0.01*t);

    # Define symbolic vector of component reliabilities
    x=[X11;X12;X13;X14;X15;X21;X22;X23;X24;X25;X26;X31;X32;X33;X34;X35];

    # Define vector of component reliability functions
    v=[x11(t);x12(t);x13(t);x14(t);x15(t);x21(t);x22(t);x23(t);x24(t);x25(t);x26(t);x31(t);x32(t);x33(t);x34(t);x35(t)];

    # Calculate overall system reliability (product of component reliabilities for a series system)
    hp=prod(x);

    # Calculate overall system failure probability (1 - reliability) but calculated as product of failures for verification purpose.
    f=prod(1-x);

    # Store results in the output structure
    hp_details.x=x;
    hp_details.v=v;
    hp_details.hp=hp;
    hp_details.f=f;
end

if RBD_Id==5 #just q_1 (t):Storage & Control has inspection  
    @variables t tau x11(t,tau) x12(t,tau) x13(t,tau) x14(t,tau) x15(t,tau) x21(t,tau) x22(t,tau) x23(t,tau) x24(t,tau) x25(t,tau) x26(t,tau) x31(t,tau) x32(t,tau) x33(t,tau) x34(t,tau) x35(t,tau) ;
    @variables X11 X12 X13 X14 X15 X21 X22 X23 X24 X25 X26 X31 X32 X33 X34 X35 ;
    x11(t,tau)=exp(-0.001*tau/2);
    x12(t,tau)=exp(-0.0055*tau/2);
    x13(t,tau)=exp(-0.0059*tau/2);
    x14(t,tau)=exp(-0.0022*tau/2);
    x15(t,tau)=exp(-0.001*tau/2);
    x21(t,tau)=exp(-0.00005*t);
    x22(t,tau)=exp(-0.00005*t);
    x23(t,tau)=exp(-0.00005*t);
    x24(t,tau)=exp(-0.00001*t);
    x25(t,tau)=exp(-0.00005*t);
    x26(t,tau)=exp(-0.1*t);
    x31(t,tau)=exp(-0.001*t);
    x32(t,tau)=exp(-0.01*t);
    x33(t,tau)=exp(-0.000001*t);
    x34(t,tau)=exp(-0.01*t);
    x35(t,tau)=exp(-0.01*t);
    x=[X11;X12;X13;X14;X15;X21;X22;X23;X24;X25;X26;X31;X32;X33;X34;X35];
    v=[x11(t,tau);x12(t,tau);x13(t,tau);x14(t,tau);x15(t,tau);x21(t,tau);x22(t,tau);x23(t,tau);x24(t,tau);x25(t,tau);x26(t,tau);x31(t,tau);x32(t,tau);x33(t,tau);x34(t,tau);x35(t,tau)];
    hp=1;
    for i=1:length(x)
        hp=hp*x(i);
    end
    f=1;
    for i=1:length(x)
        f=f*(1-x(i));
    end
    hp_details.x=x;
    hp_details.v=v;
    hp_details.hp=hp;
    hp_details.f=f;
end

if RBD_Id==6  #just q_2 (t): Distribution & Delivery has inspection  
    @variables t tau x11(t,tau) x12(t,tau) x13(t,tau) x14(t,tau) x15(t,tau) x21(t,tau) x22(t,tau) x23(t,tau) x24(t,tau) x25(t,tau) x26(t,tau) x31(t,tau) x32(t,tau) x33(t,tau) x34(t,tau) x35(t,tau) ;
    @variables X11 X12 X13 X14 X15 X21 X22 X23 X24 X25 X26 X31 X32 X33 X34 X35 ;
    x11(t,tau)=exp(-0.001*t);
    x12(t,tau)=exp(-0.0055*t);
    x13(t,tau)=exp(-0.0059*t);
    x14(t,tau)=exp(-0.0022*t);
    x15(t,tau)=exp(-0.001*t);
    x21(t,tau)=exp(-0.00005*tau/2);
    x22(t,tau)=exp(-0.00005*tau/2);
    x23(t,tau)=exp(-0.00005*tau/2);
    x24(t,tau)=exp(-0.00001*tau/2);
    x25(t,tau)=exp(-0.00005*tau/2);
    x26(t,tau)=exp(-0.1*tau/2);
    x31(t,tau)=exp(-0.001*t);
    x32(t,tau)=exp(-0.01*t);
    x33(t,tau)=exp(-0.000001*t);
    x34(t,tau)=exp(-0.01*t);
    x35(t,tau)=exp(-0.01*t);
    x=[X11;X12;X13;X14;X15;X21;X22;X23;X24;X25;X26;X31;X32;X33;X34;X35];
    v=[x11(t,tau);x12(t,tau);x13(t,tau);x14(t,tau);x15(t,tau);x21(t,tau);x22(t,tau);x23(t,tau);x24(t,tau);x25(t,tau);x26(t,tau);x31(t,tau);x32(t,tau);x33(t,tau);x34(t,tau);x35(t,tau)];
    hp=1;
    for i=1:length(x)
        hp=hp*x(i);
    end
    f=1;
    for i=1:length(x)
        f=f*(1-x(i));
    end
    hp_details.x=x;
    hp_details.v=v;
    hp_details.hp=hp;
    hp_details.f=f;
end

if RBD_Id==7  #both q_1 (t):Storage & Control and q_2 (t): Distribution & Delivery has inspection  
    @variables t tau x11(t,tau) x12(t,tau) x13(t,tau) x14(t,tau) x15(t,tau) x21(t,tau) x22(t,tau) x23(t,tau) x24(t,tau) x25(t,tau) x26(t,tau) x31(t,tau) x32(t,tau) x33(t,tau) x34(t,tau) x35(t,tau) ;
    @variables X11 X12 X13 X14 X15 X21 X22 X23 X24 X25 X26 X31 X32 X33 X34 X35 ;
    x11(t,tau)=exp(-0.001*tau/2);
    x12(t,tau)=exp(-0.0055*tau/2);
    x13(t,tau)=exp(-0.0059*tau/2);
    x14(t,tau)=exp(-0.0022*tau/2);
    x15(t,tau)=exp(-0.001*tau/2);
    x21(t,tau)=exp(-0.00005*tau/2);
    x22(t,tau)=exp(-0.00005*tau/2);
    x23(t,tau)=exp(-0.00005*tau/2);
    x24(t,tau)=exp(-0.00001*tau/2);
    x25(t,tau)=exp(-0.00005*tau/2);
    x26(t,tau)=exp(-0.1*tau/2);
    x31(t,tau)=exp(-0.001*t);
    x32(t,tau)=exp(-0.01*t);
    x33(t,tau)=exp(-0.000001*t);
    x34(t,tau)=exp(-0.01*t);
    x35(t,tau)=exp(-0.01*t);
    x=[X11;X12;X13;X14;X15;X21;X22;X23;X24;X25;X26;X31;X32;X33;X34;X35];
    v=[x11(t,tau);x12(t,tau);x13(t,tau);x14(t,tau);x15(t,tau);x21(t,tau);x22(t,tau);x23(t,tau);x24(t,tau);x25(t,tau);x26(t,tau);x31(t,tau);x32(t,tau);x33(t,tau);x34(t,tau);x35(t,tau)];
    hp=1;
    for i=1:length(x)
        hp=hp*x(i);
    end
    f=1;
    for i=1:length(x)
        f=f*(1-x(i));
    end
    hp_details.x=x;
    hp_details.v=v;
    hp_details.hp=hp;
    hp_details.f=f;
end

if RBD_Id==8  #just q_2,6(t):probability of failure of face mask has identical redundancy
    # Define symbolic variables
    @variables t tau x11(t,tau) x12(t,tau) x13(t,tau) x14(t,tau) x15(t,tau) x21(t,tau) x22(t,tau) x23(t,tau) x24(t,tau) x25(t,tau) x26(t,tau) x31(t,tau) x32(t,tau) x33(t,tau) x34(t,tau) x35(t,tau) ;
    @variables X11 X12 X13 X14 X15 X21 X22 X23 X24 X25 X26 X31 X32 X33 X34 X35 ;

    # Define component reliability functions
    x11(t,tau)=exp(-0.001*t);
    x12(t,tau)=exp(-0.0055*t);
    x13(t,tau)=exp(-0.0059*t);
    x14(t,tau)=exp(-0.0022*t);
    x15(t,tau)=exp(-0.001*t);
    x21(t,tau)=exp(-0.00005*t);
    x22(t,tau)=exp(-0.00005*t);
    x23(t,tau)=exp(-0.00005*t);
    x24(t,tau)=exp(-0.00001*t);
    x25(t,tau)=exp(-0.00005*t);
    x26(t,tau)=2*exp(-0.1*t) -exp(-2*0.1*t);#### changed to parallel: two components in parallel
    x31(t,tau)=exp(-0.001*t);
    x32(t,tau)=exp(-0.01*t);
    x33(t,tau)=exp(-0.000001*t);
    x34(t,tau)=exp(-0.01*t);
    x35(t,tau)=exp(-0.01*t);

    # Define symbolic vector of component reliabilities
    x=[X11;X12;X13;X14;X15;X21;X22;X23;X24;X25;X26;X31;X32;X33;X34;X35];

    # Define vector of component reliability functions
    v=[x11(t,tau);x12(t,tau);x13(t,tau);x14(t,tau);x15(t,tau);x21(t,tau);x22(t,tau);x23(t,tau);x24(t,tau);x25(t,tau);x26(t,tau);x31(t,tau);x32(t,tau);x33(t,tau);x34(t,tau);x35(t,tau)];

    # Calculate overall system reliability (product of component reliabilities)
    hp=prod(x);

    # Calculate overall system failure probability (1 - reliability) but calculated as product of failures for verification purpose.
    f=prod(1-x);

    # Store results in the output structure
    hp_details.x=x;
    hp_details.v=v;
    hp_details.hp=hp;
    hp_details.f=f;
end

if RBD_Id==9 #both q_1 (t):Storage & Control has inspection  and q_2,6(t):probability of failure of face mask has identical redundancy
    @variabless t tau x11(t,tau) x12(t,tau) x13(t,tau) x14(t,tau) x15(t,tau) x21(t,tau) x22(t,tau) x23(t,tau) x24(t,tau) x25(t,tau) x26(t,tau) x31(t,tau) x32(t,tau) x33(t,tau) x34(t,tau) x35(t,tau) ;
    @variables X11 X12 X13 X14 X15 X21 X22 X23 X24 X25 X26 X31 X32 X33 X34 X35 ;
    x11(t,tau)=exp(-0.001*tau/2);
    x12(t,tau)=exp(-0.0055*tau/2);
    x13(t,tau)=exp(-0.0059*tau/2);
    x14(t,tau)=exp(-0.0022*tau/2);
    x15(t,tau)=exp(-0.001*tau/2);
    x21(t,tau)=exp(-0.00005*t);
    x22(t,tau)=exp(-0.00005*t);
    x23(t,tau)=exp(-0.00005*t);
    x24(t,tau)=exp(-0.00001*t);
    x25(t,tau)=exp(-0.00005*t);
    x26(t,tau)=2*exp(-0.1*t) -exp(-2*0.1*t);# changed to parallel
    x31(t,tau)=exp(-0.001*t);
    x32(t,tau)=exp(-0.01*t);
    x33(t,tau)=exp(-0.000001*t);
    x34(t,tau)=exp(-0.01*t);
    x35(t,tau)=exp(-0.01*t);
    x=[X11;X12;X13;X14;X15;X21;X22;X23;X24;X25;X26;X31;X32;X33;X34;X35];
    v=[x11(t,tau);x12(t,tau);x13(t,tau);x14(t,tau);x15(t,tau);x21(t,tau);x22(t,tau);x23(t,tau);x24(t,tau);x25(t,tau);x26(t,tau);x31(t,tau);x32(t,tau);x33(t,tau);x34(t,tau);x35(t,tau)];
    hp=1;
    for i=1:length(x)
        hp=hp*x(i);
    end
    f=1;
    for i=1:length(x)
        f=f*(1-x(i));
    end
    hp_details.x=x;
    hp_details.v=v;
    hp_details.hp=hp;
    hp_details.f=f;
end

if RBD_Id==10  #both q_2 (t): Distribution & Delivery has inspection  and q_2,6(t):probability of failure of face mask has identical redundancy
    @variables t tau x11(t,tau) x12(t,tau) x13(t,tau) x14(t,tau) x15(t,tau) x21(t,tau) x22(t,tau) x23(t,tau) x24(t,tau) x25(t,tau) x26(t,tau) x31(t,tau) x32(t,tau) x33(t,tau) x34(t,tau) x35(t,tau) ;
    @variables X11 X12 X13 X14 X15 X21 X22 X23 X24 X25 X26 X31 X32 X33 X34 X35 ;
    x11(t,tau)=exp(-0.001*t);
    x12(t,tau)=exp(-0.0055*t);
    x13(t,tau)=exp(-0.0059*t);
    x14(t,tau)=exp(-0.0022*t);
    x15(t,tau)=exp(-0.001*t);
    x21(t,tau)=exp(-0.00005*tau/2);
    x22(t,tau)=exp(-0.00005*tau/2);
    x23(t,tau)=exp(-0.00005*tau/2);
    x24(t,tau)=exp(-0.00001*tau/2);
    x25(t,tau)=exp(-0.00005*tau/2);
    x26(t,tau)=2*exp(-0.1*t) -exp(-2*0.1*t);## changed to parallel
    x31(t,tau)=exp(-0.001*t);
    x32(t,tau)=exp(-0.01*t);
    x33(t,tau)=exp(-0.000001*t);
    x34(t,tau)=exp(-0.01*t);
    x35(t,tau)=exp(-0.01*t);
    x=[X11;X12;X13;X14;X15;X21;X22;X23;X24;X25;X26;X31;X32;X33;X34;X35];
    v=[x11(t,tau);x12(t,tau);x13(t,tau);x14(t,tau);x15(t,tau);x21(t,tau);x22(t,tau);x23(t,tau);x24(t,tau);x25(t,tau);x26(t,tau);x31(t,tau);x32(t,tau);x33(t,tau);x34(t,tau);x35(t,tau)];
    hp=1;
    for i=1:length(x)
        hp=hp*x(i);
    end
    f=1;
    for i=1:length(x)
        f=f*(1-x(i));
    end
    hp_details.x=x;
    hp_details.v=v;
    hp_details.hp=hp;
    hp_details.f=f;
end

if RBD_Id==11  #all q_1 (t):Storage & Control and q_2 (t): Distribution & Delivery has inspection and q_2,6(t):probability of failure of face mask has identical redundancy 
    @variables t tau x11(t,tau) x12(t,tau) x13(t,tau) x14(t,tau) x15(t,tau) x21(t,tau) x22(t,tau) x23(t,tau) x24(t,tau) x25(t,tau) x26(t,tau) x31(t,tau) x32(t,tau) x33(t,tau) x34(t,tau) x35(t,tau) ;
    @variables X11 X12 X13 X14 X15 X21 X22 X23 X24 X25 X26 X31 X32 X33 X34 X35 ;
    x11(t,tau)=exp(-0.001*tau/2);
    x12(t,tau)=exp(-0.0055*tau/2);
    x13(t,tau)=exp(-0.0059*tau/2);
    x14(t,tau)=exp(-0.0022*tau/2);
    x15(t,tau)=exp(-0.001*tau/2);
    x21(t,tau)=exp(-0.00005*tau/2);
    x22(t,tau)=exp(-0.00005*tau/2);
    x23(t,tau)=exp(-0.00005*tau/2);
    x24(t,tau)=exp(-0.00001*tau/2);
    x25(t,tau)=exp(-0.00005*tau/2);
    x26(t,tau)=2*exp(-0.1*t) -exp(-2*0.1*t);### changed to parallel
    x31(t,tau)=exp(-0.001*t);
    x32(t,tau)=exp(-0.01*t);
    x33(t,tau)=exp(-0.000001*t);
    x34(t,tau)=exp(-0.01*t);
    x35(t,tau)=exp(-0.01*t);
    x=[X11;X12;X13;X14;X15;X21;X22;X23;X24;X25;X26;X31;X32;X33;X34;X35];
    v=[x11(t,tau);x12(t,tau);x13(t,tau);x14(t,tau);x15(t,tau);x21(t,tau);x22(t,tau);x23(t,tau);x24(t,tau);x25(t,tau);x26(t,tau);x31(t,tau);x32(t,tau);x33(t,tau);x34(t,tau);x35(t,tau)];
    hp=1;
    for i=1:length(x)
        hp=hp*x(i);
    end
    f=1;
    for i=1:length(x)
        f=f*(1-x(i));
    end
    hp_details.x=x;
    hp_details.v=v;
    hp_details.hp=hp;
    hp_details.f=f;
end

end