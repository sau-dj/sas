ODS HTML;
ODS LISTING CLOSE;
ODS GRAPHICS ON;
LIBNAME HW3 'E:\users\kxd180034\Desktop\SAS\Assignment 3';
/* 2 */
data videogames;
set HW3.videogamesales_main;
critic = critic_score*critic_count;
user = user_score*user_count;
if Rating = "E" then r1 = 1; else r1 = 0;
if Rating = "E10+" then r2 = 1; else r2 = 0;
if Rating = "T" then r3 = 1; else r3 = 0;
if Rating = "M" then r4 = 1; else r4 = 0;
if Genre = "Sports" then g1 = 1; else g1 = 0;
if Genre = "Platform" then g2 = 1; else g2 = 0;
if Genre = "Action" then g3 = 1; else g3 = 0;
if Genre = "Shooter" then g4 = 1; else g4 = 0;
if Genre = "Puzzle" then g5 = 1; else g5 = 0;
if Genre = "Role-Playing" then g6 = 1; else g6 = 0;
if Genre = "Adventure" then g7 = 1; else g7 = 0;
if Genre = "Misc" then g8 = 1; else g8 = 0;
if Genre = "Racing" then g9 = 1; else g9 = 0;
if Genre = "Simulation" then g10 = 1; else g10 = 0;
if Genre = "Strategy" then g11 = 1; else g11 = 0;
if Genre = "Fighting" then g12 = 1; else g12 = 0;
if Platform = "DS" then p1 = 1; else p1 = 0;
if Platform = "GBA" then p2 = 1; else p2 = 0;
if Platform = "GC" then p3 = 1; else p3 = 0;
if Platform = "PC" then p4 = 1; else p4 = 0;
if Platform = "PS2" then p5 = 1; else p5 = 0;
if Platform = "PS3" then p6 = 1; else p6 = 0;
if Platform = "PSP" then p7 = 1; else p7 = 0;
if Platform = "Wii" then p8 = 1; else p8 = 0;
if Platform = "X360" then p9 = 1; else p9 = 0;
if Platform = "XS" then p10 = 1; else p10 = 0;
r1_ucount=r1*user_count;
r2_ucount=r2*user_count;
r3_ucount=r3*user_count;
r4_ucount=r4*user_count;
r1_ccount=r1*critic_count;
r2_ccount=r2*critic_count;
r3_ccount=r3*critic_count;
r4_ccount=r4*critic_count;
p1_ucount=p1*user_count;
p2_ucount=p2*user_count;
p3_ucount=p3*user_count;
p4_ucount=p4*user_count;
p5_ucount=p5*user_count;
p6_ucount=p6*user_count;
p7_ucount=p7*user_count;
p8_ucount=p8*user_count;
p9_ucount=p9*user_count;
p10_ucount=p10*user_count;
p1_ccount=p1*critic_count;
p2_ccount=p2*critic_count;
p3_ccount=p3*critic_count;
p4_ccount=p4*critic_count;
p5_ccount=p5*critic_count;
p6_ccount=p6*critic_count;
p7_ccount=p7*critic_count;
p8_ccount=p8*critic_count;
p9_ccount=p9*critic_count;
p10_ccount=p10*critic_count;
g1_uscore=g1*user_score;
g2_uscore=g2*user_score;
g3_uscore=g3*user_score;
g4_uscore=g4*user_score;
g5_uscore=g5*user_score;
g6_uscore=g6*user_score;
g7_uscore=g7*user_score;
g8_uscore=g8*user_score;
g9_uscore=g9*user_score;
g10_uscore=g10*user_score;
g11_uscore=g11*user_score;
g12_uscore=g12*user_score;
g1_cscore=g1*critic_score;
g2_cscore=g2*critic_score;
g3_cscore=g3*critic_score;
g4_cscore=g4*critic_score;
g5_cscore=g5*critic_score;
g6_cscore=g6*critic_score;
g7_cscore=g7*critic_score;
g8_cscore=g8*critic_score;
g9_cscore=g9*critic_score;
g10_cscore=g10*critic_score;
g11_cscore=g11*critic_score;
g12_cscore=g12*critic_score;
run;


