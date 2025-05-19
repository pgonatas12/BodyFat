/* Data obtained from http://hbiostat.org/data courtesy of the Vanderbilt University Department of Biostatistics. */

/* Had to edit some columns because of decimal loss when converting data to csv */


proc Import datafile='/home/u59907006/MockData/bodyfat.csv' DBMS=csv
	out=bodyfat_data replace;
	
run;

/* For this one, we're going to try to find a Multiple Regression formula for Body Fat percentage */
/* based on multiple measurements taken. */

proc univariate data=bodyfat_data normal;
	var BodyFat Density Age Weight;
run;

/* Shapiro-Wilk	W	0.991677	Pr < W	0.1649 */
/* Shapiro-Wilk	W	0.995398	Pr < W	0.6571 */
/* Shapiro-Wilk	W	0.979457	Pr < W	0.0010 */
/* Shapiro-Wilk	W	0.941371	Pr < W	<0.0001 */

proc reg data=bodyfat_data;
model bodyfat = Density Age Weight Height Neck Chest Abdomen Hip Thigh Knee Ankle Biceps Forearm Wrist
/SELECTION=ADJRSQ AIC BIC;
run;

/*Intercept	1	450.01257	10.71320	42.01	<.0001
  Density	1	-411.23785	8.25845		-49.80	<.0001
  Age		1	0.01259		0.00963		1.31	0.1923
  Weight	1	0.01005		0.01597		0.63	0.5295
  Height	1	-0.00798	0.02844		-0.28	0.7793
  Neck		1	-0.02846	0.06938		-0.41	0.6821
  Chest		1	0.02678		0.02936		0.91	0.3627
  Abdomen	1	0.01856		0.03175		0.58	0.5593
  Hip		1	0.01917		0.04343		0.44	0.6594
  Thigh		1	-0.01676	0.04303		-0.39	0.6973
  Knee		1	-0.00464	0.07162		-0.06	0.9484
  Ankle		1	-0.08568	0.06576		-1.30	0.1939
  Biceps	1	-0.05505	0.05087		-1.08	0.2803
  Forearm	1	0.03386		0.05953		0.57	0.5700
  Wrist		1	0.00734		0.16168		0.05	0.9638 */

/* Residual SE 1.27431 on 237 df */
/* R-Square	0.9781 Adj R-Sq	0.9768 */
/* F-Stat 756.32 on 14 and 237 df p-val: <.0001 */


proc reg data=bodyfat_data;
model bodyfat = Density Age Weight Height Neck Chest Abdomen Hip Thigh Ankle Biceps Forearm
;
run;

/* Intercept	1	449.89533	10.55820	42.61	<.0001 */
/* Density		1	-411.16682	8.05366		-51.05	<.0001 */
/* Age			1	0.01258		0.00858		1.47	0.1438 */
/* Weight		1	0.00988		0.01523		0.65	0.5173 */
/* Height		1	-0.00803	0.02809		-0.29	0.7752 */
/* Neck			1	-0.02710	0.06619		-0.41	0.6826 */
/* Chest		1	0.02691		0.02911		0.92	0.3562 */
/* Abdomen		1	0.01868		0.03156		0.59	0.5545 */
/* Hip			1	0.01905		0.04320		0.44	0.6597 */
/* Thigh		1	-0.01756	0.04119		-0.43	0.6703 */
/* Ankle		1	-0.08568	0.06222		-1.38	0.1698 */
/* Biceps		1	-0.05469	0.05045		-1.08	0.2794 */
/* Forearm		1	0.03403		0.05776		0.59	0.5563 */

/* Residual SE	1.26898	on 239 DF */
/* R-Square	0.9781	Adj R-Sq	0.9770 */
/* F-Stat 889.79 on 12 and 239 DF, p-val=<.0001 */

proc reg data=bodyfat_data;
model bodyfat = Density Age Weight Neck Chest Abdomen Hip Thigh Ankle Biceps Forearm
;
run;

/* Intercept	1	449.14154	10.20406	44.02	<.0001 */
/* Density		1	-411.31422	8.02174		-51.27	<.0001 */
/* Age			1	0.01277		0.00853		1.50	0.1356 */
/* Weight		1	0.00768		0.01313		0.59	0.5590 */
/* Neck			1	-0.02669	0.06605		-0.40	0.6865 */
/* Chest		1	0.02882		0.02829		1.02	0.3094 */
/* Abdomen		1	0.01930		0.03143		0.61	0.5397 */
/* Hip			1	0.02218		0.04171		0.53	0.5953 */
/* Thigh		1	-0.01540	0.04042		-0.38	0.7035 */
/* Ankle		1	-0.08533	0.06209		-1.37	0.1706 */
/* Biceps		1	-0.05401	0.05029		-1.07	0.2839 */
/* Forearm		1	0.03381		0.05764		0.59	0.5581 */

