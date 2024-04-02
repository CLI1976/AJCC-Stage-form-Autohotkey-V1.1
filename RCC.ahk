; Renal cell cancer Imaging Report Generator
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

; ---------------Tumor Location---------------
Gui, Font, s12 bold, Arial   ; 改大改粗體
Gui, Add, Text, y15 x20, 1. Tumor location/Size
Gui, Font ; 重置字體設置(不加這個 粗體改不回來)
Gui, Font, s10, Arial   ; 恢復
Gui, Add, Text, y15 x197, (
Gui, Add, Checkbox, vL1 y15 x203, Not assessable)
Gui, Add, Checkbox, vL2 y35 x40, No evidence of primary tumor.
Gui, Add, Text, y55 x40, Location: 
Gui, Add, Checkbox, vL3 y55 x105, Left
Gui, Add, Checkbox, vL4 y55 x150, Right
Gui, Add, Checkbox, vL5 y55 x203, Both
 Gui, Add, Text, y75 x40, Size: 
 Gui, Add, Checkbox, vL6 y75 x80, Non-measurable
 Gui, Add, Checkbox, vL7 y100 x40, Measurable: 
 Gui, Add, Edit, vL8 y95 x131 w40
 Gui, Add, Text, y100 x173, cm (greatest diameter) at 
Gui, Add, Checkbox, vL9 y100 x320, Right kidney
 Gui, Add, Checkbox, vL10 y100 x415, Left Kidney
 
; ---------------Tumor Invastion---------------
 Gui, Font, s12 bold, Arial   ; 改大改粗體
 Gui, Add, Text, y130 x20, 2. Tumor invasion
 Gui, Font ; 重置字體設置(不加這個 粗體改不回來)
 Gui, Font, s10, Arial   ; 恢復
 Gui, Add, Text, y130 x161, (
 Gui, Add, Checkbox, vT1 y130 x168, Not assessable)
 Gui, Add, Checkbox, vT2 y150 x40, T0: No evidence of primary tumor.
Gui, Add, Text, y170 x40,  Tumor limited to the kidney.
 Gui, Add, Checkbox, vT3 y190 x40, T1a: Tumor <= 4 cm.
 Gui, Add, Checkbox, vT4 y210 x40,T1b: Tumor > 4 cm but <= 7 cm.
Gui, Add, Checkbox, vT5 y230 x40, T2a: Tumor > 7 cm but <= 10 cm.
Gui, Add, Checkbox, vT6 y250 x40, T2b: Tumor > 10 cm.
Gui, Add, Text, y270 x40,    Tumor invades: 
 Gui, Add, Checkbox, vT7 y290 x40,T3a: Renal vein.
Gui, Add, Checkbox, vT8 y310 x40, T3a: Renal sinus fat
Gui, Add, Checkbox, vT9 y330 x40, T3a: Perirenal fat.
 Gui, Add, Checkbox, vT10 y350 x40,T3b: IVC below diaphragm
Gui, Add, Checkbox, vT11 y370 x40, T3c: IVC Above the diaphragm.
Gui, Add, Checkbox, vT12 y390 x40, T4: Beyond the Gerota’s fascia.
Gui, Add, Checkbox, vT13 y410 x40, T4: Ipsilateral Adrenal gland.

; ---------------Regional nodal metastasis---------------
  Gui, Font, s12 bold, Arial   ; 改大改粗體
  Gui, Add, Text, y440 x20, 3. Regional nodal metastasis
  Gui, Font ; 重置字體設置(不加這個 粗體改不回來)
  Gui, Font, s10, Arial   ; 恢復
 Gui, Add, Text, y440 x245, (
  Gui, Add, Checkbox, vNot y440 x253, Not assessable)
 Gui, Add, Checkbox, vNo y460 x40, No or Equivocal
 Gui, Add, Checkbox, vYes y480 x40, Yes. Location at:
 Gui, Add, Checkbox, vY1 y500 x60, Renal hilar
 Gui, Add, Checkbox, vY2 y520 x60, Caval (precaval, inter-aortocaval, para-caval, retrocaval)
 Gui, Add, Checkbox, vY3 y540 x60, Aortic (Pre-aortic, para-aortic, retro-aortic, para-aorta)
Gui, Add, Checkbox, vY4 y565 x60, Others:
Gui, Add, Edit, vY5 y560 x125 w200

