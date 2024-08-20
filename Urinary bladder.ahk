; Urinary Bladder cancer Imaging Report Generator
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
Gui, Add, Checkbox, vL2 y35 x40, No or Equivocal
Gui, Add, Text, y55 x40, Location: 
Gui, Add, Checkbox, vL3 y55 x105, Posterior wall or Trigone
Gui, Add, Checkbox, vL4 y55 x272, Right lateral wall 
Gui, Add, Checkbox, vL5 y55 x388, Left lateral wall
Gui, Add, Checkbox, vL6 y75 x105, Dome
Gui, Add, Checkbox, vL7 y75 x165, Trigone
Gui, Add, Checkbox, vL8 y75 x232, Anterior wall
Gui, Add, Checkbox, vL9 y75 x326, Inferior wall or neck
 Gui, Add, Text, y100 x40, Size: 
 Gui, Add, Checkbox, vL10 y100 x80, Non-measurable
 Gui, Add, Checkbox, vL11 y100 x205, Measurable: 
 Gui, Add, Edit, vL12 y95 x300 w40
 Gui, Add, Text, y100 x348, cm(greatest dimension of the largest tumor)

; ---------------Tumor Invastion---------------
 Gui, Font, s12 bold, Arial   ; 改大改粗體
 Gui, Add, Text, y140 x20, 2. Tumor invasion
 Gui, Font ; 重置字體設置(不加這個 粗體改不回來)
 Gui, Font, s10, Arial   ; 恢復
 Gui, Add, Text, y140 x161, (
 Gui, Add, Checkbox, vT1 y140 x168, Not assessable)
 Gui, Add, Checkbox, vT2 y160 x40, T0: No evidence of primary tumor.
 Gui, Add, Checkbox, vT3 y180 x40, T1-T2: Bladder wall.
 Gui, Add, Checkbox, vT4 y200 x40, T2: Tumor invasion to deep muscle (for MRI).
Gui, Add, Checkbox, vT5 y220 x40, T3: Gross tumor invasion to perivesical tissue.
Gui, Add, Checkbox, vT6 y245 x40,T4: Tumor invasion to adjacent organs or structures
 Gui, Add, Edit, vT7 y240 x356 w100
Gui, Add, Text, y245 x458, (described)

; ---------------Regional nodal metastasis---------------
  Gui, Font, s12 bold, Arial   ; 改大改粗體
  Gui, Add, Text, y275 x20, 3. Regional nodal metastasis
  Gui, Font ; 重置字體設置(不加這個 粗體改不回來)
  Gui, Font, s10, Arial   ; 恢復
 Gui, Add, Text, y275 x245, (
  Gui, Add, Checkbox, vNot y275 x253, Not assessable)
 Gui, Add, Checkbox, vNo y295 x40, No or Equivocal
 Gui, Add, Checkbox, vYes y315 x40, Yes
 Gui, Add, Checkbox, vY1 y335 x60, N1: Single regional LN metastasis in the true pelvis*
 Gui, Add, Checkbox, vY2 y355 x60, N2: Multiple regional LN metastasis in the true pelvis*
 Gui, Add, Checkbox, vY3 y375 x60, N3: Metastasis to the common iliac lymph nodes.
Gui, Add, Text, y395 x60,   *perivesical, obturator, internal and external iliac, or sacral lymph node
  

; ---------------Distant Metastasis---------------
   Gui, Font, s12 bold, Arial   ; 改大改粗體
  Gui, Add, Text, y425 x20, 4. Distant metastasis
  Gui, Font ; 重置字體設置(不加這個 粗體改不回來)
  Gui, Font, s10, Arial   ; 恢復
  Gui, Add, Text, y425 x165, (in this study)
  Gui, Add, Checkbox, vDM0 y445 x40, No or Equivocal
 Gui, Add, Checkbox, vDM1 y470 x40, Yes
 Gui, Add, Checkbox, vDM2 y490 x60, M1a: non-regional lymph node metastasis
 Gui, Add, Checkbox, vDM3 y515 x60, M1b: distal metastasis. 
Gui, Add, Edit, vDM4 y510 x220 w200
 
; ---------------Other Findings---------------
 Gui, Font, s12 bold, Arial   ; 改大改粗體
 Gui, Add, Text, y545 x20, 5. Other findings
 Gui, Font ; 重置字體設置(不加這個 粗體改不回來)
 Gui, Font, s10, Arial   ; 恢復
 Gui, Add, Edit, vOF0 y565 x40 w500

; Buttons
 Gui, Font, s12 bold, Arial   ; 改大改粗體
 Gui, Add, Button, Default gGenerateReport y615 x20, Generate Report
 Gui, Add, Button, gExit y615 x170, Exit