/* Residual SE	1.26655	on 240 DF */
/* R-Square	0.9781	Adj R-Sq	0.9771 */
/* F Stat 974.40 on 11 and 240 DF p-value	<.0001 */


proc reg data=bodyfat_data;
model bodyfat = Density Age Weight Neck Chest Abdomen Hip Ankle Biceps Forearm
;
run;

/* Intercept	1	448.58612	10.08149	 44.50	<.0001 */
/* Density		1	-410.87017	7.92256		-51.86	<.0001 */
/* Age			1	0.01393		0.00796		 1.75	0.0816 */
/* Weight		1	0.00735		0.01308		 0.56	0.5748 */
/* Neck			1	-0.02885	0.06569		-0.44	0.6609 */
/* Chest		1	0.03041		0.02793		 1.09	0.2772 */
/* Abdomen		1	0.01885		0.03135		 0.60	0.5483 */
/* Hip			1	0.01542		0.03768		 0.41	0.6827 */
/* Ankle		1	-0.08599	0.06195		-1.39	0.1664 */
/* Biceps		1	-0.05892	0.04853		-1.21	0.2259 */
/* Forearm		1	0.03355		0.05754		 0.58	0.5604 */

/* Residual SE	1.26430	on 241 DF */
/* R-Square	0.9781 	Adj R-Sq	0.9772 */
/* F-Stat 1075.64 on 10 and 241 DF p-value	<.0001 */


proc reg data=bodyfat_data;
model bodyfat = Density Age 
;
run;

/* Intercept	1	 474.69038	4.83412		 98.20	<.0001 */
/* Density		1	-432.08302	4.49050		-96.22	<.0001 */
/* Age			1	 0.01239	0.00678		 1.83	0.0690 */

/* Residual SE	1.30072	on 249 DF */
/* R-Square	0.9760	Adj R-Sq	0.9758 */
/* F-Stat 5070.60	on 2 and 249 DF p-value <.0001 */




proc glm data=bodyfat_data;
model bodyfat = Density Age Weight Height Neck Chest Abdomen Hip Thigh Knee Ankle Biceps Forearm Wrist
Density*Age Density*Weight Density*Height Density*Neck Density*Chest Density*Abdomen 
Density*Hip Density*Thigh Density*Knee Density*Ankle Density*Biceps Density*Forearm 
Density*Wrist Age*Weight Age*Height Age*Neck Age*Chest Age*Abdomen Age*Hip 
Age*Thigh Age*Knee Age*Ankle Age*Biceps Age*Forearm  Age*Wrist Weight*Height 
Weight*Neck Weight*Chest Weight*Abdomen Weight*Hip Weight*Thigh Weight*Knee 
Weight*Ankle Weight*Biceps Weight*Forearm Weight*Wrist Height*Neck Height*Chest 
Height*Abdomen Height*Hip  Height*Thigh  Height*Knee  Height*Ankle Height*Biceps 
Height*Forearm Height*Wrist Neck*Chest Neck*Abdomen Neck*Hip Neck*Thigh Neck*Knee 
Neck*Ankle Neck*Biceps Neck*Forearm Neck*Wrist Chest*Abdomen Chest*Hip Chest*Thigh
Chest*Knee Chest*Ankle Chest*Biceps Chest*Forearm Chest*Wrist Abdomen*Hip Abdomen*Thigh 
Abdomen*Knee Abdomen*Ankle Abdomen*Biceps Abdomen*Forearm Abdomen*Wrist Hip*Thigh 
Hip*Knee Hip*Ankle Hip*Biceps Hip*Forearm Hip*Wrist Thigh*Knee Thigh*Ankle Thigh*Biceps Thigh*Forearm   
Thigh*Wrist Knee*Ankle Knee*Biceps Knee*Forearm Knee*Wrist Ankle*Biceps Ankle*Forearm Ankle*Wrist 
Biceps*Forearm Biceps*Wrist Forearm*Wrist 
;

run;

