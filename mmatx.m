function MuelMtx = mmatx(retardance, rot_angle)

retardance = retardance * pi/180;
rot_angle = rot_angle * pi/180;

G = .5*(1+cos(retardance));
H = .5*(1-cos(retardance));

MuelMtx = [1, 0, 0, 0; 0 G+H*cos(4*rot_angle) H*sin(4*rot_angle) sin(retardance)*sin(2*rot_angle);...
    0, H*sin(4*rot_angle), G-H*cos(4*rot_angle), -sin(retardance)*cos(2*rot_angle);...
    0, -sin(retardance)*sin(2*rot_angle), sin(retardance)*cos(2*rot_angle), cos(retardance)];