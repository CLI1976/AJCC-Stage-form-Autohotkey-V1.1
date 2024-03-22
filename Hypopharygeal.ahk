; Hypopharyngeal Carcinoma Imaging Report Generator
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
Gui, Add, Checkbox, vL4 y55 x150, Right
Gui, Add, Checkbox, vL5 y55 x202, Bilateral
Gui, Add, Text, y75 x40, Location: 
Gui, Add, Checkbox, vL6 y75 x105, Pyriform sinus
Gui, Add, Checkbox, vL7 y75 x220, Post-cricoid region
Gui, Add, Checkbox, vL8 y75 x362, Post-pharyngeal wall
Gui, Add, Checkbox, vL9 y100 x105, Others
 Gui, Add, Edit, vL10 y95 x172 w200
 
 Gui, Add, Text, y125 x40, Size: 
 Gui, Add, Checkbox, vL11 y125 x80, Non-measurable
 Gui, Add, Checkbox, vL12 y125 x205, Measurable: 
 Gui, Add, Edit, vL13 y120 x300 w40
 Gui, Add, Text, y125 x348, cm(largest diameter)

; ---------------Tumor Invasion---------------
 Gui, Font, s12 bold, Arial   ; 改大改粗體
 Gui, Add, Text, y155 x20, 2. Tumor invasion
 Gui, Font ; 重置字體設置(不加這個 粗體改不回來)
 Gui, Font, s10, Arial   ; 恢復
 Gui, Add, Text, y155 x161, (
 Gui, Add, Checkbox, vT1 y155 x168, Not assessable)
 Gui, Add, Checkbox, vT2 y175 x40, T0: No regional invasion.
 Gui, Add, Checkbox, vT3 y195 x40, T1: Tumor limited to 1 subsite of hypopharynx.
 Gui, Add, Checkbox, vT4 y215 x40, T1: Tumor measures <= 2 cm in greatest dimension.
Gui, Add, Checkbox, vT5 y235 x40, T2: Tumor invades > 1 subsite of hypopharynx and/or adjacent site.
Gui, Add, Checkbox, vT6 y255 x40, T2: Tumor measures > 2 cm, but <= 4 cm in greatest dimension.
Gui, Add, Checkbox, vT7 y275 x40, T3: Tumor > 4 cm in greatest dimension or extension to esophagus.
 Gui, Add, Checkbox, vT8 y295 x40, T3: fixation of hemi-larynx.
Gui, Add, Checkbox, vT9 y315 x40, T3: Extension to esophagus.
Gui, Add, Checkbox, vT10 y335 x40, T4a: Moderately advanced local disease. Tumor invasion of:
Gui, Add, Checkbox, vT11 y355 x60, Thyroid cartilage
Gui, Add, Checkbox, vT12 y355 x180, Cricoid cartilage
 Gui, Add, Checkbox, vT13 y355 x296, Hyoid bone
Gui, Add, Checkbox, vT14 y355 x388, Thyroid gland
 Gui, Add, Checkbox, vT15 y375 x60, Central compartment soft tissue (pre-laryngeal strap muscles and subcutaneous fat)
Gui, Add, Checkbox, vT16 y395 x40, T4b: Very advanced local disease. Tumor invades:
Gui, Add, Checkbox, vT17 y415 x60, Prevertebral fascia 
Gui, Add, Checkbox, vT18 y415 x190, Encasement of carotid artery
Gui, Add, Checkbox, vT19 y415 x380, Mediastinal structures
Gui, Add, Checkbox, vT28 y440 x60, Others: 
 Gui, Add, Edit, vT29 y435 x127 w200

