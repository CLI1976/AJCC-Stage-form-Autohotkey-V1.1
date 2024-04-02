; Ovarian cancer Imaging Report Generator
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

; ---------------Tumor Size/Location---------------
Gui, Font, s12 bold, Arial   ; 改大改粗體
Gui, Add, Text, y15 x20, 1. Tumor location / Size
Gui, Font ; 重置字體設置(不加這個 粗體改不回來)
Gui, Font, s10, Arial   ; 恢復
Gui, Add, Text, y15 x201, (
Gui, Add, Checkbox, vL1 y15 x206, Tx: Not assessable)
Gui, Add, Checkbox, vL2 y40 x40, No or Equivocal
Gui, Add, Text, y60 x40, Location: 
Gui, Add, Checkbox, vL3 y60 x100, Right
Gui, Add, Checkbox, vL4 y60 x155, Left 
Gui, Add, Checkbox, vL5 y60 x207, Bilateral 
Gui, Add, Checkbox, vL6 y60 x283, Difficult to determine
Gui, Add, Text, y85 x40, Size: 
Gui, Add, Checkbox, vL7 y85 x76, Non-measureable
Gui, Add, Checkbox, vL8 y85 x204, Measurable: 
Gui, Add, Edit, vL9 y80 x300 w40
Gui, Add, Text, y85 x343, cm (length or largest diameter)

; ---------------Tumor Invastion---------------
  Gui, Font, s12 bold, Arial   ; 改大改粗體
  Gui, Add, Text, y115 x20, 2. Tumor invasion or encasement
   Gui, Font ; 重置字體設置(不加這個 粗體改不回來)
  Gui, Font, s10, Arial   ; 恢復
Gui, Add, Text, y115 x281, (
  Gui, Add, Checkbox, vT1 y115 x287, Not assessable)
 Gui, Add, Checkbox, vT2 y135 x40, T0: No evidence of primary tumor.
 Gui, Add, Checkbox, vT3 y155 x40, T1a: Limited to one ovary or fallopian tube.
 Gui, Add, Checkbox, vT4 y175 x40, T1b: Limited to both ovaries or fallopian tubes.
 Gui, Add, Checkbox, vT5 y195 x40, T2a: Visible tumor implant or peritoneal thickening on tube or uterus.
 Gui, Add, Checkbox, vT6 y215 x40, T2b: Visible tumor implant or peritoneal thickening on other pelvic tissue*.
 Gui, Add, Checkbox, vT7 y235 x40, T3: Visible tumor implant or peritoneal thickening outside pelvis.
 Gui, Add, Checkbox, vT8 y255 x60, T3b: <= 2cm
 Gui, Add, Checkbox, vT9 y275 x60, T3c: > 2cm
 Gui, Add, Checkbox, vT10 y295 x40, Ascites
 Gui, Add, Checkbox, vT11 y320 x40, Others:
 Gui, Add, Edit, vT21 y315 x105 w200
Gui, Add, Text, y340 x40,  *Pelvic cavity在影像判讀上以iliac crest的上緣為界限

