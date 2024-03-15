; Oral Cavity Carcinoma Imaging Report Generator
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
Gui, Add, Text, y55 x40, Laterality: 
Gui, Add, Checkbox, vL3 y55 x105, Left
Gui, Add, Checkbox, vL4 y55 x151, Right 
Gui, Add, Checkbox, vL5 y55 x205, Bilateral
Gui, Add, Text, y75 x40, Location: 
Gui, Add, Checkbox, vL6 y75 x105, Upper Lip
Gui, Add, Checkbox, vL7 y75 x205, Lower Lip
Gui, Add, Checkbox, vL8 y75 x305, Oral tongue 
Gui, Add, Checkbox, vL9 y95 x105, Upper gingivobuccal mucosa
Gui, Add, Checkbox, vL10 y95 x305, Lower gingivobuccal mucosa
Gui, Add, Checkbox, vL11 y115 x105, Hard palate
Gui, Add, Checkbox, vL12 y115 x205, Mouth floor
Gui, Add, Checkbox, vL13 y115 x305, Retromolar trigone  
Gui, Add, Checkbox, vL14 y140 x105, Others: 
 Gui, Add, Edit, vL15 y135 x175 w120
 Gui, Add, Text, y170 x40, Size: 
 Gui, Add, Checkbox, vL16 y170 x80, Non-measurable
 Gui, Add, Checkbox, vL17 y170 x205, Measurable: 
 Gui, Add, Edit, vL18 y165 x300 w40
 Gui, Add, Text, y170 x348, cm(largest diameter)

; ---------------Tumor Invastion---------------
 Gui, Font, s12 bold, Arial   ; 改大改粗體
 Gui, Add, Text, y200 x20, 2. Tumor invasion
 Gui, Font ; 重置字體設置(不加這個 粗體改不回來)
 Gui, Font, s10, Arial   ; 恢復
 Gui, Add, Text, y200 x161, (
 Gui, Add, Checkbox, vT1 y200 x168, Not assessable)
 Gui, Add, Checkbox, vT2 y220 x40, T0: No regional invasion.
 Gui, Add, Checkbox, vT3 y240 x40, T1: <= 2 cm in greatest dimension.
 Gui, Add, Checkbox, vT4 y260 x40, T2: > 2 cm but <= 4 cm in greatest dimension.
 Gui, Add, Checkbox, vT5 y280 x40, T3: > 4 cm in greatest dimension.
 Gui, Add, Checkbox, vT6 y300 x40, T4a: Moderately advanced local disease. Tumor invades:
 Gui, Add, Checkbox, vT7 y320 x60, Lip tumor:
 Gui, Add, Checkbox, vT8 y320 x145, Through cortical bone
 Gui, Add, Checkbox, vT9 y320 x300, Inferior alveolar nerve
 Gui, Add, Checkbox, vT10 y340 x145, Floor of mouth
 Gui, Add, Checkbox, vT11 y340 x300, Skin of face
 Gui, Add, Checkbox, vT12 y360 x60, Oral cavity:
 Gui, Add, Checkbox, vT13 y360 x145, Through cortical bone (mandible or maxilla) 
 Gui, Add, Checkbox, vT14 y380 x145, Maxillary sinus
 Gui, Add, Checkbox, vT15 y380 x300, Skin of face
 Gui, Add, Checkbox, vT16 y400 x40, T4b: Very advanced local disease. Tumor invades:
 Gui, Add, Checkbox, vT17 y420 x60, Masticator space
 Gui, Add, Checkbox, vT18 y420 x188, Pterygoid plates
 Gui, Add, Checkbox, vT19 y420 x305, Skull base
 Gui, Add, Checkbox, vT20 y445 x60, Encase internal carotid artery
 Gui, Add, Checkbox, vT21 y445 x260, Others: 
 Gui, Add, Edit, vT22 y440 x335 w200