/* (i)Outliers and influential points detection */
/* New dataset with studentized residuals and Cook's d value for each observation */
proc reg data=videogames;
model global_sales = critic_score critic_count user_score user_count 
critic user
r1 r2 r3 r4 
g1 g2 g3 g4 g5 g6 g7 g8 g9 g10 g11 g12
p1 p2 p3 p4 p5 p6 p7 p8 p9 p10 
r1_ucount r2_ucount r3_ucount r4_ucount
r1_ccount r2_ccount r3_ccount r4_ccount
p1_ucount p2_ucount p3_ucount p4_ucount p5_ucount
p6_ucount p7_ucount p8_ucount p9_ucount p10_ucount
p1_ccount p2_ccount p3_ccount p4_ccount p5_ccount
p6_ccount p7_ccount p8_ccount p9_ccount p10_ccount
g1_uscore g2_uscore g3_uscore g4_uscore g5_uscore g6_uscore
g7_uscore g8_uscore g9_uscore g10_uscore g11_uscore g12_uscore
g1_cscore g2_cscore g3_cscore g4_cscore g5_cscore g6_cscore
g7_cscore g8_cscore g9_cscore g10_cscore g11_cscore g12_cscore;
output out = vidgdata cookd = cookd student=sresiduals; 
quit;
/* Printing influential observations:(Cook's d > 4/n) */
proc print data=vidgdata;
var critic_score critic_count user_score user_count 
critic user
r1 r2 r3 r4 
g1 g2 g3 g4 g5 g6 g7 g8 g9 g10 g11 g12
p1 p2 p3 p4 p5 p6 p7 p8 p9 p10 
r1_ucount r2_ucount r3_ucount r4_ucount
r1_ccount r2_ccount r3_ccount r4_ccount
p1_ucount p2_ucount p3_ucount p4_ucount p5_ucount
p6_ucount p7_ucount p8_ucount p9_ucount p10_ucount
p1_ccount p2_ccount p3_ccount p4_ccount p5_ccount
p6_ccount p7_ccount p8_ccount p9_ccount p10_ccount
g1_uscore g2_uscore g3_uscore g4_uscore g5_uscore g6_uscore
g7_uscore g8_uscore g9_uscore g10_uscore g11_uscore g12_uscore
g1_cscore g2_cscore g3_cscore g4_cscore g5_cscore g6_cscore
g7_cscore g8_cscore g9_cscore g10_cscore g11_cscore g12_cscore;
where cookd > 4 / 4413;
run;
/* Estimating model without influential observations */
proc reg data=vidgdata plots=none;
model global_sales = critic_score critic_count user_score user_count 
critic user
r1 r2 r3 r4 
g1 g2 g3 g4 g5 g6 g7 g8 g9 g10 g11 g12
p1 p2 p3 p4 p5 p6 p7 p8 p9 p10 
r1_ucount r2_ucount r3_ucount r4_ucount
r1_ccount r2_ccount r3_ccount r4_ccount
p1_ucount p2_ucount p3_ucount p4_ucount p5_ucount
p6_ucount p7_ucount p8_ucount p9_ucount p10_ucount
p1_ccount p2_ccount p3_ccount p4_ccount p5_ccount
p6_ccount p7_ccount p8_ccount p9_ccount p10_ccount
g1_uscore g2_uscore g3_uscore g4_uscore g5_uscore g6_uscore
g7_uscore g8_uscore g9_uscore g10_uscore g11_uscore g12_uscore
g1_cscore g2_cscore g3_cscore g4_cscore g5_cscore g6_cscore
g7_cscore g8_cscore g9_cscore g10_cscore g11_cscore g12_cscore;
where cookd < 4/4413;
quit;
/* Robust Regression */
proc robustreg data=vidgdata fwls method=m;
model global_sales = critic_score critic_count user_score user_count 
critic user
r1 r2 r3 r4 
g1 g2 g3 g4 g5 g6 g7 g8 g9 g10 g11 g12
p1 p2 p3 p4 p5 p6 p7 p8 p9 p10 
r1_ucount r2_ucount r3_ucount r4_ucount
r1_ccount r2_ccount r3_ccount r4_ccount
p1_ucount p2_ucount p3_ucount p4_ucount p5_ucount
p6_ucount p7_ucount p8_ucount p9_ucount p10_ucount
p1_ccount p2_ccount p3_ccount p4_ccount p5_ccount
p6_ccount p7_ccount p8_ccount p9_ccount p10_ccount
g1_uscore g2_uscore g3_uscore g4_uscore g5_uscore g6_uscore
g7_uscore g8_uscore g9_uscore g10_uscore g11_uscore g12_uscore
g1_cscore g2_cscore g3_cscore g4_cscore g5_cscore g6_cscore
g7_cscore g8_cscore g9_cscore g10_cscore g11_cscore g12_cscore;
output out = robregmm_video weight = wgt outlier = ol;
run;


