; Gastric cancer Imaging Report Generator
; 以下變數用於在fileappend的開頭結束插入空白用的
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
; Gui, Add, Text,  Section vTitle, Colorectal Carcinoma Imaging Report


; ---------------Tumor Location and Size---------------
Gui, Font, s12 bold, Arial   ; 改大改粗體
Gui, Add, Text, y15 x20, 1. Tumor location
Gui, Add, Text, y35 x40, Location:
Gui, Font ; 重置字體設置(不加這個 粗體改不回來)
Gui, Font, s10, Arial   ; 恢復
Gui, Add, Text, y36 x120, (
Gui, Add, Checkbox, vTLS y36 x128, Not assessable)
Gui, Add, Checkbox, vL1 y55 x60, Cardia
Gui, Add, Checkbox, vL2 y55 x122, Fundus
Gui, Add, Checkbox, vL3 y55 x190, Antrum
Gui, Add, Checkbox, vL4 y55 x258, Pylorus
Gui, Add, Checkbox, vL5 y55 x325, Other:
Gui, Add, Edit, vL9 y52 x385 w100
Gui, Add, Checkbox, vL6 y75 x60, Body:
Gui, Add, Checkbox, vL7 y75 x118, Lesser/
Gui, Add, Checkbox, vL8 y75 x184, Greater curvature
Gui, Font, s12 bold, Arial   ; 改大改粗體
Gui, Add, Text, y95 x40, Size:
Gui, Font ; 重置字體設置(不加這個 粗體改不回來)
Gui, Font, s10, Arial   ; 恢復
Gui, Add, Checkbox, vNonM y96 x87, Non-measurable
Gui, Add, Checkbox, vMeas y96 x205, Measurable:
Gui, Add, Edit, vMeas1 y92 x300 w60
Gui, Add, Text, y96 x363, cm(greatest diameter)

; ---------------Tumor Invastion---------------
Gui, Font, s12 bold, Arial   ; 改大改粗體
Gui, Add, Text, y125 x20, 2. Tumor invasion
Gui, Font ; 重置字體設置(不加這個 粗體改不回來)
Gui, Font, s10, Arial   ; 恢復
Gui, Add, Text, y126 x163, (
Gui, Add, Checkbox, vNota y126 x171, Not assessable)
Gui, Add, Checkbox, vT1 y145 x40, Gastric wall(T1-T2)
Gui, Add, Checkbox, vT2 y145 x175, Perigastric tissue(T3-T4a)
Gui, Add, Checkbox, vT3 y165 x40, Adjacent organs or structures 
Gui, Add, Edit, vT5 y162 x235 w120
Gui, Add, Text, y165 x355, (T4b)
Gui, Add, Checkbox, vT4 y185 x40, Others: 
Gui, Add, Edit, vT6 y182 x105 w120

; ---------------Regional nodal metastasis---------------
  Gui, Font, s12 bold, Arial   ; 改大改粗體
Gui, Add, Text, y215 x20, 3. Regional nodal metastasis
Gui, Font ; 重置字體設置(不加這個 粗體改不回來)
Gui, Font, s10, Arial   ; 恢復
Gui, Add, Checkbox, vNo y235 x40, No
Gui, Add, Checkbox, vNequ y255 x40, Equivocal, 
Gui, Add, Text, y255 x130, Number:
Gui, Add, Edit, vNe1 y252 x185 w60
Gui, Add, Text, y280 x130, Location:
Gui, Add, Edit, vNe2 y277 x185 w240
Gui, Add, Checkbox, vNyes y305 x40, Yes, 
Gui, Add, Text, y305 x130, Number:
Gui, Add, Edit, vNy1 y302 x185 w60
Gui, Add, Text, y305 x250, (N1:1~2;  N2:3~6;  N3a:7~15;  N3b:>15)
Gui, Add, Text, y330 x130, Location:
Gui, Add, Edit, vNy2 y327 x185 w240

; ---------------Distant Metastasis---------------
  Gui, Font, s12 bold, Arial   ; 改大改粗體
Gui, Add, Text, y360 x20, 4. Distant metastasis
Gui, Font ; 重置字體設置(不加這個 粗體改不回來)
Gui, Font, s10, Arial   ; 恢復
Gui, Add, Text, y360 x165, (in this study)

Gui, Add, Checkbox, vDM0 y380 x40, No
Gui, Add, Checkbox, vDM1 y400 x40, Equivocal, location: 
Gui, Add, Edit, vDM4 y397 x175 w250
Gui, Add, Checkbox, vDM2 y425 x40, Non-regional lymph nodes, location
Gui, Add, Edit, vDM5 y422 x265 w250
Gui, Add, Checkbox, vDM3 y450 x40, Distant organ:
Gui, Add, Edit, vDM6 y447 x145 w250

