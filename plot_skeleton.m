function plot_skeleton( skeleton, min_x, max_x, min_y, max_y, min_z, max_z  )
%PLOT_SKELETON skeleton figure
% plot_skeleton(posMat(k,:,:,:))
% 
% Author: Samo Sela
% e-mail: samo.sela-at-gmail.com

    %=======================
    % Original structure
	%x = skeleton(1,1,:,1);
	%y = skeleton(1,1,:,2);
	%z = skeleton(1,1,:,3);
    %=======================
	x =	skeleton(1,:,1);
	y = skeleton(1,:,2);
	z = skeleton(1,:,3);
    
	clf;
	scatter3(x,z,y);
    if(nargin == 7)
        axis([min_x max_x min_y max_y min_z max_z])
    end
    % axis auto
	hold on;
	
	% HEAD, NECK
	draw_limb( [x(1), y(1), z(1)] , [x(2), y(2), z(2)] );
	
	% NECK, LEFT_SHOULDER
	draw_limb( [x(2), y(2), z(2)] , [x(4), y(4), z(4)] );
	% LEFT_SHOULDER, LEFT_ELBOW
	draw_limb( [x(4), y(4), z(4)] , [x(5), y(5), z(5)] );
	% LEFT_ELBOW, LEFT_HAND
	draw_limb( [x(5), y(5), z(5)] , [x(6), y(6), z(6)] );

	% NECK, RIGHT_SHOULDER
	draw_limb( [x(2), y(2), z(2)] , [x(7), y(7), z(7)] );
	% RIGHT_SHOULDER, RIGHT_ELBOW
	draw_limb( [x(7), y(7), z(7)] , [x(8), y(8), z(8)] );
	% RIGHT_ELBOW, RIGHT_HAND
	draw_limb( [x(8), y(8), z(8)] , [x(9), y(9), z(9)] );

	% LEFT_SHOULDER, TORSO
	draw_limb( [x(4), y(4), z(4)] , [x(3), y(3), z(3)] );
	% RIGHT_SHOULDER, TORSO
	draw_limb( [x(7), y(7), z(7)] , [x(3), y(3), z(3)] );

	% TORSO, LEFT_HIP
	draw_limb( [x(3), y(3), z(3)] , [x(10), y(10), z(10)] );
	% LEFT_HIP, LEFT_KNEE
	draw_limb( [x(10), y(10), z(10)] , [x(11), y(11), z(11)] );
	% LEFT_KNEE, LEFT_FOOT
	draw_limb( [x(11), y(11), z(11)] , [x(12), y(12), z(12)] );

	% TORSO, RIGHT_HIP
	draw_limb( [x(3), y(3), z(3)] , [x(13), y(13), z(13)] );
	% RIGHT_HIP, RIGHT_KNEE
	draw_limb( [x(13), y(13), z(13)] , [x(14), y(14), z(14)] );
	% RIGHT_KNEE, RIGHT_FOOT
	draw_limb( [x(14), y(14), z(14)] , [x(15), y(15), z(15)] );

	% LEFT_HIP, RIGHT_HIP
	draw_limb( [x(10), y(10), z(10)] , [x(13), y(13), z(13)] );

	hold off;
end %function plot_skeleton

function draw_limb(joint1, joint2) 
	lx = linspace(joint1(1),joint2(1),100);
	ly = linspace(joint1(2),joint2(2),100);
	lz = linspace(joint1(3),joint2(3),100);

	plot3(lx,lz,ly,'b');
end %function draw_limb