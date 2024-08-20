; Nasopharyngeal Carcinoma Imaging Report Generator
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
Gui, Add, Checkbox, vL5 y55 x202, Bilateral
 Gui, Add, Text, y80 x40, Size: 
 Gui, Add, Checkbox, vL6 y80 x80, Non-measurable
 Gui, Add, Checkbox, vL7 y80 x205, Measurable: 
 Gui, Add, Edit, vL8 y75 x300 w40
 Gui, Add, Text, y80 x348, cm(largest diameter)

; ---------------Tumor Invastion---------------
 Gui, Font, s12 bold, Arial   ; 改大改粗體
 Gui, Add, Text, y110 x20, 2. Tumor invasion
 Gui, Font ; 重置字體設置(不加這個 粗體改不回來)
 Gui, Font, s10, Arial   ; 恢復
 Gui, Add, Text, y110 x161, (
 Gui, Add, Checkbox, vT1 y110 x168, Not assessable)
 Gui, Add, Checkbox, vT2 y130 x40, T0: No tumor identified, but EBV-positive cervical node(s) involvement.
 Gui, Add, Checkbox, vT3 y150 x40, T1:
 Gui, Add, Checkbox, vT4 y150 x80, Oropharynx
Gui, Add, Checkbox, vT5 y150 x175, Nasal cavity
Gui, Add, Checkbox, vT6 y150 x270, Nasopharynx
Gui, Add, Checkbox, vT7 y170 x40, T2:
 Gui, Add, Checkbox, vT8 y170 x80, Parapharyngeal space
Gui, Add, Checkbox, vT9 y170 x240, Medial pterygoid  
Gui, Add, Checkbox, vT10 y190 x80, Lateral pterygoid
Gui, Add, Checkbox, vT11 y190 x240, Prevertebral muscles
Gui, Add, Checkbox, vT12 y210 x40, T3:
 Gui, Add, Checkbox, vT13 y210 x80, Skull base bone invasion
Gui, Add, Checkbox, vT14 y210 x247, Cervical vertebral  
 Gui, Add, Checkbox, vT15 y210 x370, Pterygoid structure
Gui, Add, Checkbox, vT16 y230 x80, Para-nasal sinus: (
Gui, Add, Checkbox, vT17 y230 x220, Ethmoid sinus
Gui, Add, Checkbox, vT18 y230 x340, Maxillary sinus 
Gui, Add, Checkbox, vT19 y250 x220, Frontal sinus
Gui, Add, Checkbox, vT20 y250 x340, Sphenoid sinus )
Gui, Add, Checkbox, vT21 y270 x40, T4:
Gui, Add, Checkbox, vT22 y270 x80, Intracranial
Gui, Add, Checkbox, vT23 y270 x172, Cranial nerves
Gui, Add, Checkbox, vT24 y270 x280, Hypopharynx
Gui, Add, Checkbox, vT25 y270 x380, Orbit 
Gui, Add, Checkbox, vT26 y270 x435, Parotid gland
Gui, Add, Checkbox, vT27 y290 x80, Infiltration beyond the lateral surface of the lateral pterygoid muscle
Gui, Add, Checkbox, vT28 y315 x80, Others: 
 Gui, Add, Edit, vT29 y310 x147 w200

; ---------------Regional nodal metastasis---------------
  Gui, Font, s12 bold, Arial   ; 改大改粗體
  Gui, Add, Text, y345 x20, 3. Regional nodal metastasis
  Gui, Font ; 重置字體設置(不加這個 粗體改不回來)
  Gui, Font, s10, Arial   ; 恢復
 Gui, Add, Text, y345 x245, (
  Gui, Add, Checkbox, vNot y345 x253, Not assessable)
 Gui, Add, Checkbox, vNo y365 x40, No regional nodal metastasis.
 Gui, Add, Checkbox, vYes y385 x40, Yes. If yes, involved lymph nodes:
 Gui, Add, Checkbox, vY1 y405 x60, N1: Unilateral cervical LN(S), <= 6 cm in greatest dimension, above CBCC.
 Gui, Add, Checkbox, vY2 y425 x60, N1: Uni-/Bi-lateral retropharyngeal LN(S), <= 6 cm in greatest dimension, above CBCC.
 Gui, Add, Checkbox, vY3 y445 x60, N2: Bilateral cervical LN(S), <= 6 cm in greatest dimension, above CBCC.
