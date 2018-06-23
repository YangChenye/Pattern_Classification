function [x4,y4]=find_symmetry_p(x1,y1,x2,y2,x3,y3)

x4=(2*(y1-y2)*(x2-x3)+2*x2*(y2-y3)+((x2-x3)^2-(y2-y3))*x1)/((y2-y3)+(x2-x3)^2);
y4=-((x2-x3)/(y2-y3))*(x4-x1)+y1;
