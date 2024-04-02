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
Gui, Add, Text, y15 x20, 1. Tumor location/Size
Gui, Font ; 重置字體設置(不加這個 粗體改不回來)
Gui, Font, s10, Arial   ; 恢復
Gui, Add, Checkbox, vL1 y35 x40, Not assessable
Gui, Add, Checkbox, vL2 y55 x40, No or Equivocal
Gui, Add, Checkbox, vL3 y80 x40, Yes: 
Gui, Add, Checkbox, vL4 y80 x90, Right side
Gui, Add, Checkbox, vL5 y80 x175, Left sizde, Size:
Gui, Add, Edit, vL6 y75 x293 w40
Gui, Add, Text, y80 x336, cm(largest diameter of the biggest tumor)

; ---------------Tumor Invastion---------------
 Gui, Font, s12 bold, Arial   ; 改大改粗體
 Gui, Add, Text, y110 x20, 2. Tumor invasion
 Gui, Font ; 重置字體設置(不加這個 粗體改不回來)
 Gui, Font, s10, Arial   ; 恢復
 Gui, Add, Checkbox, vT1 y130 x40, Not assessable
Gui, Add, Checkbox, vT2 y150 x40, Prostate
Gui, Add, Checkbox, vT3 y170 x60, One-half of one side or less(T2a)
Gui, Add, Checkbox, vT4 y190 x60, More than one-half of one lobe but not both lobes(T2b)
Gui, Add, Checkbox, vT5 y210 x60, Involves both lobes(T2c)
Gui, Add, Checkbox, vT6 y230 x40, Extracapsular extension(T3a): 
Gui, Add, Checkbox, vT7 y230 x238, Right 
Gui, Add, Checkbox, vT8 y230 x293, Left
Gui, Add, Checkbox, vT9 y250 x40, Seminal vesicle invasion(T3b):
Gui, Add, Checkbox, vT10 y250 x238, Right 
Gui, Add, Checkbox, vT11 y250 x297, Left
Gui, Add, Checkbox, vT12 y270 x40, Pelvic side wall(T4)
Gui, Add, Checkbox, vT13 y290 x40, Pelvic organs invasion(T4):
Gui, Add, Checkbox, vT14 y290 x208, Bladder
Gui, Add, Checkbox, vT15 y290 x280, Rectum
Gui, Add, Checkbox, vT16 y290 x350, Levator muscles
Gui, Add, Checkbox, vT17 y320 x60, Others: 
Gui, Add, Edit, vT18 y315 x125 w250

; ---------------Regional nodal metastasis---------------
 Gui, Font, s12 bold, Arial   ; 改大改粗體
 Gui, Add, Text, y350 x20, 3. Regional nodal metastasis
 Gui, Font ; 重置字體設置(不加這個 粗體改不回來)
 Gui, Font, s10, Arial   ; 恢復
Gui, Add, Text, y350 x245, (
 Gui, Add, Checkbox, vNot y350 x253, Not assessable)
Gui, Add, Checkbox, vNo y370 x40, No
Gui, Add, Checkbox, vEqu y390 x40, Equivocal, Location:
Gui, Add, Checkbox, vE1 y410 x60, Right obturator
Gui, Add, Checkbox, vE2 y410 x170, Left obturator
Gui, Add, Checkbox, vE3 y410 x270, Right internal iliac
Gui, Add, Checkbox, vE4 y410 x400, Left internal iliac
Gui, Add, Checkbox, vE5 y430 x60, Right external iliac 
Gui, Add, Checkbox, vE6 y430 x190, Left external iliac 
Gui, Add, Checkbox, vE7 y430 x315, Right sacral 
Gui, Add, Checkbox, vE8 y430 x410, Left sacral
Gui, Add, Checkbox, vE9 y460 x60, Others:
Gui, Add, Edit, vE10 y455 x125 w240

Gui, Add, Checkbox, vYes y480 x40, Yes
Gui, Add, Checkbox, vY1 y500 x60, Right obturator
Gui, Add, Checkbox, vY2 y500 x170, Left obturator
Gui, Add, Checkbox, vY3 y500 x270, Right internal iliac
Gui, Add, Checkbox, vY4 y500 x400, Left internal iliac
Gui, Add, Checkbox, vY5 y520 x60, Right external iliac 
Gui, Add, Checkbox, vY6 y520 x190, Left external iliac 
Gui, Add, Checkbox, vY7 y520 x315, Right sacral 
Gui, Add, Checkbox, vY8 y520 x410, Left sacral
Gui, Add, Checkbox, vY9 y550 x60, Others:
Gui, Add, Edit, vY10 y545 x125 w240