Gui, Add, Checkbox, vY4 y465 x60, N3: Uni-/Bi-lateral cervical LN(S), > 6 cm in greatest dimension, and/or extension CBCC
Gui, Add, Text, y485 x60,   *CBCC: Caudal border of cricoid cartilage.
  Gui, Add, Text, y510 x60, Maximal size of the largest positive node: 
 Gui, Add, Edit, vY7 y505 x308 w60
  Gui, Add, Text, y510 x369, mm (long axis)
Gui, Add, Text, y530 x60, Location: Left level:
 Gui, Add, Checkbox, vY8 y530 x180, I
 Gui, Add, Checkbox, vY9 y530 x220, II
 Gui, Add, Checkbox, vY10 y530 x260, III
 Gui, Add, Checkbox, vY11 y530 x300, IV
 Gui, Add, Checkbox, vY12 y530 x340, V
 Gui, Add, Checkbox, vY13 y530 x380, VI
 Gui, Add, Checkbox, vY14 y530 x420, VII
Gui, Add, Text, y550 x108, Right level:
 Gui, Add, Checkbox, vY15 y550 x180, I
 Gui, Add, Checkbox, vY16 y550 x220, II
 Gui, Add, Checkbox, vY17 y550 x260, III
 Gui, Add, Checkbox, vY18 y550 x300, IV
 Gui, Add, Checkbox, vY19 y550 x340, V
 Gui, Add, Checkbox, vY20 y550 x380, VI
 Gui, Add, Checkbox, vY21 y550 x420, VII
 Gui, Add, Text, y575 x108, Others: 
 Gui, Add, Edit, vY22 y570 x165 w200

; ---------------Distant Metastasis---------------
   Gui, Font, s12 bold, Arial   ; 改大改粗體
  Gui, Add, Text, y605 x20, 4. Distant metastasis
  Gui, Font ; 重置字體設置(不加這個 粗體改不回來)
  Gui, Font, s10, Arial   ; 恢復
  Gui, Add, Text, y605 x165, (in this study)
  Gui, Add, Checkbox, vDM0 y625 x40, No
 Gui, Add, Checkbox, vDM1 y650 x40, Equivocal, location: 
 Gui, Add, Edit, vDM2 y645 x174 w250
 Gui, Add, Checkbox, vDM3 y675 x40, Yes, location:
Gui, Add, Edit, vDM4 y670 x142 w250
 
; ---------------Other Findings---------------
 Gui, Font, s12 bold, Arial   ; 改大改粗體
 Gui, Add, Text, y705 x20, 5. Other findings
 Gui, Font ; 重置字體設置(不加這個 粗體改不回來)
 Gui, Font, s10, Arial   ; 恢復
 Gui, Add, Edit, vOF0 y725 x40 w500

; Buttons
 Gui, Font, s12 bold, Arial   ; 改大改粗體
 Gui, Add, Button, Default gGenerateReport y770 x20, Generate Report
 Gui, Add, Button, gExit y770 x170, Exit

