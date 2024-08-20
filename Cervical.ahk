; Cervical cancer Imaging Report Generator
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
Gui, Add, Text, y15 x20, 1. Tumor Size
Gui, Font ; 重置字體設置(不加這個 粗體改不回來)
Gui, Font, s10, Arial   ; 恢復
Gui, Add, Text, y15 x131, (
Gui, Add, Checkbox, vL1 y15 x136, Tx: Not assessable)
Gui, Add, Checkbox, vL2 y40 x40, Non-measureable
Gui, Add, Checkbox, vL3 y40 x166, Measurable: 
Gui, Add, Edit, vL4 y35 x262 w40
Gui, Add, Text, y40 x308, cm (length or largest diameter)

; ---------------Tumor Invastion---------------
 Gui, Font, s12 bold, Arial   ; 改大改粗體
 Gui, Add, Text, y70 x20, 2. Tumor invasion
 Gui, Font ; 重置字體設置(不加這個 粗體改不回來)
 Gui, Font, s10, Arial   ; 恢復
Gui, Add, Text, y70 x162, (
 Gui, Add, Checkbox, vT1 y70 x168, Not assessable)
Gui, Add, Checkbox, vT2 y90 x40, T0: No evidence of primary tumor.
Gui, Add, Text, y110 x40, Cervical carcinoma confined to the uterus:
Gui, Add, Checkbox, vT3 y130 x60, T1b1: Tumor <= 2 cm
Gui, Add, Checkbox, vT4 y150 x60, T1b2: Tumor >2, but <= 4 cm.
Gui, Add, Checkbox, vT5 y170 x60, T1b3: Tumor > 4 cm.
Gui, Add, Text, y190 x40, Vaginal invasion
Gui, Add, Checkbox, vT6 y210 x60, T2a1: <= 4 cm, upper 2/3.
Gui, Add, Checkbox, vT7 y230 x60, T2a2: > 4 cm, upper 2/3.
Gui, Add, Checkbox, vT8 y250 x60, T3a: Lower 1/3.
Gui, Add, Checkbox, vT9 y270 x40, T2b: Parametrial invasion
Gui, Add, Checkbox, vT10 y270 x211, Right
Gui, Add, Checkbox, vT11 y270 x266, Left
Gui, Add, Checkbox, vT12 y290 x40, T3b: Pelvic side wall or floor.
Gui, Add, Checkbox, vT13 y310 x40, T3b: Tumor related hydronephrosis/Hydroureter
Gui, Add, Checkbox, vT14 y310 x337, Right
Gui, Add, Checkbox, vT15 y310 x396, Left
Gui, Add, Checkbox, vT16 y330 x40, T4: Pelvic organs invasion.
Gui, Add, Checkbox, vT17 y355 x60, Bladder 
Gui, Add, Checkbox, vT18 y355 x130, Rectum
Gui, Add, Checkbox, vT19 y355 x200, Sigmoid colon
Gui, Add, Checkbox, vT20 y355 x310, Others: 
Gui, Add, Edit, vT21 y350 x374 w100

; ---------------Regional nodal metastasis---------------
 Gui, Font, s12 bold, Arial   ; 改大改粗體
 Gui, Add, Text, y385 x20, 3. Regional nodal metastasis
 Gui, Font ; 重置字體設置(不加這個 粗體改不回來)
 Gui, Font, s10, Arial   ; 恢復
 Gui, Add, Text, y385 x245, (
  Gui, Add, Checkbox, vNot y385 x253, Not assessable)
 Gui, Add, Checkbox, vNo y405 x40, No or equivocal 
 Gui, Add, Checkbox, vE1 y425 x40, Yes
 Gui, Add, Checkbox, vE2 y445 x60, N1: Pelvic LN
 Gui, Add, Checkbox, vE3 y465 x60, N2: Para-aortic LN

