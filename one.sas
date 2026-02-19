proc import datafile="C:\Users\ianko\Desktop\sas\SMPL DATA\College.csv"
DBMS= csv out= college replace;


proc print data=College; run;

data college2;
set College;
if (private='Yes') then P_1 = 1; else P_1= 0;
run;

proc print data= college2; run;

proc univariate data=college2 normal plot;
var apps accept enroll top10perc top25perc f_undergrad p_undergrad outstate room_board books personal phd terminal s_f_ratio perc_alumni expend grad_rate P_1;
run;

proc import datafile="C:\Users\ianko\Desktop\sas\SMPL DATA\college.csv"
DBMS= csv out= college replace;

data college3;
set college2;
if (accept>5154) then delete;
if (enroll>1892) then delete;
if (top10perc>65) then delete;
run;

proc print data=college3; run;

data MODcollege3;
set college3(firstobs=1 obs=544);
Lp_undergrad = log(p_undergrad);
run;

proc print data=MODcollege3; run;

proc reg data=MODcollege3;
model enroll = accept top10perc room_board f_undergrad grad_rate P_1 Lp_undergrad / tol vif collin;
run;

data Model_MODcollege3;
set MODcollege3;
y_bar= 183.10230 + (0.16968*accept) + (0.58053*top10perc) + (-0.03350*room_board) + (0.09463*f_undergrad) + (0.16653*grad_rate) + (-11.69977*P_1);
predicted_err=((enroll-y_bar)**2); run;

proc print data=Model_MODcollege3; run;

data TESTcollege3;
set college3(firstobs=545 obs=657);
Lp_undergrad = log(p_undergrad);
run;

proc print data=TESTcollege3;

proc reg data=TESTcollege3;
model enroll = accept top10perc room_board f_undergrad grad_rate P_1 Lp_undergrad / tol vif collin;
run;

proc univariate data=TESTcollege3;
var apps accept enroll top10perc top25perc f_undergrad p_undergrad outstate room_board books personal phd terminal s_f_ratio perc_alumni expend grad_rate P_1 Lp_undergrad;
run;

proc reg data=MODcollege3;
model enroll = accept top10perc room_board f_undergrad  P_1 Lp_undergrad / tol vif collin;
run;

proc reg data=MODcollege3;
model enroll = accept top10perc room_board f_undergrad Lp_undergrad / tol vif collin;
run;