; ---------------Regional nodal metastasis---------------
 Gui, Font, s12 bold, Arial   ; 改大改粗體
 Gui, Add, Text, y370 x20, 3. Regional nodal metastasis
 Gui, Font ; 重置字體設置(不加這個 粗體改不回來)
 Gui, Font, s10, Arial   ; 恢復
 Gui, Add, Text, y370 x245, (
  Gui, Add, Checkbox, vNot y370 x253, Not assessable)
 Gui, Add, Checkbox, vNo y390 x40, No 
 Gui, Add, Checkbox, vE1 y410 x40, Equivocal ( 5-10 mm)
 Gui, Add, Checkbox, vE2 y430 x60, External iliac:
 Gui, Add, Checkbox, vE3 y430 x166, Right
 Gui, Add, Checkbox, vE4 y430 x220, Left
 Gui, Add, Checkbox, vE5 y450 x60, Internal iliac:
 Gui, Add, Checkbox, vE6 y450 x166, Right
 Gui, Add, Checkbox, vE7 y450 x220, Left
 Gui, Add, Checkbox, vE8 y470 x60, Obturator:
 Gui, Add, Checkbox, vE9 y470 x166, Right
 Gui, Add, Checkbox, vE10 y470  x220, Left
 Gui, Add, Checkbox, vE11 y490 x60, Common iliac:
 Gui, Add, Checkbox, vE12 y490 x166, Right
 Gui, Add, Checkbox, vE13 y490  x220, Left
 Gui, Add, Checkbox, vE14 y510 x60, Inguinal: 
 Gui, Add, Checkbox, vE15 y510 x166, Right
 Gui, Add, Checkbox, vE16 y510  x220, Left
 Gui, Add, Checkbox, vE17 y530 x60, Paraaortic:
 Gui, Add, Checkbox, vE18 y530 x166, Inframesenteric
 Gui, Add, Checkbox, vE19 y530 x280, Infrarenal
 Gui, Add, Checkbox, vE20 y530 x360, Suprarenal
 Gui, Add, Checkbox, vY1 y550 x40, Yes ( > 10 mm)
 Gui, Add, Checkbox, vY2 y570 x60, External iliac:
 Gui, Add, Checkbox, vY3 y570 x166, Right
 Gui, Add, Checkbox, vY4 y570 x220, Left
 Gui, Add, Checkbox, vY5 y590 x60, Internal iliac:
 Gui, Add, Checkbox, vY6 y590 x166, Right
 Gui, Add, Checkbox, vY7 y590 x220, Left
 Gui, Add, Checkbox, vY8 y610 x60, Obturator:
 Gui, Add, Checkbox, vY9 y610 x166, Right
 Gui, Add, Checkbox, vY10 y610  x220, Left
 Gui, Add, Checkbox, vY11 y630 x60, Common iliac:
 Gui, Add, Checkbox, vY12 y630 x166, Right
 Gui, Add, Checkbox, vY13 y630  x220, Left
 Gui, Add, Checkbox, vY14 y650 x60, Inguinal: 
 Gui, Add, Checkbox, vY15 y650 x166, Right
 Gui, Add, Checkbox, vY16 y650  x220, Left
 Gui, Add, Checkbox, vY17 y670 x60, Paraaortic:
 Gui, Add, Checkbox, vY18 y670 x166, Inframesenteric
 Gui, Add, Checkbox, vY19 y670 x280, Infrarenal
 Gui, Add, Checkbox, vY20 y670 x360, Suprarenal

; ---------------Distant Metastasis---------------
   Gui, Font, s12 bold, Arial   ; 改大改粗體
  Gui, Add, Text, y700 x20, 4. Distant metastasis
  Gui, Font ; 重置字體設置(不加這個 粗體改不回來)
 Gui, Font, s10, Arial   ; 恢復
 Gui, Add, Text, y700 x165, (in this study)
 Gui, Add, Checkbox, vDM0 y720 x40, No or Equivocal
 Gui, Add, Checkbox, vDM1 y740 x40, Yes (specified as below) M1 (FIGO IV)
 Gui, Add, Checkbox, vDM2 y765 x60, Liver
 Gui, Add, Checkbox, vDM3 y765 x115, Lung
 Gui, Add, Checkbox, vDM4 y765 x170, Pleura
 Gui, Add, Checkbox, vDM5 y765 x237, Others:
 Gui, Add, Edit, vDM6 y760 x305 w150
 
; ---------------Other Findings---------------
  Gui, Font, s12 bold, Arial   ; 改大改粗體
  Gui, Add, Text, y795 x20, 5. Other findings
  Gui, Font ; 重置字體設置(不加這個 粗體改不回來)
  Gui, Font, s10, Arial   ; 恢復
  Gui, Add, Edit, vOF0 y815 x40 w450
  Gui, Add, Checkbox, vOF1 y840 x40, Pleural effusion

; Buttons
 Gui, Font, s12 bold, Arial   ; 改大改粗體
 Gui, Add, Button, Default gGenerateReport y880 x20, Generate Report
 Gui, Add, Button, gExit y880 x170, Exit

