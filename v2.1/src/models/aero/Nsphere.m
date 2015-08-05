%   Nsphere.m:  Matlab M-file to compute the drag coefficient on a sphere
%   using Newtonian theory for hypersonic flow.
%
%   The sphere is centered on (x,y,z) = (1,0,0).  The "leading edge"
%   is at (x,y,z) = (0,0,0) and the trailing edge is at (x,y,z) = (2,0,0).
%   The reference area for the drag coefficient is the cross sectional
%   area of the sphere.
%
clear all;
close all;
clc;
Rb = 2.5146;
%
%...Define the outer mold line
%
%   (x0,y0) define the center of the circle defining the arc
%   (x1,y1) define the start of the circular arc
%   (x2,y2) define the end of the circular arc
%
Rn = 6.035;
x0 = Rn;
y0 = 0.0;
x1 = 0.0;
y1 = 0.0;
x2 = 0.4812;
y2 = 2.3615;
npts = 30;
theta1 = atan2(y1-y0,x1-x0);
theta2 = atan2(y2-y0,x2-x0);
theta = linspace(theta1,theta2,npts);
x = x0 + Rn*cos(theta);
y = y0 + Rn*sin(theta);

Rs = 0.2515;
x0 = 0.7126;
y0 = 2.5146 - Rs;
x1 = 0.4812;
y1 = 2.3615;
x2 = 0.7126;
y2 = 2.5146;
npts = 8;
theta1 = atan2(y1-y0,x1-x0);
theta2 = atan2(y2-y0,x2-x0);
theta = linspace(theta1,theta2,npts);
x = [x, x0 + Rs*cos(theta)];
y = [y, y0 + Rs*sin(theta)];

Rs = 0.2515;
x0 = 0.7126;
y0 = 2.5146 - Rs;
x1 = 0.7126;
y1 = 2.5146;
x2 = 0.8477;
y2 = 2.4752;
npts = 8;
theta1 = atan2(y1-y0,x1-x0);
theta2 = atan2(y2-y0,x2-x0);
theta = linspace(theta1,theta2,npts);
x = [x, x0 + Rs*cos(theta)];
y = [y, y0 + Rs*sin(theta)];

x1 = 0.8477;
y1 = 2.4752;
x2 = 3.2785;
y2 = 0.9266;
npts = 5;
theta1 = linspace(x1, x2, npts);
theta2 = linspace(y1, y2, npts);
x = [x, theta1];
y = [y, theta2];

Ras = 0.0508;
x0 = 3.251;
y0 = 0.884;
x1 = 3.2785;
y1 = 0.9266;
x2 = 3.3020;
y2 = 0.8838;
npts = 4;
theta1 = atan2(y1-y0,x1-x0);
theta2 = atan2(y2-y0,x2-x0);
theta = linspace(theta1,theta2,npts);
x = [x, x0 + Ras*cos(theta)];
y = [y, y0 + Ras*sin(theta)];

x1 = 3.3020;
y1 = 0.8838;
x2 = 3.3020;
y2 = 0;
npts = 6;
theta1 = linspace(x1, x2, npts);
theta2 = linspace(y1, y2, npts);
x = [x, theta1];
y = [y, theta2];
ni = length(x);
%
%...Plot the outer mold line
%
figure(1)
plot(x,y,'-o')
axis('equal')
xlabel('x')
ylabel('y')
%
%...Define the axisymmetric surface generated from the mold line
%
nj = 2*ni-1;
tt = linspace(0,2*pi,nj);
for i=1:ni
for j=1:nj
   xx(i,j) = x(i);
   rr(i,j) = y(i);
   yy(i,j) = rr(i,j)*cos(tt(j));
   zz(i,j) = rr(i,j)*sin(tt(j));
end
end
%
figure(2)
surfl(xx,yy,zz)
colormap(gray)
axis('equal')
%
%...Define the ceters of each surface panel
%
for i=1:ni-1
for j=1:nj-1
   xm(i,j) = 0.25*(xx(i,j)+xx(i+1,j)+xx(i,j+1)+xx(i+1,j+1));
   ym(i,j) = 0.25*(yy(i,j)+yy(i+1,j)+yy(i,j+1)+yy(i+1,j+1));
   zm(i,j) = 0.25*(zz(i,j)+zz(i+1,j)+zz(i,j+1)+zz(i+1,j+1));
end
end
%
figure(3)
surfl(xx,yy,zz)
colormap(gray)
hold on
plot3(xm,ym,zm,'o')
axis('equal')
%
%...Define the unit normal vectors in the middle of each panel
%
for i=1:ni-1
for j=1:nj-1
   ux = xx(i+1,j+1) - xx(i,j);
   uy = yy(i+1,j+1) - yy(i,j);
   uz = zz(i+1,j+1) - zz(i,j);
   vx = xx(i,j+1) - xx(i+1,j);
   vy = yy(i,j+1) - yy(i+1,j);
   vz = zz(i,j+1) - zz(i+1,j);
   nx(i,j) = uy*vz - uz*vy;
   ny(i,j) = uz*vx - ux*vz;
   nz(i,j) = ux*vy - uy*vx;
   nn = sqrt(nx(i,j)^2+ny(i,j)^2+nz(i,j)^2);
   nx(i,j) = - nx(i,j)/nn;
   ny(i,j) = - ny(i,j)/nn;
   nz(i,j) = - nz(i,j)/nn;
end
end
%
figure(4)
quiver3(xm,ym,zm,nx,ny,nz,1.0)
hold on
surfl(xx,yy,zz)
colormap(gray)
axis('equal')
hold off
%
%...Compute and plot Cp
%
for i=1:ni-1
for j=1:nj-1
   ndotfree = -nx(i,j);
   if ndotfree > 0,
      cp(i,j) = 2*ndotfree^2;
   else
      cp(i,j) = 0.0;
   end
end
end
%
figure(5)
% surf(xm,ym,zm,cp)
surf(xx,yy,zz,cp)
colormap('default')
colorbar
axis('equal')
%
%...Compute the drag coefficient
%
Aref = pi*Rb^2;
cd = 0.0;
for i=1:ni-1
for j=1:nj-1
%......find the area of the panel
   dl1 = sqrt((xx(i,j)-xx(i+1,j))^2 ...
       + (yy(i,j)-yy(i+1,j))^2 ...
       + (zz(i,j)-zz(i+1,j))^2);
   dl2 = 0.5*(sqrt((xx(i,j)-xx(i,j+1))^2 ...
       + (yy(i,j)-yy(i,j+1))^2 ...
       + (zz(i,j)-zz(i,j+1))^2) ...
       + sqrt((xx(i+1,j)-xx(i+1,j+1))^2 ...
       + (yy(i+1,j)-yy(i+1,j+1))^2 ...
       + (zz(i+1,j)-zz(i+1,j+1))^2));
   ds = dl1.*dl2;
   ndotfree = -nx(i,j);
   cd = cd + cp(i,j).*ndotfree.*ds./Aref;
end
end
disp(['Drag coefficient = ',num2str(cd)]);
