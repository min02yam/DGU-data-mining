/*독립성검정- 카이스퀘어*/
proc freq data=final;
weight smp_wgt;
table CARAVAN*(MOSTYPE	MAANTHUI	MGEMOMV	MGEMLEEF	MOSHOOFD	MGODRK	MGODPR	MGODOV	MGODGE
	MRELGE	MRELSA	MRELOV	MFALLEEN	MFGEKIND	MFWEKIND	MOPLHOOG	MOPLMIDD	MOPLLAAG	
	MBERHOOG	MBERZELF	MBERBOER	MBERMIDD	MBERARBG	MBERARBO	MSKA	MSKB1	MSKB2
	MSKC	MSKD	MHHUUR	MHKOOP	MAUT1	MAUT2	MAUT0	MZFONDS	MZPART	MINKM30	MINK3045	
	MINK4575	MINK7512	MINK123M	MINKGEM	MKOOPKLA	PWAPART	PWABEDR	PWALAND	PPERSAUT	
	PBESAUT	PMOTSCO	PVRAAUT	PAANHANG	PTRACTOR	PWERKT	PBROM	PLEVEN	PPERSONG	
	PGEZONG	PWAOREG	PBRAND	PZEILPL	PPLEZIER	PFIETS	PINBOED	PBYSTAND	AWAPART	AWABEDR
	AWALAND	APERSAUT	ABESAUT	AMOTSCO	AVRAAUT	AAANHANG	ATRACTOR	AWERKT	ABROM	ALEVEN	
	APERSONG	AGEZONG	AWAOREG	ABRAND	AZEILPL	APLEZIER	AFIETS	AINBOED	ABYSTAND)/
	CHISQ;
run;  

/*독립성검정-피셔*/
proc freq data=final;
weight smp_wgt;
table CARAVAN*(PBESAUT) / FISHER ; 
run;  
proc freq data=final;
weight smp_wgt;
table CARAVAN*(PVRAAUT) / FISHER ; 
run;  
proc freq data=final;
weight smp_wgt;
table CARAVAN*( PWERKT) / FISHER ; 
run;  
proc freq data=final;
weight smp_wgt;
table CARAVAN*( PPERSONG) / FISHER ; 
run;  
proc freq data=final;
weight smp_wgt;
table CARAVAN*(AWABEDR) / FISHER ; 
run;  
proc freq data=final;
weight smp_wgt;
table CARAVAN*(ABESAUT) / FISHER ; 
run;  

proc freq data=final;
weight smp_wgt;
table CARAVAN*(AVRAAUT) / FISHER ; 
run;  
proc freq data=final;
weight smp_wgt;
table CARAVAN*(AWERKT) / FISHER ; 
run;  
proc freq data=final;
weight smp_wgt;
table CARAVAN*(APERSONG) / FISHER ; 
run; 



/*변수 선택후 분할표*/
proc freq data=final;
weight smp_wgt;
table CARAVAN*(MOSTYPE MAANTHUI MGEMOMV MGEMLEEF MOSHOOFD MGODRK MGODPR
 MGODOV MGODGE MRELGE MRELSA MRELOV MFALLEEN MFGEKIND MFWEKIND MOPLHOOG MOPLMIDD MOPLLAAG 
 MBERHOOG MBERZELF MBERBOER MBERMIDD MBERARBG MBERARBO MSKA MSKB1 MSKB2 MSKC MSKD MHHUUR 
 MHKOOP MAUT1 MAUT2 MAUT0 MZFONDS MZPART   MINKM30 MINK3045 MINK4575 MINK7512 MINK123M 
 MINKGEM MKOOPKLA PWAPART PWABEDR PWALAND PPERSAUT PMOTSCO   PAANHANG PTRACTOR 
 PWERKT PBROM PLEVEN    PGEZONG   PWAOREG   PBRAND   PZEILPL   PPLEZIER PFIETS   
 PINBOED PBYSTAND AWAPART AWALAND   APERSAUT AMOTSCO   AAANHANG ATRACTOR 
 ABROM ALEVEN AGEZONG   AWAOREG ABRAND   AZEILPL   APLEZIER AFIETS   AINBOED   ABYSTAND)
 /CHISQ;
 RUN;
 
 %macro step4(var);  
