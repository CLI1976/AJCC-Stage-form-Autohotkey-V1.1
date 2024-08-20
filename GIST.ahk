; GIST Imaging Report Generator
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

; ---------------Tumor location / size / number---------------
Gui, Font, s12 bold, Arial   ; 改大改粗體
Gui, Add, Text, y15 x20, 1. Tumor location / size / number
Gui, Font ; 重置字體設置(不加這個 粗體改不回來)
Gui, Font, s10, Arial   ; 恢復
Gui, Add, Text, y15 x270, (
Gui, Add, Checkbox, vL1 y15 x276, Not assessable)
Gui, Add, Checkbox, vL2 y35 x40, No evidence of primary tumor.
Gui, Add, Text, y55 x40, Location: 
Gui, Add, Checkbox, vL3 y55 x105, Stomach
Gui, Add, Checkbox, vL4 y55 x180, Small intestine
Gui, Add, Checkbox, vL5 y55 x290, Large intestine
Gui, Add, Checkbox, vL6 y55 x400, Peritoneum
Gui, Add, Checkbox, vL7 y80 x105, Others: 
 Gui, Add, Edit, vL8 y75 x172 w200
 
 Gui, Add, Text, y105 x40, Size: 
 Gui, Add, Checkbox, vL9 y105 x80, Non-measurable
 Gui, Add, Checkbox, vL10 y105 x205, Measurable: 
 Gui, Add, Edit, vL11 y100 x300 w40
 Gui, Add, Text, y105 x348, cm (greatest diameter)
Gui, Add, Text, y125 x40, Number: 
 Gui, Add, Edit, vL12 y120 x95 w40

; ---------------Tumor Invasion---------------
 Gui, Font, s12 bold, Arial   ; 改大改粗體
 Gui, Add, Text, y155 x20, 2. Tumor invasion
 Gui, Font ; 重置字體設置(不加這個 粗體改不回來)
 Gui, Font, s10, Arial   ; 恢復
 Gui, Add, Text, y155 x161, (
 Gui, Add, Checkbox, vT1 y155 x168, Not assessable)
 Gui, Add, Checkbox, vT2 y175 x40, T0: No evidence of primary tumor.
 Gui, Add, Checkbox, vT3 y195 x40, T1: Tumor <= 2 cm
 Gui, Add, Checkbox, vT4 y215 x40, T2: Tumor > 2 cm but < 5 cm
Gui, Add, Checkbox, vT5 y235 x40, T3: Tumor >= 5 cm but < 10 cm
Gui, Add, Checkbox, vT6 y255 x40, T4: Tumor >= 10 cm

; ---------------Regional nodal metastasis---------------
  Gui, Font, s12 bold, Arial   ; 改大改粗體
  Gui, Add, Text, y285 x20, 3. Regional nodal metastasis
  Gui, Font ; 重置字體設置(不加這個 粗體改不回來)
  Gui, Font, s10, Arial   ; 恢復
 Gui, Add, Text, y285 x245, (
  Gui, Add, Checkbox, vNot y285 x253, Not assessable)
 Gui, Add, Checkbox, vNo y305 x40, No
 Gui, Add, Checkbox, vE1 y325 x40, Equivocal (5-9mm)
Gui, Add, Text, y350 x60, Number of suspicious lymph node: 
 Gui, Add, Edit, vE2 y345 x265 w40
Gui, Add, Text, y380 x60, Location:
 Gui, Add, Edit, vE3 y375 x120 w240
  Gui, Add, Checkbox, vY1 y400 x40, Yes. If yes: 
Gui, Add, Text, y425 x60, Number: 
 Gui, Add, Edit, vY2 y420 x120 w40
Gui, Add, Text, y425 x165, (N1: >= 1)
Gui, Add, Text, y450 x60, Location:
 Gui, Add, Edit, vY3 y445 x120 w240


; ---------------Distant Metastasis---------------
   Gui, Font, s12 bold, Arial   ; 改大改粗體
  Gui, Add, Text, y480 x20, 4. Distant metastasis
  Gui, Font ; 重置字體設置(不加這個 粗體改不回來)
  Gui, Font, s10, Arial   ; 恢復
  Gui, Add, Text, y480 x165, (in this study)
  Gui, Add, Checkbox, vDM0 y500 x40, No or Equivocal
 Gui, Add, Checkbox, vDM1 y525 x40, Yes, location: 
 Gui, Add, Edit, vDM2 y520 x142 w250
 