/* Intercept		-600.8994883	737.2162393	-0.82	0.4163 */
/* Density			543.8524605		636.1103749	0.85	0.3940 */
/* Age				1.8987371		1.2197890	1.56	0.1217 */
/* Weight			-5.8950610		2.0826192	-2.83	0.0053 */
/* Height			0.8449851		6.4276265	0.13	0.8956 */
/* Neck				9.7504022	10.7857242	0.90	0.3675 */
/* Chest			-1.4493994	3.4484523	-0.42	0.6749 */
/* Abdomen			7.0095182	2.6780466	2.62	0.0098 */
/* Hip				4.9132666	6.2630496	0.78	0.4340 */
/* Thigh			11.6633888	6.6032955	1.77	0.0794 */
/* Knee				-17.8809845	10.9840657	-1.63	0.1057 */
/* Ankle			34.8579013	10.5681558	3.30	0.0012 */
/* Biceps			20.5475722	7.0860194	2.90	0.0043 */
/* Forearm			3.4022940	11.6412939	0.29	0.7705 */
/* Wrist			-49.8251618	24.4882885	-2.03	0.0437 */
/* Density*Age		-1.0579064	0.9546480	-1.11	0.2696 */
/* Density*Weight	4.7284297	1.8412510	2.57	0.0112 */
/* Density*Height	-1.2497533	5.4262387	-0.23	0.8182 */
/* Density*Neck		-5.4500693	7.4627015	-0.73	0.4664 */
/* Density*Chest	0.4850095	2.7668756	0.18	0.8611 */
/* Density*Abdomen	-5.9463871	2.0487499	-2.90	0.0043 */
/* Density*Hip		-2.1592506	4.7737450	-0.45	0.6517 */
/* Density*Thigh	-12.8660617	4.7849912	-2.69	0.0080 */
/* Density*Knee		19.4162220	8.0099387	2.42	0.0166 */
/* Density*Ankle	-31.7422460	8.9967998	-3.53	0.0006 */
/* Density*Biceps	-12.2660410	5.2842245	-2.32	0.0217 */
/* Density*Forearm	-3.3045796	8.3731643	-0.39	0.6937 */
/* Density*Wrist	26.4635763	16.8564900	1.57	0.1186 */
/* Age*Weight		0.0029449	0.0021659	1.36	0.1760 */
/* Age*Height		-0.0060334	0.0058675	-1.03	0.3055 */
/* Age*Neck			-0.0010499	0.0077782	-0.13	0.8928 */
/* Age*Chest		-0.0015943	0.0033556	-0.48	0.6354 */
/* Age*Abdomen		-0.0061240	0.0030798	-1.99	0.0486 */
/* Age*Hip			0.0028109	0.0057355	0.49	0.6248 */
/* Age*Thigh		-0.0001187	0.0042750	-0.03	0.9779 */
/* Age*Knee			0.0082756	0.0066839	1.24	0.2177 */
/* Age*Ankle		-0.0380674	0.0093188	-4.09	<.0001 */
/* Age*Biceps		-0.0150512	0.0065800	-2.29	0.0236 */
/* Age*Forearm		-0.0066485	0.0079711	-0.83	0.4056 */
/* Age*Wrist		0.0470946	0.0148183	3.18	0.0018 */
/* Weight*Height	0.0036911	0.0067053	0.55	0.5828 */
/* Weight*Neck		0.0095735	0.0158580	0.60	0.5470 */
/* Weight*Chest		0.0011261	0.0039938	0.28	0.7784 */
/* Weight*Abdomen	-0.0022239	0.0051905	-0.43	0.6689 */
/* Weight*Hip		0.0096366	0.0077523	1.24	0.2158 */
/* Weight*Thigh		-0.0086792	0.0111360	-0.78	0.4370 */
/* Weight*Knee		0.0220460	0.0228090	0.97	0.3354 */
/* Weight*Ankle		-0.0255283	0.0222696	-1.15	0.2535 */
/* Weight*Biceps	0.0090082	0.0119998	0.75	0.4540 */
/* Weight*Forearm	-0.0046974	0.0158724	-0.30	0.7677 */
/* Weight*Wrist		-0.0334899	0.0467403	-0.72	0.4748 */
/* Height*Neck		-0.0139890	0.0469204	-0.30	0.7660 */
/* Height*Chest		0.0143248	0.0138151	1.04	0.3015 */
/* Height*Abdomen	0.0029086	0.0176332	0.16	0.8692 */
/* Height*Hip		-0.0215601	0.0230404	-0.94	0.3509 */
/* Height*Thigh		0.0201094	0.0270019	0.74	0.4576 */
/* Height*Knee		-0.0119334	0.0513756	-0.23	0.8166 */
/* Height*Ankle		0.0175368	0.0638292	0.27	0.7839 */
/* Height*Biceps	-0.0483195	0.0345122	-1.40	0.1636 */
/* Height*Forearm	0.0063729	0.0618319	0.10	0.9180 */
/* Height*Wrist		0.0716819	0.1259748	0.57	0.5702 */
/* Neck*Chest		-0.0098722	0.0274803	-0.36	0.7199 */
/* Neck*Abdomen		-0.0089161	0.0287283	-0.31	0.7567 */
/* Neck*Hip			-0.0009835	0.0360085	-0.03	0.9782 */
/* Neck*Thigh		0.0124431	0.0317837	0.39	0.6960 */
/* Neck*Knee		0.0118130	0.0651563	0.18	0.8564 */
/* Neck*Ankle		-0.0025771	0.0812244	-0.03	0.9747 */
/* Neck*Biceps		-0.0826798	0.0481581	-1.72	0.0881 */
/* Neck*Forearm		-0.0045299	0.0683033	-0.07	0.9472 */
/* Neck*Wrist		-0.0619131	0.1443815	-0.43	0.6687 */
/* Chest*Abdomen	0.0070099	0.0091820	0.76	0.4464 */
/* Chest*Hip		-0.0173656	0.0137662	-1.26	0.2092 */
/* Chest*Thigh		0.0187776	0.0143190	1.31	0.1918 */
/* Chest*Knee		-0.0287732	0.0319867	-0.90	0.3698 */
/* Chest*Ankle		0.0218576	0.0433798	0.50	0.6151 */
/* Chest*Biceps		-0.0259651	0.0200025	-1.30	0.1963 */
/* Chest*Forearm	0.0131347	0.0315451	0.42	0.6777 */
/* Chest*Wrist		0.0661415	0.0703742	0.94	0.3488 */
/* Abdomen*Hip		-0.0064791	0.0169981	-0.38	0.7036 */
/* Abdomen*Thigh	-0.0277132	0.0167174	-1.66	0.0995 */
/* Abdomen*Knee		0.0311779	0.0302128	1.03	0.3038 */
/* Abdomen*Ankle	0.0187271	0.0341409	0.55	0.5842 */
/* Abdomen*Biceps	-0.0104083	0.0199540	-0.52	0.6027 */
/* Abdomen*Forearm	0.0379792	0.0357486	1.06	0.2898 */
/* Abdomen*Wrist	-0.0392340	0.0687668	-0.57	0.5692 */
/* Hip*Thigh		0.0156159	0.0233887	0.67	0.5054 */
/* Hip*Knee			-0.0409548	0.0339442	-1.21	0.2296 */
/* Hip*Ankle		-0.0499006	0.0556528	-0.90	0.3714 */
/* Hip*Biceps		0.0007004	0.0271824	0.03	0.9795 */
/* Hip*Forearm		-0.0357708	0.0408872	-0.87	0.3831 */
/* Hip*Wrist		0.1228932	0.0970309	1.27	0.2073 */
/* Thigh*Knee		0.0185563	0.0330513	0.56	0.5754 */
/* Thigh*Ankle		-0.0207993	0.0546114	-0.38	0.7039 */
/* Thigh*Biceps		-0.0116786	0.0258802	-0.45	0.6525 */
/* Thigh*Forearm	-0.0091939	0.0421484	-0.22	0.8276 */
/* Thigh*Wrist		0.0613021	0.0974562	0.63	0.5303 */
/* Knee*Ankle		0.0322318	0.0977954	0.33	0.7422 */
/* Knee*Biceps		0.0263807	0.0495062	0.53	0.5949 */
/* Knee*Forearm		-0.0413768	0.0816535	-0.51	0.6131 */
/* Knee*Wrist		-0.2237999	0.1499312	-1.49	0.1377 */
/* Ankle*Biceps		-0.0308821	0.0637453	-0.48	0.6288 */
/* Ankle*Forearm	0.0567481	0.0901222	0.63	0.5299 */
/* Ankle*Wrist		0.2304976	0.1551916	1.49	0.1396 */
/* Biceps*Forearm	-0.0318693	0.0408538	-0.78	0.4366 */
/* Biceps*Wrist		0.1557562	0.1112983	1.40	0.1638 */
/* Forearm*Wrist	0.0846521	0.1489107	0.57	0.5706 */

