; Cholangiocarcinoma Imaging Report Generator
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

; ---------------Tumor Size---------------
Gui, Font, s12 bold, Arial   ; 改大改粗體
Gui, Add, Text, y15 x20, 1. Tumor Size
Gui, Font ; 重置字體設置(不加這個 粗體改不回來)
Gui, Font, s10, Arial   ; 恢復
Gui, Add, Text, y15 x132, (
Gui, Add, Checkbox, vL1 y15 x138, Not assessable)
Gui, Add, Checkbox, vL2 y35 x40, Non-measureable
Gui, Add, Checkbox, vL3 y60 x40, Measurable:
Gui, Add, edit, vL4 y55 x133 w60
Gui, Add, Text, y60 x197, cm (greatest diameter) 

; ---------------Tumor Invasion---------------
 Gui, Font, s12 bold, Arial   ; 改大改粗體
 Gui, Add, Text, y90 x20, 2. Tumor invasion
 Gui, Font ; 重置字體設置(不加這個 粗體改不回來)
 Gui, Font, s10, Arial   ; 恢復
 Gui, Add, Text, y90 x161, (
 Gui, Add, Checkbox, vT1 y90 x168, Not assessable)
 Gui, Add, Checkbox, vI1 y110 x40, Intrahepatic duct (peripheral to the 2nd order bile ducts)
 Gui, Add, Text, y135 x60, Location:
 Gui, Add, edit, vI2 y130 x118 w100
 Gui, Add, Checkbox, vI3 y155 x60, TX: Primary tumor cannot be assessed.
Gui, Add, Checkbox, vI4 y175 x60, T0: No evidence of primary tumor.
Gui, Add, Checkbox, vI5 y195 x60, T1a: Solitary tumor <= 5 cm without vascular invasion.
Gui, Add, Checkbox, vI6 y215 x60, T1b: Solitary tumor > 5 cm without vascular invasion.
Gui, Add, Checkbox, vI7 y235 x60, T2: Solitary tumor with intrahepatic vascular invasion.
Gui, Add, Checkbox, vI8 y255 x60, T2: Multiple tumors, with or without tumor vascular invasion.
Gui, Add, Checkbox, vI9 y275 x60, T3: Tumor perforates the visceral peritoneum.
Gui, Add, Checkbox, vI10 y295 x60, T4: Directly invades local adjacent extrahepatic structures.

Gui, Add, Checkbox, vP1 y320 x40, Perihilar extrahepatic duct (extrahepatic duct to cystic duct origin)
 Gui, Add, Text, y345 x60, Location:
 Gui, Add, edit, vP2 y340 x118 w100
 Gui, Add, Checkbox, vP3 y365 x60, TX: Primary tumor cannot be assessed.
Gui, Add, Checkbox, vP4 y385 x60, T0: No evidence of primary tumor.
Gui, Add, Checkbox, vP5 y405 x60, T1: Tumor confines in the bile duct.
Gui, Add, Text, y425 x60, Tumor invades: 
Gui, Add, Checkbox, vP6 y445 x60, T2a: Surrounding periductal adipose tissue.
Gui, Add, Checkbox, vP7 y465 x60, T2b: Adjacent hepatic parenchyma.
Gui, Add, Checkbox, vP8 y485 x60, T3: Unilateral branches of the portal vein or hepatic artery.
Gui, Add, Checkbox, vP9 y505 x60, T4: Main portal vein or portal branches bilaterally.
Gui, Add, Checkbox, vP10 y525 x60, T4: Common hepatic artery
Gui, Add, Checkbox, vP11 y545 x60, T4: 2nd order branch bile duct bilaterally
Gui, Add, Checkbox, vP12 y565 x60, T4: Unilateral 2nd order branch bile duct and contralateral portal vein or hepatic artery

Gui, Add, Checkbox, vD1 y585 x40, Distal extrahepatic duct (between Ampulla of Vater and cystic duct origin)
Gui, Add, Checkbox, vD3 y605 x60, TX: Primary tumor cannot be assessed.
Gui, Add, Checkbox, vD4 y625 x60, T0: No evidence of primary tumor.
Gui, Add, Text, y650 x60,  Tumor invades the bile duct wall with a depth:
 Gui, Add, edit, vD5 y645 x325 w50