; Show GUI
Gui, Show, w615 h930, Ovarian Cancer Imaging Report Generator
return

; === 生成報告===
GenerateReport:
    ; Collect data from GUI
    Gui, Submit, NoHide
     ; 刪除現有的 test.txt 文件
    FileDelete, c:\temp\test.txt
    ; 將結果逐行輸入test.txt中
FormatTime, CurrentDate,, yyyy/MM/dd
FileAppend,  Addtional report for cancer staging  on %CurrentDate%`n, c:\temp\test.txt    ; 輸入空白行幫助排版
FileAppend,   =========================================== `n, c:\temp\test.txt 
    FileAppend, MCH Imaging Report for Ovarian Cancer (AJCC 8th) `n, c:\temp\test.txt
    FileAppend,    `n, c:\temp\test.txt    ; 輸入空白行幫助排版
    FileAppend, *本表單僅依據單次影像進行分期供腫瘤團隊參考，並不代表病人的臨床分期，臨床分期需綜合病人臨床發現、各種影像(包括各種內視鏡及超音波檢查)及病理表現來進行判斷，病人的最終臨床分期可能因癌症團隊討論有所異動，敬請參閱病歷首頁。 `n, c:\temp\test.txt
    FileAppend,   %2_Space% `n, c:\temp\test.txt    ; 輸入空白行幫助排版
;-------------------------------------------------------------
    
;--------------第一段-----------------------------------------------
FileAppend,  1. %1_Space%Tumor location / size , c:\temp\test.txt  
if L1 = 1
 {
   FileAppend,  %2_Space%(■ Tx: Not assessable)  `n, c:\temp\test.txt
}
  if L1 = 0
 {
   FileAppend,  %2_Space%(□ Tx: Not assessable)  `n, c:\temp\test.txt
}
if L2 = 1
 {
   FileAppend,  %4_Space%■ No or Equivocal  `n, c:\temp\test.txt
}
  if L2 = 0
 {
   FileAppend,  %4_Space%□ No or Equivocal  `n, c:\temp\test.txt
}
   FileAppend,  %4_Space%Location: , c:\temp\test.txt
if L3 = 1
 {
   FileAppend,  %2_Space%■ Right, c:\temp\test.txt
}
  if L3 = 0
 {
   FileAppend,  %2_Space%□ Right,  c:\temp\test.txt
}
if L4 = 1
 {
   FileAppend,  %2_Space%■ Left, c:\temp\test.txt
}
  if L4 = 0
 {
   FileAppend,  %2_Space%□ Left,  c:\temp\test.txt
}
if L5 = 1
 {
   FileAppend,  %2_Space%■ Bilateral, c:\temp\test.txt
}
  if L5 = 0
 {
   FileAppend,  %2_Space%□ Bilateral,  c:\temp\test.txt
}
if L6 = 1
 {
   FileAppend,  %2_Space%■ Difficult to determine `n, c:\temp\test.txt
}
  if L6 = 0
 {
   FileAppend,  %2_Space%□ Difficult to determine `n ,  c:\temp\test.txt
}