data final;
 set final;
 if &var =0 THEN &var.0=1; else &var.0=0;
 if &var =1 THEN &var.1=1; else &var.1=0;
 if &var =2 THEN &var.2=1; else &var.2=0;
 if &var =3 THEN &var.3=1; else &var.3=0; 
 if &var =4 THEN &var.4=1; else &var.4=0;
 if &var =5 THEN &var.5=1; else &var.5=0;
 if &var in (6,7) THEN &var.67=1; else &var.67=0;
 if &var =8 THEN &var.8=1; else &var.8=0; 
 if &var =9 THEN &var.9=1; else &var.9=0; 
run;
%mend;
%step4(MRELGE);  

%macro step5(var);  
data final;
 set final;
 if &var =0 THEN &var.0=1; else &var.0=0;
 if &var in (1,2) THEN &var.12=1; else &var.12=0;
 if &var =3 THEN &var.3=1; else &var.3=0;
 if &var =4 THEN &var.4=1; else &var.4=0; 
 if &var in (5,6) THEN &var.56=1; else &var.56=0;
run;
%mend;
%step5(MRELSA);  

%macro step6(var);  
data final;
 set final;
 if &var in (0,1) THEN &var.01=1; else &var.01=0;
 if &var =2 THEN &var.2=1; else &var.2=0;
 if &var =3 THEN &var.3=1; else &var.3=0;
 if &var in (4,5) THEN &var.45=1; else &var.45=0;
 if &var =6 THEN &var.6=1; else &var.6=0;
 if &var =7 THEN &var.7=1; else &var.7=0; 
 if &var =8 THEN &var.8=1; else &var.8=0; 
 if &var =9 THEN &var.9=1; else &var.9=0; 
run;
%mend; %step6(MFALLEEN); 

%macro step7(var);  
data final;
 set final;
 if &var =0 THEN &var.0=1; else &var.0=0;
 if &var =1 THEN &var.1=1; else &var.1=0;
 if &var in (2,3) THEN &var.23=1; else &var.23=0;
 if &var =4 THEN &var.4=1; else &var.4=0;
 if &var =5 THEN &var.5=1; else &var.5=0; 
 if &var =6 THEN &var.6=1; else &var.6=0; 
 if &var =7 THEN &var.7=1; else &var.7=0; 
 if &var =8 THEN &var.8=1; else &var.8=0; 
 if &var =9 THEN &var.9=1; else &var.9=0; 
run;
%mend; 
%step7(MFWEKIND);

/**MOPLHOOG MOPLMIDD**/
%macro step8(var);  
data final;
 set final;
 if &var in (0,1) THEN &var.01=1; else &var.01=0;
 if &var =2 THEN &var.2=1; else &var.2=0;
 if &var =3 THEN &var.3=1; else &var.3=0;
 if &var =4 THEN &var.4=1; else &var.4=0; 
 if &var =5 THEN &var.5=1; else &var.5=0; 
 if &var =6 THEN &var.6=1; else &var.6=0; 
 if &var =7 THEN &var.7=1; else &var.7=0; 
 if &var =8 THEN &var.8=1; else &var.8=0; 
 if &var =9 THEN &var.9=1; else &var.9=0; 
run;
%mend; 
%step8(MOPLHOOG);

%macro step9(var);  
data final;
 set final;
 if &var =0 THEN &var.0=1; else &var.0=0;
 if &var =1 THEN &var.1=1; else &var.1=0;
 if &var in (2,3,4) THEN &var.234=1; else &var.234=0;
 if &var =5 THEN &var.5=1; else &var.5=0; 
 if &var =6 THEN &var.6=1; else &var.6=0; 
 if &var =7 THEN &var.7=1; else &var.7=0; 
 if &var =8 THEN &var.8=1; else &var.8=0; 
 if &var =9 THEN &var.9=1; else &var.9=0; 
run;
%mend; 
%step9(MOPLMIDD);

/***MBERHOOG MBERZELF MBERBOER MBERMIDD MBERARBG MBERARBO ***/