; ---------------Other Findings---------------
 Gui, Font, s12 bold, Arial   ; 改大改粗體
 Gui, Add, Text, y555 x20, 5. Other findings
 Gui, Font ; 重置字體設置(不加這個 粗體改不回來)
 Gui, Font, s10, Arial   ; 恢復
 Gui, Add, Edit, vOF0 y575 x40 w500

; Buttons
 Gui, Font, s12 bold, Arial   ; 改大改粗體
 Gui, Add, Button, Default gGenerateReport y625 x20, Generate Report
 Gui, Add, Button, gExit y625 x170, Exit

; Show GUI
Gui, Show,  w615 h665, GIST Imaging Report Generator
return

; === 生成報告===
GenerateReport:
    ; Collect data from GUI
    Gui, Submit, NoHide
     ; 刪除現有的 test.txt 文件
    FileDelete, c:\temp\test.txt
    ; 將結果逐行輸入test.txt中
FormatTime, CurrentDate,, yyyy/MM/dd
FileAppend,  Addtional report for cancer staging on %CurrentDate%  `n, c:\temp\test.txt    ; 輸入空白行幫助排版
FileAppend,   =========================================== `n, c:\temp\test.txt 
    FileAppend, MCH Imaging Report for Gastrointestinal Stromal Tumor (AJCC 8th)`n, c:\temp\test.txt
    FileAppend,    `n, c:\temp\test.txt    ; 輸入空白行幫助排版
    FileAppend, 本表單僅依據單次影像進行分期供腫瘤團隊參考，並不代表病人的臨床分期，臨床分期需綜合病人臨床發現、各種影像(包括各種內視鏡及超音波檢查)及病理表現來進行判斷，病人的最終臨床分期可能因癌症團隊討論有所異動，敬請參閱病歷首頁。 `n, c:\temp\test.txt
    FileAppend,   %2_Space% `n, c:\temp\test.txt    ; 輸入空白行幫助排版
;-------------------------------------------------------------
    
;--------------第二段-----------------------------------------------
FileAppend,  1. %1_Space%Tumor location / size / number , c:\temp\test.txt  
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
   FileAppend,  %4_Space%■ No evidence of primary tumor. `n, c:\temp\test.txt
}
  if L2 = 0
 {
   FileAppend,  %4_Space%□ No evidence of primary tumor. `n, c:\temp\test.txt
}
 FileAppend,  %4_Space%Location:   , c:\temp\test.txt
if L3 = 1
 {
   FileAppend,  %2_Space%■ Stomach, c:\temp\test.txt
}
  if L3 = 0
 {
   FileAppend,  %2_Space%□ Stomach,  c:\temp\test.txt
}
if L4= 1
 {
   FileAppend,  %2_Space%■ Small intestine, c:\temp\test.txt
}
  if L4 = 0
 {
   FileAppend,  %2_Space%□ Small intestine,  c:\temp\test.txt
}
if L5 = 1
 {
   FileAppend,  %2_Space%■ Large intestine , c:\temp\test.txt
}
  if L5 = 0
 {
   FileAppend,  %2_Space%□ Large intestine ,  c:\temp\test.txt
}
if L6 = 1
 {
   FileAppend,  %2_Space%■ Peritoneum`n , c:\temp\test.txt
}
  if L6 = 0
 {
   FileAppend,  %2_Space%□ Peritoneum `n,  c:\temp\test.txt
}
if L7 = 1
 {
   FileAppend,  %4_Space%%4_Space%%4_Space%%4_Space%%4_Space%%2_Space%■ Others: __%L8%__  `n , c:\temp\test.txt
}
  if L7 = 0
 {
   FileAppend,  %4_Space%%4_Space%%4_Space%%4_Space%%4_Space%%2_Space%□ Others: __%L8%__  `n ,  c:\temp\test.txt
}