; ---------------Other Findings---------------
  Gui, Font, s12 bold, Arial   ; 改大改粗體
Gui, Add, Text, y480 x20, 5. Other findings
Gui, Font ; 重置字體設置(不加這個 粗體改不回來)
Gui, Font, s10, Arial   ; 恢復
Gui, Add, Edit, vOF0 y500 x20 w500

; Buttons
  Gui, Font, s12 bold, Arial   ; 改大改粗體
Gui, Add, Button, Default gGenerateReport y540 x20, Generate Report
Gui, Add, Button, gExit y540 x170, Exit

; Show GUI
Gui, Show, w600 h600, Gastric Cancer Imaging Report Generator
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
    FileAppend, MCH Imaging Report for Gastric Carcinoma (AJCC 8th)  `n, c:\temp\test.txt
    FileAppend,    `n, c:\temp\test.txt    ; 輸入空白行幫助排版
    FileAppend, *本表單僅依據單次影像進行分期供腫瘤團隊參考，並不代表病人的臨床分期，臨床分期需綜合病人臨床發現、各種影像(包括各種內視鏡及超音波檢查)及病理表現來進行判斷，病人的最終臨床分期可能因癌症團隊討論有所異動，敬請參閱病歷首頁。 `n, c:\temp\test.txt
    FileAppend,   %2_Space% `n, c:\temp\test.txt    ; 輸入空白行幫助排版
;-------------------------------------------------------------
    