; ---------------Distant Metastasis---------------
   Gui, Font, s12 bold, Arial   ; 改大改粗體
 Gui, Add, Text, y495 x20, 4. Distant metastasis
 Gui, Font ; 重置字體設置(不加這個 粗體改不回來)
 Gui, Font, s10, Arial   ; 恢復
 Gui, Add, Text, y495 x165, (in this study)
 Gui, Add, Checkbox, vDM0 y515 x40, No or Equivocal
Gui, Add, Checkbox, vDM1 y535 x40, Yes
Gui, Add, Checkbox, vDM2 y555 x60, Non-regional lymph nodes
Gui, Add, Checkbox, vDM3 y580 x80, Left Inguinal nodes
Gui, Add, Checkbox, vDM4 y580 x211, Right inguinal nodes
Gui, Add, Checkbox, vDM5 y580 x352, Others
Gui, Add, Edit, vDM6 y575 x420 w100
 Gui, Add, Checkbox, vDM7 y600 x60, Peritoneum
 Gui, Add, Checkbox, vDM8 y620 x60, Bone
Gui, Add, Checkbox, vDM9 y640 x60, Liver
Gui, Add, Checkbox, vDM10 y660 x60, Lung
Gui, Add, Checkbox, vDM11 y685 x60, Others: 
 Gui, Add, Edit, vDM12 y680 x127 w250
 
; ---------------Other Findings---------------
 Gui, Font, s12 bold, Arial   ; 改大改粗體
 Gui, Add, Text, y715 x20, 5. Other findings
 Gui, Font ; 重置字體設置(不加這個 粗體改不回來)
 Gui, Font, s10, Arial   ; 恢復
 Gui, Add, Edit, vOF0 y735 x40 w500

; Buttons
 Gui, Font, s12 bold, Arial   ; 改大改粗體
 Gui, Add, Button, Default gGenerateReport y785 x20, Generate Report
 Gui, Add, Button, gExit y785 x170, Exit

; Show GUI
Gui, Show, w615 h830, Cervical Cancer Imaging Report Generator
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
    FileAppend, MCH Imaging Report for Cervical Carcinoma (AJCC 9th) `n, c:\temp\test.txt
    FileAppend,    `n, c:\temp\test.txt    ; 輸入空白行幫助排版
    FileAppend, *本表單僅依據單次影像進行分期供腫瘤團隊參考，並不代表病人的臨床分期，臨床分期需綜合病人臨床發現、各種影像(包括各種內視鏡及超音波檢查)及病理表現來進行判斷，病人的最終臨床分期可能因癌症團隊討論有所異動，敬請參閱病歷首頁。 `n, c:\temp\test.txt
    FileAppend,   %2_Space% `n, c:\temp\test.txt    ; 輸入空白行幫助排版
;-------------------------------------------------------------
    
;--------------第一段-----------------------------------------------
FileAppend,  1. %1_Space%Tumor size , c:\temp\test.txt  
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
   FileAppend,  %4_Space%■ Non-measureable, c:\temp\test.txt
}
  if L2 = 0
 {
   FileAppend,  %4_Space%□ Non-measureable, c:\temp\test.txt
}
if L3 = 1
 {
   FileAppend,  %2_Space%■ Measurable: __%L4%__ cm (length or largest diameter)`n, c:\temp\test.txt
}
  if L3 = 0
 {
   FileAppend,  %2_Space%□ Measurable: __%L4%__ cm (length or largest diameter)`n,  c:\temp\test.txt
}
 FileAppend,   %2_Space% `n, c:\temp\test.txt    ; 輸入空白行幫助排版

;--------------第二段-----------------------------------------------
FileAppend,  2. %1_Space%Tumor invasion  , c:\temp\test.txt  

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
   FileAppend,  %4_Space%Cervical carcinoma confined to the uterus: `n, c:\temp\test.txt