/* Residual SE 0.849962 on 146 DF */
/* R-Sq 0.994000  */
/* F-Stat 230.35 on 105 and 146 DF	p-value <.0001 */



proc glm data=bodyfat_data;
model bodyfat = Density Weight Abdomen Thigh Ankle Biceps
  Wrist Density*Weight Density*Abdomen Density*Thigh
  Density*Knee Density*Ankle Density*Biceps Age*Abdomen
  Age*Ankle Age*Biceps Age*Wrist Neck*Biceps Abdomen*Thigh 
;

run;

/* Parameter		Estimate	StandardError	t Value	Pr > |t|
Intercept		-242.5555590	115.7780513		-2.10	0.0373
Density			252.3967912		106.3959947		2.37	0.0185
Weight			-3.7382709		0.4320188		-8.65	<.0001
Abdomen			4.8419966		0.7738580		6.26	<.0001
Thigh			3.9454634		1.8427639		2.14	0.0333
Ankle			20.9083073		4.4728368		4.67	<.0001
Biceps			6.6430678		2.4383851		2.72	0.0069
Wrist			-1.0610647		0.3654294		-2.90	0.0040
Density*Weight	3.5640790		0.4091538		8.71	<.0001
Density*Abdomen	-4.5381892		0.7256577		-6.25	<.0001
Density*Thigh	-3.8128534		1.7038611		-2.24	0.0262
Density*Knee	-0.0279673		0.0623756		-0.45	0.6543
Density*Ankle	-19.3902899		4.1141035		-4.71	<.0001
Density*Biceps	-6.3998395		2.2545701		-2.84	0.0049
Abdomen*Age		-0.0013498		0.0009051		-1.49	0.1372
Ankle*Age		-0.0115318		0.0042778		-2.70	0.0075
Biceps*Age		0.0015973		0.0029351		0.54	0.5868
Wrist*Age		0.0195827		0.0067582		2.90	0.0041
Biceps*Neck		0.0008405		0.0018295		0.46	0.6464
Abdomen*Thigh	0.0005284		0.0013606		0.39	0.6981
 */

