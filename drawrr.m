function[]= drawrr(p, center_location,L,H,phii)
center1=center_location(1);
center2=center_location(2);
R= ([cos(phii), -sin(phii); sin(phii), cos(phii)]);
X=([-L/2, L/2, L/2, -L/2]);
Y=([-H/2, -H/2, H/2, H/2]);
for i=1:4
T(:,i)=R*[X(i); Y(i)];
end
x_lower_left=center1+T(1,1);
x_lower_right=center1+T(1,2);
x_upper_right=center1+T(1,3);
x_upper_left=center1+T(1,4);
x_upper = (x_upper_left + x_upper_right)/2;
y_lower_left=center2+T(2,1);
y_lower_right=center2+T(2,2);
y_upper_right=center2+T(2,3);
y_upper_left=center2+T(2,4);
y_upper = (y_upper_left + y_upper_right)/2;
 x_coor=[x_lower_left x_lower_right x_upper_right x_upper_left];
 y_coor=[y_lower_left y_lower_right y_upper_right y_upper_left];
% x_coor=[x_lower_left x_lower_right x_upper];
% y_coor=[y_lower_left y_lower_right y_upper];
p.Vertices = [x_coor; y_coor]';
end