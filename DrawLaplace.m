[X,Y] = meshgrid(-5:0.1:5);
s=X+1j*Y;
Z= abs(3./(s-3)+1./s);
mesh(X,Y,Z)