; ---------------Regional nodal metastasis---------------
  Gui, Font, s12 bold, Arial   ; 改大改粗體
  Gui, Add, Text, y470 x20, 3. Regional nodal metastasis
  Gui, Font ; 重置字體設置(不加這個 粗體改不回來)
  Gui, Font, s10, Arial   ; 恢復
 Gui, Add, Text, y470 x245, (
  Gui, Add, Checkbox, vNot y470 x253, Not assessable)
 Gui, Add, Checkbox, vNo y490 x40, No regional nodal metastasis.
 Gui, Add, Checkbox, vYes y510 x40, Yes. If yes, involved lymph nodes:
 Gui, Add, Checkbox, vY1 y530 x60, N1: Single ipsilateral lymph node <= 3 cm in greatest dimension and ENE(-).
 Gui, Add, Checkbox, vY2 y550 x60, N2a: Single ipsilateral lymph node > 3 cm, <= 6 cm in greatest dimension and ENE(-).
 Gui, Add, Checkbox, vY3 y570 x60, N2b: Multiple ipsilateral lymph nodes, <= 6 cm in greatest dimension and ENE(-).
Gui, Add, Checkbox, vY4 y590 x60, N2c: Bilateral or contralateral lymph nodes, <= 6 cm in greatest dimension and ENE(-)
Gui, Add, Checkbox, vY5 y610 x60, N3a: Metastasis in a lymph node > 6 cm in greatest dimension and ENE(-).
Gui, Add, Checkbox, vY6 y630 x60, N3b: Metastasis in any node(s) and clinically overt ENE(+).
  Gui, Add, Text, y655 x60, Maximal size of the largest positive node: 
 Gui, Add, Edit, vY7 y650 x308 w60
  Gui, Add, Text, y655 x369, mm (long axis)
Gui, Add, Text, y675 x60, Location: Left level:
 Gui, Add, Checkbox, vY8 y675 x180, I
 Gui, Add, Checkbox, vY9 y675 x220, II
 Gui, Add, Checkbox, vY10 y675 x260, III
 Gui, Add, Checkbox, vY11 y675 x300, IV
 Gui, Add, Checkbox, vY12 y675 x340, V
 Gui, Add, Checkbox, vY13 y675 x380, VI
 Gui, Add, Checkbox, vY14 y675 x420, VII
Gui, Add, Text, y695 x108, Right level:
 Gui, Add, Checkbox, vY15 y695 x180, I
 Gui, Add, Checkbox, vY16 y695 x220, II
 Gui, Add, Checkbox, vY17 y695 x260, III
 Gui, Add, Checkbox, vY18 y695 x300, IV
 Gui, Add, Checkbox, vY19 y695 x340, V
 Gui, Add, Checkbox, vY20 y695 x380, VI
 Gui, Add, Checkbox, vY21 y695 x420, VII
 Gui, Add, Text, y720 x108, Others: 
 Gui, Add, Edit, vY22 y715 x165 w200

; ---------------Distant Metastasis---------------
   Gui, Font, s12 bold, Arial   ; 改大改粗體
  Gui, Add, Text, y750 x20, 4. Distant metastasis
  Gui, Font ; 重置字體設置(不加這個 粗體改不回來)
  Gui, Font, s10, Arial   ; 恢復
  Gui, Add, Text, y750 x165, (in this study)
  Gui, Add, Checkbox, vDM0 y770 x40, No
 Gui, Add, Checkbox, vDM1 y795 x40, Equivocal, location: 
 Gui, Add, Edit, vDM2 y790 x174 w250
 Gui, Add, Checkbox, vDM3 y820 x40, Yes, location:
Gui, Add, Edit, vDM4 y815 x142 w250
 
; ---------------Other Findings---------------
 Gui, Font, s12 bold, Arial   ; 改大改粗體
 Gui, Add, Text, y850 x20, 5. Other findings
 Gui, Font ; 重置字體設置(不加這個 粗體改不回來)
 Gui, Font, s10, Arial   ; 恢復
 Gui, Add, Edit, vOF0 y870 x40 w500

; Buttons
 Gui, Font, s12 bold, Arial   ; 改大改粗體
 Gui, Add, Button, Default gGenerateReport y920 x20, Generate Report
 Gui, Add, Button, gExit y920 x170, Exit