%macro step10(var);  
data final;
 set final;
 if &var in (0,1) THEN &var.01=1; else &var.01=0;
 if &var =2 THEN &var.2=1; else &var.2=0;
 if &var =3 THEN &var.3=1; else &var.3=0;
 if &var =4 THEN &var.4=1; else &var.4=0;
 if &var =5 THEN &var.5=1; else &var.5=0;
 if &var =6 THEN &var.6=1; else &var.6=0; 
 if &var =7 THEN &var.7=1; else &var.7=0; 
 if &var =8 THEN &var.8=1; else &var.8=0; 
 if &var =9 THEN &var.9=1; else &var.9=0; 
run;
%mend;
%step10(MBERHOOG);


%macro step11(var);  
data final;
 set final;
 if &var =0 THEN &var.0=1; else &var.0=0;
 if &var in (1,2) THEN &var.12=1; else &var.12=0;
 if &var =3 THEN &var.3=1; else &var.3=0;
 if &var =4 THEN &var.4=1; else &var.4=0; 
 if &var =5 THEN &var.5=1; else &var.5=0; 
run;
%mend;
%step11(MBERZELF);  


%macro step12(var);  
data final;
 set final;
 if &var =0 THEN &var.0=1; else &var.0=0;
 if &var =1 THEN &var.1=1; else &var.1=0;
 if &var =2 THEN &var.2=1; else &var.2=0;
 if &var =3 THEN &var.3=1; else &var.3=0;
 if &var =4 THEN &var.4=1; else &var.4=0; 
 if &var =5 THEN &var.5=1; else &var.5=0; 
 if &var in (6,8,9) THEN &var.689=1; else &var.689=0;
run;
%mend; 
%step12(MBERBOER);

%macro step13(var);  
data final;
 set final;
 if &var in (0,1) THEN &var.01=1; else &var.01=0;
 if &var in (2,3) THEN &var.23=1; else &var.23=0;
 if &var =4 THEN &var.4=1; else &var.4=0;
 if &var =5 THEN &var.5=1; else &var.5=0;
 if &var =6 THEN &var.6=1; else &var.6=0; 
 if &var =7 THEN &var.7=1; else &var.7=0; 
 if &var =8 THEN &var.8=1; else &var.8=0; 
 if &var =9 THEN &var.9=1; else &var.9=0; 
run;
%mend;
%step13(MBERMIDD);

%macro step14(var);  
data final;
 set final;
 if &var in (0,1) THEN &var.01=1; else &var.01=0;
 if &var =2 THEN &var.2=1; else &var.2=0;
 if &var =3 THEN &var.3=1; else &var.3=0;
 if &var in (4,5) THEN &var.45=1; else &var.45=0;
 if &var =6 THEN &var.6=1; else &var.6=0; 
 if &var =7 THEN &var.7=1; else &var.7=0; 
 if &var =8 THEN &var.8=1; else &var.8=0; 
 if &var =9 THEN &var.9=1; else &var.9=0; 
run;
%mend;
%step14(MBERARBG);


%macro step15(var);  
data final;
 set final;
 if &var =0 THEN &var.0=1; else &var.0=0;
 if &var =1 THEN &var.1=1; else &var.1=0;
 if &var in (2,3) THEN &var.23=1; else &var.23=0;
 if &var in (4,5) THEN &var.45=1; else &var.45=0;
 if &var =6 THEN &var.6=1; else &var.6=0; 
 if &var in (7,8) THEN &var.78=1; else &var.78=0;
 if &var =9 THEN &var.9=1; else &var.9=0; 
run;
%mend;
%step15(MBERARBO);

/**MSKA MSKB1 MSKB2 MSKC 사회계급*/

%macro step15(var);  
data final;
 set final;
 if &var =0 THEN &var.0=1; else &var.0=0;
 if &var in (1,2) THEN &var.12=1; else &var.12=0;
 if &var =3 THEN &var.3=1; else &var.3=0;
 if &var =4 THEN &var.4=1; else &var.4=0; 
 if &var =5 THEN &var.5=1; else &var.5=0; 
 if &var =6 THEN &var.6=1; else &var.6=0; 
 if &var =7 THEN &var.7=1; else &var.7=0; 
 if &var =8 THEN &var.8=1; else &var.8=0; 
 if &var =9 THEN &var.9=1; else &var.9=0; 
