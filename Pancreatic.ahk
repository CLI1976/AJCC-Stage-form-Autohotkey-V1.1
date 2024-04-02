; Pancreatic cancer Imaging Report Generator
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
Gui, Add, Checkbox, vL2 y40 x40, No evidence of primary tumor.
Gui, Add, Text, y60 x40, Location: 
Gui, Add, Checkbox, vL3 y80 x60, Pancreatic head and neck  
Gui, Add, Checkbox, vL4 y100 x60, Pancreatic body (between the left border of the SMV and the left border of the aorta)
Gui, Add, Checkbox, vL5 y120 x60, Pancreatic tail
Gui, Add, Checkbox, vL6 y145 x60, Others: 
Gui, Add, Edit, vL7 y140 x127 w160
Gui, Add, Text, y170 x40, Size: 
Gui, Add, Checkbox, vL8 y170 x76, Non-measureable
Gui, Add, Checkbox, vL9 y170 x204, Measurable: 
Gui, Add, Edit, vL10 y165 x300 w40
Gui, Add, Text, y170 x343, cm (greatest diameter)

; ---------------Tumor Invastion---------------
 Gui, Font, s12 bold, Arial   ; 改大改粗體
 Gui, Add, Text, y200 x20, 2. Tumor invasion or encasement
 Gui, Font ; 重置字體設置(不加這個 粗體改不回來)
 Gui, Font, s10, Arial   ; 恢復
 Gui, Add, Text, y200 x281, (
 Gui, Add, Checkbox, vT1 y200 x287, Not assessable)
 Gui, Add, Checkbox, vT2 y220 x40, T0: No evidence of primary tumor.
 Gui, Add, Checkbox, vT3 y240 x40, T1-T3: Tumor limited to the pancreas
 Gui, Add, Checkbox, vT4 y260 x60, T1a: Tumor <= 0.5 cm
 Gui, Add, Checkbox, vT5 y280 x60, T1b: Tumor > 0.5 cm but < 1cm
 Gui, Add, Checkbox, vT6 y300 x60, T1c: Tumor 1 cm to 2 cm
 Gui, Add, Checkbox, vT7 y320 x60, T2: Tumor > 2cm but <= 4 cm
 Gui, Add, Checkbox, vT8 y340 x60, T3: Tumor > 4 cm
 Gui, Add, Checkbox, vT9 y360 x40, T4: Tumor invasion beyond pancreas
 Gui, Add, Checkbox, vT10 y380 x60, Celiac trunk
 Gui, Add, Checkbox, vT11 y380 x156, Superior mesenteric artery(SMA)
 Gui, Add, Checkbox, vT12 y380 x370, Common hepatic artery
 Gui, Add, Checkbox, vT13 y405 x60, Adjacent organs:
 Gui, Add, Edit, vT14 y400 x183 w250

; ---------------Regional nodal metastasis---------------
 Gui, Font, s12 bold, Arial   ; 改大改粗體
 Gui, Add, Text, y435 x20, 3. Regional nodal metastasis
 Gui, Font ; 重置字體設置(不加這個 粗體改不回來)
 Gui, Font, s10, Arial   ; 恢復
 Gui, Add, Text, y435 x245, (
 Gui, Add, Checkbox, vNot y435 x253, Not assessable)
 Gui, Add, Checkbox, vNo y455 x40, No 
 Gui, Add, Checkbox, vE1 y475 x40, Equivocal (5-9mm)
Gui, Add, Text, y500 x60, Number:
Gui, Add, Edit, vE2 y495 x120 w40
Gui, Add, Text, y525 x60, Location: 
Gui, Add, Edit, vE3 y520 x120 w140
Gui, Add, Checkbox, vY1 y545 x40, Yes. If yes: 
Gui, Add, Text, y570 x60, Number:
Gui, Add, Edit, vY2 y565 x120 w40
Gui, Add, Text, y570 x167, (N1: 1-3; N2: >= 4)
Gui, Add, Text, y595 x60, Location: 
Gui, Add, Edit, vY3 y590 x120 w140