FileAppend,  %4_Space%Size: , c:\temp\test.txt
if L7 = 1
 {
   FileAppend,  %2_Space%■ Non-measureable, c:\temp\test.txt
}
  if L7 = 0
 {
   FileAppend,  %2_Space%□ Non-measureable,  c:\temp\test.txt
}
if L8 = 1
 {
   FileAppend,  %2_Space%■ Measurable: __%L9%__cm (length or largest diameter) `n, c:\temp\test.txt
}
  if L8 = 0
 {
   FileAppend,  %2_Space%□ Measurable: __%L9%__ cm (length or largest diameter) `n,  c:\temp\test.txt
}

 FileAppend,   %2_Space% `n, c:\temp\test.txt    ; 輸入空白行幫助排版

;--------------第二段-----------------------------------------------
FileAppend,  2. %1_Space%Tumor invasion or encasement  , c:\temp\test.txt  

if T1= 1
 {
   FileAppend,  %2_Space%(■ Not assessable)`n, c:\temp\test.txt
}
  if T1= 0
 {
   FileAppend,  %2_Space%(□ Not assessable)`n, c:\temp\test.txt
}
if T2= 1
 {
   FileAppend,  %4_Space%■ T0: No evidence of primary tumor `n, c:\temp\test.txt
}
  if T2= 0
 {
   FileAppend,  %4_Space%□ T0: No evidence of primary tumor `n, c:\temp\test.txt
}
 if T3= 1
 {
   FileAppend,  %4_Space%■ T1a: Limited to one ovary or fallopian tube. `n, c:\temp\test.txt
}
  if T3= 0
 {
   FileAppend,  %4_Space%□ T1a: Limited to one ovary or fallopian tube.  `n, c:\temp\test.txt
}
if T4= 1
 {
   FileAppend,  
(
%4_Space%■ T1b: Limited to both ovaries or fallopian tubes.
 )`n, c:\temp\test.txt
}
  if T4= 0
 {
   FileAppend,  
(
%4_Space%□ T1b: Limited to both ovaries or fallopian tubes.
) `n, c:\temp\test.txt
}
if T5= 1
 {
   FileAppend,  %4_Space%■ T2a: Visible tumor implant or peritoneal thickening on tube or uterus.  `n, c:\temp\test.txt
}
  if T5= 0
 {
   FileAppend,  %4_Space%□ T2a: Visible tumor implant or peritoneal thickening on tube or uterus. `n, c:\temp\test.txt
}
if T6= 1
 {
   FileAppend, 
(
%4_Space%■ T2b: Visible tumor implant or peritoneal thickening on other pelvic tissue*.
)`n , c:\temp\test.txt
}
  if T6= 0
 {
   FileAppend,  
(
%4_Space%□ T2b: Visible tumor implant or peritoneal thickening on other pelvic tissue*.
)`n , c:\temp\test.txt
}
if T7= 1
 {
   FileAppend, 
(
%4_Space%■ T3: Visible tumor implant or peritoneal thickening outside pelvis.
)`n , c:\temp\test.txt
}
  if T7= 0
 {
   FileAppend,  
(
%4_Space%□ T3: Visible tumor implant or peritoneal thickening outside pelvis.
)`n , c:\temp\test.txt
}
if T8= 1
 {
   FileAppend, 
(
%4_Space%%4_Space%■ T3b: <= 2cm
)`n , c:\temp\test.txt
}
  if T8= 0
 {
   FileAppend,  
(
%4_Space%%4_Space%□ T3b: <= 2cm
)`n , c:\temp\test.txt
}
if T9= 1
 {
   FileAppend,  %4_Space%%4_Space%■ T3c: > 2cm `n, c:\temp\test.txt
}
  if T9= 0
 {
   FileAppend,  %4_Space%%4_Space%□ T3c: > 2cm `n, c:\temp\test.txt
}
if T10= 1
 {
   FileAppend, %4_Space%■ Ascites `n, c:\temp\test.txt
}
  if T10= 0
 {
   FileAppend,  %4_Space%□ Ascites `n, c:\temp\test.txt
}
if T11= 1
 {
   FileAppend,  %4_Space%■ Others: __%T12%__`n, c:\temp\test.txt
}
  if T11= 0
 {   
FileAppend,  %4_Space%□ Others: __%T12%__`n, c:\temp\test.txt
}
FileAppend,  %4_Space% *Pelvic cavity在影像判讀上以iliac crest的上緣為界限 `n, c:\temp\test.txt  

FileAppend,   %2_Space% `n, c:\temp\test.txt    ; 輸入空白行幫助排版

;--------------第三段-----------------------------------------------

FileAppend,  3. %1_Space%Regional nodal metastasis(, c:\temp\test.txt  
if Not= 1
 {
   FileAppend,  ■ Not assessable) %1_Space% `n, c:\temp\test.txt
}
  if Not= 0
 {
   FileAppend,  □ Not assessable)%1_Space% `n, c:\temp\test.txt
}
if No= 1
 {
   FileAppend,  %4_Space%■ No `n, c:\temp\test.txt
}
  if No= 0
 {
   FileAppend,  %4_Space%□ No `n, c:\temp\test.txt
}
if E1= 1
 {
   FileAppend,  %4_Space%■ Equivocal ( 5-10 mm)  `n, c:\temp\test.txt
}
  if E1= 0
 {
   FileAppend,  %4_Space%□ Equivocal ( 5-10 mm)  `n, c:\temp\test.txt
}
if E2= 1
 {
   FileAppend,  %4_Space%%4_Space%■ External iliac:, c:\temp\test.txt
}
  if E2= 0
 {
   FileAppend, %4_Space%%4_Space%□ External iliac:, c:\temp\test.txt
}
if E3= 1
 {
   FileAppend,  %2_Space%■  Right, c:\temp\test.txt
}
  if E3= 0
 {
   FileAppend, %2_Space%□  Right, c:\temp\test.txt
}
if E4= 1
 {
   FileAppend,  %2_Space%■  Left `n, c:\temp\test.txt
}
  if E4= 0
 {
   FileAppend, %2_Space%□  Left `n, c:\temp\test.txt
}
if E5= 1
 {
   FileAppend,  %4_Space%%4_Space%■ Internal iliac:, c:\temp\test.txt
}
  if E5= 0
 {
   FileAppend, %4_Space%%4_Space%□ Internal iliac:, c:\temp\test.txt
}
if E6= 1
 {
   FileAppend,  %2_Space%■  Right, c:\temp\test.txt
}
  if E6= 0
 {
   FileAppend, %2_Space%□  Right, c:\temp\test.txt
}
if E7= 1
 {
   FileAppend,  %2_Space%■  Left `n, c:\temp\test.txt
}
  if E7= 0
 {
   FileAppend, %2_Space%□  Left `n, c:\temp\test.txt
}
if E8= 1
 {
   FileAppend,  %4_Space%%4_Space%■ Obturator:, c:\temp\test.txt
}
  if E8= 0
 {
   FileAppend, %4_Space%%4_Space%□ Obturator:, c:\temp\test.txt
}
if E9= 1
 {
   FileAppend,  %2_Space%■  Right, c:\temp\test.txt
}
  if E9= 0
 {
   FileAppend, %2_Space%□  Right, c:\temp\test.txt
}
if E10= 1
 {
   FileAppend,  %2_Space%■  Left `n, c:\temp\test.txt
}
  if E10= 0
 {
   FileAppend, %2_Space%□  Left `n, c:\temp\test.txt
}
if E11= 1
 {
   FileAppend,  %4_Space%%4_Space%■ Common iliac:, c:\temp\test.txt
}
  if E11= 0
 {
   FileAppend, %4_Space%%4_Space%□ Common iliac:, c:\temp\test.txt
}
if E12= 1
 {
   FileAppend,  %2_Space%■  Right, c:\temp\test.txt
}
  if E12= 0
 {
   FileAppend, %2_Space%□  Right, c:\temp\test.txt
}
if E13= 1
 {
   FileAppend,  %2_Space%■  Left `n, c:\temp\test.txt
}
  if E13= 0
 {
   FileAppend, %2_Space%□  Left `n, c:\temp\test.txt
}
if E14= 1
 {
   FileAppend,  %4_Space%%4_Space%■ Inguinal: , c:\temp\test.txt
}
  if E14= 0
 {
   FileAppend, %4_Space%%4_Space%□ Inguinal: , c:\temp\test.txt
}
if E15= 1
 {
   FileAppend,  %2_Space%■  Right, c:\temp\test.txt
}
  if E15= 0
 {
   FileAppend, %2_Space%□  Right, c:\temp\test.txt
}
if E16= 1
 {
   FileAppend,  %2_Space%■  Left `n, c:\temp\test.txt
}
  if E16= 0
 {
   FileAppend, %2_Space%□  Left `n, c:\temp\test.txt
}
if E17= 1
 {
   FileAppend,  %4_Space%%4_Space%■ Paraaortic:, c:\temp\test.txt
}
  if E17= 0
 {
   FileAppend, %4_Space%%4_Space%□ Paraaortic:, c:\temp\test.txt
}
if E18= 1
 {
   FileAppend,  %2_Space%■  Inframesenteric, c:\temp\test.txt
}
  if E18= 0
 {
   FileAppend, %2_Space%□  Inframesenteric, c:\temp\test.txt
}
if E19= 1
 {
   FileAppend,  %2_Space%■  Infrarenal, c:\temp\test.txt
}
  if E19= 0
 {
   FileAppend, %2_Space%□  Infrarenal, c:\temp\test.txt
}
if E20= 1
 {
   FileAppend,  %2_Space%■  Suprarenal `n, c:\temp\test.txt
}
  if E20= 0
 {
   FileAppend, %2_Space%□ Suprarenal`n, c:\temp\test.txt
}


if Y1= 1
 {
   FileAppend,  %4_Space%■ Yes ( > 10 mm)  `n, c:\temp\test.txt
}
  if Y1= 0
 {
   FileAppend,  %4_Space%□ Yes ( > 10 mm)  `n, c:\temp\test.txt
}
if Y2= 1
 {
   FileAppend,  %4_Space%%4_Space%■ External iliac:, c:\temp\test.txt
}
  if Y2= 0
 {
   FileAppend, %4_Space%%4_Space%□ External iliac:, c:\temp\test.txt
}
if Y3= 1
 {
   FileAppend,  %2_Space%■  Right, c:\temp\test.txt
}
  if Y3= 0
 {
   FileAppend, %2_Space%□  Right, c:\temp\test.txt
}
if Y4= 1
 {
   FileAppend,  %2_Space%■  Left `n, c:\temp\test.txt
}
  if Y4= 0
 {
   FileAppend, %2_Space%□  Left `n, c:\temp\test.txt
}
if Y5= 1
 {
   FileAppend,  %4_Space%%4_Space%■ Internal iliac:, c:\temp\test.txt
}
  if Y5= 0
 {
   FileAppend, %4_Space%%4_Space%□ Internal iliac:, c:\temp\test.txt
}
if Y6= 1
 {
   FileAppend,  %2_Space%■  Right, c:\temp\test.txt
}
  if Y6= 0
 {
   FileAppend, %2_Space%□  Right, c:\temp\test.txt
}
if Y7= 1
 {
   FileAppend,  %2_Space%■  Left `n, c:\temp\test.txt
}
  if Y7= 0
 {
   FileAppend, %2_Space%□  Left `n, c:\temp\test.txt
}
if Y8= 1
 {
   FileAppend,  %4_Space%%4_Space%■ Obturator:, c:\temp\test.txt
}
  if Y8= 0
 {
   FileAppend, %4_Space%%4_Space%□ Obturator:, c:\temp\test.txt
}
if Y9= 1
 {
   FileAppend,  %2_Space%■  Right, c:\temp\test.txt
}
  if Y9= 0
 {
   FileAppend, %2_Space%□  Right, c:\temp\test.txt
}
if Y10= 1
 {
   FileAppend,  %2_Space%■  Left `n, c:\temp\test.txt
}
  if Y10= 0
 {
   FileAppend, %2_Space%□  Left `n, c:\temp\test.txt
}
if Y11= 1
 {
   FileAppend,  %4_Space%%4_Space%■ Common iliac:, c:\temp\test.txt
}
  if Y11= 0
 {
   FileAppend, %4_Space%%4_Space%□ Common iliac:, c:\temp\test.txt
}
if Y12= 1
 {
   FileAppend,  %2_Space%■  Right, c:\temp\test.txt
}
  if Y12= 0
 {
   FileAppend, %2_Space%□  Right, c:\temp\test.txt
}
if Y13= 1
 {
   FileAppend,  %2_Space%■  Left `n, c:\temp\test.txt
}
  if Y13= 0
 {
   FileAppend, %2_Space%□  Left `n, c:\temp\test.txt
}
if Y14= 1
 {
   FileAppend,  %4_Space%%4_Space%■ Inguinal: , c:\temp\test.txt
}
  if Y14= 0
 {
   FileAppend, %4_Space%%4_Space%□ Inguinal: , c:\temp\test.txt
}
if Y15= 1
 {
   FileAppend,  %2_Space%■  Right, c:\temp\test.txt
}
  if Y15= 0
 {
   FileAppend, %2_Space%□  Right, c:\temp\test.txt
}
if Y16= 1
 {
   FileAppend,  %2_Space%■  Left `n, c:\temp\test.txt
}
  if Y16= 0
 {
   FileAppend, %2_Space%□  Left `n, c:\temp\test.txt
}
if Y17= 1
 {
   FileAppend,  %4_Space%%4_Space%■ Paraaortic:, c:\temp\test.txt
}
  if Y17= 0
 {
   FileAppend, %4_Space%%4_Space%□ Paraaortic:, c:\temp\test.txt
}
if Y18= 1
 {
   FileAppend,  %2_Space%■  Inframesenteric, c:\temp\test.txt
}
  if Y18= 0
 {
   FileAppend, %2_Space%□  Inframesenteric, c:\temp\test.txt
}
if Y19= 1
 {
   FileAppend,  %2_Space%■  Infrarenal, c:\temp\test.txt
}
  if Y19= 0
 {
   FileAppend, %2_Space%□  Infrarenal, c:\temp\test.txt
}
if Y20= 1
 {
   FileAppend,  %2_Space%■  Suprarenal `n, c:\temp\test.txt
}
  if Y20= 0
 {
   FileAppend, %2_Space%□ Suprarenal`n, c:\temp\test.txt
}

FileAppend,   %2_Space% `n, c:\temp\test.txt    ; 輸入空白行幫助排版

;--------------第四段-----------------------------------------------

   FileAppend,  4. %1_Space%Distant metastasis(in this study)`n, c:\temp\test.txt  
if DM0= 1
 {
   FileAppend,  
(
%4_Space%■ No or Equivocal
) `n, c:\temp\test.txt
}
  if DM0 = 0
 {
   FileAppend,  
(
%4_Space%□ No or Equivocal
) `n, c:\temp\test.txt
}
if DM1= 1
 {
   FileAppend,  
(
%4_Space%■ Yes (specified as below) M1 (FIGO IV)
)`n, c:\temp\test.txt
}
  if DM1 = 0
 {
   FileAppend,  
(
%4_Space%□ Yes (specified as below) M1 (FIGO IV)
)`n, c:\temp\test.txt
}    
if DM2= 1
 {
   FileAppend,  %4_Space%%4_Space%■  Liver, c:\temp\test.txt
}
  if DM2= 0
 {
   FileAppend, %4_Space%%4_Space%□  Liver, c:\temp\test.txt
}
if DM3= 1
 {
   FileAppend,  %2_Space%■ Lung, c:\temp\test.txt
}
  if DM3 = 0
 {
   FileAppend, %2_Space%□  Lung, c:\temp\test.txt
}
if DM4= 1
 {
   FileAppend,  %2_Space%■ Pleura, c:\temp\test.txt
}
  if DM4= 0
 {
   FileAppend,  %2_Space%□ Pleura, c:\temp\test.txt
}
if DM5= 1
 {
   FileAppend,  %2_Space%■ Others:__%DM6%__ `n , c:\temp\test.txt
}
  if DM5= 0
 {
   FileAppend,  %2_Space%□ Others:__%DM6%__ `n , c:\temp\test.txt
}


    FileAppend,   %2_Space% `n, c:\temp\test.txt    ; 輸入空白行幫助排版
;-------------------------------------------------------------
    FileAppend,  5. %1_Space%Other findings: , c:\temp\test.txt 
    FileAppend,  %4_Space%__%OF0%__ `n, c:\temp\test.txt 
    FileAppend,   %2_Space% `n, c:\temp\test.txt    ; 輸入空白行幫助排版
if OF1= 1
 {
   FileAppend,  ■ Pleural effusion `n , c:\temp\test.txt
}
  if OF1= 0
 {
   FileAppend,  □ Pleural effusion `n , c:\temp\test.txt
}
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
