; Hepatocellular Carcinoma Imaging Report Generator
; 以下變數用於在fileappend的開頭結束插入空白用的
; 平常跳行 Y+20; 有edit, text+25 edit+20 ; 段落+30
6_Space := "      "
5_Space := "     "
4_Space := "    "
3_Space := "   "
2_Space := "  "
1_Space := " "
5_tab := "					"
4_tab := "				"
3_tab := "			"
2_tab := "		"
1_tab := "	"

#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%

; GUI Configuration
Gui, Color, 85ddda
Gui, Font, cDefault, Arial

; Title
; Gui, Add, Text,  Section vTitle, HCC Imaging Report

; ---------------Tumor Location and Size---------------
Gui, Font, s12 bold, Arial   ; 改大改粗體
Gui, Add, Text, y15 x20, 1. Tumor location / Size
Gui, Font ; 重置字體設置(不加這個 粗體改不回來)
Gui, Font, s10, Arial   ; 恢復
Gui, Add, Checkbox, vTLS y15 x200, Not assessable
Gui, Font, s12 bold, Arial   ; 改大改粗體
Gui, Add, Text, y35 x40, Number:
Gui, Font ; 重置字體設置(不加這個 粗體改不回來)
Gui, Font, s10, Arial   ; 恢復
Gui, Add, Checkbox, vOne y60 x40, One
Gui, Add, Checkbox, vTwo y60 x90, Two
Gui, Add, Checkbox, vMultiple0 y60 x140, Multiple: 
Gui, Add, Edit, vMultiple1 y55 x210 w30
; 使用反引號來轉義分號
Gui, Add, Text, y115 x250, `;  
Gui, Add, Checkbox, vInfiltrative y60 x260, Infiltrative or ill-defined lesions
Gui, Font, s12 bold, Arial   ; 改大改粗體
Gui, Add, Text, y80 x40, Location:
Gui, Font ; 重置字體設置(不加這個 粗體改不回來)
Gui, Font, s10, Arial   ; 恢復
Gui, Add, Checkbox, vS1 y100 x40, S1
Gui, Add, Checkbox, vS2 y100 x80, S2
Gui, Add, Checkbox, vS3 y100 x120, S3
Gui, Add, Checkbox, vS4 y100 x160, S4
Gui, Add, Checkbox, vS5 y100 x200, S5
Gui, Add, Checkbox, vS6 y100 x240, S6
Gui, Add, Checkbox, vS7 y100 x280, S7
Gui, Add, Checkbox, vS8 y100 x320, S8
Gui, Font, s12 bold, Arial   ; 改大改粗體
Gui, Add, Text, y120 x40, Size:
Gui, Font ; 重置字體設置(不加這個 粗體改不回來)
Gui, Font, s10, Arial   ; 恢復
Gui, Add, Text, y120 x84, (
Gui, Add, Checkbox, vNonM y120 x90, Non-measurable)
Gui, Add, Text, y145 x40, Measurable: 
Gui, Add, Edit, vMeas y140 x120 w60
Gui, Add, Text, y145 x185, cm(the greatest tumor)
Gui, Add, Checkbox, vT1a y165 x40, T1a: solitary tumor <= 2cm
Gui, Add, Checkbox, vT1b y185 x40, T1b & T2: tumor > 2cm, without/with micro-vascular invasion
Gui, Add, Checkbox, vT2 y205 x40, T2: multiple tumors, <=5cm 
Gui, Add, Checkbox, vT3 y225 x40, T3: multiple tumors, >5cm 
; ---------------Tumor Characteristics---------------
Gui, Font, s12 bold, Arial   ; 改大改粗體
Gui, Add, Text, y255 x20, 2. Tumor Characteristics and Associated Liver Features
Gui, Font ; 重置字體設置(不加這個 粗體改不回來)
Gui, Font, s10, Arial   ; 恢復
Gui, Add, Text, y255 x440, (
Gui, Add, Checkbox, vNonM1 y255 x445, Non-assessable)
Gui, Add, Radio, vMTypical y275 x40, yes 
Gui, Add, Radio, y275 x83, no
Gui, Add, Radio,  y275 x120, equivocal: Typical enhancement pattern
Gui, Add, Text, y275 x370, . 
;不懂為何沒加個什麼東西上下兩個radio會被視為同一組單選而錯亂

Gui, Add, Radio, vMportal y295 x40, yes 
Gui, Add, Radio, y295 x83, no 
Gui, Add, Radio,  y295 x120, equivocal: Major portal vein, location:
Gui, Add, Checkbox, vMPright y295 x355, Right
Gui, Add, Checkbox, vMPleft y295 x407, Left
Gui, Add, Checkbox, vMPmain y295 x452, Main
Gui, Add, Checkbox, vMPSMV y295 x502, SMV(T4)

Gui, Add, Radio, vMhepatic y315 x40, yes 
Gui, Add, Radio, y315 x83, no
Gui, Add, Radio,  y315 x120, equivocal: Major hepatic vein, location:
Gui, Add, Checkbox, vHPright y315 x365, Right
Gui, Add, Checkbox, vHPmid y315 x419, Middle
Gui, Add, Checkbox, vHPleft y315 x481, Left
Gui, Add, Checkbox, vHPIVC y315 x525, IVC(T4)

Gui, Add, Radio, vExtra y335 x40, yes 
Gui, Add, Radio, y335 x83, no
Gui, Add, Radio,  y335 x120, equivocal: Extra-hepatic spread(T4)

Gui, Add, Checkbox, vCirrhosis y355 x40, Cirrhosis
Gui, Add, Checkbox, vAscites y355 x120, Ascites
Gui, Add, Checkbox, vPort y355 x195, Portosystemic collateral vessel

; ---------------Regional nodal metastasis---------------
  Gui, Font, s12 bold, Arial   ; 改大改粗體
Gui, Add, Text, y385 x20, 3. Regional nodal metastasis
Gui, Font ; 重置字體設置(不加這個 粗體改不回來)
Gui, Font, s10, Arial   ; 恢復
Gui, Add, Text, y385 x238, (
Gui, Add, Checkbox, vRNon y385 x243, Non-measurable)
Gui, Add, Checkbox, vNo y405 x40, No
Gui, Add, Checkbox, vNequ y425 x40, Equivocal, location: 
Gui, Add, Checkbox, vNhi y425 x175, hilar
Gui, Add, Checkbox, vNin y425 x223, inf. phrenic
Gui, Add, Checkbox, vNhe y425 x310, hepatoduodenal lig.
Gui, Add, Checkbox, vNca y425 x448, caval

Gui, Add, Checkbox, vNyes y445 x40, Yes, location: 
Gui, Add, Checkbox, vYhi y445 x175, hilar
Gui, Add, Checkbox, vYin y445 x223, inf. phrenic
Gui, Add, Checkbox, vYhe y445 x310, hepatoduodenal lig.
Gui, Add, Checkbox, vYca y445 x448, caval

; ---------------Distant Metastasis---------------
  Gui, Font, s12 bold, Arial   ; 改大改粗體
Gui, Add, Text, y475 x20, 4. Distant metastasis
Gui, Font ; 重置字體設置(不加這個 粗體改不回來)
Gui, Font, s10, Arial   ; 恢復
Gui, Add, Text, y475 x165, (in this study)

Gui, Add, Checkbox, vDM0 y495 x40, No
Gui, Add, Checkbox, vDM1 y520 x40, Equivocal, location: 
Gui, Add, Edit, vDM3 y515 x170 w250
Gui, Add, Checkbox, vDM2 y545 x40, Yes, location: 
Gui, Add, Edit, vDM4 y540 x140 w250
; ---------------Other Findings---------------
  Gui, Font, s12 bold, Arial   ; 改大改粗體
Gui, Add, Text, y575 x20, 5. Other findings
Gui, Font ; 重置字體設置(不加這個 粗體改不回來)
Gui, Font, s10, Arial   ; 恢復
Gui, Add, Edit, vOF0 y595 x20 w500

; Buttons
  Gui, Font, s12 bold, Arial   ; 改大改粗體
Gui, Add, Button, Default gGenerateReport y640 x20, Generate Report
Gui, Add, Button, gExit y640 x170, Exit

; Show GUI
Gui, Show, w600 h700, Hepatocellular Carcinoma Imaging Report Generator
return

; === 生成報告===
GenerateReport:
    ; Collect data from GUI
    Gui, Submit, NoHide
     ; 刪除現有的 test.txt 文件
    FileDelete, c:\temp\test.txt
    ; 將結果逐行輸入test.txt中
FormatTime, CurrentDate,, yyyy/MM/dd
FileAppend,  Addtional report for cancer staging on %CurrentDate%   `n, c:\temp\test.txt   
FileAppend,   =========================================== `n, c:\temp\test.txt 
    FileAppend, MCH Imaging Report for Hepatocellular Carcinoma (AJCC 8th)  `n, c:\temp\test.txt
    FileAppend,    `n, c:\temp\test.txt    ; 輸入空白行幫助排版
    FileAppend, *本表單僅依據單次影像進行分期供腫瘤團隊參考，並不代表病人的臨床分期，臨床分期需綜合病人臨床發現、各種影像(包括各種內視鏡及超音波檢查)及病理表現來進行判斷，病人的最終臨床分期可能因癌症團隊討論有所異動，敬請參閱病歷首頁。 `n, c:\temp\test.txt
    FileAppend,   %2_Space% `n, c:\temp\test.txt    ; 輸入空白行幫助排版
;-------------------------------------------------------------
 
;--------------第二段-----------------------------------------------
    FileAppend,  1. %1_Space%Tumor location / Size ( , c:\temp\test.txt  
if TLS = 1
 {
   FileAppend,  ■ Not assessable)  `n, c:\temp\test.txt
}
  if TLS = 0
 {
   FileAppend,  □ Not assessable)  `n, c:\temp\test.txt
}
    FileAppend, %4_Space%Number:  `n, c:\temp\test.txt
