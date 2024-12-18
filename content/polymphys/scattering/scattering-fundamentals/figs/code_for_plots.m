%% figure for Model 1

xmax = 3.5;
x = 0:0.01:xmax;
y = cos(2*pi*x);

plot(x,y,'LineWidth',2)
box off
ax = gca;
ax.XAxisLocation = "origin";
ax.YAxisLocation = "origin";

xticks(0:1:xmax);
xticklabels({'0', '\lambda', '2\lambda',  '3\lambda', '4\lambda'})
yticks((-1):1:1)
yticklabels({'-E_0','0','E_0'})

set(gca,'LineWidth',2,'YLim',[-1.2 1.2],'XLim',[0 xmax],'FontSize',16)
set(gcf,'Units','inches','Position',[1 1 5.5 2])

%% figure for CTQ 7 (adding in phase and out of phase waves)

y1 = cos(2*pi*x);
y2 = cos(2*pi*x + pi);

figure(1)
plot(x,y1+y2,'LineWidth',2)
box off
ax = gca;
ax.XAxisLocation="origin";
ax.YAxis.Visible = 'off';
set(ax,'YLim',[-2 2],'XTick',[])
set(gcf,'Units','inches','Position',[1 1 5.5 2])

%% figure for model 2

lambda = 1;
x_step = 0.05;
d = 0.8;
n_nominal = 3.75;

del_x_n = 0.5;
theta_half = asin(del_x_n*lambda/(2*d));
E0 = 0.3;

vec_1_x_left = lambda*(0:x_step:n_nominal);
vec_1_x_right = lambda*(n_nominal:x_step:(2*n_nominal));
vec_2_x_left = lambda*(0:x_step:(n_nominal+del_x_n/2));
vec_2_x_right = lambda*((n_nominal+del_x_n/2):x_step:(2*n_nominal+del_x_n));

vec_1_y_left = 0*vec_1_x_left;
vec_1_y_right = 0*vec_1_x_right;
vec_1_E_left = E0*cos( 2*pi*vec_1_x_left/lambda );
vec_1_E_right = E0*cos(2*pi*vec_1_x_right/lambda );

vec_2_y_left = 0*vec_2_x_left;
vec_2_y_right = 0*vec_2_x_right;
vec_2_E_left = E0*cos( 2*pi*vec_2_x_left/lambda );
vec_2_E_right = E0*cos(2*pi*vec_2_x_right/lambda );

R_left = [cos(theta_half) sin(theta_half); -sin(theta_half) cos(theta_half)];
R_right = [cos(theta_half) -sin(theta_half); sin(theta_half) cos(theta_half)];

vec_1_xy_left_rot = R_left*[ vec_1_x_left; vec_1_y_left ];
vec_1_xE_left_rot = R_left*[ vec_1_x_left; vec_1_E_left ];
vec_2_xy_left_rot = R_left*[ vec_2_x_left; vec_2_y_left ];
vec_2_xE_left_rot = R_left*[ vec_2_x_left; vec_2_E_left ];

vec_1_xy_right_rot = R_right*[ vec_1_x_right; vec_1_y_right ];
vec_1_xE_right_rot = R_right*[ vec_1_x_right; vec_1_E_right ];
vec_2_xy_right_rot = R_right*[ vec_2_x_right; vec_2_y_right ];
vec_2_xE_right_rot = R_right*[ vec_2_x_right; vec_2_E_right ];

figure(1)
clf

% plot the scattering centers
plot([0,0],[0,-d],'o','MarkerFaceColor','k','MarkerSize',10)
hold on

% plot all of the lines and waves
plot(vec_1_xy_left_rot(1,:)-vec_1_xy_left_rot(1,end), vec_1_xy_left_rot(2,:)-vec_1_xy_left_rot(2,end),'Color','k')
plot(vec_1_xE_left_rot(1,:)-vec_1_xy_left_rot(1,end), vec_1_xE_left_rot(2,:)-vec_1_xy_left_rot(2,end),'Color','r','LineWidth',2)
plot(vec_2_xy_left_rot(1,:)-vec_2_xy_left_rot(1,end), vec_2_xy_left_rot(2,:)-vec_2_xy_left_rot(2,end)-d,'Color','k')
plot(vec_2_xE_left_rot(1,:)-vec_2_xy_left_rot(1,end), vec_2_xE_left_rot(2,:)-vec_2_xy_left_rot(2,end)-d,'Color','r','LineWidth',2)

plot(vec_1_xy_right_rot(1,:)-vec_1_xy_right_rot(1,1), vec_1_xy_right_rot(2,:)-vec_1_xy_right_rot(2,1),'Color','k')
plot(vec_1_xE_right_rot(1,:)-vec_1_xy_right_rot(1,1), vec_1_xE_right_rot(2,:)-vec_1_xy_right_rot(2,1),'Color','r','LineWidth',2)
plot(vec_2_xy_right_rot(1,:)-vec_2_xy_right_rot(1,1), vec_2_xy_right_rot(2,:)-vec_2_xy_right_rot(2,1)-d,'Color','k')
plot(vec_2_xE_right_rot(1,:)-vec_2_xy_right_rot(1,1), vec_2_xE_right_rot(2,:)-vec_2_xy_right_rot(2,1)-d,'Color','r','LineWidth',2)

% finally, fix plot formatting
box off
ax = gca
ax.XAxis.Visible = 'off';
set(gca,'DataAspectRatio',[1 1 1])
ax.YAxis.Visible = 'off';
set(gca,'DataAspectRatio',[1 1 1])

%% scattering angles fig (note: fig made in illustrator, this is just the calculation of the solutions)

lambda = 500;
d = 650;

n = 0:10;

theta_rad = 2*asin(lambda*n/(2*d));
theta_deg = theta_rad*180/pi;

figure(1)
clf
plot( cos(0:0.01:pi), sin(0:0.01:pi), '-','Color','k')
hold on
for i = 1:length(n)
    if( real(theta_rad(i) > 0.9999*pi))
        continue;
    end
    plot(cos(theta_rad(i)), sin(theta_rad(i)), 'o','MarkerFaceColor','r')
end

set(gca,'XLim',[-1 1],'YLim',[0 1],'DataAspectRatio', [1 1 1])