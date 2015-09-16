function F = call(a)
    F = [0.3*cos(a(1))*cos(a(2))*cos(a(3))-0.3*sin(a)*sin(a(3))+0.29*cos(a)*sin(a(2))+0.1837;
        0.3*sin(a(2))*cos(a(3))-0.29*cos(a(2))+.2892;
        0.3*sin(a)*cos(a(2))*cos(a(3))+0.3*cos(a)*sin(a(3))+0.29*sin(a)*sin(a(2))-0.3791];
end