/* Residual SE 1.108620 on 232 DF */
/* R-Sq 0.983780  */
/* F-Stat 740.58 on 19 and 232 DF	p-value <.0001 */



proc glm data=bodyfat_data;
model bodyfat = Density Weight Abdomen Thigh Ankle Biceps
  Wrist Density*Weight Density*Abdomen Density*Thigh
  Density*Ankle Density*Biceps Age*Ankle Age*Wrist 
;

run;

/* Parameter	Estimate		StandardError	t Value	Pr > |t|
Intercept		-267.9230773	97.09713221		-2.76	0.0062
Density			272.1219351		92.01189823		2.96	0.0034
Weight			-3.6195684		0.41161100		-8.79	<.0001
Abdomen			4.3132856		0.68123179		6.33	<.0001
Thigh			4.9427713		1.59454027		3.10	0.0022
Ankle			20.5875465		4.23044087		4.87	<.0001
Biceps			6.6572063		2.26517324		2.94	0.0036
Wrist			-0.8174078		0.29572737		-2.76	0.0062
Density*Weight	3.4504216		0.39063614		8.83	<.0001
Density*Abdomen	-4.0630438		0.64803248		-6.27	<.0001
Density*Thigh	-4.7086290		1.51488562		-3.11	0.0021
Density*Ankle	-19.1244780		3.90009395		-4.90	<.0001
Density*Biceps	-6.3113008		2.13525448		-2.96	0.0034
Ankle*Age		-0.0107520		0.00401474		-2.68	0.0079
Wrist*Age		0.0145890		0.00507743		2.87	0.0044 */

/* Residual SE 1.103929 on 237 DF */
/* R-Sq 0.983570  */
/* F-Stat 1013.42 on 14 and 237 DF	p-value <.0001 */



proc glm data=bodyfat_data;
model bodyfat = Weight Abdomen Ankle Density*Weight Density*Abdomen 
  Density*Ankle  
;

run;

/* Parameter		Estimate		Standard Error	t Value	Pr > |t| */
/* Intercept		15.89827658		1.72364746		9.22	<.0001 */
/* Weight			-2.28513727		0.23961807		-9.54	<.0001 */
/* Abdomen			4.30686252		0.59388623		7.25	<.0001 */
/* Ankle			19.17732533		1.48335221		12.93	<.0001 */
/* Weight*Density	2.17059102		0.22740980		9.54	<.0001 */
/* Abdomen*Density	-4.03005058		0.56498722		-7.13	<.0001 */
/* Ankle*Density	-18.28341215	1.40880013		-12.98	<.0001 */



/* Residual SE 1.176694 on 245 DF */
/* R-Sq 0.980703  */
/* F-Stat 2075.17 on 6 and 245 DF	p-value <.0001 */


