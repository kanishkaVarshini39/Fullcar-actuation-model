LFZO                         = 1 ;                
LCX                          = 1 ;                
LMUX                         = 1 ;                
LEX                          = 1 ;                
LKX                          = 1 ;                
LHX                          = 1 ;                
LVX                          = 1 ;                
LCY                          = 1 ;                
LMUY                         = 1 ;                
LEY                          = 1 ;                
LKY                          = 1 ;                
LHY                          = 1 ;                
LVY                          = 1 ;                
LTR                          = 1 ;                
LRES                         = 1 ;                
LXAL                         = 1 ;                
LYKA                         = 1 ;                
LVYKA                        = 1 ;                
LS                           = 1 ;                
LKYC                         = 1 ;                
LKZC                         = 1 ;                
LVMX                         = 1 ;                
LMX                          = 1 ;                
LMY                          = 1 ;                
LMP                          = 1 ;                

PCX1                         = 1.5767 ;           
PDX1                         = 2.3195 ;           
PDX2                         = -0.013452  ;       
PDX3                         = 5.96       ;       
PEX1                         = -3.637e-13 ;       
PEX2                         = -0.28217   ;       
PEX3                         = -0.6       ;       
PEX4                         = 0.9        ;       
PKX1                         = 40.5424    ;       
PKX2                         = 29.9974    ;       
PKX3                         = -1.0517    ;       
PHX1                         = 0.0004551  ;       
PHX2                         = 0.0029521  ;       
PVX1                         = -0.023894  ;       
PVX2                         = -0.1       ;       
PPX1                         = -0.85055   ;       
PPX2                         = -1.4069    ;       
PPX3                         = -0.26111   ;       
PPX4                         = 0.19634    ;       
RBX1                         = 13.8812    ;       
RBX2                         = 8.6651     ;       
RBX3                         = 216.1734   ;       
RCX1                         = 1.0438     ;       
REX1                         = 0.6709     ;       
REX2                         = 0.7907     ;       
RHX1                         = 0.0028779  ;       


kappa = linspace(-0.25, 0.25, 500);
Fz_values = [1080, 1180, 1280, 1380, 1480,1580];

figure;
hold on;
title('Longitudinal Force vs Slip Ratio ');
xlabel('\kappa (Slip Ratio)');
ylabel('F_x (Longitudinal Force) [N]');
grid on;


for i = 1:length(Fz_values)
    Fz = Fz_values(i);
    dfz = (Fz - LFZO * 1500) / (LFZO * 1500);
    mu_x = (PDX1 + PDX2 * dfz) * (1 - PDX3 * 0) * LMUX;
    Dx = mu_x * Fz;
    Ex = (PEX1 + PEX2 * dfz + PEX3 * dfz^2) .* (1 - PEX4 * sign(kappa)) * LEX;
    Kx = Fz * (PKX1 + PKX2 * dfz) * exp(PKX3 * dfz) * LKX;
    Cx = PCX1 * LCX;
    Bx = Kx ./ (Cx .* Dx);
    SHx = (PHX1 + PHX2 * dfz) * LHX;
    SVx = Fz * (PVX1 + PVX2 * dfz) * LVX * LMUX;
    kappa_x = kappa + SHx;
    term1 = Bx .* kappa_x;
    term2 = atan(term1);
    term3 = atan(Bx .* kappa_x - Ex .* (Bx .* kappa_x - term2));
    Fx0 = Dx .* sin(Cx .* term3) + SVx;

    plot(kappa, Fx0, 'DisplayName', sprintf('Fz = %d N', Fz), 'LineWidth', 1.5);
end

legend show;
hold off;
 


