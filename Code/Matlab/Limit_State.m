function [LS_details]=Limit_State(LS_Id)
if LS_Id==1
    syms x1 x2 y1 y2 z1 z2 
    x=[x1;x2];
    y=[y1;y2];
    z=[z1;z2];

    g_x=(x1^0.5) - x2;
    LS_details.x=x;
    LS_details.y=y;
    LS_details.z=z;
    LS_details.g_x=g_x;
end
if LS_Id==6
    syms x1 x2 x3 z1 z2 z3 
    x=[x1;x2;x3];
    z=[z1;z2;z3];

    g_x=x1*x2 - 2*x3;
    LS_details.x=x;
    LS_details.z=z;
    LS_details.g_x=g_x;
end
if LS_Id==2
    syms x1 x2 y1 y2 z1 z2 
    x=[x1;x2];
    y=[y1;y2];
    z=[z1;z2];

    g_x=x1*x2 - 1140;
    LS_details.x=x;
    LS_details.y=y;
    LS_details.z=z;
    LS_details.g_x=g_x;
end
if LS_Id==8
    syms x1 x2 x3 x4 y1 y2 y3 y4 z1 z2 z3 z4
    x=[x1;x2;x3;x4];
    y=[y1;y2;y3;y4];
    z=[z1;z2;z3;z4];

    g_x=x1*x2 - 2*x3 -0.5*2*x4;
    LS_details.x=x;
    LS_details.y=y;
    LS_details.z=z;
    LS_details.g_x=g_x;
end
end