/* (ii) Multicollinearity detection */
/* Correlation Matrix */
proc corr data= vidgdata;
var critic_score critic_count user_score user_count 
critic user
r1 r2 r3 r4 
g1 g2 g3 g4 g5 g6 g7 g8 g9 g10 g11 g12
p1 p2 p3 p4 p5 p6 p7 p8 p9 p10 
r1_ucount r2_ucount r3_ucount r4_ucount
r1_ccount r2_ccount r3_ccount r4_ccount
p1_ucount p2_ucount p3_ucount p4_ucount p5_ucount
p6_ucount p7_ucount p8_ucount p9_ucount p10_ucount
p1_ccount p2_ccount p3_ccount p4_ccount p5_ccount
p6_ccount p7_ccount p8_ccount p9_ccount p10_ccount
g1_uscore g2_uscore g3_uscore g4_uscore g5_uscore g6_uscore
g7_uscore g8_uscore g9_uscore g10_uscore g11_uscore g12_uscore
g1_cscore g2_cscore g3_cscore g4_cscore g5_cscore g6_cscore
g7_cscore g8_cscore g9_cscore g10_cscore g11_cscore g12_cscore;
run;
/* Parameter estimates before dropping correlated variables */
proc reg data = vidgdata plots=none;
model global_sales = critic_score critic_count user_score user_count 
critic user
r1 r2 r3 r4 
g1 g2 g3 g4 g5 g6 g7 g8 g9 g10 g11 g12
p1 p2 p3 p4 p5 p6 p7 p8 p9 p10 
r1_ucount r2_ucount r3_ucount r4_ucount
r1_ccount r2_ccount r3_ccount r4_ccount
p1_ucount p2_ucount p3_ucount p4_ucount p5_ucount
p6_ucount p7_ucount p8_ucount p9_ucount p10_ucount
p1_ccount p2_ccount p3_ccount p4_ccount p5_ccount
p6_ccount p7_ccount p8_ccount p9_ccount p10_ccount
g1_uscore g2_uscore g3_uscore g4_uscore g5_uscore g6_uscore
g7_uscore g8_uscore g9_uscore g10_uscore g11_uscore g12_uscore
g1_cscore g2_cscore g3_cscore g4_cscore g5_cscore g6_cscore
g7_cscore g8_cscore g9_cscore g10_cscore g11_cscore g12_cscore / collinoint vif; 
quit;
/* Generating factors */
proc factor data=vidgdata out=vidgdata2 score simple corr scree nfactors=84;
var critic_score critic_count user_score user_count 
critic user
r1 r2 r3 r4 
g1 g2 g3 g4 g5 g6 g7 g8 g9 g10 g11 g12
p1 p2 p3 p4 p5 p6 p7 p8 p9 p10 
r1_ucount r2_ucount r3_ucount r4_ucount
r1_ccount r2_ccount r3_ccount r4_ccount
p1_ucount p2_ucount p3_ucount p4_ucount p5_ucount
p6_ucount p7_ucount p8_ucount p9_ucount p10_ucount
p1_ccount p2_ccount p3_ccount p4_ccount p5_ccount
p6_ccount p7_ccount p8_ccount p9_ccount p10_ccount
g1_uscore g2_uscore g3_uscore g4_uscore g5_uscore g6_uscore
g7_uscore g8_uscore g9_uscore g10_uscore g11_uscore g12_uscore
g1_cscore g2_cscore g3_cscore g4_cscore g5_cscore g6_cscore
g7_cscore g8_cscore g9_cscore g10_cscore g11_cscore g12_cscore;
run;
/* Parameter estimates after dropping correlated variables */
proc reg data = vidgdata;
model global_sales = critic_score critic_count user_score user_count 
user
r1 r2 r3 r4 g5 g7 g12
p1 p2 p3 p4 p5 p6 p7 p8 p9 p10 
r1_ucount r2_ucount r3_ucount r4_ucount
r1_ccount r2_ccount r3_ccount r4_ccount
p1_ucount p2_ucount p3_ucount p5_ucount
p7_ucount p8_ucount p10_ucount
p1_ccount p2_ccount p3_ccount p4_ccount p5_ccount
p6_ccount p7_ccount p8_ccount p9_ccount p10_ccount / collinoint vif; 
quit;


