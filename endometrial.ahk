; Prostate cancer Imaging Report Generator
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
Gui, Add, Text, y15 x20, 1. Tumor Size
Gui, Font ; 重置字體設置(不加這個 粗體改不回來)
Gui, Font, s10, Arial   ; 恢復
Gui, Add, Text, y15 x127, (
Gui, Add, Checkbox, vL1 y15 x132, Not assessable)
Gui, Add, Checkbox, vL2 y35 x40, Non-measurable
Gui, Add, Checkbox, vL3 y60 x40, Measurable:
Gui, Add, Edit, vL4 y55 x132 w40
Gui, Add, Text, y60 x180, cm (greatest diameter)
; ---------------Tumor Invastion---------------
 Gui, Font, s12 bold, Arial   ; 改大改粗體
 Gui, Add, Text, y90 x20, 2. Tumor invasion
 Gui, Font ; 重置字體設置(不加這個 粗體改不回來)
 Gui, Font, s10, Arial   ; 恢復
Gui, Add, Text, y90 x160, (
 Gui, Add, Checkbox, vT1 y90 x166, Not assessable)
Gui, Add, Checkbox, vT2 y110 x40, No or Equivocal 
Gui, Add, Checkbox, vT3 y130 x40, Yes. If yes:
Gui, Add, Checkbox, vT4 y150 x60, Tumor in uterine corpus
Gui, Add, Checkbox, vT5 y170 x80, Tumor limited to endometrium or invades less than one half of the myometrium (T1a)
Gui, Add, Checkbox, vT6 y190 x80, Tumor invades more than one half of the myometrium (T1b)
Gui, Add, Checkbox, vT7 y210 x60, Tumor invades stromal connective tissue of the cervix but does not extend beyound uterus (T2)
Gui, Add, Checkbox, vT8 y230 x60, Tumor invades serosa and/or adnexa (T3a)
Gui, Add, Checkbox, vT9 y250 x60, Vaginal involvement (T3b)
Gui, Add, Checkbox, vT10 y270 x60, Tumor invades bladder (T4)
Gui, Add, Checkbox, vT11 y290 x60, Tumor invades bowel (T4)
Gui, Add, Checkbox, vT12 y315 x60, Others: 
Gui, Add, Edit, vT13 y310 x125 w250

; ---------------Regional nodal metastasis---------------
 Gui, Font, s12 bold, Arial   ; 改大改粗體
 Gui, Add, Text, y345 x20, 3. Regional nodal metastasis
 Gui, Font ; 重置字體設置(不加這個 粗體改不回來)
 Gui, Font, s10, Arial   ; 恢復
Gui, Add, Text, y345 x245, (
 Gui, Add, Checkbox, vNot y345 x253, Not assessable)
Gui, Add, Checkbox, vNo y365 x40, No
Gui, Add, Checkbox, vEqu y385 x40, Equivocal
Gui, Add, Checkbox, vE1 y405 x60, Pelvic LN
Gui, Add, Checkbox, vE2 y425 x60, Para-aortic LN
Gui, Add, Checkbox, vE3 y445 x40, Yes
Gui, Add, Checkbox, vE4 y465 x60, Pelvic LN (N1)
Gui, Add, Checkbox, vE5 y485 x60, Para-aortic LN (N2)
  
; ---------------Distant Metastasis---------------
   Gui, Font, s12 bold, Arial   ; 改大改粗體
 Gui, Add, Text, y515 x20, 4. Distant metastasis
 Gui, Font ; 重置字體設置(不加這個 粗體改不回來)
 Gui, Font, s10, Arial   ; 恢復
 Gui, Add, Text, y515 x181, (in this study)(
 Gui, Add, Checkbox, vDM0 y515 x265, Not assessable)