; Show GUI
Gui, Show,  w615 h960, Hypopharyngeal Carcinoma Imaging Report Generator
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
    FileAppend, MCH Imaging Report for Hypopharyngeal Carcinoma (AJCC 8th)`n, c:\temp\test.txt
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
 FileAppend,  %4_Space%Laterality:  , c:\temp\test.txt
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

 FileAppend,  %4_Space%Location:  , c:\temp\test.txt
if L6 = 1
 {
   FileAppend,  %2_Space%■ Pyriform sinus, c:\temp\test.txt
}
  if L6 = 0
 {
   FileAppend,  %2_Space%□ Pyriform sinus,  c:\temp\test.txt
}
if L7= 1
 {
   FileAppend,  %2_Space%■ Post-cricoid region, c:\temp\test.txt
}
  if L7 = 0
 {
   FileAppend,  %2_Space%□ Post-cricoid region,  c:\temp\test.txt
}
if L8 = 1
 {
   FileAppend,  %2_Space%■ Post-pharyngeal wall  `n , c:\temp\test.txt
}
  if L8 = 0
 {
   FileAppend,  %2_Space%□ Post-pharyngeal wall   `n ,  c:\temp\test.txt
}
if L9 = 1
 {
   FileAppend,  %4_Space%%4_Space%%4_Space%%4_Space%%4_Space%%2_Space%■ Others: __%L10%__  `n , c:\temp\test.txt
}
  if L9 = 0
 {
   FileAppend,  %4_Space%%4_Space%%4_Space%%4_Space%%4_Space%%2_Space%□ Others: __%L10%__  `n ,  c:\temp\test.txt
}

FileAppend,  %4_Space%Size: , c:\temp\test.txt
if L11 = 1
 {
   FileAppend,  %2_Space%■ Non-measurable, c:\temp\test.txt
}
  if L11 = 0
 {
   FileAppend,  %2_Space%□ Non-measurable,  c:\temp\test.txt
}
if L12 = 1
 {
   FileAppend,  %2_Space%■ Measurable: __%L13%__cm(largest diameter)`n, c:\temp\test.txt
}
  if L12 = 0
 {
   FileAppend,  %2_Space%□ Measurable: __%L13%__cm(largest diameter) `n,  c:\temp\test.txt
}   
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
   FileAppend,  %4_Space%■ T0: No regional invasion. `n, c:\temp\test.txt
}
  if T2= 0
 {
   FileAppend,  %4_Space%□ T0: No regional invasion. `n, c:\temp\test.txt
}
if T3= 1
 {
   FileAppend,  %4_Space%■ T1: Tumor limited to 1 subsite of hypopharynx. `n, c:\temp\test.txt
}
  if T3= 0
 {
   FileAppend,  %4_Space%□ T1: Tumor limited to 1 subsite of hypopharynx. `n, c:\temp\test.txt
}
if T4= 1
 {
   FileAppend,  %4_Space%■ T1: Tumor measures <= 2 cm in greatest dimension. `n, c:\temp\test.txt
}
  if T4= 0
 {
   FileAppend,  %4_Space%□ T1: Tumor measures <= 2 cm in greatest dimension. `n, c:\temp\test.txt
}
if T5= 1
 {
   FileAppend,  %4_Space%■T2: Tumor invades > 1 subsite of hypopharynx and/or adjacent site. `n, c:\temp\test.txt
}
  if T5= 0
 {
   FileAppend,  %4_Space%□ T2: Tumor invades > 1 subsite of hypopharynx and/or adjacent site. `n, c:\temp\test.txt
}
if T6= 1
 {
   FileAppend,  %4_Space%■ T2: Tumor measures > 2 cm`,` but <= 4 cm in greatest dimension. `n, c:\temp\test.txt
}
  if T6= 0
 {
   FileAppend,  %4_Space%□ T2: Tumor measures > 2 cm`,` but <= 4 cm in greatest dimension. `n, c:\temp\test.txt
}
if T7= 1
 {
   FileAppend,  %4_Space%■ T3: Tumor > 4 cm in greatest dimension or extension to esophagus `n , c:\temp\test.txt
}
  if T7= 0
 {
   FileAppend,  %4_Space%□ T3: Tumor > 4 cm in greatest dimension or extension to esophagus `n , c:\temp\test.txt
}
if T8= 1
 {
   FileAppend,  %4_Space%■ T3: fixation of hemi-larynx. `n, c:\temp\test.txt
}
  if T8= 0
 {
   FileAppend,  %4_Space%□ T3: fixation of hemi-larynx. `n, c:\temp\test.txt
}
if T9= 1
 {
   FileAppend,  %4_Space%■T3: Extension to esophagus.  `n, c:\temp\test.txt
}
  if T9= 0
 {
   FileAppend,  %4_Space%□ T3: Extension to esophagus.  `n, c:\temp\test.txt
}
if T10= 1
 {
   FileAppend,  %4_Space%■ T4a: Moderately advanced local disease. Tumor invasion of: `n , c:\temp\test.txt
}
  if T10= 0
 {
   FileAppend,  %4_Space%□ T4a: Moderately advanced local disease. Tumor invasion of:  `n, c:\temp\test.txt
}
if T11= 1
 {
   FileAppend,  %4_Space%%4_Space%■ Thyroid cartilage, c:\temp\test.txt
}
  if T11= 0
 {   
FileAppend, %4_Space%%4_Space%□ Thyroid cartilage, c:\temp\test.txt
}
if T12= 1
 {
   FileAppend,  %2_Space%■ Cricoid cartilage, c:\temp\test.txt
}
  if T12= 0
 {
   FileAppend,  %2_Space%□ Cricoid cartilage, c:\temp\test.txt
}
if T13= 1
 {
   FileAppend,  %2_Space%■ Hyoid bone , c:\temp\test.txt
}
  if T13= 0
 {
   FileAppend,  %2_Space%□ Hyoid bone , c:\temp\test.txt
}
if T14= 1
 {
   FileAppend, %2_Space%■ Thyroid gland `n  , c:\temp\test.txt
}
  if T14= 0
 {
   FileAppend,  %2_Space%□ Thyroid gland `n  , c:\temp\test.txt
}
if T15= 1
 {
   FileAppend, %4_Space%%4_Space%■ Central compartment soft tissue (pre-laryngeal strap muscles and subcutaneous fat)  `n, c:\temp\test.txt
}
  if T15= 0
 {
   FileAppend,  %4_Space%%4_Space%□ Central compartment soft tissue (pre-laryngeal strap muscles and subcutaneous fat)  `n , c:\temp\test.txt
}
if T16= 1
 {
   FileAppend, %4_Space%■  T4b: Very advanced local disease. Tumor invades: `n, c:\temp\test.txt
}
  if T16= 0
 {
   FileAppend,  %4_Space%□  T4b: Very advanced local disease. Tumor invades: `n, c:\temp\test.txt
}
if T17= 1
 {
   FileAppend,  %4_Space%%4_Space%■ Prevertebral fascia, c:\temp\test.txt
}
  if T17= 0
 {
   FileAppend,  %4_Space%%4_Space%□ Prevertebral fascia, c:\temp\test.txt
}
if T18= 1
 {
   FileAppend,  %2_Space%■ Encasement of carotid artery , c:\temp\test.txt
}
  if T18= 0
 {
   FileAppend,  %2_Space%□ Encasement of carotid artery , c:\temp\test.txt
}
if T19= 1
 {
   FileAppend,  %2_Space%■ Mediastinal structures `n, c:\temp\test.txt
}
  if T19= 0
 {
   FileAppend,  %2_Space%□ Mediastinal structures `n, c:\temp\test.txt
}
if T28= 1
 {
   FileAppend,  %4_Space%%4_Space%■ Others: __%T29%__ `n, c:\temp\test.txt
}
  if T28= 0
 {
   FileAppend,  %4_Space%%4_Space%□ Others: __%T29%__ `n, c:\temp\test.txt
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