; ---------------Regional nodal metastasis---------------
  Gui, Font, s12 bold, Arial   ; 改大改粗體
  Gui, Add, Text, y475 x20, 3. Regional nodal metastasis
  Gui, Font ; 重置字體設置(不加這個 粗體改不回來)
  Gui, Font, s10, Arial   ; 恢復
 Gui, Add, Text, y475 x245, (
  Gui, Add, Checkbox, vNot y475 x253, Not assessable)
 Gui, Add, Checkbox, vNo y495 x40, No regional nodal metastasis.
 Gui, Add, Checkbox, vYes y515 x40, Yes. If yes, involved lymph nodes:
 Gui, Add, Checkbox, vY1 y535 x60, N1: Single ipsilateral lymph node <= 3 cm in greatest dimension and ENE(-).
 Gui, Add, Checkbox, vY2 y555 x60, N2a: Single ipsilateral lymph node > 3 cm, <= 6 cm in greatest dimension and ENE(-).
 Gui, Add, Checkbox, vY3 y575 x60, N2b: Multiple ipsilateral lymph nodes, <= 6 cm in greatest dimension and ENE(-).
Gui, Add, Checkbox, vY4 y595 x60, N2c: Bilateral or contralateral lymph nodes, <= 6 cm in greatest dimension and ENE(-)
Gui, Add, Checkbox, vY5 y615 x60, N3a: Metastasis in a lymph node > 6 cm in greatest dimension and ENE(-).
Gui, Add, Checkbox, vY6 y635 x60, N3b: Metastasis in any node(s) and clinically overt ENE(+).
  Gui, Add, Text, y660 x60, Maximal size of the largest positive node: 
 Gui, Add, Edit, vY7 y655 x308 w60
  Gui, Add, Text, y660 x373, mm (long axis)
Gui, Add, Text, y680 x60, Location: Left level:
 Gui, Add, Checkbox, vY8 y680 x180, I
 Gui, Add, Checkbox, vY9 y680 x220, II
 Gui, Add, Checkbox, vY10 y680 x260, III
 Gui, Add, Checkbox, vY11 y680 x300, IV
 Gui, Add, Checkbox, vY12 y680 x340, V
 Gui, Add, Checkbox, vY13 y680 x380, VI
 Gui, Add, Checkbox, vY14 y680 x420, VII
Gui, Add, Text, y700 x108, Right level:
 Gui, Add, Checkbox, vY15 y700 x180, I
 Gui, Add, Checkbox, vY16 y700 x220, II
 Gui, Add, Checkbox, vY17 y700 x260, III
 Gui, Add, Checkbox, vY18 y700 x300, IV
 Gui, Add, Checkbox, vY19 y700 x340, V
 Gui, Add, Checkbox, vY20 y700 x380, VI
 Gui, Add, Checkbox, vY21 y700 x420, VII

; ---------------Distant Metastasis---------------
   Gui, Font, s12 bold, Arial   ; 改大改粗體
  Gui, Add, Text, y730 x20, 4. Distant metastasis
  Gui, Font ; 重置字體設置(不加這個 粗體改不回來)
  Gui, Font, s10, Arial   ; 恢復
  Gui, Add, Text, y730 x165, (in this study)
  Gui, Add, Checkbox, vDM0 y750 x40, No
 Gui, Add, Checkbox, vDM1 y775 x40, Equivocal, location: 
 Gui, Add, Edit, vDM2 y770 x174 w250
 Gui, Add, Checkbox, vDM3 y800 x40, Yes, location:
Gui, Add, Edit, vDM4 y795 x142 w250
 
; ---------------Other Findings---------------
 Gui, Font, s12 bold, Arial   ; 改大改粗體
 Gui, Add, Text, y830 x20, 5. Other findings
 Gui, Font ; 重置字體設置(不加這個 粗體改不回來)
 Gui, Font, s10, Arial   ; 恢復
 Gui, Add, Edit, vOF0 y850 x40 w500

; Buttons
 Gui, Font, s12 bold, Arial   ; 改大改粗體
 Gui, Add, Button, Default gGenerateReport y910 x20, Generate Report
 Gui, Add, Button, gExit y910 x170, Exit

; Show GUI
Gui, Show,  w615 h960, Oral Cavity Carcinoma Imaging Report Generator
return

; === 生成報告===
GenerateReport:
    ; Collect data from GUI
    Gui, Submit, NoHide
     ; 刪除現有的 test.txt 文件
    FileDelete, c:\temp\test.txt
    ; 將結果逐行輸入test.txt中