Gui, Add, Text, y650 x378, mm
Gui, Add, Text, y670 x60, (Invasion depth. T1: <5mm`;`  5mm<T2 <=12mm`;` T3 >12mm)
Gui, Add, Text, y690 x60, Tumor invades
Gui, Add, Checkbox, vD6 y710 x80, T4: Celiac trunk
Gui, Add, Checkbox, vD7 y710 x195, T4: SMA
Gui, Add, Checkbox, vD8 y710 x273, T4: Common hepatic artery. 
Gui, Add, Checkbox, vD9 y735 x80, Other adjacent organ: 
Gui, Add, edit, vD10 y730 x225 w150

; ---------------Regional nodal metastasis---------------
  Gui, Font, s12 bold, Arial   ; 改大改粗體
 Gui, Add, Text, y765 x20, 3. Regional nodal metastasis
  Gui, Font ; 重置字體設置(不加這個 粗體改不回來)
  Gui, Font, s10, Arial   ; 恢復
 Gui, Add, Text, y765 x245, (
   Gui, Add, Checkbox, vNot y765 x253, Not assessable)
 Gui, Add, Checkbox, vNo y785 x40, No 
  Gui, Add, Checkbox, vYes y805 x40, Yes. If yes:
Gui, Add, text, y830 x60, Number:  
 Gui, Add, edit, vN1 y825 x120 w60
Gui, Add, text,  y855 x60, Location: 
 Gui, Add, edit, vN2 y850 x120 w250
Gui, Add, text,  y875 x60, *Intrahepatic duct- N1: >1
Gui, Add, text,  y895 x60, *Extrahepatic duct- 
Gui, Add, text,  y915 x80,  N1: 1 - 3 positive LN typically involving the hilar, cystic duct, CBD, 
Gui, Add, text,  y935 x110,  hepatic artery, posterior pancreatoduodenal, and portal vein LNs.
Gui, Add, text,  y955 x80, N2: >= 4 lymph nodes 


; ---------------Distant Metastasis---------------
   Gui, Font, s12 bold, Arial   ; 改大改粗體
  Gui, Add, Text, y985 x20, 4. Distant metastasis
  Gui, Font ; 重置字體設置(不加這個 粗體改不回來)
  Gui, Font, s10, Arial   ; 恢復
   Gui, Add, Text, y985 x165, (in this study)
  Gui, Add, Checkbox, vDM0 y1005 x40, No or Equivocal
  Gui, Add, Checkbox, vDM1 y1030 x40, Yes, location:
 Gui, Add, Edit, vDM2 y1025 x142 w250
 
; ---------------Other Findings---------------
  Gui, Font, s12 bold, Arial   ; 改大改粗體
  Gui, Add, Text, y1055 x20, 5. Other findings
  Gui, Font ; 重置字體設置(不加這個 粗體改不回來)
  Gui, Font, s10, Arial   ; 恢復
  Gui, Add, Edit, vOF0 y1075 x40 w500

; Buttons
 Gui, Font, s12 bold, Arial   ; 改大改粗體
  Gui, Add, Button, Default gGenerateReport y1110 x20, Generate Report
  Gui, Add, Button, gExit y1110 x170, Exit

; Show GUI
Gui, Show, x591 y76 w615 h1150, Cholangiocarcinoma Imaging Report Generator
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
    FileAppend, MCH Imaging Report for Cholangiocarcinoma (AJCC 8th) `n, c:\temp\test.txt
    FileAppend,    `n, c:\temp\test.txt    ; 輸入空白行幫助排版
    FileAppend, *本表單僅依據單次影像進行分期供腫瘤團隊參考，並不代表病人的臨床分期，臨床分期需綜合病人臨床發現、各種影像(包括各種內視鏡及超音波檢查)及病理表現來進行判斷，病人的最終臨床分期可能因癌症團隊討論有所異動，敬請參閱病歷首頁。 `n, c:\temp\test.txt
    FileAppend,   %2_Space% `n, c:\temp\test.txt    ; 輸入空白行幫助排版
;-------------------------------------------------------------
    