/* (iii) Heteroscedasticity detection */
proc reg data=vidgdata;
model global_sales = critic_score critic_count user_score user_count 
critic user
r1 r2 r3 r4 
g1 g2 g3 g4 g5 g6 g7 g8 g9 g10 g11 g12
p1 p2 p3 p4 p5 p6 p7 p8 p9 p10 
r1_ucount r2_ucount r3_ucount r4_ucount
r1_ccount r2_ccount r3_ccount r4_ccount
p1_ucount p2_ucount p3_ucount p4_ucount p5_ucount
p6_ucount p7_ucount p8_ucount p9_ucount p10_ucount
p1_ccount p2_ccount p3_ccount p4_ccount p5_ccount
p6_ccount p7_ccount p8_ccount p9_ccount p10_ccount
g1_uscore g2_uscore g3_uscore g4_uscore g5_uscore g6_uscore
g7_uscore g8_uscore g9_uscore g10_uscore g11_uscore g12_uscore
g1_cscore g2_cscore g3_cscore g4_cscore g5_cscore g6_cscore
g7_cscore g8_cscore g9_cscore g10_cscore g11_cscore g12_cscore / hcc spec;
quit;
/* Log Transformation */
data vidgdata3;
set vidgdata;
log_global_sales = log(global_sales);
run;
proc reg data=videogames3;
model log_global_sales = critic_score critic_count user_score user_count 
critic user
r1 r2 r3 r4 
g1 g2 g3 g4 g5 g6 g7 g8 g9 g10 g11 g12
p1 p2 p3 p4 p5 p6 p7 p8 p9 p10 
r1_ucount r2_ucount r3_ucount r4_ucount
r1_ccount r2_ccount r3_ccount r4_ccount
p1_ucount p2_ucount p3_ucount p4_ucount p5_ucount
p6_ucount p7_ucount p8_ucount p9_ucount p10_ucount
p1_ccount p2_ccount p3_ccount p4_ccount p5_ccount
p6_ccount p7_ccount p8_ccount p9_ccount p10_ccount
g1_uscore g2_uscore g3_uscore g4_uscore g5_uscore g6_uscore
g7_uscore g8_uscore g9_uscore g10_uscore g11_uscore g12_uscore
g1_cscore g2_cscore g3_cscore g4_cscore g5_cscore g6_cscore
g7_cscore g8_cscore g9_cscore g10_cscore g11_cscore g12_cscore / hcc spec;
quit;

/* (iv) Normality of error term */
proc univariate data=vidgdata normal;
var sresiduals; 
histogram sresiduals / normal kernel;
run;
proc univariate data=vidgdata normal;
var sresiduals; 
histogram sresiduals / normal kernel;
where cookd < 4 / 4413;
run;