;  
;
;; ---------------Distant Metastasis---------------
   Gui, Font, s12 bold, Arial   ; 改大改粗體
  Gui, Add, Text, y595 x20, 4. Distant metastasis
  Gui, Font ; 重置字體設置(不加這個 粗體改不回來)
  Gui, Font, s10, Arial   ; 恢復
  Gui, Add, Text, y595 x165, (in this study)
  Gui, Add, Checkbox, vDM0 y615 x40, No or Equivocal
 Gui, Add, Checkbox, vDM1 y640 x40, Yes, location: 
 Gui, Add, Checkbox, vDM2 y640 x140, Liver
 Gui, Add, Checkbox, vDM3 y640 x188, Lung 
 Gui, Add, Checkbox, vDM4 y640 x238, Bone
 Gui, Add, Checkbox, vDM5 y640 x288, Others 
Gui, Add, Edit, vDM6 y635 x350 w150
 
; ---------------Other Findings---------------
 Gui, Font, s12 bold, Arial   ; 改大改粗體
 Gui, Add, Text, y670 x20, 5. Other findings
 Gui, Font ; 重置字體設置(不加這個 粗體改不回來)
 Gui, Font, s10, Arial   ; 恢復
 Gui, Add, Edit, vOF0 y690 x40 w500



; Buttons
 Gui, Font, s12 bold, Arial   ; 改大改粗體
 Gui, Add, Button, Default gGenerateReport y740 x20, Generate Report
 Gui, Add, Button, gExit y740 x170, Exit

; Show GUI
Gui, Show,  w580 h790, Renal cell carcinoma Imaging Report Generator
return

; === 生成報告===
GenerateReport:
    ; Collect data from GUI
    Gui, Submit, NoHide
     ; 刪除現有的 test.txt 文件
    FileDelete, c:\temp\test.txt
    ; 將結果逐行輸入test.txt中
FormatTime, CurrentDate,, yyyy/MM/dd
FileAppend,  Addtional report for cancer staging  on %CurrentDate% `n, c:\temp\test.txt    ; 輸入空白行幫助排版
FileAppend,   =========================================== `n, c:\temp\test.txt 
    FileAppend, MCH Imaging Report for Cancer of kidney (Renal cell carcinoma) (AJCC 8th)`n, c:\temp\test.txt
    FileAppend,    `n, c:\temp\test.txt    ; 輸入空白行幫助排版
    FileAppend, 本表單僅依據單次影像進行分期供腫瘤團隊參考，並不代表病人的臨床分期，臨床分期需綜合病人臨床發現、各種影像(包括各種內視鏡及超音波檢查)及病理表現來進行判斷，病人的最終臨床分期可能因癌症團隊討論有所異動，敬請參閱病歷首頁。 `n, c:\temp\test.txt
    FileAppend,   %2_Space% `n, c:\temp\test.txt    ; 輸入空白行幫助排版
;-------------------------------------------------------------
    
;--------------第二段-----------------------------------------------
FileAppend,  1. %1_Space%Tumor location / size , c:\temp\test.txt  
if L1 = 1
 {
   FileAppend,  %2_Space%(■ Not assessable)  `n, c:\temp\test.txt
}
  if L1 = 0
 {
   FileAppend,  %2_Space%(□ Not assessable)  `n, c:\temp\test.txt
}
if L2 = 1
 {
   FileAppend,  %4_Space%■ No or Equivocal `n, c:\temp\test.txt
}
  if L2 = 0
 {
   FileAppend,  %4_Space%□ No or Equivocal `n, c:\temp\test.txt
}
 FileAppend,  %4_Space%Location: , c:\temp\test.txt