if One = 1
 {
   FileAppend,  %4_Space%■ one %1_Space%, c:\temp\test.txt
}
  if One = 0
 {
   FileAppend,  %6_Space%□ one %1_Space%, c:\temp\test.txt
}
if Two = 1
 {
   FileAppend,  ■ two %1_Space%, c:\temp\test.txt
}
  if Two = 0
 {
   FileAppend,  □ two %1_Space%, c:\temp\test.txt
}
if Multiple0 = 1
 {
   FileAppend,  ■ Multiple: %1_Space%, c:\temp\test.txt
}
  if Multiple0 = 0
 {
   FileAppend,  □ Multiple: %1_Space%, c:\temp\test.txt
}
    FileAppend,__%Multiple1%__%1_Space%, c:\temp\test.txt
    FileAppend, 
(
;%1_Space%
), c:\temp\test.txt

if Infiltrative = 1
 {
   FileAppend,  ■ Infiltrative or ill-defined lesions %1_Space%, c:\temp\test.txt
}
  if Infiltrative = 0
 {
   FileAppend,  □ Infiltrative or ill-defined lesions %1_Space%, c:\temp\test.txt
}
   FileAppend,  %1_Space% `n, c:\temp\test.txt   ; 跳行
   FileAppend, %4_Space%Location:  `n, c:\temp\test.txt