Gui, Add, Checkbox, vDM1 y535 x40, No or Equivocal:
Gui, Add, Checkbox, vDM2 y555 x40, Yes. If yes:
Gui, Add, Checkbox, vDM3 y575 x60, Non-regional lymph nodes
Gui, Add, Checkbox, vDM4 y600 x80, Left inguinal nodes
Gui, Add, Checkbox, vDM5 y600 x210, Right inguinal nodes
Gui, Add, Checkbox, vDM7 y600 x348, Others: 
Gui, Add, Edit, vDM8 y595 x413 w160
Gui, Add, Checkbox, vDM9 y625 x60, Others:
 Gui, Add, Edit, vDM10 y620 x123 w250
 
; ---------------Other Findings---------------
 Gui, Font, s12 bold, Arial   ; 改大改粗體
 Gui, Add, Text, y655 x20, 5. Other findings:
 Gui, Font ; 重置字體設置(不加這個 粗體改不回來)
 Gui, Font, s10, Arial   ; 恢復
 Gui, Add, Edit, vOF0 y675 x40 w500

; Buttons
 Gui, Font, s12 bold, Arial   ; 改大改粗體
 Gui, Add, Button, Default gGenerateReport y715 x20, Generate Report
 Gui, Add, Button, gExit y715 x170, Exit

; Show GUI
Gui, Show, w680 h760, Endometrial Carcinoma Imaging Report Generator
return

; === 生成報告===
GenerateReport:
    ; Collect data from GUI
    Gui, Submit, NoHide
     ; 刪除現有的 test.txt 文件
    FileDelete, c:\temp\test.txt
    ; 將結果逐行輸入test.txt中
FormatTime, CurrentDate,, yyyy/MM/dd
FileAppend,  Addtional report for cancer staging on %CurrentDate%  `n, c:\temp\test.txt    
FileAppend,   =========================================== `n, c:\temp\test.txt 
    FileAppend, MCH Imaging Report for Endometrial Carcinoma (AJCC 8th)  `n, c:\temp\test.txt
    FileAppend,    `n, c:\temp\test.txt    ; 輸入空白行幫助排版
    FileAppend, *本表單僅依據單次影像進行分期供腫瘤團隊參考，並不代表病人的臨床分期，臨床分期需綜合病人臨床發現、各種影像(包括各種內視鏡及超音波檢查)及病理表現來進行判斷，病人的最終臨床分期可能因癌症團隊討論有所異動，敬請參閱病歷首頁。`n, c:\temp\test.txt
    FileAppend,   %2_Space% `n, c:\temp\test.txt    ; 輸入空白行幫助排版
;-------------------------------------------------------------
    
;--------------第二段-----------------------------------------------
FileAppend,  1. %1_Space%Tumor Size , c:\temp\test.txt  
if L1 = 1
 {
   FileAppend,  %2_Space%(■ Not assessable)  `n, c:\temp\test.txt
}
  if L1 = 0
 {
   FileAppend,  %2_Space%(□ Not assessable )`n, c:\temp\test.txt
}
if L2 = 1
 {
   FileAppend,  %4_Space%■ Non-measurable`n, c:\temp\test.txt
}
  if L2 = 0
 {
   FileAppend,  %4_Space%□ Non-measurable`n, c:\temp\test.txt
}
if L3 = 1
 {
   FileAppend,  %4_Space%■ Measurable: __%L4%__ cm (greatest diameter)`n, c:\temp\test.txt
}
  if L3 = 0
 {
   FileAppend,  %4_Space%□ Measurable: __%L4%__cm (greatest diameter)`n , c:\temp\test.txt
}