; ---------------Distant Metastasis---------------
   Gui, Font, s12 bold, Arial   ; 改大改粗體
  Gui, Add, Text, y625 x20, 4. Distant metastasis
  Gui, Font ; 重置字體設置(不加這個 粗體改不回來)
 Gui, Font, s10, Arial   ; 恢復
 Gui, Add, Text, y625 x165, (in this study)
 Gui, Add, Checkbox, vDM0 y645 x40, No or Equivocal
 Gui, Add, Checkbox, vDM1 y670 x40, Yes, location:
 Gui, Add, Edit, vDM2 y665 x142 w250
 
; ---------------Other Findings---------------
  Gui, Font, s12 bold, Arial   ; 改大改粗體
  Gui, Add, Text, y700 x20, 5. Other findings
  Gui, Font ; 重置字體設置(不加這個 粗體改不回來)
  Gui, Font, s10, Arial   ; 恢復
 Gui, Add, Edit, vOF1 y720 x40 w250
  
; Buttons
 Gui, Font, s12 bold, Arial   ; 改大改粗體
 Gui, Add, Button, Default gGenerateReport y770 x20, Generate Report
 Gui, Add, Button, gExit y770 x170, Exit

; Show GUI
Gui, Show, w615 h820, Pancreatic Cancer Imaging Report Generator
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
    FileAppend, MCH Imaging Report for Pancreatic Carcinoma (AJCC 8th) `n, c:\temp\test.txt
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
   FileAppend,  %4_Space%■ No evidence of primary tumor.  `n, c:\temp\test.txt
}
  if L2 = 0
 {
   FileAppend,  %4_Space%□ No evidence of primary tumor.  `n, c:\temp\test.txt
}
   FileAppend,  %4_Space%Location:`n , c:\temp\test.txt
if L3 = 1
 {
   FileAppend,  %4_Space%%4_Space%■ Pancreatic head and neck  `n, c:\temp\test.txt
}
  if L3 = 0
 {
   FileAppend,  %4_Space%%4_Space%□ Pancreatic head and neck  `n,  c:\temp\test.txt
}
if L4 = 1
 {
   FileAppend,  %4_Space%%4_Space%■ Pancreatic body (between the left border of the SMV and the left border of the aorta) `n, c:\temp\test.txt
}
  if L4 = 0
 {
   FileAppend,  %4_Space%%4_Space%□ Pancreatic body (between the left border of the SMV and the left border of the aorta)`n,  c:\temp\test.txt
}
if L5 = 1
 {
   FileAppend,  %4_Space%%4_Space%■ Pancreatic tail `n , c:\temp\test.txt
}
  if L5 = 0
 {
   FileAppend,  %4_Space%%4_Space%□ Pancreatic tail `n,  c:\temp\test.txt
}
if L6 = 1
 {
   FileAppend,  %4_Space%%4_Space%■ Others: __%L7%__ `n, c:\temp\test.txt
}
  if L6 = 0
 {
   FileAppend,  %4_Space%%4_Space%□ Others: __%L7%__ `n ,  c:\temp\test.txt
}
FileAppend,  %4_Space%Size: , c:\temp\test.txt
if L8 = 1
 {
   FileAppend,  %2_Space%■ Non-measureable, c:\temp\test.txt
}
  if L8 = 0
 {
   FileAppend,  %2_Space%□ Non-measureable,  c:\temp\test.txt
}
if L9 = 1
 {
   FileAppend,  %2_Space%■ Measurable: __%L10%__cm (greatest diameter) `n, c:\temp\test.txt
}
  if L9 = 0
 {
   FileAppend,  %2_Space%□ Measurable: __%L10%__ cm (greatest diameter) `n,  c:\temp\test.txt
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
   FileAppend,  %4_Space%■ T1-T3: Tumor limited to the pancreas `n, c:\temp\test.txt
}
  if T3= 0
 {
   FileAppend,  %4_Space%□ T1-T3: Tumor limited to the pancreas  `n, c:\temp\test.txt
}
if T4= 1
 {
   FileAppend,  
(
%4_Space%%4_Space%■ T1a: Tumor <= 0.5 cm
 )`n, c:\temp\test.txt
}
  if T4= 0
 {
   FileAppend,  
(
%4_Space%%4_Space%□ T1a: Tumor <= 0.5 cm
) `n, c:\temp\test.txt
}
if T5= 1
 {
   FileAppend,  %4_Space%%4_Space%■ T1b: Tumor > 0.5 cm but < 1cm  `n, c:\temp\test.txt
}
  if T5= 0
 {
   FileAppend,  %4_Space%%4_Space%□ T1b: Tumor > 0.5 cm but < 1cm `n, c:\temp\test.txt
}
if T6= 1
 {
   FileAppend, 
(
%4_Space%%4_Space%■ T1c: Tumor 1 cm to 2 cm
)`n , c:\temp\test.txt
}
  if T6= 0
 {
   FileAppend,  
(
%4_Space%%4_Space%□ T1c: Tumor 1 cm to 2 cm
)`n , c:\temp\test.txt
}
if T7= 1
 {
   FileAppend, 
(
%4_Space%%4_Space%■ T2: Tumor > 2cm but <= 4 cm
)`n , c:\temp\test.txt
}
  if T7= 0
 {
   FileAppend,  
(
%4_Space%%4_Space%□ T2: Tumor > 2cm but <= 4 cm
)`n , c:\temp\test.txt
}
if T8= 1
 {
   FileAppend, 
(
%4_Space%%4_Space%■ T3: Tumor > 4 cm
)`n , c:\temp\test.txt
}
  if T8= 0
 {
   FileAppend,  
(
%4_Space%%4_Space%□ T3: Tumor > 4 cm
)`n , c:\temp\test.txt
}
if T9= 1
 {
   FileAppend,  %4_Space%■ T4: Tumor invasion beyond pancreas `n, c:\temp\test.txt
}
  if T9= 0
 {
   FileAppend,  %4_Space%□ T4: Tumor invasion beyond pancreas `n, c:\temp\test.txt
}
if T10= 1
 {
   FileAppend, %4_Space%%4_Space%■ Celiac trunk, c:\temp\test.txt
}
  if T10= 0
 {
   FileAppend,  %4_Space%%4_Space%□ Celiac trunk, c:\temp\test.txt
}
if T11= 1
 {
   FileAppend,  %2_Space%■ Superior mesenteric artery(SMA), c:\temp\test.txt
}
  if T11= 0
 {   
FileAppend,  %2_Space%□ Superior mesenteric artery(SMA), c:\temp\test.txt
}
if T12= 1
 {
   FileAppend,  %2_Space%■ Common hepatic artery`n , c:\temp\test.txt
}
  if T12= 0
 {   
FileAppend,  %2_Space%□ Common hepatic artery`n, c:\temp\test.txt
}
if T13= 1
 {
   FileAppend,  %4_Space%%4_Space%■ Adjacent organs: __%T14%__`n , c:\temp\test.txt
}
  if T13= 0
 {   
FileAppend,  %4_Space%%4_Space%□ Adjacent organs: __%T14%__`n, c:\temp\test.txt
}
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
   FileAppend,  %4_Space%■ Equivocal (5-9mm)  `n, c:\temp\test.txt
}
  if E1= 0
 {
   FileAppend,  %4_Space%□ Equivocal (5-9mm)  `n, c:\temp\test.txt
}
FileAppend,  %4_Space%%4_Space%Number: __%E2%__  `n, c:\temp\test.txt
FileAppend,  %4_Space%%4_Space%Location: __%E3%__  `n, c:\temp\test.txt


if Y1= 1
 {
   FileAppend,  %4_Space%■ Yes. If yes:   `n, c:\temp\test.txt
}
  if Y1= 0
 {
   FileAppend,  %4_Space%□ Yes. If yes:   `n, c:\temp\test.txt
}
FileAppend,  %4_Space%%4_Space%Number: __%Y2%__  (N1: 1-3; N2: >= 4) `n, c:\temp\test.txt
FileAppend,  %4_Space%%4_Space%Location: __%Y3%__  `n, c:\temp\test.txt

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
%4_Space%■ Yes, location: __%DM2%__
)`n, c:\temp\test.txt
}
  if DM1 = 0
 {
   FileAppend,  
(
%4_Space%□ Yes, location: __%DM2%__
)`n, c:\temp\test.txt
}    

    FileAppend,   %2_Space% `n, c:\temp\test.txt    ; 輸入空白行幫助排版
;-------------------------------------------------------------
    FileAppend,  5. %1_Space%Other findings: , c:\temp\test.txt 
    FileAppend,  %1_Space%__%OF1%__ `n, c:\temp\test.txt 
    

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