if T3= 1
 {
   FileAppend,  %4_Space%%4_Space%■ T1b1: Tumor <= 2 cm. `n, c:\temp\test.txt
}
  if T3= 0
 {
   FileAppend,  %4_Space%%4_Space%□ T1b1: Tumor <= 2 cm.  `n, c:\temp\test.txt
}
if T4= 1
 {
   FileAppend,  
(
%4_Space%%4_Space%■ T1b2: Tumor >2, but <= 4 cm.
 )`n, c:\temp\test.txt
}
  if T4= 0
 {
   FileAppend,  
(
%4_Space%%4_Space%□ T1b2: Tumor >2, but <= 4 cm.
) `n, c:\temp\test.txt
}
if T5= 1
 {
   FileAppend,  %4_Space%%4_Space%■ T1b3: Tumor > 4 cm.  `n, c:\temp\test.txt
}
  if T5= 0
 {
   FileAppend,  %4_Space%%4_Space%□ T1b3: Tumor > 4 cm.  `n, c:\temp\test.txt
}
   FileAppend,  %4_Space%Vaginal invasion `n, c:\temp\test.txt

if T6= 1
 {
   FileAppend, 
(
%4_Space%%4_Space%■ T2a1: <= 4 cm, upper 2/3. 
)`n , c:\temp\test.txt
}
  if T6= 0
 {
   FileAppend,  
(
%4_Space%%4_Space%□ T2a1: <= 4 cm, upper 2/3. 
)`n , c:\temp\test.txt
}
if T7= 1
 {
   FileAppend, 
(
%4_Space%%4_Space%■ T2a2: > 4 cm, upper 2/3.
)`n , c:\temp\test.txt
}
  if T7= 0
 {
   FileAppend,  
(
%4_Space%%4_Space%□ T2a2: > 4 cm, upper 2/3. 
)`n , c:\temp\test.txt
}
if T8= 1
 {
   FileAppend, 
(
%4_Space%%4_Space%■  T3a: Lower 1/3.
)`n , c:\temp\test.txt
}
  if T8= 0
 {
   FileAppend,  
(
%4_Space%%4_Space%□ T3a: Lower 1/3. 
)`n , c:\temp\test.txt
}
if T9= 1
 {
   FileAppend,  %4_Space%■ T2b: Parametrial invasion:, c:\temp\test.txt
}
  if T9= 0
 {
   FileAppend,  %4_Space%□ T2b: Parametrial invasion:, c:\temp\test.txt
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
   FileAppend,  %4_Space%■ T3b: Pelvic side wall or floor.`n, c:\temp\test.txt
}
  if T12= 0
 {
   FileAppend,  %4_Space%□ T3b: Pelvic side wall or floor.`n, c:\temp\test.txt
}
if T13= 1
 {
   FileAppend,  %4_Space%■ T3b: Tumor related hydronephrosis/Hydroureter , c:\temp\test.txt
}
  if T13= 0
 {
   FileAppend,  %4_Space%□ T3b: Tumor related hydronephrosis/Hydroureter , c:\temp\test.txt
}
if T14= 1
 {
   FileAppend, %2_Space%■ Right, c:\temp\test.txt
}
  if T14= 0
 {
   FileAppend,  %2_Space%□ Right, c:\temp\test.txt
}
if T15= 1
 {
   FileAppend, %2_Space%■ Left `n, c:\temp\test.txt
}
  if T15= 0
 {
   FileAppend,  %2_Space%□ Left `n, c:\temp\test.txt
}
if T16= 1
 {
   FileAppend,  %4_Space%■ T4: Pelvic organs invasion.`n, c:\temp\test.txt
}
  if T16= 0
 {   
FileAppend,  %4_Space%□ T4: Pelvic organs invasion.`n, c:\temp\test.txt
}
if T17= 1
 {
   FileAppend,  %4_Space%%4_Space%■ Bladder, c:\temp\test.txt
}
  if T17= 0
 {
   FileAppend,  %4_Space%%4_Space%□ Bladder, c:\temp\test.txt
}
if T18= 1
 {
   FileAppend,  %2_Space%■ Rectum, c:\temp\test.txt
}
  if T18= 0
 {   
FileAppend,  %2_Space%□ Rectum, c:\temp\test.txt
}
if T19= 1
 {
   FileAppend,  %2_Space%■ Sigmoid colon`n, c:\temp\test.txt
}
  if T19= 0
 {   
FileAppend,  %2_Space%□ Sigmoid colon`n, c:\temp\test.txt
}
if T20= 1
 {
   FileAppend,  %4_Space%%4_Space%■ Others: __%T21%__`n, c:\temp\test.txt
}
  if T20= 0
 {   
FileAppend,  %4_Space%%4_Space%□ Others: __%T21%__`n, c:\temp\test.txt
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
   FileAppend,  %4_Space%■ No or Equivocal `n, c:\temp\test.txt
}
  if No= 0
 {
   FileAppend,  %4_Space%□ No or Equivocal `n, c:\temp\test.txt
}
if E1= 1
 {
   FileAppend,  %4_Space%■ Yes  `n, c:\temp\test.txt
}
  if E1= 0
 {
   FileAppend,  %4_Space%□ Yes  `n, c:\temp\test.txt
}
if E2= 1
 {
   FileAppend,  %4_Space%%4_Space%■  N1: Pelvic LN `n, c:\temp\test.txt
}
  if E2= 0
 {
   FileAppend, %4_Space%%4_Space%□  N1: Pelvic LN `n, c:\temp\test.txt
}
if E3= 1
 {
   FileAppend,  %4_Space%%4_Space%■  N2: Para-aortic LN `n, c:\temp\test.txt
}
  if E3= 0
 {
   FileAppend, %4_Space%%4_Space%□  N2: Para-aortic LN `n, c:\temp\test.txt
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
   FileAppend,  %4_Space%%4_Space%■  Non-regional lymph nodes `n, c:\temp\test.txt
}
  if DM2= 0
 {
   FileAppend, %4_Space%%4_Space%□  Non-regional lymph nodes `n, c:\temp\test.txt
}
if DM3= 1
 {
   FileAppend,  %4_Space%%4_Space%%4_Space%■  Left Inguinal nodes, c:\temp\test.txt
}
  if DM3 = 0
 {
   FileAppend, %4_Space%%4_Space%%4_Space%□  Left Inguinal nodes, c:\temp\test.txt
}
if DM4= 1
 {
   FileAppend,  %2_Space%■ Right inguinal nodes , c:\temp\test.txt
}
  if DM4= 0
 {
   FileAppend,  %2_Space%□ Right inguinal nodes, c:\temp\test.txt
}
if DM5= 1
 {
   FileAppend,  %2_Space%■ Others:__%DM6%__ `n , c:\temp\test.txt
}
  if DM5= 0
 {
   FileAppend,  %2_Space%□ Others:__%DM6%__ `n , c:\temp\test.txt
}
if DM7= 1
 {
   FileAppend,  %4_Space%%4_Space%■ Peritoneum`n, c:\temp\test.txt
}
  if DM7= 0
 {
   FileAppend,  %4_Space%%4_Space%□ Peritoneum`n, c:\temp\test.txt
}
if DM8= 1
 {
   FileAppend,  %4_Space%%4_Space%■ Bone `n, c:\temp\test.txt
}
  if DM8= 0
 {
   FileAppend,  %4_Space%%4_Space%□ Bone `n, c:\temp\test.txt
}
if DM9= 1
 {
   FileAppend,  %4_Space%%4_Space%■ Liver `n, c:\temp\test.txt
}
  if DM9= 0
 {
   FileAppend,  %4_Space%%4_Space%□ Liver `n, c:\temp\test.txt
}
if DM10= 1
 {
   FileAppend,  %4_Space%%4_Space%■ Lung `n, c:\temp\test.txt
}
  if DM10= 0
 {
   FileAppend,  %4_Space%%4_Space%□ Lung `n, c:\temp\test.txt
}
if DM11= 1
 {
   FileAppend,  %4_Space%%4_Space%■ Others: __%DM12%__`n, c:\temp\test.txt
}
  if DM11= 0
 {
   FileAppend,  %4_Space%%4_Space%□ Others: __%DM12%__`n, c:\temp\test.txt
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