if L3 = 1
 {
   FileAppend,  %2_Space%■ Left, c:\temp\test.txt
}
  if L3 = 0
 {
   FileAppend,  %2_Space%□ Left,  c:\temp\test.txt
}
if L4= 1
 {
   FileAppend,  %2_Space%■ Right , c:\temp\test.txt
}
  if L4 = 0
 {
   FileAppend,  %2_Space%□ Right ,  c:\temp\test.txt
}
if L5 = 1
 {
   FileAppend,  %2_Space%■ Both `n , c:\temp\test.txt
}
  if L5 = 0
 {
   FileAppend,  %2_Space%□ Both `n ,  c:\temp\test.txt
}
FileAppend,  %4_Space%Size: , c:\temp\test.txt
if L6 = 1
 {
   FileAppend,  %2_Space%■ Non-measurable `n, c:\temp\test.txt
}
  if L6 = 0
 {
   FileAppend,  %2_Space%□ Non-measurable `n,  c:\temp\test.txt
}
if L7 = 1
 {
   FileAppend,  %4_Space%■ Measurable: __%L8%__cm (greatest diameter) at , c:\temp\test.txt
}
  if L7 = 0
 {
   FileAppend,  %4_Space%□ Measurable: __%L8%__cm (greatest diameter) at ,  c:\temp\test.txt
}   
if L9 = 1
 {
   FileAppend,  %2_Space%■ Right kidney, c:\temp\test.txt
}
  if L9 = 0
 {
   FileAppend,  %2_Space%□ Right kidney,  c:\temp\test.txt
}
if L10 = 1
 {
   FileAppend,  %2_Space%■ Left kidney `n, c:\temp\test.txt
}
  if L10 = 0
 {
   FileAppend,  %2_Space%□ Left kidney `n,  c:\temp\test.txt
}
 FileAppend,   %2_Space% `n, c:\temp\test.txt    ; 輸入空白行幫助排版
;--------------第三段-----------------------------------------------
FileAppend,  2. %1_Space%Tumor invasion  , c:\temp\test.txt  

if T1= 1
 {
   FileAppend,  %2_Space%(■ Not assessable) `n, c:\temp\test.txt
}
  if T1= 0
 {
   FileAppend,  %2_Space%(□ Not assessable) `n, c:\temp\test.txt
}
if T2= 1
 {
   FileAppend,  %4_Space%■ T0: No evidence of primary tumor.`n, c:\temp\test.txt
}
  if T2= 0
 {
   FileAppend,  %4_Space%□ T0: No evidence of primary tumor.`n, c:\temp\test.txt
}
FileAppend,  %4_Space%Tumor limited to the kidney. `n, c:\temp\test.txt
if T3= 1
 {
   FileAppend,  %4_Space%■ T1a: Tumor <= 4 cm. `n, c:\temp\test.txt
}
  if T3= 0
 {
   FileAppend,  %4_Space%□ T1a: Tumor <= 4 cm. `n, c:\temp\test.txt
}
if T4= 1
 {
   FileAppend,  %4_Space%■ T1b: Tumor > 4 cm but <= 7 cm. `n, c:\temp\test.txt
}
  if T4= 0
 {
   FileAppend,  %4_Space%□ T1b: Tumor > 4 cm but <= 7 cm. `n, c:\temp\test.txt
}
if T5= 1
 {
   FileAppend,  %4_Space%■ T2a: Tumor > 7 cm but <= 10 cm. `n, c:\temp\test.txt
}
  if T5= 0
 {
   FileAppend,  %4_Space%□ T2a: Tumor > 7 cm but <= 10 cm. `n, c:\temp\test.txt
}
if T6= 1
 {
   FileAppend,  %4_Space%■ T2b: Tumor > 10 cm.`n, c:\temp\test.txt
}
  if T6= 0
 {
   FileAppend,  %4_Space%□ T2b: Tumor > 10 cm. `n, c:\temp\test.txt
}
FileAppend,  %4_Space%Tumor invades:   `n, c:\temp\test.txt
if T7= 1
 {
   FileAppend,  %4_Space%■ T3a: Renal vein.`n, c:\temp\test.txt
}
  if T7= 0
 {
   FileAppend,  %4_Space%□ T3a: Renal vein. `n, c:\temp\test.txt
}
if T8= 1
 {
   FileAppend,  %4_Space%■ T3a: Renal sinus fat `n, c:\temp\test.txt
}
  if T8= 0
 {
   FileAppend,  %4_Space%□ T3a: Renal sinus fat  `n, c:\temp\test.txt
}
if T9= 1
 {
   FileAppend,  %4_Space%■ T3a: Perirenal fat. `n, c:\temp\test.txt
}
  if T9= 0
 {
   FileAppend,  %4_Space%□ T3a: Perirenal fat.  `n, c:\temp\test.txt
}
if T10= 1
 {
   FileAppend,  %4_Space%■ T3b: IVC below diaphragm `n, c:\temp\test.txt
}
  if T10= 0
 {
   FileAppend,  %4_Space%□ T3b: IVC below diaphragm `n, c:\temp\test.txt
}
if T11= 1
 {
   FileAppend,  %4_Space%■ T3c: IVC Above the diaphragm. `n, c:\temp\test.txt
}
  if T11= 0
 {
   FileAppend,  %4_Space%□ T3c: IVC Above the diaphragm. `n, c:\temp\test.txt
}
if T12= 1
 {
   FileAppend,  %4_Space%■ T4: Beyond the Gerota’s fascia. `n, c:\temp\test.txt
}
  if T12= 0
 {
   FileAppend,  %4_Space%□ T4: Beyond the Gerota’s fascia. `n, c:\temp\test.txt
}
if T13= 1
 {
   FileAppend,  %4_Space%■ T4: Ipsilateral Adrenal gland. `n, c:\temp\test.txt
}
  if T13= 0
 {
   FileAppend,  %4_Space%□ T4: Ipsilateral Adrenal gland.  `n, c:\temp\test.txt
}
    FileAppend,   %2_Space% `n, c:\temp\test.txt    ; 輸入空白行幫助排版

;--------------第四段-----------------------------------------------

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
   FileAppend,  %4_Space%■ No or Equivocal `n, c:\temp\test.txt
}
  if No= 0
 {
   FileAppend,  %4_Space%□ No or Equivocal `n, c:\temp\test.txt
}
if Yes= 1
 {
   FileAppend,  
(
%4_Space%■ Yes. Location at:
)`n, c:\temp\test.txt
}
  if Yes= 0
 {
   FileAppend,  
(
%4_Space%□ Yes. Location at:
)`n, c:\temp\test.txt
}
if Y1= 1
 {
   FileAppend,  
(
%4_Space%%4_Space%■ Renal hilar
)`n , c:\temp\test.txt
}
  if Y1= 0
 {
   FileAppend,  
(
%4_Space%%4_Space%□ Renal hilar
)`n, c:\temp\test.txt
}
if Y2= 1
 {
   FileAppend,  %4_Space%%4_Space%■ Caval (precaval`,` inter-aortocaval`,` para-caval`,` retrocaval) `n, c:\temp\test.txt
}
  if Y2= 0
 {
   FileAppend, %4_Space%%4_Space%□ Caval (precaval`,` inter-aortocaval`,` para-caval`,` retrocaval) `n , c:\temp\test.txt
}
if Y3= 1
 {
   FileAppend, %4_Space%%4_Space%■ Aortic (Pre-aortic`,` para-aortic`,` retro-aortic`,` para-aorta) `n, c:\temp\test.txt
}
  if Y3= 0
 {
   FileAppend,  %4_Space%%4_Space%□ Aortic (Pre-aortic`,` para-aortic`,` retro-aortic`,` para-aorta) `n, c:\temp\test.txt
}
if Y4= 1
 {
   FileAppend,  
(
%4_Space%%4_Space%■ Other: __%Y5%__
)`n, c:\temp\test.txt
}
  if Y4= 0
 {
   FileAppend,  
(
%4_Space%%4_Space%□ Other: __%Y5%__
)`n, c:\temp\test.txt
}
 