FileAppend,  Addtional report for cancer staging  `n, c:\temp\test.txt    ; 輸入空白行幫助排版
FileAppend,   =========================================== `n, c:\temp\test.txt 
    FileAppend, MCH Imaging Report for Oral Cavity Carcinoma (AJCC 8th)`n, c:\temp\test.txt
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
FileAppend,  %4_Space%Laterality: , c:\temp\test.txt
if L3 = 1
 {
   FileAppend,  %2_Space%■ Left, c:\temp\test.txt
}
  if L3 = 0
 {
   FileAppend,  %2_Space%□ Left,  c:\temp\test.txt
}
if L4 = 1
 {
   FileAppend,  %2_Space%■ Right, c:\temp\test.txt
}
  if L4 = 0
 {
   FileAppend,  %2_Space%□ Right, c:\temp\test.txt
}
if L5 = 1
 {
   FileAppend, 
(
 %2_Space%■ Bilateral
)`n, c:\temp\test.txt
}
  if L5 = 0
 {
   FileAppend,  
(
%2_Space%□ Bilateral
)`n, c:\temp\test.txt
}
 FileAppend,  %4_Space%Location: , c:\temp\test.txt
if L6 = 1
 {
   FileAppend,  %2_Space%■ Upper Lip, c:\temp\test.txt
}
  if L6 = 0
 {
   FileAppend,  %2_Space%□ Upper Lip,  c:\temp\test.txt
}
if L7 = 1
 {
   FileAppend,  %2_Space%■ Lower Lip, c:\temp\test.txt
}
  if L7 = 0
 {
   FileAppend,  %2_Space%□ Lower Lip,  c:\temp\test.txt
}
if L8 = 1
 {
   FileAppend,  %2_Space%■ Oral tongue `n , c:\temp\test.txt
}
  if L8 = 0
 {
   FileAppend,  %2_Space%□ Oral tongue `n ,  c:\temp\test.txt
}
if L9 = 1
 {
   FileAppend,  %4_Space%%4_Space%%4_Space%%4_Space%%4_Space%■ Upper gingivobuccal mucosa, c:\temp\test.txt
}
  if L9 = 0
 {
   FileAppend,  %4_Space%%4_Space%%4_Space%%4_Space%%4_Space%□ Upper gingivobuccal mucosa,  c:\temp\test.txt
}
if L10 = 1
 {
   FileAppend,  %2_Space%■ Lower gingivobuccal mucosa `n, c:\temp\test.txt
}
  if L10 = 0
 {
   FileAppend,  %2_Space%□ Lower gingivobuccal mucosa `n,  c:\temp\test.txt
}
if L11 = 1
 {
   FileAppend,  %4_Space%%4_Space%%4_Space%%4_Space%%4_Space%■ Hard palate, c:\temp\test.txt
}
  if L11 = 0
 {
   FileAppend,  %4_Space%%4_Space%%4_Space%%4_Space%%4_Space%□ Hard palate,  c:\temp\test.txt
}
if L12 = 1
 {
   FileAppend,  %2_Space%■ Mouth floor, c:\temp\test.txt
}
  if L12 = 0
 {
   FileAppend,  %2_Space%□ Mouth floor,  c:\temp\test.txt
}
if L13 = 1
 {
   FileAppend,  %2_Space%■ Retromolar trigone `n, c:\temp\test.txt
}
  if L13 = 0
 {
   FileAppend,  %2_Space%□ Retromolar trigone `n,  c:\temp\test.txt
}
if L14 = 1
 {
   FileAppend,  %4_Space%%4_Space%%4_Space%%4_Space%%4_Space%■ Others: __%L15%__ `n, c:\temp\test.txt
}
  if L14 = 0
 {
   FileAppend,  %4_Space%%4_Space%%4_Space%%4_Space%%4_Space%□ Others: __%L15%__ `n,  c:\temp\test.txt
}
FileAppend,  %4_Space%Size: , c:\temp\test.txt
if L16 = 1
 {
   FileAppend,  %2_Space%■ Non-measurable, c:\temp\test.txt
}
  if L16 = 0
 {
   FileAppend,  %2_Space%□ Non-measurable,  c:\temp\test.txt
}
if L17 = 1
 {
   FileAppend,  %2_Space%■ Measurable: __%L18%__cm(largest diameter)`n, c:\temp\test.txt
}
  if L17 = 0
 {
   FileAppend,  %2_Space%□ Measurable: __%L18%__cm(largest diameter) `n,  c:\temp\test.txt
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
   FileAppend,  %4_Space%■ T0: No regional invasion.`n, c:\temp\test.txt
}
  if T2= 0
 {
   FileAppend,  %4_Space%□ T0: No regional invasion.`n, c:\temp\test.txt
}
if T3= 1
 {
   FileAppend,  %4_Space%■ T1: <= 2 cm in greatest dimension. `n, c:\temp\test.txt
}
  if T3= 0
 {
   FileAppend,  %4_Space%□ T1: <= 2 cm in greatest dimension. `n, c:\temp\test.txt
}
if T4= 1
 {
   FileAppend,  %4_Space%■ T2: > 2 cm but <= 4 cm in greatest dimension. `n, c:\temp\test.txt
}
  if T4= 0
 {
   FileAppend,  %4_Space%□ T2: > 2 cm but <= 4 cm in greatest dimension.`n, c:\temp\test.txt
}
if T5= 1
 {
   FileAppend,  %4_Space%■ T3: > 4 cm in greatest dimension. `n, c:\temp\test.txt
}
  if T5= 0
 {
   FileAppend,  %4_Space%□ T3: > 4 cm in greatest dimension. `n, c:\temp\test.txt
}
if T6= 1
 {
   FileAppend,  %4_Space%■ T4a: Moderately advanced local disease. Tumor invades: `n, c:\temp\test.txt
}
  if T6= 0
 {
   FileAppend,  %4_Space%□ T4a: Moderately advanced local disease. Tumor invades: `n, c:\temp\test.txt
}
if T7= 1
 {
   FileAppend,  %4_Space%%4_Space%■ Lip tumor: , c:\temp\test.txt
}
  if T7= 0
 {
   FileAppend,  %4_Space%%4_Space%□ Lip tumor: , c:\temp\test.txt
}
if T8= 1
 {
   FileAppend,  %2_Space%■ Through cortical bone, c:\temp\test.txt
}
  if T8= 0
 {
   FileAppend,  %2_Space%□ Through cortical bone, c:\temp\test.txt
}
if T9= 1
 {
   FileAppend,  %2_Space%■ Inferior alveolar nerve `n, c:\temp\test.txt
}
  if T9= 0
 {
   FileAppend,  %2_Space%□ Inferior alveolar nerve `n, c:\temp\test.txt
}
if T10= 1
 {
   FileAppend, %4_Space%%4_Space%%4_Space%%4_Space%%4_Space%%4_Space%%4_Space%%4_Space%■ Floor of mouth, c:\temp\test.txt
}
  if T10= 0
 {
   FileAppend,  %4_Space%%4_Space%%4_Space%%4_Space%%4_Space%%4_Space%%4_Space%%4_Space%□ Floor of mouth, c:\temp\test.txt
}
if T11= 1
 {
   FileAppend,  %2_Space%■ Skin of face`n, c:\temp\test.txt
}
  if T11= 0
 {   
FileAppend,  %2_Space%□ Skin of face`n, c:\temp\test.txt
}
if T12= 1
 {
   FileAppend,  %4_Space%%4_Space%■ Oral cavity:, c:\temp\test.txt
}
  if T12= 0
 {
   FileAppend,  %4_Space%%4_Space%□ Oral cavity:, c:\temp\test.txt
}
if T13= 1
 {
   FileAppend,  %2_Space%■ Through cortical bone (mandible or maxilla) `n, c:\temp\test.txt
}
  if T13= 0
 {
   FileAppend,  %2_Space%□ Through cortical bone (mandible or maxilla) `n, c:\temp\test.txt
}
if T14= 1
 {
   FileAppend, %4_Space%%4_Space%%4_Space%%4_Space%%4_Space%%4_Space%%4_Space%%4_Space%■ Maxillary sinus, c:\temp\test.txt
}
  if T14= 0
 {
   FileAppend,  %4_Space%%4_Space%%4_Space%%4_Space%%4_Space%%4_Space%%4_Space%%4_Space%□ Maxillary sinus, c:\temp\test.txt
}
if T15= 1
 {
   FileAppend, %2_Space%■ Skin of face `n, c:\temp\test.txt
}
  if T15= 0
 {
   FileAppend,  %2_Space%□ Skin of face `n, c:\temp\test.txt
}
if T16= 1
 {
   FileAppend,  %4_Space%■ T4b: Very advanced local disease. Tumor invades: `n, c:\temp\test.txt
}
  if T16= 0
 {   
FileAppend,  %4_Space%□ T4b: Very advanced local disease. Tumor invades: `n, c:\temp\test.txt
}
if T17= 1
 {
   FileAppend,  %4_Space%%4_Space%■ Masticator space, c:\temp\test.txt
}
  if T17= 0
 {
   FileAppend,  %4_Space%%4_Space%□ Masticator space, c:\temp\test.txt
}
if T18= 1
 {
   FileAppend,  %2_Space%■ Pterygoid plates, c:\temp\test.txt
}
  if T18= 0
 {
   FileAppend,  %2_Space%□ Pterygoid plates, c:\temp\test.txt
}
if T19= 1
 {
   FileAppend,  %2_Space%■ Skull base `n, c:\temp\test.txt
}
  if T19= 0
 {
   FileAppend,  %2_Space%□ Skull base `n, c:\temp\test.txt
}
if T20= 1
 {
   FileAppend,  %4_Space%%4_Space%■ Encase internal carotid artery, c:\temp\test.txt
}
  if T20= 0
 {
   FileAppend,  %4_Space%%4_Space%□ Encase internal carotid artery, c:\temp\test.txt
}
if T21= 1
 {
   FileAppend,  %2_Space%■ Others: __%T22%__ `n, c:\temp\test.txt
}
  if T21= 0
 {
   FileAppend,  %2_Space%□ Others: __%T22%__ `n, c:\temp\test.txt
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
%4_Space%%4_Space%■ N1: Single ipsilateral lymph node <=3cm in greatest dimension and ENE(-). 
)`n , c:\temp\test.txt
}
  if Y1= 0
 {
   FileAppend,  
(
%4_Space%%4_Space%□ N1: Single ipsilateral lymph node <=3cm in greatest dimension and ENE(-). 
)`n, c:\temp\test.txt
}
if Y2= 1
 {
   FileAppend,  
(
%4_Space%%4_Space%■ N2a: Single ipsilateral lymph node >3cm, <=6cm in greatest dimension and ENE(-). 
)`n, c:\temp\test.txt
}
  if Y2= 0
 {
   FileAppend,
(
%4_Space%%4_Space%□ N2a: Single ipsilateral lymph node >3cm, <=6cm in greatest dimension and ENE(-). 
)`n , c:\temp\test.txt
}
if Y3= 1
 {
   FileAppend,  
(
%4_Space%%4_Space%■ N2b: Multiple ipsilateral lymph nodes, <=6cm in greatest dimension and ENE(-). 
)`n, c:\temp\test.txt
}
  if Y3= 0
 {
   FileAppend,  
(
%4_Space%%4_Space%□ N2b: Multiple ipsilateral lymph nodes, <=6cm in greatest dimension and ENE(-). 
)`n, c:\temp\test.txt
}
if Y4= 1
 {
   FileAppend,  
(
%4_Space%%4_Space%■ N2c: Bilateral or contralateral lymph nodes, <=6cm in greatest dimension and ENE(-)
)`n, c:\temp\test.txt
}
  if Y4= 0
 {
   FileAppend,  
(
%4_Space%%4_Space%□ N2c: Bilateral or contralateral lymph nodes, <=6cm in greatest dimension and ENE(-)
)`n, c:\temp\test.txt
}
if Y5= 1
 {
   FileAppend,  
(
%4_Space%%4_Space%■ N3a: Metastasis in a lymph node >6cm in greatest dimension and ENE(-).
)`n, c:\temp\test.txt
}
  if Y5= 0
 {
   FileAppend,  
(
%4_Space%%4_Space%□ N3a: Metastasis in a lymph node >6cm in greatest dimension and ENE(-).
)`n, c:\temp\test.txt
}
if Y6= 1
 {
   FileAppend,  
(
%4_Space%%4_Space%■ N3b: Metastasis in any node(s) and clinically overt ENE(+).
)`n, c:\temp\test.txt
}
  if Y6= 0
 {
   FileAppend,  
(
%4_Space%%4_Space%□ N3b: Metastasis in any node(s) and clinically overt ENE(+).
)`n, c:\temp\test.txt
}
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

FileAppend,   %2_Space% `n, c:\temp\test.txt    ; 輸入空白行幫助排版

;--------------第五段-----------------------------------------------

   FileAppend,  4. %1_Space%Distant metastasis(in this study)`n, c:\temp\test.txt  
if DM0= 1
 {
   FileAppend,  
(
%4_Space%■ No,
)`n, c:\temp\test.txt
}
  if DM0 = 0
 {
   FileAppend,  
(
%4_Space%□ No,
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