if S1 = 1
 {
   FileAppend,  %6_Space%■ S1 %2_Space%, c:\temp\test.txt
}
  if S1 = 0
 {
   FileAppend,  %6_Space%□ S1 %2_Space%, c:\temp\test.txt
}
if S2 = 1
 {
   FileAppend,  ■ S2 %2_Space%, c:\temp\test.txt
}
  if S2 = 0
 {
   FileAppend,  □ S2 %2_Space%, c:\temp\test.txt
}
if S3 = 1
 {
   FileAppend,  ■ S3 %2_Space%, c:\temp\test.txt
}
  if S3 = 0
 {
   FileAppend,  □ S3 %2_Space%, c:\temp\test.txt
}
if S4 = 1
 {
   FileAppend,  ■ S4 %2_Space%, c:\temp\test.txt
}
  if S4 = 0
 {
   FileAppend,  □ S4 %2_Space%, c:\temp\test.txt
}
if S5 = 1
 {
   FileAppend,  ■ S5 %2_Space%, c:\temp\test.txt
}
  if S5 = 0
 {
   FileAppend,  □ S5 %2_Space%, c:\temp\test.txt
}
if S6 = 1
 {
   FileAppend,  ■ S6 %2_Space%, c:\temp\test.txt
}
  if S6 = 0
 {
   FileAppend,  □ S6 %2_Space%, c:\temp\test.txt
}
if S7 = 1
 {
   FileAppend,  ■ S7 %2_Space%, c:\temp\test.txt
}
  if S7 = 0
 {
   FileAppend,  □ S7 %2_Space%, c:\temp\test.txt
}
if S8 = 1
 {
   FileAppend,  ■ S8 %2_Space%`n, c:\temp\test.txt
}
  if S8 = 0
 {
   FileAppend,  □ S8 %2_Space%`n, c:\temp\test.txt
}
 FileAppend, %4_Space%Size: ( , c:\temp\test.txt  
if NonM = 1
 {
   FileAppend,  ■ Non-measurable)  `n, c:\temp\test.txt
}
  if NonM = 0
 {
   FileAppend,  □ Non-measurable) `n, c:\temp\test.txt
}
    FileAppend,  %6_Space%Measurable:_%Meas%_cm (the greatest tumor)`n, c:\temp\test.txt  
if T1a = 1
 {
   FileAppend,  %6_Space%■ T1a: solitary tumor <= 2cm  `n, c:\temp\test.txt
}
  if T1a = 0
 {
   FileAppend,  %6_Space%□ T1a: solitary tumor <= 2cm `n, c:\temp\test.txt
}
if T1b = 1
 {
   FileAppend, 
( 
%6_Space%■ T1b & T2: tumor > 2cm, without/with micro-vascular invasion  
)`n, c:\temp\test.txt
}
  if T1b = 0
 {
   FileAppend,  
(
%6_Space%□ T1b & T2: tumor > 2cm, without/with micro-vascular invasion
)`n, c:\temp\test.txt
}
if T2 = 1
 {
   FileAppend,  
(
%6_Space%■ T2: multiple tumors, <=5cm 
)`n, c:\temp\test.txt
}
  if T2 = 0
 {
   FileAppend,  
(
%6_Space%□ T2: multiple tumors, <=5cm 
)`n, c:\temp\test.txt
}
if T3 = 1
 {
   FileAppend,  
(
%6_Space%■ T3: multiple tumors, >5cm 
)`n, c:\temp\test.txt
}
  if T3 = 0
 {
   FileAppend,
(
%6_Space%□ T3: multiple tumors, >5cm 
)`n, c:\temp\test.txt
}
    FileAppend,   %2_Space% `n, c:\temp\test.txt    ; 輸入空白行幫助排版

;--------------第三段-----------------------------------------------
FileAppend,  2. %1_Space%Tumor Characteristics and Associated Liver Features( , c:\temp\test.txt  
if NonM1= 1
 {
   FileAppend,  ■ Non-assessable) %1_Space% `n, c:\temp\test.txt
}
  if NonM1= 0
 {
   FileAppend,  □ Non-assessable)%1_Space% `n, c:\temp\test.txt
}
If (MTypical = 1)
{
    FileAppend,  %4_Space%■ yes □ no □ equivocal: Typical enhancement pattern `n, c:\temp\test.txt
}
Else If (MTypical = 2)
{
    FileAppend,  %4_Space%□ yes ■ no □ equivocal: Typical enhancement pattern `n, c:\temp\test.txt
}
Else If (MTypical = 3)
{
    FileAppend,  %4_Space%□ yes □ no ■ equivocal: Typical enhancement pattern `n, c:\temp\test.txt
}
Else If (MTypical = 0)
{
    FileAppend,  %4_Space%□ yes □ no □ equivocal: Typical enhancement pattern `n, c:\temp\test.txt
}
If (Mportal=1) 
{
    FileAppend,  
(
%4_Space%■ yes □ no □ equivocal: Major portal vein, location:%1_Space%
), c:\temp\test.txt
}
Else If (Mportal=2) 
{
    FileAppend,
(
%4_Space%□ yes ■ no □ equivocal: Major portal vein, location:%1_Space%
), c:\temp\test.txt
}
Else If (Mportal=3) 
{
    FileAppend,
(
%4_Space%□ yes □ no ■ equivocal: Major portal vein, location:%1_Space%
), c:\temp\test.txt
}
Else If (Mportal=0) 
{
    FileAppend,
(
%4_Space%□ yes □ no □ equivocal: Major portal vein, location:%1_Space%
), c:\temp\test.txt
}
if MPright= 1
 {
   FileAppend,  ■ Right%1_Space%, c:\temp\test.txt
}
  if MPright= 0
 {
   FileAppend,  □ Right%1_Space%, c:\temp\test.txt
}
if MPleft= 1
 {
   FileAppend,  ■ Left%1_Space%, c:\temp\test.txt
}
  if MPleft= 0
 {
   FileAppend,  □ Left%1_Space%, c:\temp\test.txt
}
if MPmain= 1
 {
   FileAppend,  ■ Main%1_Space%, c:\temp\test.txt
}
  if MPmain= 0
 {
   FileAppend,  □ Main%1_Space%, c:\temp\test.txt
}
if MPSMV= 1
 {
   FileAppend,  ■ SMV(T4)`n, c:\temp\test.txt
}
  if MPSMV= 0
 {
   FileAppend,  □ SMV(T4)`n, c:\temp\test.txt
}
If (Mhepatic=1) 
{
    FileAppend,
(
%4_Space%■ yes □ no □ equivocal: Major hepatic vein, location:%1_Space%
), c:\temp\test.txt
}
Else If (Mhepatic=2) 
{
    FileAppend,
(
%4_Space%□ yes ■ no □ equivocal: Major hepatic vein, location:%1_Space%
), c:\temp\test.txt
}
Else If (Mhepatic=3) 
{
    FileAppend,
(
%4_Space%□ yes □ no ■ equivocal: Major hepatic vein, location:%1_Space%
), c:\temp\test.txt
}
Else If (Mhepatic=0) 
{
    FileAppend,
(
%4_Space%□ yes □ no □ equivocal: Major hepatic vein, location:%1_Space%
), c:\temp\test.txt
}
if HPright= 1
 {
   FileAppend,  ■ Right%1_Space%, c:\temp\test.txt
}
  if HPright= 0
 {
   FileAppend,  □ Right%1_Space%, c:\temp\test.txt
}
if HPmid= 1
 {
   FileAppend,  ■ Middle%1_Space%, c:\temp\test.txt
}
  if HPmid= 0
 {
   FileAppend,  □ Middle%1_Space%, c:\temp\test.txt
}
if HPleft= 1
 {
   FileAppend,  ■ Left%1_Space%, c:\temp\test.txt
}
  if HPleft= 0
 {
   FileAppend,  □ Left%1_Space%, c:\temp\test.txt
}
if HPIVC= 1
 {
   FileAppend,  ■ IVC(T4)`n, c:\temp\test.txt
}
  if HPIVC= 0
 {
   FileAppend,  □ IVC(T4)`n, c:\temp\test.txt
}
If (Extra=1) 
{
    FileAppend,
(
%4_Space%■ yes □ no □ equivocal: Extra-hepatic spread(T4)`n
), c:\temp\test.txt
}
Else If (Extra=2) 
{
    FileAppend,
(
%4_Space%□ yes ■ no □ equivocal: Extra-hepatic spread(T4)`n
), c:\temp\test.txt
}
Else If (Extra=3) 
{
    FileAppend,
(
%4_Space%□ yes □ no ■ equivocal: Extra-hepatic spread(T4)`n
), c:\temp\test.txt
}
Else If (Extra=0) 
{
    FileAppend,
(
%4_Space%□ yes □ no □ equivocal: Extra-hepatic spread(T4)`n
), c:\temp\test.txt
}
if Cirrhosis= 1
 {
   FileAppend,  %4_Space%■ Cirrhosis %3_Space%, c:\temp\test.txt
}
  if Cirrhosis= 0
 {
   FileAppend,  %4_Space%□ Cirrhosis %3_Space%, c:\temp\test.txt
}
if Ascites= 1
 {
   FileAppend,  ■ Ascites %3_Space%, c:\temp\test.txt
}
  if Ascites= 0
 {
   FileAppend,  □ Ascites %3_Space%, c:\temp\test.txt
}
if Port= 1
 {
   FileAppend,  ■ Portosystemic collateral vessel `n, c:\temp\test.txt
}
  if Port= 0
 {
   FileAppend,  □ Portosystemic collateral vessel `n, c:\temp\test.txt
}
    FileAppend,   %2_Space% `n, c:\temp\test.txt    ; 輸入空白行幫助排版

;--------------第四段-----------------------------------------------

FileAppend,  3. %1_Space%Regional node metastasis%2_Space%(, c:\temp\test.txt  
if RNon= 1
 {
   FileAppend,  ■ Non-measurable) `n, c:\temp\test.txt
}
  if RNon= 0
 {
   FileAppend,  □ Non-measurable) `n, c:\temp\test.txt
}
if No= 1
 {
   FileAppend,  %4_Space%■ No `n, c:\temp\test.txt
}
  if No= 0
 {
   FileAppend,  %4_Space%□ No `n, c:\temp\test.txt
}
if Nequ= 1
 {
   FileAppend,  
(
%4_Space%■ Equivocal, location:%1_Space%
), c:\temp\test.txt
}
  if Nequ= 0
 {
   FileAppend,  
(
%4_Space%□ Equivocal, location:%1_Space%
), c:\temp\test.txt
}
if Nhi= 1
 {
   FileAppend,  
(
■ hilar  %2_Space%
), c:\temp\test.txt
}
  if Nhi= 0
 {
   FileAppend,  
(
□ hilar  %2_Space%
), c:\temp\test.txt
}
if Nin= 1
 {
   FileAppend,  
(
■ inf. phrenic  %2_Space%
), c:\temp\test.txt
}
  if Nin= 0
 {
   FileAppend,  
(
□ inf. phrenic  %2_Space%
), c:\temp\test.txt
}
if Nhe= 1
 {
   FileAppend,  
(
■ hepatoduodenal lig. %2_Space%
), c:\temp\test.txt
}
  if Nhe= 0
 {
   FileAppend,  
(
□ hepatoduodenal lig. %2_Space%
), c:\temp\test.txt
}
if Nca= 1
 {
   FileAppend, ■ caval `n, c:\temp\test.txt
}
  if Nca= 0
 {
   FileAppend,  □ caval `n, c:\temp\test.txt
}
if Nyes= 1
 {
   FileAppend,  
(
%4_Space%■ Yes, location:%6_Space%%5_Space%%1_Space%
), c:\temp\test.txt
}
  if Nyes= 0
 {
   FileAppend,  
(
%4_Space%□ Yes, location:%6_Space%%5_Space%%1_Space%
), c:\temp\test.txt
}
if Yhi= 1
 {
   FileAppend,  
(
■ hilar  %2_Space%
), c:\temp\test.txt
}
  if Yhi= 0
 {
   FileAppend,  
(
□ hilar  %2_Space%
), c:\temp\test.txt
}
if Yin= 1
 {
   FileAppend,  
(
■ inf. phrenic  %2_Space%
), c:\temp\test.txt
}
  if Yin= 0
 {
   FileAppend,  
(
□ inf. phrenic  %2_Space%
), c:\temp\test.txt
}
if Yhe= 1
 {
   FileAppend,  
(
■ hepatoduodenal lig. %2_Space%
), c:\temp\test.txt
}
  if Yhe= 0
 {
   FileAppend,  
(
□ hepatoduodenal lig. %2_Space%
), c:\temp\test.txt
}
if Yca= 1
 {
   FileAppend, ■ caval `n, c:\temp\test.txt
}
  if Yca= 0
 {
   FileAppend,  □ caval `n, c:\temp\test.txt
}
FileAppend,   %2_Space% `n, c:\temp\test.txt    ; 輸入空白行幫助排版

;--------------第五段-----------------------------------------------

   FileAppend,  4. %1_Space%Distant metastasis(in this study)`n, c:\temp\test.txt  
if DM0= 1
 {
   FileAppend,  %4_Space%■ No %1_Space%, c:\temp\test.txt
}
  if DM0 = 0
 {
   FileAppend,  %4_Space%□ No %1_Space%, c:\temp\test.txt
}
    FileAppend,  `n, c:\temp\test.txt  ;跳行
if DM1= 1
 {
   FileAppend,  
(
%4_Space%■ Equivocal, location: %1_Space%__%DM3%__
), c:\temp\test.txt
}
  if DM1 = 0
 {
   FileAppend,  
(
%4_Space%□ Equivocal, location:  _____%DM3%______
), c:\temp\test.txt
}
    FileAppend,   %2_Space%`n, c:\temp\test.txt 
if DM2= 1
 {
   FileAppend,  
(
%4_Space%■ Yes, location: %1_Space%__%DM4%__
)`n, c:\temp\test.txt
}
  if DM2 = 0
 {
   FileAppend,  
(
%4_Space%□ Yes, location:  _____%DM4%______
)`n, c:\temp\test.txt
}
    FileAppend,   %2_Space% `n, c:\temp\test.txt    ; 輸入空白行幫助排版
;-------------------------------------------------------------
    FileAppend,  5. %1_Space%Other findings: `n, c:\temp\test.txt 
    FileAppend,  %4_Space%______%OF0%________ `n, c:\temp\test.txt 
; ==================================
   FileRead, ClipboardContent, c:\temp\test.txt
    ; 將內容複製到剪貼簿
    Clipboard := ClipboardContent
    MsgBox, %Clipboard%
return

Exit:
    GuiClose:
    ExitApp
return
