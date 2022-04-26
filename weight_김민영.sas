/*파일 저장은 학교 sas이용함*/
/*샘플링한 파일 불러오기*/
FILENAME REFFILE '/folders/myfolders/final2.csv';  
PROC IMPORT DATAFILE=REFFILE
DBMS=CSV  
OUT=final;  
GETNAMES=YES;
RUN;

/*sample weight*/

data final; 
if CARAVAN=1 then smp_wgt=1; 
else smp_wgt=16;   
set final;
run;