; Show GUI
Gui, Show,  w615 h665, Urinary Bladder cancer Imaging Report Generator
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
    FileAppend, MCH Imaging Report for Urinary Bladder cancer (AJCC 8th)`n, c:\temp\test.txt
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
   FileAppend,  %2_Space%■ Posterior wall or Trigone, c:\temp\test.txt
}
  if L3 = 0
 {
   FileAppend,  %2_Space%□ Posterior wall or Trigone,  c:\temp\test.txt
}
if L4= 1
 {
   FileAppend,  %2_Space%■ Right lateral wall , c:\temp\test.txt
}
  if L4 = 0
 {
   FileAppend,  %2_Space%□ Right lateral wall ,  c:\temp\test.txt
}
if L5 = 1
 {
   FileAppend,  %2_Space%■ Left lateral wall `n , c:\temp\test.txt
}
  if L5 = 0
 {
   FileAppend,  %2_Space%□ Left lateral wall `n ,  c:\temp\test.txt
}
if L6 = 1
 {
   FileAppend,  %4_Space%%4_Space%%4_Space%%4_Space%%4_Space%%2_Space%■ Dome, c:\temp\test.txt
}
  if L6 = 0
 {
   FileAppend,  %4_Space%%4_Space%%4_Space%%4_Space%%4_Space%%2_Space%□ Dome,  c:\temp\test.txt
}
if L7= 1
 {
   FileAppend,  %2_Space%■ Trigone , c:\temp\test.txt
}
  if L7 = 0
 {
   FileAppend,  %2_Space%□ Trigone ,  c:\temp\test.txt
}
if L8= 1
 {
   FileAppend,  %2_Space%■ Anterior wall , c:\temp\test.txt
}
  if L8 = 0
 {
   FileAppend,  %2_Space%□ Anterior wall ,  c:\temp\test.txt
}
if L9= 1
 {
   FileAppend,  %2_Space%■ Inferior wall or neck `n , c:\temp\test.txt
}
  if L9 = 0
 {
   FileAppend,  %2_Space%□ Inferior wall or neck `n ,  c:\temp\test.txt
}
FileAppend,  %4_Space%Size: , c:\temp\test.txt
if L10 = 1
 {
   FileAppend,  %2_Space%■ Non-measurable, c:\temp\test.txt
}
  if L10 = 0
 {
   FileAppend,  %2_Space%□ Non-measurable,  c:\temp\test.txt
}
if L11 = 1
 {
   FileAppend,  %2_Space%■ Measurable: __%L12%__cm (greatest dimension of the largest tumor)`n, c:\temp\test.txt
}
  if L11 = 0
 {
   FileAppend,  %2_Space%□ Measurable: __%L12%__cm (greatest dimension of the largest tumor) `n,  c:\temp\test.txt
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
if T3= 1
 {
   FileAppend,  %4_Space%■ T1-T2: Bladder wall. `n, c:\temp\test.txt
}
  if T3= 0
 {
   FileAppend,  %4_Space%□ T1-T2: Bladder wall. `n, c:\temp\test.txt
}
if T4= 1
 {
   FileAppend,  %4_Space%■ T2: Tumor invasion to deep muscle (for MRI). `n, c:\temp\test.txt
}
  if T4= 0
 {
   FileAppend,  %4_Space%□ T2: Tumor invasion to deep muscle (for MRI). `n, c:\temp\test.txt
}
if T5= 1
 {
   FileAppend,  %4_Space%■ T3: Gross tumor invasion to perivesical tissue. `n, c:\temp\test.txt
}
  if T5= 0
 {
   FileAppend,  %4_Space%□ T3: Gross tumor invasion to perivesical tissue. `n, c:\temp\test.txt
}
if T6= 1
 {
   FileAppend,  %4_Space%■ T4: Tumor invasion to adjacent organs or structures __%T7%__ (described)`n, c:\temp\test.txt
}
  if T6= 0
 {
   FileAppend,  %4_Space%□ T4: Tumor invasion to adjacent organs or structures __%T7%__(described) `n, c:\temp\test.txt
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
%4_Space%■ Yes
)`n, c:\temp\test.txt
}
  if Yes= 0
 {
   FileAppend,  
(
%4_Space%□ Yes
)`n, c:\temp\test.txt
}
if Y1= 1
 {
   FileAppend,  
(
%4_Space%%4_Space%■ N1: Single regional LN metastasis in the true pelvis*
)`n , c:\temp\test.txt
}
  if Y1= 0
 {
   FileAppend,  
(
%4_Space%%4_Space%□N1: Single regional LN metastasis in the true pelvis*
)`n, c:\temp\test.txt
}
if Y2= 1
 {
   FileAppend,  
(
%4_Space%%4_Space%■ N2: Multiple regional LN metastasis in the true pelvis*
)`n, c:\temp\test.txt
}
  if Y2= 0
 {
   FileAppend,
(
%4_Space%%4_Space%□ N2: Multiple regional LN metastasis in the true pelvis*
)`n , c:\temp\test.txt
}
if Y3= 1
 {
   FileAppend,  
(
%4_Space%%4_Space%■ N3: Metastasis to the common iliac lymph nodes.
)`n, c:\temp\test.txt
}
  if Y3= 0
 {
   FileAppend,  
(
%4_Space%%4_Space%□ N3: Metastasis to the common iliac lymph nodes.
)`n, c:\temp\test.txt
}
 FileAppend,  %4_Space%%4_Space%*perivesical`,` obturator`,` internal and external iliac`,` or sacral lymph node `n, c:\temp\test.txt

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
%4_Space%■ Yes
)`n, c:\temp\test.txt
}
  if DM1 = 0
 {
   FileAppend,  
(
%4_Space%□ Yes
)`n, c:\temp\test.txt
}    
if DM2= 1
 {
   FileAppend,  %4_Space%%4_Space%■ M1a: non-regional lymph node metastasis`n, c:\temp\test.txt
}
  if DM2= 0
 {
   FileAppend,  %4_Space%%4_Space%□ M1a: non-regional lymph node metastasis `n, c:\temp\test.txt
}
if DM3= 1
 {
   FileAppend,  %4_Space%%4_Space%■ M1b: distal metastasis __%DM4%__`n, c:\temp\test.txt
}
  if DM3= 0
 {
   FileAppend,  %4_Space%%4_Space%□ M1b: distal metastasis __%DM4%__ `n, c:\temp\test.txt
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