run;
%mend;
%step15(MSKA);  

%macro step16(var);  
data final;
 set final;
 if &var in (0,1) THEN &var.01=1; else &var.01=0;
 if &var =2 THEN &var.2=1; else &var.2=0;
 if &var =3 THEN &var.3=1; else &var.3=0;
 if &var =4 THEN &var.4=1; else &var.4=0; 
 if &var =5 THEN &var.5=1; else &var.5=0; 
 if &var =6 THEN &var.6=1; else &var.6=0; 
 if &var =7 THEN &var.7=1; else &var.7=0; 
 if &var =8 THEN &var.8=1; else &var.8=0; 
 if &var =9 THEN &var.9=1; else &var.9=0; 
run;
%mend; 
%step16(MSKB1);

%macro step17(var);  
data final;
 set final;
 if &var =0 THEN &var.0=1; else &var.0=0;
 if &var in (1,2) THEN &var.12=1; else &var.12=0;
 if &var =3 THEN &var.3=1; else &var.3=0;
 if &var =4 THEN &var.4=1; else &var.4=0; 
 if &var =5 THEN &var.5=1; else &var.5=0; 
 if &var =6 THEN &var.6=1; else &var.6=0; 
 if &var in (7,8) THEN &var.78=1; else &var.78=0;
 if &var =9 THEN &var.9=1; else &var.9=0; 
run;
%mend;
%step17(MSKB2);  

%macro step18(var);  
data final;
 set final;
 if &var =0 THEN &var.0=1; else &var.0=0;
 if &var =1 THEN &var.1=1; else &var.1=0;
 if &var =2 THEN &var.2=1; else &var.2=0;
 if &var =3 THEN &var.3=1; else &var.3=0;
 if &var in (4,5) THEN &var.45=1; else &var.45=0;
 if &var =6 THEN &var.6=1; else &var.6=0; 
 if &var =7 THEN &var.7=1; else &var.7=0; 
 if &var =8 THEN &var.8=1; else &var.8=0; 
 if &var =9 THEN &var.9=1; else &var.9=0; 
run;
%mend;
%step18(MSKC);

/**MAUT1 MAUT2 MAUT0  자동차**/
%macro step19(var);  
data final;
 set final;
 if &var in (0,1) THEN &var.01=1; else &var.01=0;
 if &var =2 THEN &var.2=1; else &var.2=0;
 if &var in (3,4) THEN &var.34=1; else &var.34=0;
 if &var =5 THEN &var.5=1; else &var.5=0;
 if &var =6 THEN &var.6=1; else &var.6=0; 
 if &var =7 THEN &var.7=1; else &var.7=0; 
 if &var =8 THEN &var.8=1; else &var.8=0; 
 if &var =9 THEN &var.9=1; else &var.9=0; 
run;
%mend;
%step19(MAUT1);


%macro step20(var);  
data final;
 set final;
 if &var in (0,1) THEN &var.01=1; else &var.01=0;
 if &var =2 THEN &var.2=1; else &var.2=0;
 if &var =3 THEN &var.3=1; else &var.3=0;
 if &var =4 THEN &var.4=1; else &var.4=0; 
 if &var =5 THEN &var.5=1; else &var.5=0; 
 if &var =6 THEN &var.6=1; else &var.6=0;  
run;
%mend; 
%step20(MAUT2);

%macro step21(var);  
data final;
 set final;
 if &var =0 THEN &var.0=1; else &var.0=0;
 if &var =1 THEN &var.1=1; else &var.1=0;
 if &var =2 THEN &var.2=1; else &var.2=0;
 if &var =3 THEN &var.3=1; else &var.3=0;
 if &var =4 THEN &var.4=1; else &var.4=0; 
 if &var =5 THEN &var.5=1; else &var.5=0; 
  if &var =6 THEN &var.6=1; else &var.6=0; 
 if &var in (7,8,9) THEN &var.789=1; else &var.789=0;
run;
%mend; 
%step21(MAUT0);