;--------------第二段-----------------------------------------------
FileAppend,  1. %1_Space%Tumor location`n , c:\temp\test.txt  
FileAppend,  %4_Space%Location:( , c:\temp\test.txt  
if TLS = 1
 {
   FileAppend,  ■ Not assessable)  `n, c:\temp\test.txt
}
  if TLS = 0
 {
   FileAppend,  □ Not assessable)  `n, c:\temp\test.txt
}
if L1 = 1
 {
   FileAppend,  %4_Space%%4_Space%■ Cardia, c:\temp\test.txt
}
  if L1 = 0
 {
   FileAppend,  %4_Space%%4_Space%□ Cardia, c:\temp\test.txt
}
if L2 = 1
 {
   FileAppend,  %4_Space%■ Fundus, c:\temp\test.txt
}
  if L2 = 0
 {
   FileAppend,  %4_Space%□ Fundus, c:\temp\test.txt
}
if L3 = 1
 {
   FileAppend,  %4_Space%■ Antrum, c:\temp\test.txt
}
  if L3 = 0
 {
   FileAppend,  %4_Space%□ Antrum, c:\temp\test.txt
}
if L4 = 1
 {
   FileAppend,  %4_Space%■ Pylorus, c:\temp\test.txt
}
  if L4 = 0
 {
   FileAppend,  %4_Space%□ Pylorus, c:\temp\test.txt
}
if L5 = 1
 {
   FileAppend,  %4_Space%■ Other:_%L9%_`n, c:\temp\test.txt
}
  if L5 = 0
 {
   FileAppend,  %4_Space%□ Other:_%L9%_`n, c:\temp\test.txt
}
if L6 = 1
 {
   FileAppend,  %4_Space%%4_Space%■ Body:, c:\temp\test.txt
}
  if L6 = 0
 {
   FileAppend,  %4_Space%%4_Space%□ Body:, c:\temp\test.txt
}
if L7 = 1
 {
   FileAppend,  %2_Space%■ Lesser/, c:\temp\test.txt
}
  if L7 = 0
 {
   FileAppend,  %2_Space%□ Lesser/, c:\temp\test.txt
}
if L8 = 1
 {
   FileAppend,  %2_Space%■ Greater curvature`n, c:\temp\test.txt
}
  if L8 = 0
 {
   FileAppend,  %2_Space%□ Greater curvature`n, c:\temp\test.txt
}

    FileAppend, %4_Space%Size: , c:\temp\test.txt

if NonM = 1
 {
   FileAppend,  %4_Space%■ Non-measurable, c:\temp\test.txt
}
  if NonM = 0
 {
   FileAppend,  %4_Space%□ Non-measurable, c:\temp\test.txt
}

if Meas = 1
 {
   FileAppend,  %4_Space%■ Measurable:_%Meas1%_cm (greatest diameter)`n, c:\temp\test.txt
}
  if Meas = 0
 {
   FileAppend,  %4_Space%□ Measurable:_%Meas1%_cm (greatest diameter)`n, c:\temp\test.txt
}

    FileAppend,   %2_Space% `n, c:\temp\test.txt    ; 輸入空白行幫助排版

;--------------第三段-----------------------------------------------
FileAppend,  2. %1_Space%Tumor invasion( , c:\temp\test.txt  

if Nota= 1
 {
   FileAppend,  ■ Not assessable) %1_Space% `n, c:\temp\test.txt
}
  if Nota= 0
 {
   FileAppend,  □ Not assessable)%1_Space% `n, c:\temp\test.txt
}
if T1= 1
 {
   FileAppend,  %4_Space%■ Gastric wall(T1-T2), c:\temp\test.txt
}
  if T1= 0
 {
   FileAppend,  %4_Space%□ Gastric wall(T1-T2), c:\temp\test.txt
}
if T2= 1
 {
   FileAppend,  %4_Space%■ Perigastric tissue(T3-T4a)`n, c:\temp\test.txt
}
  if T2= 0
 {
   FileAppend,  %4_Space%□ Perigastric tissue(T3-T4a)`n, c:\temp\test.txt
}
if T3= 1
 {
   FileAppend,  %4_Space%■ Adjacent organs or structures_%T5%_`n, c:\temp\test.txt
}
  if T3= 0
 {
   FileAppend,  %4_Space%□ Adjacent organs or structures_%T5%_`n, c:\temp\test.txt
}
if T4= 1
 {
   FileAppend,  %4_Space%■ Others: _%T6%_`n, c:\temp\test.txt
}
  if T4= 0
 {
   FileAppend,  %4_Space%□ Others: _%T6%_`n, c:\temp\test.txt
}
    FileAppend,   %2_Space% `n, c:\temp\test.txt    ; 輸入空白行幫助排版

;--------------第四段-----------------------------------------------

FileAppend,  3. %1_Space%Regional node metastasis%2_Space%`n, c:\temp\test.txt  

if No= 1
 {
   FileAppend,  %4_Space%■ No`n, c:\temp\test.txt
}
  if No= 0
 {
   FileAppend,  %4_Space%□ No`n, c:\temp\test.txt
}
if Nequ= 1
 {
   FileAppend,  
(
%4_Space%■ Equivocal, %1_tab%Number: _%Ne1%_
)`n, c:\temp\test.txt
}
  if Nequ= 0
 {
   FileAppend,  
(
%4_Space%□ Equivocal, %1_tab%Number: _%Ne1%_
)`n, c:\temp\test.txt
}
   FileAppend,  %2_tab%Location: _%Ne2%_`n , c:\temp\test.txt
if Nyes= 1
 {
   FileAppend,  
(
%4_Space%■ Yes, %4_Space%%1_tab%Number: _%Ny1%_
), c:\temp\test.txt
}
  if Nyes= 0
 {
   FileAppend,  
(
%4_Space%□ Yes, %4_Space%%1_tab%Number: _%Ny1%_
), c:\temp\test.txt
}
FileAppend,  
(
 (N1:1-2;  N2:3-6;  N3a:7-15;  N3b:>15)
)`n , c:\temp\test.txt
   FileAppend,  %2_tab%Location: _%Ny2%_`n , c:\temp\test.txt
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
%4_Space%■ Equivocal, location: _%DM4%_`n
), c:\temp\test.txt
}
  if DM1 = 0
 {
   FileAppend,  
(
%4_Space%□ Equivocal, location: _%DM4%_`n
), c:\temp\test.txt
}

if DM2= 1
 {
   FileAppend,  
(
%4_Space%■ Non-regional lymph nodes, location: _%DM5%_`n
), c:\temp\test.txt
}
  if DM2 = 0
 {
   FileAppend,  
(
%4_Space%□ Non-regional lymph nodes, location: _%DM5%_`n
), c:\temp\test.txt
}

if DM3= 1
 {
   FileAppend,  
(
%4_Space%■ Distant organ: _%DM6%_`n
), c:\temp\test.txt
}
  if DM3 = 0
 {
   FileAppend,  
(
%4_Space%□ Distant organ: _%DM6%_`n
), c:\temp\test.txt
}
    FileAppend,   %2_Space% `n, c:\temp\test.txt    ; 輸入空白行幫助排版
;-------------------------------------------------------------
    FileAppend,  5. %1_Space%Other findings: `n, c:\temp\test.txt 
    FileAppend,  %4_Space%_%OF0%_ `n, c:\temp\test.txt 
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