; ---------------Distant Metastasis---------------
   Gui, Font, s12 bold, Arial   ; 改大改粗體
 Gui, Add, Text, y580 x20, 4. Distant metastasis
 Gui, Font ; 重置字體設置(不加這個 粗體改不回來)
 Gui, Font, s10, Arial   ; 恢復
 Gui, Add, Text, y580 x165, (in this study)
 Gui, Add, Checkbox, vDM0 y610 x40, No, 
Gui, Add, Checkbox, vDM1 y610 x80, Equivocal:
Gui, Add, Edit, vDM2 y605 x160 w250
Gui, Add, Checkbox, vDM3 y630 x40, Non-regional lymph node(M1a)
Gui, Add, Checkbox, vDM4 y650 x60, Right common iliac
Gui, Add, Checkbox, vDM5 y650 x200, Left common iliac
Gui, Add, Checkbox, vDM6 y650 x330, Right inguinal  
Gui, Add, Checkbox, vDM7 y650 x435, Left inguinal
Gui, Add, Checkbox, vDM8 y680 x60, Para-aortic
Gui, Add, Checkbox, vDM9 y680 x150, Others:
 Gui, Add, Edit, vDM10 y675 x220 w250
Gui, Add, Checkbox, vDM11 y710 x40, Bone(M1b)
Gui, Add, Edit, vDM12 y705 x125 w250
Gui, Add, Checkbox, vDM13 y740 x40, Other organs(M1c)
Gui, Add, Edit, vDM14 y735 x170 w250
 
; ---------------Other Findings---------------
 Gui, Font, s12 bold, Arial   ; 改大改粗體
 Gui, Add, Text, y770 x20, 5. Other findings
 Gui, Font ; 重置字體設置(不加這個 粗體改不回來)
 Gui, Font, s10, Arial   ; 恢復
 Gui, Add, Edit, vOF0 y800 x40 w500

; Buttons
 Gui, Font, s12 bold, Arial   ; 改大改粗體
 Gui, Add, Button, Default gGenerateReport y835 x20, Generate Report
 Gui, Add, Button, gExit y835 x170, Exit