FileAppend,   %2_Space% `n, c:\temp\test.txt    ; 輸入空白行幫助排版
;--------------第三段-----------------------------------------------
FileAppend,  2. %1_Space%Tumor invasion, c:\temp\test.txt  

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
   FileAppend,  %4_Space%■ No or Equivocal `n, c:\temp\test.txt
}
  if T2= 0
 {
   FileAppend,  %4_Space%□ No or Equivocal `n, c:\temp\test.txt
}
if T3= 1
 {
   FileAppend,  %4_Space%■ Yes. If yes:`n, c:\temp\test.txt
}
  if T3= 0
 {
   FileAppend,  %4_Space%□ Yes. If yes:`n, c:\temp\test.txt
}
if T4= 1
 {
   FileAppend,  %4_Space%%4_Space%■ Tumor in uterine corpus`n, c:\temp\test.txt
}
  if T4= 0
 {
   FileAppend,  %4_Space%%4_Space%□ Tumor in uterine corpus`n, c:\temp\test.txt
}
if T5= 1
 {
   FileAppend,  %4_Space%%4_Space%%4_Space%■ Tumor limited to endometrium or invades less than one half of the myometrium (T1a)`n, c:\temp\test.txt
}
  if T5= 0
 {
   FileAppend,  %4_Space%%4_Space%%4_Space%□ Tumor limited to endometrium or invades less than one half of the myometrium (T1a) `n, c:\temp\test.txt
}
if T6= 1
 {
   FileAppend,   %4_Space%%4_Space%%4_Space%■ Tumor invades more than one half of the myometrium (T1b) `n , c:\temp\test.txt
}
  if T6= 0
 {
   FileAppend,  %4_Space%%4_Space%%4_Space%□ Tumor invades more than one half of the myometrium (T1b) `n, c:\temp\test.txt
}
if T7= 1
 {
   FileAppend,   %4_Space%%4_Space%■ Tumor invades stromal connective tissue of the cervix but does not extend beyound uterus (T2) `n, c:\temp\test.txt
}
  if T7= 0
 {
   FileAppend,   %4_Space%%4_Space%□ Tumor invades stromal connective tissue of the cervix but does not extend beyound uterus (T2) `n, c:\temp\test.txt
}
if T8= 1
 {
   FileAppend,  %4_Space%%4_Space%■ Tumor invades serosa and/or adnexa (T3a)`n, c:\temp\test.txt
}
  if T8= 0
 {
   FileAppend,  %4_Space%%4_Space%□ Tumor invades serosa and/or adnexa (T3a)`n, c:\temp\test.txt
}
if T9= 1
 {
   FileAppend,  %4_Space%%4_Space%■ Vaginal involvement (T3b)  `n, c:\temp\test.txt
}
  if T9= 0
 {
   FileAppend,  %4_Space%%4_Space%□ Vaginal involvement (T3b) `n , c:\temp\test.txt
}
if T10= 1
 {
   FileAppend, %4_Space%%4_Space%■ Tumor invades bladder (T4)  `n, c:\temp\test.txt
}
  if T10= 0
 {
   FileAppend,  %4_Space%%4_Space%□ Tumor invades bladder (T4) `n , c:\temp\test.txt
}
if T11= 1
 {
   FileAppend,  %4_Space%%4_Space%■ Tumor invades bowel (T4) `n, c:\temp\test.txt
}
  if T11= 0
 {   
FileAppend,  %4_Space%%4_Space%□ Tumor invades bowel (T4) `n, c:\temp\test.txt
}
if T12= 1
 {
   FileAppend,  %4_Space%%4_Space%■  Others: __%T13%__ `n, c:\temp\test.txt
}
  if T12= 0
 {
   FileAppend, %4_Space%%4_Space%□  Others: __%T13%__ `n, c:\temp\test.txt
}

    FileAppend,   %2_Space% `n, c:\temp\test.txt    ; 輸入空白行幫助排版

;--------------第四段-----------------------------------------------

FileAppend,  3. %1_Space%Regional nodal metastasis , c:\temp\test.txt  
if Not= 1
 {
   FileAppend,  %2_Space%( ■ Not assessable) %1_Space% `n, c:\temp\test.txt
}
  if Not= 0
 {
   FileAppend, %2_Space%( □ Not assessable)%1_Space% `n, c:\temp\test.txt
}
if No= 1
 {
   FileAppend,  %4_Space%■ No `n, c:\temp\test.txt
}
  if No= 0
 {
   FileAppend,  %4_Space%□ No `n, c:\temp\test.txt
}
if Equ= 1
 {
   FileAppend,  
(
%4_Space%■ Equivocal
)`n, c:\temp\test.txt
}
  if Equ= 0
 {
   FileAppend,  
(
%4_Space%□ Equivocal
)`n, c:\temp\test.txt
}
if E1= 1
 {
   FileAppend,  %4_Space%%4_Space%■ Pelvic LN `n, c:\temp\test.txt
}
  if E1= 0
 {
   FileAppend,  %4_Space%%4_Space%□ Pelvic LN `n, c:\temp\test.txt
}
if E2= 1
 {
   FileAppend,  %4_Space%%4_Space%■ Para-aortic LN `n, c:\temp\test.txt
}
  if E2= 0
 {
   FileAppend,  %4_Space%%4_Space%□ Para-aortic LN `n, c:\temp\test.txt
}
if E3= 1
 {
   FileAppend,  %4_Space%■ Yes `n, c:\temp\test.txt
}
  if E3= 0
 {
   FileAppend,  %4_Space%□ Yes `n, c:\temp\test.txt
}
if E4= 1
 {
   FileAppend,  %4_Space%%4_Space%■ Pelvic LN (N1) `n, c:\temp\test.txt
}
  if E4= 0
 {
   FileAppend,  %4_Space%%4_Space%□ Pelvic LN (N1) `n, c:\temp\test.txt
}
if E5= 1
 {
   FileAppend,  %4_Space%%4_Space%■ Para-aortic LN (N2) `n, c:\temp\test.txt
}
  if E5= 0
 {
   FileAppend,  %4_Space%%4_Space%□ Para-aortic LN (N2) `n , c:\temp\test.txt
}

FileAppend,   %2_Space% `n, c:\temp\test.txt    ; 輸入空白行幫助排版

;--------------第五段-----------------------------------------------

   FileAppend,  4. %1_Space%Distant metastasis(in this study) , c:\temp\test.txt  
if DM0= 1
 {
   FileAppend,  
(
%2_Space%(■ Not assessable)
) `n, c:\temp\test.txt
}
  if DM0 = 0
 {
   FileAppend,  
(
%2_Space%(□ Not assessable)
)`n, c:\temp\test.txt
}
if DM1= 1
 {
   FileAppend,  
(
%4_Space%■ No or Equivocal:
)`n, c:\temp\test.txt
}
  if DM1 = 0
 {
   FileAppend,  
(
%4_Space%□ No or Equivocal:
)`n, c:\temp\test.txt
}    
if DM2= 1
 {
   FileAppend,  
(
%4_Space%■ Yes. If yes:
)`n, c:\temp\test.txt
}
  if DM2 = 0
 {
   FileAppend,  
(
%4_Space%□ Yes. If yes:
)`n, c:\temp\test.txt
}
if DM3= 1
 {
   FileAppend,  %4_Space%%4_Space%■ Non-regional lymph nodes `n , c:\temp\test.txt
}
  if DM3= 0
 {
   FileAppend,  %4_Space%%4_Space%□ Non-regional lymph nodes `n , c:\temp\test.txt
}
if DM4= 1
 {
   FileAppend,  %4_Space%%4_Space%%4_Space%■ Left inguinal nodes , c:\temp\test.txt
}
  if DM4= 0
 {
   FileAppend,  %4_Space%%4_Space%%4_Space%□ Left inguinal nodes , c:\temp\test.txt
}
if DM5= 1
 {
   FileAppend,  %2_Space% ■ Right inguinal nodes , c:\temp\test.txt
}
  if DM5= 0
 {
   FileAppend,  %2_Space%□ Right inguinal nodes , c:\temp\test.txt
}

if DM7= 1
 {
   FileAppend,  %2_Space%■ Others: __%DM8%__ `n, c:\temp\test.txt
}
  if DM7= 0
 {
   FileAppend,  %2_Space%□ Others: __%DM8%__ `n, c:\temp\test.txt
}

if DM9= 1
 {
   FileAppend,  %4_Space%%4_Space%■ Others: __%DM10%__`n, c:\temp\test.txt
}
  if DM9= 0
 {
   FileAppend,  %4_Space%%4_Space%□ Others: __%DM10%__`n, c:\temp\test.txt
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