; Show GUI
Gui, Show,  w615 h820, Nasopharyngeal Carcinoma Imaging Report Generator
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
    FileAppend, MCH Imaging Report for Nasopharyngeal Carcinoma (AJCC 8th)`n, c:\temp\test.txt
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
   FileAppend,  %4_Space%■ No evidence of primary tumor. `n, c:\temp\test.txt
}
  if L2 = 0
 {
   FileAppend,  %4_Space%□ No evidence of primary tumor. `n, c:\temp\test.txt
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
   FileAppend,  %2_Space%■ Right, c:\temp\test.txt
}
  if L4 = 0
 {
   FileAppend,  %2_Space%□ Right,  c:\temp\test.txt
}
if L5 = 1
 {
   FileAppend,  %2_Space%■ Bilateral `n , c:\temp\test.txt
}
  if L5 = 0
 {
   FileAppend,  %2_Space%□ Bilateral `n ,  c:\temp\test.txt
}
FileAppend,  %4_Space%Size: , c:\temp\test.txt
if L6 = 1
 {
   FileAppend,  %2_Space%■ Non-measurable, c:\temp\test.txt
}
  if L6 = 0
 {
   FileAppend,  %2_Space%□ Non-measurable,  c:\temp\test.txt
}
if L7 = 1
 {
   FileAppend,  %2_Space%■ Measurable: __%L8%__cm(largest diameter)`n, c:\temp\test.txt
}
  if L7 = 0
 {
   FileAppend,  %2_Space%□ Measurable: __%L8%__cm(largest diameter) `n,  c:\temp\test.txt
}   
 FileAppend,   %2_Space% `n, c:\temp\test.txt    ; 輸入空白行幫助排版
;--------------第三段-----------------------------------------------
FileAppend,  2. %1_Space%Tumor invasion  , c:\temp\test.txt  

if T1= 1
 {
   FileAppend,  %2_Space%■ Not assessable`n, c:\temp\test.txt
}
  if T1= 0
 {
   FileAppend,  %2_Space%□ Not assessable`n, c:\temp\test.txt
}
if T2= 1
 {
   FileAppend,  %4_Space%■ T0: No tumor identified`,` but EBV-positive cervical node(s) involvement.`n, c:\temp\test.txt
}
  if T2= 0
 {
   FileAppend,  %4_Space%□ T0: No tumor identified`,` but EBV-positive cervical node(s) involvement.`n, c:\temp\test.txt
}
if T3= 1
 {
   FileAppend,  %4_Space%■ T1:, c:\temp\test.txt
}
  if T3= 0
 {
   FileAppend,  %4_Space%□ T1:, c:\temp\test.txt
}
if T4= 1
 {
   FileAppend,  %2_Space%■ Oropharynx, c:\temp\test.txt
}
  if T4= 0
 {
   FileAppend,  %2_Space%□ Oropharynx, c:\temp\test.txt
}
if T5= 1
 {
   FileAppend,  %2_Space%■ Nasal cavity, c:\temp\test.txt
}
  if T5= 0
 {
   FileAppend,  %2_Space%□ Nasal cavity, c:\temp\test.txt
}
if T6= 1
 {
   FileAppend,  %2_Space%■ Nasopharynx `n, c:\temp\test.txt
}
  if T6= 0
 {
   FileAppend,  %2_Space%□ Nasopharynx `n, c:\temp\test.txt
}
if T7= 1
 {
   FileAppend,  %4_Space%■ T2: , c:\temp\test.txt
}
  if T7= 0
 {
   FileAppend,  %4_Space%□ T2: , c:\temp\test.txt
}
if T8= 1
 {
   FileAppend,  %2_Space%■ Parapharyngeal space, c:\temp\test.txt
}
  if T8= 0
 {
   FileAppend,  %2_Space%□ Parapharyngeal space, c:\temp\test.txt
}
if T9= 1
 {
   FileAppend,  %2_Space%■ Medial pterygoid `n, c:\temp\test.txt
}
  if T9= 0
 {
   FileAppend,  %2_Space%□ Medial pterygoid `n, c:\temp\test.txt
}
if T10= 1
 {
   FileAppend,  %4_Space%%4_Space%%4_Space%%2_Space%■ Lateral pterygoid  , c:\temp\test.txt
}
  if T10= 0
 {
   FileAppend,  %4_Space%%4_Space%%4_Space%%2_Space%□ Lateral pterygoid , c:\temp\test.txt
}
if T11= 1
 {
   FileAppend,  %2_Space%■ Prevertebral muscles `n, c:\temp\test.txt
}
  if T11= 0
 {   
FileAppend, %2_Space%□ Prevertebral muscles `n, c:\temp\test.txt
}
if T12= 1
 {
   FileAppend,  %4_Space%■ T3:, c:\temp\test.txt
}
  if T12= 0
 {
   FileAppend,  %4_Space%□ T3:, c:\temp\test.txt
}
if T13= 1
 {
   FileAppend,  %2_Space%■ Skull base bone invasion , c:\temp\test.txt
}
  if T13= 0
 {
   FileAppend,  %2_Space%□ Skull base bone invasion , c:\temp\test.txt
}
if T14= 1
 {
   FileAppend, %2_Space%■ Cervical vertebral  , c:\temp\test.txt
}
  if T14= 0
 {
   FileAppend,  %2_Space%□ Cervical vertebral  , c:\temp\test.txt
}
if T15= 1
 {
   FileAppend, %2_Space%■ Pterygoid structure `n, c:\temp\test.txt
}
  if T15= 0
 {
   FileAppend,  %2_Space%□ Pterygoid structure `n , c:\temp\test.txt
}
if T16= 1
 {
   FileAppend, %4_Space%%4_Space%%4_Space%%2_Space%■  Para-nasal sinus: (, c:\temp\test.txt
}
  if T16= 0
 {
   FileAppend,  %4_Space%%4_Space%%4_Space%%2_Space%□  Para-nasal sinus: (, c:\temp\test.txt
}
if T17= 1
 {
   FileAppend,  %2_Space%■ Ethmoid sinus, c:\temp\test.txt
}
  if T17= 0
 {
   FileAppend,  %2_Space%□ Ethmoid sinus, c:\temp\test.txt
}
if T18= 1
 {
   FileAppend,  %2_Space%■ Maxillary sinus  `n, c:\temp\test.txt
}
  if T18= 0
 {
   FileAppend,  %2_Space%□ Maxillary sinus `n, c:\temp\test.txt
}
if T19= 1
 {
   FileAppend,  %4_Space%%4_Space%%4_Space%%4_Space%%4_Space%%4_Space%%4_Space%%4_Space%%4_Space%%4_Space%%4_Space%%4_Space%%4_Space%■ Frontal sinus, c:\temp\test.txt
}
  if T19= 0
 {
   FileAppend,  %4_Space%%4_Space%%4_Space%%4_Space%%4_Space%%4_Space%%4_Space%%4_Space%%4_Space%%4_Space%%4_Space%%4_Space%%4_Space%□ Frontal sinus, c:\temp\test.txt
}
if T20= 1
 {
   FileAppend,  %2_Space%■ Sphenoid sinus ) `n, c:\temp\test.txt
}
  if T20= 0
 {
   FileAppend,  %2_Space%□ Sphenoid sinus ) `n, c:\temp\test.txt
}
if T21= 1
 {
   FileAppend,  %4_Space%■ T4: , c:\temp\test.txt
}
  if T21= 0
 {
   FileAppend,  %4_Space%□ T4: , c:\temp\test.txt
}
if T22= 1
 {
   FileAppend,  %2_Space%■ Intracranial, c:\temp\test.txt
}
  if T22= 0
 {
   FileAppend,  %2_Space%□ Intracranial, c:\temp\test.txt
}
if T23= 1
 {
   FileAppend,  %2_Space%■ Cranial nerves, c:\temp\test.txt
}
  if T23= 0
 {
   FileAppend,  %2_Space%□ Cranial nerves, c:\temp\test.txt
}
if T24= 1
 {
   FileAppend,  %2_Space%■ Hypopharynx, c:\temp\test.txt
}
  if T24= 0
 {
   FileAppend,  %2_Space%□ Hypopharynx, c:\temp\test.txt
}
if T25= 1
 {
   FileAppend,  %2_Space%■ Orbit , c:\temp\test.txt
}
  if T25= 0
 {
   FileAppend,  %2_Space%□ Orbit , c:\temp\test.txt
}
if T26= 1
 {
   FileAppend,  %2_Space%■ Parotid gland `n, c:\temp\test.txt
}
  if T26= 0
 {
   FileAppend,  %2_Space%□ Parotid gland `n, c:\temp\test.txt
}
if T27= 1
 {
   FileAppend,  %4_Space%%4_Space%%4_Space%%2_Space%■ Infiltration beyond the lateral surface of the lateral pterygoid muscle`n, c:\temp\test.txt
}
  if T27= 0
 {
   FileAppend,  %4_Space%%4_Space%%4_Space%%2_Space%□ Infiltration beyond the lateral surface of the lateral pterygoid muscle `n, c:\temp\test.txt
}
if T28= 1
 {
   FileAppend,  %4_Space%%4_Space%%4_Space%%2_Space%■ Others: __%T29%__ `n, c:\temp\test.txt
}
  if T28= 0
 {
   FileAppend,  %4_Space%%4_Space%%4_Space%%2_Space%□ Others: __%T29%__ `n, c:\temp\test.txt
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
   FileAppend,  %4_Space%■ No regional nodal metastasis. `n, c:\temp\test.txt
}
  if No= 0
 {
   FileAppend,  %4_Space%□ No regional nodal metastasis. `n, c:\temp\test.txt
}
if Yes= 1
 {
   FileAppend,  
(
%4_Space%■ Yes. If yes, involved lymph nodes: 
)`n, c:\temp\test.txt
}
  if Yes= 0
 {
   FileAppend,  
(
%4_Space%□ Yes. If yes, involved lymph nodes: 
)`n, c:\temp\test.txt
}
if Y1= 1
 {
   FileAppend,  
(
%4_Space%%4_Space%■ N1: Unilateral cervical LN(S), <= 6 cm in greatest dimension, above CBCC.
)`n , c:\temp\test.txt
}
  if Y1= 0
 {
   FileAppend,  
(
%4_Space%%4_Space%□ N1: Unilateral cervical LN(S), <= 6 cm in greatest dimension, above CBCC.
)`n, c:\temp\test.txt
}
if Y2= 1
 {
   FileAppend,  
(
%4_Space%%4_Space%■ N1: Uni-/Bi-lateral retropharyngeal LN(S), <= 6 cm in greatest dimension, above CBCC.
)`n, c:\temp\test.txt
}
  if Y2= 0
 {
   FileAppend,
(
%4_Space%%4_Space%□ N1: Uni-/Bi-lateral retropharyngeal LN(S), <= 6 cm in greatest dimension, above CBCC.
)`n , c:\temp\test.txt
}
if Y3= 1
 {
   FileAppend,  
(
%4_Space%%4_Space%■ N2: Bilateral cervical LN(S), <= 6 cm in greatest dimension, above CBCC. 
)`n, c:\temp\test.txt
}
  if Y3= 0
 {
   FileAppend,  
(
%4_Space%%4_Space%□ N2: Bilateral cervical LN(S), <= 6 cm in greatest dimension, above CBCC.
)`n, c:\temp\test.txt
}
if Y4= 1
 {
   FileAppend,  
(
%4_Space%%4_Space%■ N3: Uni-/Bi-lateral cervical LN(S), > 6 cm in greatest dimension, and/or extension CBCC
)`n, c:\temp\test.txt
}
  if Y4= 0
 {
   FileAppend,  
(
%4_Space%%4_Space%□ N3: Uni-/Bi-lateral cervical LN(S), > 6 cm in greatest dimension, and/or extension CBCC
)`n, c:\temp\test.txt
}
FileAppend,  
(
%4_Space%%4_Space%*CBCC: Caudal border of cricoid cartilage.
)`n, c:\temp\test.txt
FileAppend,  %4_Space%%4_Space%Maximal size of the largest positive node: __%Y7%__ mm (long axis)`n , c:\temp\test.txt
FileAppend,  %4_Space%%4_Space%Location: Left level:  , c:\temp\test.txt
if Y8= 1
 {
   FileAppend,  %2_Space%■ I, c:\temp\test.txt
}
  if Y8= 0
 {
   FileAppend,  %2_Space%□ I, c:\temp\test.txt
}
if Y9= 1
 {
   FileAppend,  %3_Space%■ II, c:\temp\test.txt
}
  if Y9= 0
 {
   FileAppend,  %3_Space%□ II, c:\temp\test.txt
}
if Y10= 1
 {
   FileAppend,  %3_Space%■ III, c:\temp\test.txt
}
  if Y10= 0
 {
   FileAppend,  %3_Space%□ III, c:\temp\test.txt
}
if Y11= 1
 {
   FileAppend,  %3_Space%■ IV, c:\temp\test.txt
}
  if Y11= 0
 {
   FileAppend,  %3_Space%□ IV, c:\temp\test.txt
}
if Y12= 1
 {
   FileAppend,  %3_Space%■ V, c:\temp\test.txt
}
  if Y12= 0
 {
   FileAppend,  %3_Space%□ V, c:\temp\test.txt
}
if Y13= 1
 {
   FileAppend,  %3_Space%■ VI, c:\temp\test.txt
}
  if Y13= 0
 {
   FileAppend,  %3_Space%□ VI, c:\temp\test.txt
}
if Y14= 1
 {
   FileAppend,  %3_Space%■ VII`n, c:\temp\test.txt
}
  if Y14= 0
 {
   FileAppend,  %3_Space%□ VII`n, c:\temp\test.txt
}
FileAppend,  %4_Space%%4_Space%%4_Space%%4_Space%%4_Space%%4_Space%Right level:  , c:\temp\test.txt
if Y15= 1
 {
   FileAppend,  %2_Space%■ I, c:\temp\test.txt
}
  if Y15= 0
 {
   FileAppend,  %2_Space%□ I, c:\temp\test.txt
}
if Y16= 1
 {
   FileAppend,  %3_Space%■ II, c:\temp\test.txt
}
  if Y16= 0
 {
   FileAppend,  %3_Space%□ II, c:\temp\test.txt
}
if Y17= 1
 {
   FileAppend,  %3_Space%■ III, c:\temp\test.txt
}
  if Y17= 0
 {
   FileAppend,  %3_Space%□ III, c:\temp\test.txt
}
if Y18= 1
 {
   FileAppend,  %3_Space%■ IV, c:\temp\test.txt
}
  if Y18= 0
 {
   FileAppend,  %3_Space%□ IV, c:\temp\test.txt
}
if Y19= 1
 {
   FileAppend,  %3_Space%■ V, c:\temp\test.txt
}
  if Y19= 0
 {
   FileAppend,  %3_Space%□ V, c:\temp\test.txt
}
if Y20= 1
 {
   FileAppend,  %3_Space%■ VI, c:\temp\test.txt
}
  if Y20= 0
 {
   FileAppend,  %3_Space%□ VI, c:\temp\test.txt
}
if Y21= 1
 {
   FileAppend,  %3_Space%■ VII`n, c:\temp\test.txt
}
  if Y21= 0
 {
   FileAppend,  %3_Space%□ VII`n, c:\temp\test.txt
}
FileAppend,  %4_Space%%4_Space%%4_Space%%4_Space%%4_Space%%4_Space%Others: __%Y22%__  `n, c:\temp\test.txt

FileAppend,   %2_Space% `n, c:\temp\test.txt    ; 輸入空白行幫助排版

;--------------第五段-----------------------------------------------

   FileAppend,  4. %1_Space%Distant metastasis(in this study)`n, c:\temp\test.txt  
if DM0= 1
 {
   FileAppend,  
(
%4_Space%■ No
)`n, c:\temp\test.txt
}
  if DM0 = 0
 {
   FileAppend,  
(
%4_Space%□ No
)`n, c:\temp\test.txt
}
if DM1= 1
 {
   FileAppend,  
(
%4_Space%■ Equivocal, location: __%DM2%__
)`n, c:\temp\test.txt
}
  if DM1 = 0
 {
   FileAppend,  
(
%4_Space%□ Equivocal, location: _%DM2%__
)`n, c:\temp\test.txt
}    
if DM3= 1
 {
   FileAppend,  
(
%4_Space%■ Yes, location: _%DM4%__
)`n, c:\temp\test.txt
}
  if DM3 = 0
 {
   FileAppend,  
(
%4_Space%□ Yes, location: _%DM4%__
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