;--------------第一段-----------------------------------------------
FileAppend,  1. %1_Space%Tumor location , c:\temp\test.txt  
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
   FileAppend,  %4_Space%■ Non-measureable `n, c:\temp\test.txt
}
  if L2 = 0
 {
   FileAppend,  %4_Space%□ Non-measureable `n, c:\temp\test.txt
}
if L3 = 1
 {
   FileAppend,  %4_Space%■ Measurable: __%L4%__cm (greatest diameter)  `n, c:\temp\test.txt
}
  if L3 = 0
 {
   FileAppend,  %4_Space%□ Measurable: __%L4%__cm (greatest diameter)  `n,  c:\temp\test.txt
}
   
; FileAppend,   %2_Space% `n, c:\temp\test.txt    ; 輸入空白行幫助排版
;--------------第二段-----------------------------------------------
FileAppend,  2. %1_Space%Tumor invasion  , c:\temp\test.txt  

if T1= 1
 {
   FileAppend,  %4_Space%( ■ Not assessable )`n, c:\temp\test.txt
}
  if T1= 0
 {
   FileAppend,  %4_Space%( □ Not assessable )`n, c:\temp\test.txt
}

if I1= 1
 {  ; l1的括號頭
   FileAppend,  %4_Space%■ Intrahepatic duct (peripheral to the 2nd order bile ducts) `n, c:\temp\test.txt
FileAppend,  %4_Space%Location: __%I2%__ `n, c:\temp\test.txt
if I3= 1
 {
   FileAppend,  %4_Space%%4_Space%■ TX: Primary tumor cannot be assessed. `n, c:\temp\test.txt
}
  if I3= 0
 {
   FileAppend,  %4_Space%%4_Space%□ TX: Primary tumor cannot be assessed. `n, c:\temp\test.txt
}
if I4= 1
 {
   FileAppend,  %4_Space%%4_Space%■ T0: No evidence of primary tumor. `n, c:\temp\test.txt
}
  if I4= 0
 {
   FileAppend,  %4_Space%%4_Space%□ T0: No evidence of primary tumor. `n, c:\temp\test.txt
}
if I5= 1
 {
   FileAppend,  %4_Space%%4_Space%■ T1a: Solitary tumor <= 5 cm without vascular invasion. `n, c:\temp\test.txt
}
  if I5= 0
 {
   FileAppend,  %4_Space%%4_Space%□ T1a: Solitary tumor <= 5 cm without vascular invasion. `n, c:\temp\test.txt
}
if I6= 1
 {
   FileAppend,  %4_Space%%4_Space%■ T1b: Solitary tumor > 5 cm without vascular invasion. `n, c:\temp\test.txt
}
  if I6= 0
 {
   FileAppend,  %4_Space%%4_Space%□ T1b: Solitary tumor > 5 cm without vascular invasion. `n, c:\temp\test.txt
}
if I7= 1
 {
   FileAppend,  %4_Space%%4_Space%■ T2: Solitary tumor with intrahepatic vascular invasion. `n, c:\temp\test.txt
}
  if I7= 0
 {
   FileAppend,  %4_Space%%4_Space%□ T2: Solitary tumor with intrahepatic vascular invasion. `n, c:\temp\test.txt
}
if I8= 1
 {
   FileAppend,  %4_Space%%4_Space%■ T2: Multiple tumors`,` with or without tumor vascular invasion. `n, c:\temp\test.txt
}
  if I8= 0
 {
   FileAppend,  %4_Space%%4_Space%□ T2: Multiple tumors`,` with or without tumor vascular invasion. `n, c:\temp\test.txt
}
if I9= 1
 {
   FileAppend,  %4_Space%%4_Space%■ T3: Tumor perforates the visceral peritoneum. `n, c:\temp\test.txt
}
  if I9= 0
 {
   FileAppend,  %4_Space%%4_Space%□ T3: Tumor perforates the visceral peritoneum. `n, c:\temp\test.txt
}
if I10= 1
 {
   FileAppend,  %4_Space%%4_Space%■ T4: Directly invades local adjacent extrahepatic structures. `n, c:\temp\test.txt
}
  if I10= 0
 {
   FileAppend,  %4_Space%%4_Space%□ T4: Directly invades local adjacent extrahepatic structures. `n, c:\temp\test.txt
}
} ; I1的括號結尾


if P1= 1
 {  ; P1的括號頭
   FileAppend,  %4_Space%■ Perihilar extrahepatic duct (extrahepatic duct to cystic duct origin) `n, c:\temp\test.txt
FileAppend,  %4_Space%Location: __%P2%__ `n, c:\temp\test.txt
if P3= 1
 {
   FileAppend,  %4_Space%%4_Space%■ TX: Primary tumor cannot be assessed. `n, c:\temp\test.txt
}
  if P3= 0
 {
   FileAppend,  %4_Space%%4_Space%□ TX: Primary tumor cannot be assessed. `n, c:\temp\test.txt
}
if P4= 1
 {
   FileAppend,  %4_Space%%4_Space%■ T0: No evidence of primary tumor. `n, c:\temp\test.txt
}
  if P4= 0
 {
   FileAppend,  %4_Space%%4_Space%□ T0: No evidence of primary tumor. `n, c:\temp\test.txt
}
if P5= 1
 {
   FileAppend,  %4_Space%%4_Space%■ T1: Tumor confines in the bile duct. `n, c:\temp\test.txt
}
  if P5= 0
 {
   FileAppend,  %4_Space%%4_Space%□ T1: Tumor confines in the bile duct. `n, c:\temp\test.txt
}
   FileAppend,  %4_Space%%4_Space%Tumor invades:  `n, c:\temp\test.txt
if P6= 1
 {
   FileAppend,  %4_Space%%4_Space%■ T2a: Surrounding periductal adipose tissue. `n, c:\temp\test.txt
}
  if P6= 0
 {
   FileAppend,  %4_Space%%4_Space%□ T2a: Surrounding periductal adipose tissue. `n, c:\temp\test.txt
}
if P7= 1
 {
   FileAppend,  %4_Space%%4_Space%■ T2b: Adjacent hepatic parenchyma. `n, c:\temp\test.txt
}
  if P7= 0
 {
   FileAppend,  %4_Space%%4_Space%□ T2b: Adjacent hepatic parenchyma.. `n, c:\temp\test.txt
}
if P8= 1
 {
   FileAppend,  %4_Space%%4_Space%■ T3: Unilateral branches of the portal vein or hepatic artery. `n, c:\temp\test.txt
}
  if P8= 0
 {
   FileAppend,  %4_Space%%4_Space%□ T3: Unilateral branches of the portal vein or hepatic artery. `n, c:\temp\test.txt
}
if P9= 1
 {
   FileAppend,  %4_Space%%4_Space%■ T4: Main portal vein or portal branches bilaterally. `n, c:\temp\test.txt
}
  if P9= 0
 {
   FileAppend,  %4_Space%%4_Space%□ T4: Main portal vein or portal branches bilaterally. `n, c:\temp\test.txt
}
if P10= 1
 {
   FileAppend,  %4_Space%%4_Space%■ T4: Common hepatic artery `n, c:\temp\test.txt
}
  if P10= 0
 {
   FileAppend,  %4_Space%%4_Space%□ T4: Common hepatic artery `n, c:\temp\test.txt
}
if P11= 1
 {
   FileAppend,  %4_Space%%4_Space%■ T4: 2nd order branch bile duct bilaterally `n, c:\temp\test.txt
}
  if P11= 0
 {
   FileAppend,  %4_Space%%4_Space%□ T4: 2nd order branch bile duct bilaterally `n, c:\temp\test.txt
}
if P12= 1
 {
   FileAppend,  %4_Space%%4_Space%■ T4: Unilateral 2nd order branch bile duct and contralateral portal vein or hepatic artery `n, c:\temp\test.txt
}
  if P12= 0
 {
   FileAppend,  %4_Space%%4_Space%□ T4: Unilateral 2nd order branch bile duct and contralateral portal vein or hepatic artery `n, c:\temp\test.txt
}
} ; P1的括號結尾