FileAppend,   %2_Space% `n, c:\temp\test.txt    ; 輸入空白行幫助排版

;--------------第五段-----------------------------------------------

   FileAppend,  4. %1_Space%Distant metastasis(in this study)`n, c:\temp\test.txt  
if DM0= 1
 {
   FileAppend,  
(
%4_Space%■ No or Equivocal
)`n, c:\temp\test.txt
}
  if DM0 = 0
 {
   FileAppend,  
(
%4_Space%□ No or Equivocal
)`n, c:\temp\test.txt
}
if DM1= 1
 {
   FileAppend,  %4_Space%■ Yes`,` location: , c:\temp\test.txt
}
  if DM1 = 0
 {
   FileAppend,  %4_Space%□ Yes`,` location: , c:\temp\test.txt
}    
if DM2= 1
 {
   FileAppend,  %2_Space%■ Liver, c:\temp\test.txt
}
  if DM2= 0
 {
   FileAppend,  %2_Space%□ Liver, c:\temp\test.txt
}
if DM3= 1
 {
   FileAppend,  %2_Space%■ Lung, c:\temp\test.txt
}
  if DM3= 0
 {
   FileAppend,  %2_Space%□ Lung, c:\temp\test.txt
}
if DM4= 1
 {
   FileAppend,  %2_Space%■ Bone, c:\temp\test.txt
}
  if DM4= 0
 {
   FileAppend,  %2_Space%□ Bone, c:\temp\test.txt
}

if DM5= 1
 {
   FileAppend,  %2_Space%■ Others __%DM6%__ `n, c:\temp\test.txt
}
  if DM5= 0
 {
   FileAppend,  %2_Space%□ Others __%DM6%__ `n, c:\temp\test.txt
}

    FileAppend,   %2_Space% `n, c:\temp\test.txt    ; 輸入空白行幫助排版
;-------------------------------------------------------------
    FileAppend,  5. %1_Space%Other findings: `n, c:\temp\test.txt 
    FileAppend,  %4_Space%__%OF0%__ `n, c:\temp\test.txt 
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