; Show GUI
Gui, Show, w615 h880, Prostate Cancer Imaging Report Generator
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
    FileAppend, MCH Imaging Report for Prostate Carcinoma (AJCC 8th) `n, c:\temp\test.txt
    FileAppend,    `n, c:\temp\test.txt    ; 輸入空白行幫助排版
    FileAppend, *本表單僅依據單次影像進行分期供腫瘤團隊參考，並不代表病人的臨床分期，臨床分期需綜合病人臨床發現、各種影像(包括各種內視鏡及超音波檢查)及病理表現來進行判斷，病人的最終臨床分期可能因癌症團隊討論有所異動，敬請參閱病歷首頁。 `n, c:\temp\test.txt
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
   FileAppend,  %4_Space%■ No or Equivocal`n, c:\temp\test.txt
}
  if L2 = 0
 {
   FileAppend,  %4_Space%□ No or Equivocal `n, c:\temp\test.txt
}
if L3 = 1
 {
   FileAppend,  %4_Space%■ Yes:`n, c:\temp\test.txt
}
  if L3 = 0
 {
   FileAppend,  %4_Space%□ Yes:`n,  c:\temp\test.txt
}
if L4 = 1
 {
   FileAppend,  %4_Space%%4_Space%Location: ■ Right side, c:\temp\test.txt
}
  if L4 = 0
 {
   FileAppend,  %4_Space%%4_Space%Location: □ Right side, c:\temp\test.txt
}
if L5 = 1
 {
   FileAppend, 
(
 %2_Space%■ Left side
%4_Space%%4_Space%Size: _%L6%_cm(largest diameter of the biggest tumor)`n
)`n, c:\temp\test.txt
}
  if L5 = 0
 {
   FileAppend,  
(
%2_Space%□ Left side
%4_Space%%4_Space%Size: _%L6%_cm(largest diameter of the biggest tumor)`n
)`n, c:\temp\test.txt
}
   
; FileAppend,   %2_Space% `n, c:\temp\test.txt    ; 輸入空白行幫助排版
;--------------第三段-----------------------------------------------
FileAppend,  2. %1_Space%Tumor invasion `n , c:\temp\test.txt  

if T1= 1
 {
   FileAppend,  %4_Space%■ Not assessable`n, c:\temp\test.txt
}
  if T1= 0
 {
   FileAppend,  %4_Space%□ Not assessable`n, c:\temp\test.txt
}
if T2= 1
 {
   FileAppend,  %4_Space%■ Prostate`n, c:\temp\test.txt
}
  if T2= 0
 {
   FileAppend,  %4_Space%□ Prostate`n, c:\temp\test.txt
}
if T3= 1
 {
   FileAppend,  %4_Space%%4_Space%■ One-half of one side or less(T2a) `n, c:\temp\test.txt
}
  if T3= 0
 {
   FileAppend,  %4_Space%%4_Space%□ One-half of one side or less(T2a) `n, c:\temp\test.txt
}
if T4= 1
 {
   FileAppend,  %4_Space%%4_Space%■ More than one-half of one lobe but not both lobes(T2b)`n, c:\temp\test.txt
}
  if T4= 0
 {
   FileAppend,  %4_Space%%4_Space%□ More than one-half of one lobe but not both lobes(T2b)`n, c:\temp\test.txt
}
if T5= 1
 {
   FileAppend,  %4_Space%%4_Space%■ Involves both lobes(T2c) `n, c:\temp\test.txt
}
  if T5= 0
 {
   FileAppend,  %4_Space%%4_Space%□ Involves both lobes(T2c) `n, c:\temp\test.txt
}
if T6= 1
 {
   FileAppend,  %4_Space%■ Extracapsular extension(T3a): , c:\temp\test.txt
}
  if T6= 0
 {
   FileAppend,  %4_Space%□ Extracapsular extension(T3a): , c:\temp\test.txt
}
if T7= 1
 {
   FileAppend,  %2_Space%■ Right , c:\temp\test.txt
}
  if T7= 0
 {
   FileAppend,  %2_Space%□ Right , c:\temp\test.txt
}
if T8= 1
 {
   FileAppend,  %2_Space%■ Left`n, c:\temp\test.txt
}
  if T8= 0
 {
   FileAppend,  %2_Space%□ Left`n, c:\temp\test.txt
}
if T9= 1
 {
   FileAppend,  %4_Space%■ Seminal vesicle invasion(T3b):, c:\temp\test.txt
}
  if T9= 0
 {
   FileAppend,  %4_Space%□ Seminal vesicle invasion(T3b):, c:\temp\test.txt
}
if T10= 1
 {
   FileAppend, %2_Space%■ Right, c:\temp\test.txt
}
  if T10= 0
 {
   FileAppend,  %2_Space%□ Right, c:\temp\test.txt
}
if T11= 1
 {
   FileAppend,  %2_Space%■ Left`n, c:\temp\test.txt
}
  if T11= 0
 {   
FileAppend,  %2_Space%□ Left`n, c:\temp\test.txt
}
if T12= 1
 {
   FileAppend,  %4_Space%■ Pelvic side wall(T4)`n, c:\temp\test.txt
}
  if T12= 0
 {
   FileAppend,  %4_Space%□ Pelvic side wall(T4)`n, c:\temp\test.txt
}
if T13= 1
 {
   FileAppend,  %4_Space%■ Pelvic organs invasion(T4):, c:\temp\test.txt
}
  if T13= 0
 {
   FileAppend,  %4_Space%□ Pelvic organs invasion(T4):, c:\temp\test.txt
}
if T14= 1
 {
   FileAppend, %2_Space%■ Bladder, c:\temp\test.txt
}
  if T14= 0
 {
   FileAppend,  %2_Space%□ Bladder, c:\temp\test.txt
}
if T15= 1
 {
   FileAppend, %2_Space%■ Rectum, c:\temp\test.txt
}
  if T15= 0
 {
   FileAppend,  %2_Space%□ Rectum, c:\temp\test.txt
}
if T16= 1
 {
   FileAppend,  %2_Space%■ Levator muscles`n, c:\temp\test.txt
}
  if T16= 0
 {   
FileAppend,  %2_Space%□ Levator muscles`n, c:\temp\test.txt
}
if T17= 1
 {
   FileAppend,  %4_Space%%4_Space%■ Others:_%T18%_`n, c:\temp\test.txt
}
  if T17= 0
 {
   FileAppend,  %4_Space%%4_Space%□ Others:__%T18%__`n, c:\temp\test.txt
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
   FileAppend,  %4_Space%■ No`n, c:\temp\test.txt
}
  if No= 0
 {
   FileAppend,  %4_Space%□ No`n, c:\temp\test.txt
}
if Equ= 1
 {
   FileAppend,  
(
%4_Space%■ Equivocal, Location:
)`n, c:\temp\test.txt
}
  if Equ= 0
 {
   FileAppend,  
(
%4_Space%□ Equivocal, Location:
)`n, c:\temp\test.txt
}
if E1= 1
 {
   FileAppend,  %4_Space%%4_Space%■ Right obturator, c:\temp\test.txt
}
  if E1= 0
 {
   FileAppend,  %4_Space%%4_Space%□ Right obturator, c:\temp\test.txt
}
if E2= 1
 {
   FileAppend,  %2_Space%■  Left obturator, c:\temp\test.txt
}
  if E2= 0
 {
   FileAppend,  %2_Space%□  Left obturator, c:\temp\test.txt
}
if E3= 1
 {
   FileAppend,  %2_Space%■ Right internal iliac, c:\temp\test.txt
}
  if E3= 0
 {
   FileAppend,  %2_Space%□ Right internal iliac, c:\temp\test.txt
}
if E4= 1
 {
   FileAppend,  %2_Space%■ Left internal iliac`n, c:\temp\test.txt
}
  if E4= 0
 {
   FileAppend,  %2_Space%□ Left internal iliac`n, c:\temp\test.txt
}
if E5= 1
 {
   FileAppend,  %4_Space%%4_Space%■ Right external iliac , c:\temp\test.txt
}
  if E5= 0
 {
   FileAppend,  %4_Space%%4_Space%□ Right external iliac , c:\temp\test.txt
}
if E6= 1
 {
   FileAppend,  %2_Space%■ Left external iliac , c:\temp\test.txt
}
  if E6= 0
 {
   FileAppend,  %2_Space%□ Left external iliac , c:\temp\test.txt
}
if E7= 1
 {
   FileAppend,  %2_Space%■ Right sacral , c:\temp\test.txt
}
  if E7= 0
 {
   FileAppend,  %2_Space%□ Right sacral , c:\temp\test.txt
}
if E8= 1
 {
   FileAppend,  %2_Space%■ Left sacral`n, c:\temp\test.txt
}
  if E8= 0
 {
   FileAppend,  %2_Space%□ Left sacral`n, c:\temp\test.txt
}
if E9= 1
 {
   FileAppend,  %4_Space%%4_Space%■ Others:__%E10%__`n, c:\temp\test.txt
}
  if E9= 0
 {
   FileAppend,  %4_Space%%4_Space%□ Others:__%E10%__`n, c:\temp\test.txt
}
if Yes= 1
 {
   FileAppend,  %4_Space%■ Yes`n, c:\temp\test.txt
}
  if Yes= 0
 {
   FileAppend,  %4_Space%□ Yes`n, c:\temp\test.txt
}
if Y1= 1
 {
   FileAppend,  %4_Space%%4_Space%■ Right obturator, c:\temp\test.txt
}
  if Y1= 0
 {
   FileAppend,  %4_Space%%4_Space%□ Right obturator, c:\temp\test.txt
}
if Y2= 1
 {
   FileAppend,  %2_Space%■  Left obturator, c:\temp\test.txt
}
  if Y2= 0
 {
   FileAppend,  %2_Space%□  Left obturator, c:\temp\test.txt
}
if Y3= 1
 {
   FileAppend,  %2_Space%■ Right internal iliac, c:\temp\test.txt
}
  if Y3= 0
 {
   FileAppend,  %2_Space%□ Right internal iliac, c:\temp\test.txt
}
if Y4= 1
 {
   FileAppend,  %2_Space%■ Left internal iliac`n, c:\temp\test.txt
}
  if Y4= 0
 {
   FileAppend,  %2_Space%□ Left internal iliac`n, c:\temp\test.txt
}
if Y5= 1
 {
   FileAppend,  %4_Space%%4_Space%■ Right external iliac , c:\temp\test.txt
}
  if Y5= 0
 {
   FileAppend,  %4_Space%%4_Space%□ Right external iliac , c:\temp\test.txt
}
if Y6= 1
 {
   FileAppend,  %2_Space%■ Left external iliac , c:\temp\test.txt
}
  if Y6= 0
 {
   FileAppend,  %2_Space%□ Left external iliac , c:\temp\test.txt
}
if Y7= 1
 {
   FileAppend,  %2_Space%■ Right sacral , c:\temp\test.txt
}
  if Y7= 0
 {
   FileAppend,  %2_Space%□ Right sacral , c:\temp\test.txt
}
if Y8= 1
 {
   FileAppend,  %2_Space%■ Left sacral`n, c:\temp\test.txt
}
  if Y8= 0
 {
   FileAppend,  %2_Space%□ Left sacral`n, c:\temp\test.txt
}
if Y9= 1
 {
   FileAppend,  %4_Space%%4_Space%■ Others:__%Y10%__`n, c:\temp\test.txt
}
  if Y9= 0
 {
   FileAppend,  %4_Space%%4_Space%□ Others:__%Y10%__`n, c:\temp\test.txt
}


FileAppend,   %2_Space% `n, c:\temp\test.txt    ; 輸入空白行幫助排版

;--------------第五段-----------------------------------------------

   FileAppend,  4. %1_Space%Distant metastasis(in this study)`n, c:\temp\test.txt  
if DM0= 1
 {
   FileAppend,  
(
%4_Space%■ No,
), c:\temp\test.txt
}
  if DM0 = 0
 {
   FileAppend,  
(
%4_Space%□ No,
), c:\temp\test.txt
}
if DM1= 1
 {
   FileAppend,  
(
%2_Space%■ Equivocal: __%DM2%__
)`n, c:\temp\test.txt
}
  if DM1 = 0
 {
   FileAppend,  
(
%2_Space%□ Equivocal: _%DM2%__
)`n, c:\temp\test.txt
}    
if DM3= 1
 {
   FileAppend,  
(
%4_Space%■ Non-regional lymph node(M1a)
)`n, c:\temp\test.txt
}
  if DM3 = 0
 {
   FileAppend,  
(
%4_Space%□ Non-regional lymph node(M1a)
)`n, c:\temp\test.txt
}
if DM4= 1
 {
   FileAppend,  %4_Space%%4_Space%■ Right common iliac , c:\temp\test.txt
}
  if DM4= 0
 {
   FileAppend,  %4_Space%%4_Space%□ Right common iliac , c:\temp\test.txt
}
if DM5= 1
 {
   FileAppend,  %2_Space%■ Left common iliac , c:\temp\test.txt
}
  if DM5= 0
 {
   FileAppend,  %2_Space%□ Left common iliac , c:\temp\test.txt
}
if DM6= 1
 {
   FileAppend,  %2_Space%■ Right inguinal   , c:\temp\test.txt
}
  if DM6= 0
 {
   FileAppend,  %2_Space%□ Right inguinal   , c:\temp\test.txt
}
if DM7= 1
 {
   FileAppend,  %2_Space%■ Left inguinal`n, c:\temp\test.txt
}
  if DM7= 0
 {
   FileAppend,  %2_Space%□ Left inguinal`n, c:\temp\test.txt
}
if DM8= 1
 {
   FileAppend,  %4_Space%%4_Space%■ Para-aortic , c:\temp\test.txt
}
  if DM8= 0
 {
   FileAppend,  %4_Space%%4_Space%□ Para-aortic, c:\temp\test.txt
}
if DM9= 1
 {
   FileAppend,  %2_Space%■ Others: __%DM10%__`n, c:\temp\test.txt
}
  if DM9= 0
 {
   FileAppend,  %2_Space%□ Others: __%DM10%__`n, c:\temp\test.txt
}
if DM11= 1
 {
   FileAppend,  %4_Space%■ Bone(M1b): __%DM12%__`n, c:\temp\test.txt
}
  if DM11= 0
 {
   FileAppend,  %4_Space%□ Bone(M1b): __%DM12%__`n, c:\temp\test.txt
}
if DM13= 1
 {
   FileAppend,  %4_Space%■ Other organs(M1c): __%DM14%__`n, c:\temp\test.txt
}
  if DM13= 0
 {
   FileAppend,  %4_Space%□ Other organs(M1c): __%DM14%__`n, c:\temp\test.txt
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
