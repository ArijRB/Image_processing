function [ dest ] = rotationImage( source , angledeg)

% angles in deg
angle = angledeg/180*pi;

source=double(source);

% Rotation matrices
rot = [cos(angle) , -sin(angle) ; sin(angle) , cos(angle)];
roti = [cos(angle) , sin(angle) ; -sin(angle) , cos(angle)];

[w,h] = size(source);

% Source image corners
a = [1 ; h ];
b = [w ; 1 ];
c = [w;h];
d = [1;1];

% Projection of the cornbers

coin1 = rot * a;
coin2 = rot * b;
coin3 = rot * c;
coin4 = rot * d;

minx = min([coin1(1),coin2(1),coin3(1),coin4(1)]);
miny = min([coin1(2),coin2(2),coin3(2),coin4(2)]);
maxx = max([coin1(1),coin2(1),coin3(1),coin4(1)]);
maxy = max([coin1(2),coin2(2),coin3(2),coin4(2)]);


decx = floor(abs(minx))+1;
decy = floor(abs(miny))+1;

wd = floor(abs(minx))+1+floor(abs(maxx))+1;
hd = floor(abs(miny))+1+floor(abs(maxy))+1;


dest = zeros(wd,hd);
%dest(:,:) = 255;
dest(:,:) = 128;

vois = zeros(4,2);

for i=1:wd
    for j=1:hd
        pt = [i - decx ; j-decy];
        pts = roti * pt;
        
        % exact nearest neighbor
%         xf = floor(pts(1));
%         yf = floor(pts(2));
%         vois(1,:) = [ xf , yf];
%         vois(2,:) = [xf + 1 , yf ];
%         vois(3,:) = [ xf , yf + 1 ];
%         vois(4,:) = [xf + 1 , yf + 1 ];
%         M = repmat(pts,1,4);
%         dd = sum(M - vois').^2;
%         
%         [mini, imin] = min(dd);
%         
%         pts = vois(imin,:)';
        
        % approximate nearest neighbor : rounding each dimension
        pts = round(pts);
        
        if(pts(1)>0 & pts(1) <= w & pts(2)>0 & pts(2) <=h)
            dest(i,j) = source(pts(1),pts(2));
        end
        
    end
end


end