if D1= 1
 {  ; D1的括號頭
   FileAppend,  %4_Space%■ Distal extrahepatic duct (between Ampulla of Vater and cystic duct origin) `n, c:\temp\test.txt
if D3= 1
 {
   FileAppend,  %4_Space%%4_Space%■ TX: Primary tumor cannot be assessed. `n, c:\temp\test.txt
}
  if D3= 0
 {
   FileAppend,  %4_Space%%4_Space%□ TX: Primary tumor cannot be assessed. `n, c:\temp\test.txt
}
if D4= 1
 {
   FileAppend,  %4_Space%%4_Space%■ T0: No evidence of primary tumor. `n, c:\temp\test.txt
}
  if D4= 0
 {
   FileAppend,  %4_Space%%4_Space%□ T0: No evidence of primary tumor. `n, c:\temp\test.txt
}

   FileAppend,  %4_Space%%4_Space%Tumor invades the bile duct wall with a depth: __%D5%__mm `n, c:\temp\test.txt
   FileAppend,  %4_Space%%4_Space% (Invasion depth. T1: <5mm`;`  5mm<T2 <=12mm`;` T3 >12mm) `n, c:\temp\test.txt
  FileAppend,  %4_Space%%4_Space%Tumor invades`n, c:\temp\test.txt
if D6= 1
 {
   FileAppend,  %4_Space%%4_Space%%4_Space%■  T4: Celiac trunk , c:\temp\test.txt
}
  if D6= 0
 {
   FileAppend,  %4_Space%%4_Space%%4_Space%□ T4: Celiac trunk , c:\temp\test.txt
}
if D7= 1
 {
   FileAppend,  %2_Space%■ T4: SMA , c:\temp\test.txt
}
  if D7= 0
 {
   FileAppend,  %2_Space%□ T4: SMA  , c:\temp\test.txt
}
if D8= 1
 {
   FileAppend,  %2_Space%■ T4: Common hepatic artery.   `n, c:\temp\test.txt
}
  if D8= 0
 {
   FileAppend,  %2_Space%□ T4: Common hepatic artery. `n, c:\temp\test.txt
}
if D9= 1
 {
   FileAppend,  %4_Space%%4_Space%%4_Space%■ Other adjacent organ: __%D10%__ `n, c:\temp\test.txt
}
  if D9= 0
 {
   FileAppend,  %4_Space%%4_Space%%4_Space%□ Other adjacent organ: __%D10%__  `n, c:\temp\test.txt
}
} ; D1的括號結尾



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
   FileAppend,  %4_Space%■ No`n, c:\temp\test.txt
}
  if No= 0
 {
   FileAppend,  %4_Space%□ No`n, c:\temp\test.txt
}
if Yes= 1
 {
   FileAppend,  
(
%4_Space%■ Yes. If yes:
)`n, c:\temp\test.txt
}
  if Yes= 0
 {
   FileAppend,  
(
%4_Space%□ Yes. If yes:
)`n, c:\temp\test.txt
}
FileAppend,  %4_Space%%4_Space%Number: __%N1%__ `n, c:\temp\test.txt
FileAppend,  %4_Space%%4_Space%Location: __%N2%__ `n, c:\temp\test.txt