/** MINKM30 MINK4575 MINK7512   수익에 에대한 **/
%macro step22(var);  
data final;
 set final;
 if &var =0 THEN &var.0=1; else &var.0=0;
 if &var in (1,2) THEN &var.12=1; else &var.12=0;
 if &var =3 THEN &var.3=1; else &var.3=0;
 if &var =4 THEN &var.4=1; else &var.4=0; 
 if &var =5 THEN &var.5=1; else &var.5=0; 
 if &var =6 THEN &var.6=1; else &var.6=0; 
 if &var =7 THEN &var.7=1; else &var.7=0; 
 if &var =8 THEN &var.8=1; else &var.8=0; 
 if &var =9 THEN &var.9=1; else &var.9=0; 
run;
%mend;
%step22(MINKM30); 

%macro step23(var);  
data final;
 set final;
 if &var in (0,1) THEN &var.01=1; else &var.01=0;
 if &var =2 THEN &var.2=1; else &var.2=0;
 if &var =3 THEN &var.3=1; else &var.3=0;
 if &var =4 THEN &var.4=1; else &var.4=0; 
 if &var =5 THEN &var.5=1; else &var.5=0; 
 if &var =6 THEN &var.6=1; else &var.6=0;  
 if &var =7 THEN &var.7=1; else &var.7=0; 
 if &var =8 THEN &var.8=1; else &var.8=0; 
 if &var =9 THEN &var.9=1; else &var.9=0; 
run;
%mend; 
%step23(MINK4575);


%macro step24(var);  
data final;
 set final;
 if &var =0 THEN &var.0=1; else &var.0=0;
 if &var =1 THEN &var.1=1; else &var.1=0;
 if &var in (2,3) THEN &var.23=1; else &var.23=0;
 if &var =4 THEN &var.4=1; else &var.4=0; 
 if &var =5 THEN &var.5=1; else &var.5=0; 
 if &var in (6,8) THEN &var.68=1; else &var.68=0;
 if &var =9 THEN &var.9=1; else &var.9=0; 
run;
%mend; 
%step24(MINK7512);

/** MKOOPKLA**/
%macro step25(var);  
data final;
 set final;
 if &var in (1,2) THEN &var.12=1; else &var.12=0;
 if &var =3 THEN &var.3=1; else &var.3=0;
 if &var in (4,5) THEN &var.45=1; else &var.45=0;
 if &var =6 THEN &var.6=1; else &var.6=0; 
 if &var =7 THEN &var.7=1; else &var.7=0; 
 if &var =8 THEN &var.8=1; else &var.8=0; 
run;
%mend;
%step25(MKOOPKLA);

/**PWABEDR PTRACTOR PZEILPL PPLEZIER ALEVEN  **/
%macro step26(var);  
data final;
 set final;
 if &var =0 THEN &var.0=1; else &var.0=0;
 if &var =2 THEN &var.2=1; else &var.2=0;
 if &var =3 THEN &var.3=1; else &var.3=0;
 if &var in (4,5) THEN &var.45=1; else &var.45=0;
run;
%mend;
%step26(PWABEDR);

%macro step27(var);  
data final;
 set final;
 if &var =0 THEN &var.0=1; else &var.0=0;
 if &var =3 THEN &var.3=1; else &var.3=0;
 if &var =4 THEN &var.4=1; else &var.4=0; 
 if &var in (5,6) THEN &var.56=1; else &var.56=0;
 run;
%mend;
%step27(PTRACTOR);

%macro step28(var);  
data final;
 set final;
 if &var in (0,1) THEN &var.01=1; else &var.01=0;
 if &var =2 THEN &var.2=1; else &var.2=0;
run;
%mend; 
%step28(PZEILPL);

%macro step29(var);  
data final;
 set final;
 if &var =0 THEN &var.0=1; else &var.0=0;
 if &var in (1,2,3) THEN &var.123=1; else &var.123=0;
 if &var =4 THEN &var.4=1; else &var.4=0; 
 if &var =6 THEN &var.6=1; else &var.6=0; 
run;
%mend; 
%step29(PPLEZIER);

%macro step30(var);  
data final;
 set final;
 if &var =0 THEN &var.0=1; else &var.0=0;
 if &var =1 THEN &var.1=1; else &var.1=0;
 if &var =2 THEN &var.2=1; else &var.2=0;
 if &var in (3,4) THEN &var.34=1; else &var.34=0;
run;
%mend;
%step30(ALEVEN); 

