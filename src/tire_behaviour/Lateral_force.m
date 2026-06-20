LFZO                         = 1;                 
LCX                          = 1;                 
LMUX                         = 1;                 
LEX                          = 1;                 
LKX                          = 1;                 
LHX                          = 1;                 
LVX                          = 1;                 
LCY                          = 1;                 
LMUY                         = 1;                 
LEY                          = 1;                 
LKY                          = 1;                 
LHY                          = 1;                 
LVY                          = 1;                 
LTR                          = 1;                 
LRES                         = 1;                 
LXAL                         = 1;                 
LYKA                         = 1;                 
LVYKA                        = 1;                 
LS                           = 1;                 
LKYC                         = 1;                 
LKZC                         = 1;                 
LVMX                         = 1;                 
LMX                          = 1;                 
LMY                          = 1;                 
LMP                          = 1; 
PCY1                         = 1.5;               
PDY1                         = 2.4672;            
PDY2                         = -0.5  ;            
PDY3                         = -10   ;            
PEY1                         = 0.55399;           
PEY2                         = 0.10101;           
PEY3                         = 0.56338;           
PEY4                         = 0.36202;           
PEY5                         = 204.3064;          
PKY1                         = -25.715 ;          
PKY2                         = 1.0629  ;          
PKY3                         = -1      ;          
PKY4                         = 2       ;          
PKY5                         = -20.9386;          
PKY6                         = -3.8651 ;          
PKY7                         = 1.6753  ;          
PHY1                         = 0.0025675;         
PHY2                         = 0.0057404;         
PVY1                         = 0.052848 ;         
PVY2                         = 0.18607  ;         
PVY3                         = 1.5008   ;         
PVY4                         = -2.3281  ;         
PPY1                         = 0.32248  ;         
PPY2                         = 1.4901   ;         
PPY3                         = -0.1723  ;         
PPY4                         = -0.13651 ;         
PPY5                         = 0.073706 ;         
RBY1                         = 33.099   ;         
RBY2                         = 22.1023  ;         
RBY3                         = 0.066873 ;         
RBY4                         = 90       ;         
RCY1                         = 0.93368  ;         
REY1                         = 0.76213 ;          
REY2                         = 0.45092 ;          
RHY1                         = 0.0128  ;          
RHY2                         = 0.02057 ;          
RVY1                         = 0       ;          
RVY2                         = 0       ;          
RVY3                         = 0       ;          
RVY4                         = 0      ;           
RVY5                         = 0       ;          
RVY6                         = 0        ;  

alpha = linspace(-250,250,500);
alpha_rad = deg2rad(alpha);

Fz_values = [1080, 1180, 1280, 1380, 1480,1580];

figure;
hold on;
title('Lateral Force vs Slip angle ');
xlabel('\alpha (Slip angle)');
ylabel('F_x (lateral Force) [N]');
grid on;


for i = 1:length(Fz_values)
    Fz = Fz_values(i);
    dfz = (Fz - LFZO * 1500) / (LFZO * 1500);
    mu_y = (PDY1 + PDY2 * dfz) * (1 - PDY3 * 0) * LMUY;
    Dy = mu_y * Fz;
    Ey = (PEY1 + PEY2 * dfz) .* (1 - PEY3 * sign(alpha_rad)) * LEY;
    Ky = PKY1*1500*sin(2*atan(Fz/(PKY2*1500*LFZO)))*LFZO*LKY;
    Cy = PCY1 * LCY;
    By = Ky ./ (Cy .* Dy);
    SHy = (PHY1 + PHY2 * dfz) * LHY;
    SVy = Fz * (PVY1 + PVY2 * dfz) * LVY * LMUY;
    alpha_y = alpha_rad + SHy;
    term1 = By .* alpha_y;
    term2 = atan(term1);
    term3 = atan(By .* alpha_y - Ey .* (By .* alpha_y - term2));
    Fy0 = Dy .* sin(Cy .* term3) + SVy;

    plot(alpha, Fy0, 'DisplayName', sprintf('Fz = %d N', Fz), 'LineWidth', 1.5);
end

legend show;
hold off;