if I1= 1
 {  ; l1的括號頭
FileAppend,  %4_Space%%4_Space%*Intrahepatic duct- N1: >1`n, c:\temp\test.txt
} ; l1的括號結尾

if P1= 1
 {  ; P1的括號頭
FileAppend,  %4_Space%%4_Space%*Extrahepatic duct-`n, c:\temp\test.txt
FileAppend,  %4_Space%%4_Space%%4_Space%N1: 1 - 3 positive LN typically involving the hilar`,` cystic duct`,` CBD`,` `n, c:\temp\test.txt
FileAppend,  %4_Space%%4_Space%%4_Space%%4_Space%%2_Space% hepatic artery`,` posterior pancreatoduodenal`,` and portal vein LNs.`n, c:\temp\test.txt
FileAppend,  %4_Space%%4_Space%%4_Space%N2: >= 4 lymph nodes  `n, c:\temp\test.txt
} ; P1的括號結尾

if D1= 1
 {  ; D1的括號頭
FileAppend,  %4_Space%%4_Space%*Extrahepatic duct-`n, c:\temp\test.txt
FileAppend,  %4_Space%%4_Space%%4_Space%N1: 1 - 3 positive LN typically involving the hilar`,` cystic duct`,` CBD`,` `n, c:\temp\test.txt
FileAppend,  %4_Space%%4_Space%%4_Space%%4_Space%%2_Space% hepatic artery`,` posterior pancreatoduodenal`,` and portal vein LNs.`n, c:\temp\test.txt
FileAppend,  %4_Space%%4_Space%%4_Space%N2: >= 4 lymph nodes  `n, c:\temp\test.txt
}  ; D1的括號結尾

FileAppend,   %2_Space% `n, c:\temp\test.txt    ; 輸入空白行幫助排版

;--------------第四段-----------------------------------------------

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
%4_Space%■ Yes, location:__%DM2%__
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
