[x,y] = meshgrid(-10:10,-10:10);                                
Z = 100.*(y-x.^2).^2 + (1-x).^2;
meshc(x,y,Z)