FileAppend,  %4_Space%Size: , c:\temp\test.txt
if L9 = 1
 {
   FileAppend,  %2_Space%■ Non-measurable, c:\temp\test.txt
}
  if L9 = 0
 {
   FileAppend,  %2_Space%□ Non-measurable,  c:\temp\test.txt
}
if L10 = 1
 {
   FileAppend,  %2_Space%■ Measurable: __%L11%__cm(largest diameter)`n, c:\temp\test.txt
}
  if L10 = 0
 {
   FileAppend,  %2_Space%□ Measurable: __%L11%__cm(largest diameter) `n,  c:\temp\test.txt
}   
FileAppend,  %4_Space%Number: __%L12%__ `n, c:\temp\test.txt

 FileAppend,   %2_Space% `n, c:\temp\test.txt    ; 輸入空白行幫助排版
;--------------第三段-----------------------------------------------
FileAppend,  2. %1_Space%Tumor invasion  , c:\temp\test.txt  

if T1= 1
 {
   FileAppend,  %2_Space%( ■ Not assessable)`n, c:\temp\test.txt
}
  if T1= 0
 {
   FileAppend,  %2_Space%( □ Not assessable )`n, c:\temp\test.txt
}
if T2= 1
 {
   FileAppend,  %4_Space%■ T0: No evidence of primary tumor.`n, c:\temp\test.txt
}
  if T2= 0
 {
   FileAppend,  %4_Space%□ T0: No evidence of primary tumor.`n, c:\temp\test.txt
}
if T3= 1
 {
   FileAppend,  %4_Space%■ T1: Tumor <= 2 cm `n, c:\temp\test.txt
}
  if T3= 0
 {
   FileAppend,  %4_Space%□ T1: Tumor <= 2 cm `n, c:\temp\test.txt
}
if T4= 1
 {
   FileAppend,  %4_Space%■ T2: Tumor > 2 cm but < 5 cm`n, c:\temp\test.txt
}
  if T4= 0
 {
   FileAppend,  %4_Space%□ T2: Tumor > 2 cm but < 5 cm `n, c:\temp\test.txt
}
if T5= 1
 {
   FileAppend,  %4_Space%■ T3: Tumor >= 5 cm but < 10 cm `n, c:\temp\test.txt
}
  if T5= 0
 {
   FileAppend,  %4_Space%□ T3: Tumor >= 5 cm but < 10 cm `n, c:\temp\test.txt
}
if T6= 1
 {
   FileAppend,  %4_Space%■ T4: Tumor >= 10 cm `n, c:\temp\test.txt
}
  if T6= 0
 {
   FileAppend,  %4_Space%□ T4: Tumor >= 10 cm `n, c:\temp\test.txt
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
   FileAppend,  %4_Space%■ No `n, c:\temp\test.txt
}
  if No= 0
 {
   FileAppend,  %4_Space%□ No `n, c:\temp\test.txt
}
if E1= 1
 {
   FileAppend,  
(
%4_Space%■ Equivocal (5-9mm)
)`n, c:\temp\test.txt
}
  if E1= 0
 {
   FileAppend,  
(
%4_Space%□ Equivocal (5-9mm)
)`n, c:\temp\test.txt
}
FileAppend,  %4_Space%%4_Space%Number of suspicious lymph node: __%E2%__  `n, c:\temp\test.txt
FileAppend,  %4_Space%%4_Space%Location: __%E3%__ `n, c:\temp\test.txt


if Y1= 1
 {
   FileAppend,  
(
%4_Space%■ Yes. If yes: 
)`n, c:\temp\test.txt
}
  if Y1= 0
 {
   FileAppend,  
(
%4_Space%□ Yes. If yes: 
)`n, c:\temp\test.txt
}
FileAppend,  %4_Space%%4_Space%Number: __%Y2%__  (N1: >= 1)`n, c:\temp\test.txt
FileAppend,  %4_Space%%4_Space%Location: __%Y3%__ `n, c:\temp\test.txt

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
   FileAppend,  
(
%4_Space%■ Yes, location: _%DM2%__
)`n, c:\temp\test.txt
}
  if DM1 = 0
 {
   FileAppend,  
(
%4_Space%□ Yes, location: _%DM2%__
)`n, c:\temp\test.txt
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
