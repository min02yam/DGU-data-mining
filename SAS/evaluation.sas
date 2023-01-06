/*Train data를10그룹으로 나눔*/
data mod_dec;
set m_out(where=(splitwgt^=.));
if (_n_=1) then set preddata;
retain sumwgt;
n+splitwgt ; /*웨이트 누적 n값은 웨이트 더해나가면서 누적으로 만들어짐*/
if n<0.1*sumwgt then mod_dec=0; else
if n<0.2*sumwgt then mod_dec=1; else
if n<0.3*sumwgt then mod_dec=2; else
if n<0.4*sumwgt then mod_dec=3; else
if n<0.5*sumwgt then mod_dec=4; else
if n<0.6*sumwgt then mod_dec=5; else
if n<0.7*sumwgt then mod_dec=6; else
if n<0.8*sumwgt then mod_dec=7; else
if n<0.9*sumwgt then mod_dec=8; else
mod_dec=9;
run;

/*십분위분석*/
title "Decile Analysis"; /*어느 선에서 끊어서 마케팅 할건지*/
proc tabulate data=mod_dec;
weight splitwgt;
class mod_dec;
var records CARAVAN pred;/*갯수*/
table mod_dec='decil' all='Total', 
records='Number of obs'*(sum=' '*f=c0mma10.)
pred='Predicted probalilty'*(mean=' '*f=11.5)
CARAVAN='Actual'*(mean=' '*f=11.5)/rts=9 row=float;
run;

/*test에 적용*/
proc univariate data=m_out(where=(splitwgt=.)) noprint;
weight smp_wgt;
var pred CARAVAN;
output out=preddata sumwgt=sumwgt;
run;  


data mod_dec;
set m_out(where=(splitwgt=.));
if (_n_=1) then set preddata;
retain sumwgt;
n+smp_wgt ;
if n<0.1*sumwgt then mod_dec=0; else
if n<0.2*sumwgt then mod_dec=1; else
if n<0.3*sumwgt then mod_dec=2; else
if n<0.4*sumwgt then mod_dec=3; else
if n<0.5*sumwgt then mod_dec=4; else
if n<0.6*sumwgt then mod_dec=5; else
if n<0.7*sumwgt then mod_dec=6; else
if n<0.8*sumwgt then mod_dec=7; else
if n<0.9*sumwgt then mod_dec=8; else
mod_dec=9;
run;

title "Decile Analysis"; 
proc tabulate data=mod_dec;
weight smp_wgt;
class mod_dec;
var records CARAVAN pred;
table mod_dec='decil' all='Total', 
records='Number of obs'*(sum=' '*f=c0mma10.)
pred='Predicted probalilty'*(mean=' '*f=11.5)
CARAVAN='Actual'*(mean=' '*f=11.5)/rts=9 row=float;
run;
