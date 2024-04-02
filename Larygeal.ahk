; Laryngeal Carcinoma Imaging Report Generator
; 以下變數用於在fileappend的開頭結束插入空白用的
; 平常跳行 Y+20; 有edit, text+25 edit+20 ; 段落+30
24_Space := "                        "
12_Space := "            "
8_Space := "        "
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
Gui, Add, Checkbox, vL3 y55 x105, Supraglottis:
Gui, Add, Checkbox, vL4 y55 x200, False vocal cords
Gui, Add, Checkbox, vL5 y55 x324, Arytenoids
Gui, Add, Checkbox, vL6 y55 x410, Epiglottis
Gui, Add, Checkbox, vL7 y55 x490, Aryepiglottic folds 
Gui, Add, Checkbox, vL8 y75 x105, Glottis
Gui, Add, Checkbox, vL9 y95 x105, Subglottis
Gui, Add, Checkbox, vL10 y120 x105, Others
 Gui, Add, Edit, vL11 y115 x172 w200
 
 Gui, Add, Text, y145 x40, Size: 
 Gui, Add, Checkbox, vL12 y145 x80, Non-measurable
 Gui, Add, Checkbox, vL13 y145 x205, Measurable: 
 Gui, Add, Edit, vL14 y140 x300 w40
Gui, Add, Edit, vL15 y140 x540 w40
 Gui, Add, Text, y145 x345, cm(largest diameter); Thickness:
Gui, Add, Text, y145 x583, cm

; 畫垂直線
Gui, Add, GroupBox, w5 h1550  y10 x650, 

; ---------------Tumor Invasion---------------
 Gui, Font, s12 bold, Arial   ; 改大改粗體
 Gui, Add, Text, y175 x20, 2. Tumor invasion
 Gui, Font ; 重置字體設置(不加這個 粗體改不回來)
 Gui, Font, s10, Arial   ; 恢復
 Gui, Add, Text, y175 x161, (
 Gui, Add, Checkbox, vT1 y175 x168, Not assessable)
 Gui, Add, Checkbox, vT2 y195 x40, T0: No regional invasion.

Gui, Add, GroupBox, w615 h325  y215 x30, Supraglottis
 Gui, Add, Checkbox, vT3 y235 x40, Supraglottis
 Gui, Add, Checkbox, vT4 y255 x60, T1: Tumor limited to one subsite of supraglottis.
Gui, Add, Checkbox, vT5 y275 x60, T2: Tumor invades at least 2 subsites of supraglottis or glottis or regions outside the supraglottis.
 Gui, Add, Text, y295 x80, (e.g., mucosa of base of tongue, vallecula, medial wall of pyriform sinus)
Gui, Add, Checkbox, vT6 y315 x60, T3: Tumor invades any of the following: 
Gui, Add, Checkbox, vT7 y335 x80, Postcricoid area
 Gui, Add, Checkbox, vT8 y335 x220, Pre-epiglottic space
Gui, Add, Checkbox, vT9 y355 x80, Paraglottic space
Gui, Add, Checkbox, vT10 y355 x220, Inner cortex of thyroid cartilage
Gui, Add, Checkbox, vT11 y375 x60, T4a: Moderately advanced local disease. Tumor invades:
Gui, Add, Checkbox, vT12 y395 x80, Through the outer cortex of thyroid cartilage.
 Gui, Add, Checkbox, vT13 y415 x80, Invades tissues beyond larynx.
Gui, Add, Checkbox, vT14 y435 x80, Trachea
 Gui, Add, Checkbox, vT15 y435 x150, Deep extrinsic muscle of the tongue
Gui, Add, Checkbox, vT16 y455 x80, Strap muscles
Gui, Add, Checkbox, vT17 y455 x190, Thyroid 
Gui, Add, Checkbox, vT18 y455 x256, Esophagus
Gui, Add, Checkbox, vT19 y475 x60, T4b: Very advanced local disease. Tumor invades:
Gui, Add, Checkbox, vT20 y495 x80, Prevertebral space
 Gui, Add, Checkbox, vT21 y495 x214, Encases carotid artery
Gui, Add, Checkbox, vT22 y495 x370, Mediastinal structures
Gui, Add, Checkbox, vT23 y520 x80, Others: 
 Gui, Add, Edit, vT24 y515 x147 w200

;

Gui, Add, GroupBox, w615 h325  y535 x30, Glottis
 Gui, Add, Checkbox, vT25 y555 x40, Glottis
 Gui, Add, Checkbox, vT26 y575 x60, T1: Tumor limited to the vocal cord(s) (may involve anterior or posterior commissure).
Gui, Add, Checkbox, vT27 y595 x80, T1a: Limited to one vocal cord.
Gui, Add, Checkbox, vT28 y615 x80, T1b: Involves both vocal cords.
Gui, Add, Checkbox, vT29 y635 x60, T2: Tumor extends to supraglottis and/or subglottis.
 Gui, Add, Checkbox, vT30 y655 x60, T3: Tumor limited to larynx with vocal cord fixation and/or invasion of
Gui, Add, Checkbox, vT31 y675 x80, Paraglottic space 
Gui, Add, Checkbox, vT32 y675 x220, Inner cortex of thyroid cartilage
Gui, Add, Checkbox, vT33 y695 x60, T4a: Moderately advanced local disease. Tumor invades:
Gui, Add, Checkbox, vT34 y715 x80, Through the outer cortex of thyroid cartilage.
 Gui, Add, Checkbox, vT35 y735 x80, Trachea
Gui, Add, Checkbox, vT36 y735 x155, Cricoid cartilage
 Gui, Add, Checkbox, vT37 y755 x80, Soft tissues of neck including deep extrinsic muscles of the tongue.
Gui, Add, Checkbox, vT38 y775 x80, Strap muscles
Gui, Add, Checkbox, vT39 y775 x190, Thyroid 
Gui, Add, Checkbox, vT40 y775 x256, Esophagus
Gui, Add, Checkbox, vT41 y795 x60, T4b: Very advanced local disease. Tumor invades:
Gui, Add, Checkbox, vT42 y815 x80, Prevertebral space
Gui, Add, Checkbox, vT43 y815 x214, Encases carotid artery
Gui, Add, Checkbox, vT44 y815 x370, Mediastinal structures
Gui, Add, Checkbox, vT45 y840 x80, Others: 
Gui, Add, Edit, vT46 y835 x147 w200
;

Gui, Add, GroupBox, w615 h265  y15 x680, Subglottis
 Gui, Add, Checkbox, vT47 y35 x690, Subglottis
 Gui, Add, Checkbox, vT48 y55 x710, T1: Tumor limited to the subglottis.
Gui, Add, Checkbox, vT49 y75 x710, T2: Tumor extends to vocal cord(s) with normal or impaired mobility.
Gui, Add, Checkbox, vT50 y95 x710, T3: Tumor limited to larynx and invasion of
Gui, Add, Checkbox, vT51 y115 x730, Paraglottic space 
Gui, Add, Checkbox, vT52 y115 x870, Inner cortex of thyroid cartilage
Gui, Add, Checkbox, vT53 y135 x710, T4a: Moderately advanced local disease. Tumor invades:
Gui, Add, Checkbox, vT54 y155 x730, Cricoid
 Gui, Add, Checkbox, vT55 y155 x800, Thyroid cartilage
Gui, Add, Checkbox, vT56 y155 x925, Trachea
 Gui, Add, Checkbox, vT57 y175 x730, Soft tissues of neck including deep extrinsic muscles of the tongue.
Gui, Add, Checkbox, vT58 y195 x730, Strap muscles
Gui, Add, Checkbox, vT59 y195 x840, Thyroid 
Gui, Add, Checkbox, vT60 y195 x906, Esophagus
Gui, Add, Checkbox, vT61 y215 x710, T4b: Very advanced local disease. Tumor invades:
Gui, Add, Checkbox, vT62 y235 x730, Prevertebral space
 Gui, Add, Checkbox, vT63 y235 x864, Encases carotid artery
Gui, Add, Checkbox, vT64 y235 x1020, Mediastinal structures
Gui, Add, Checkbox, vT65 y260 x730, Others: 
 Gui, Add, Edit, vT66 y255 x797 w200


;
;; ---------------Regional nodal metastasis---------------
  Gui, Font, s12 bold, Arial   ; 改大改粗體
  Gui, Add, Text, y290 x670, 3. Regional nodal metastasis
  Gui, Font ; 重置字體設置(不加這個 粗體改不回來)
  Gui, Font, s10, Arial   ; 恢復
 Gui, Add, Text, y290 x895, (
  Gui, Add, Checkbox, vNot y290 x903, Not assessable)
 Gui, Add, Checkbox, vNo y310 x690, No regional nodal metastasis.
 Gui, Add, Checkbox, vYes y330 x690, Yes. If yes, involved lymph nodes:
 Gui, Add, Checkbox, vY1 y350 x710, N1: Single ipsilateral lymph node <= 3 cm in greatest dimension and ENE(-).
 Gui, Add, Checkbox, vY2 y370 x710, N2a: Single ipsilateral lymph node > 3 cm, <= 6 cm in greatest dimension and ENE(-).
 Gui, Add, Checkbox, vY3 y390 x710, N2b: Multiple ipsilateral lymph nodes, <= 6 cm in greatest dimension and ENE(-).
Gui, Add, Checkbox, vY4 y410 x710, N2c: Bilateral or contralateral lymph nodes, <= 6 cm in greatest dimension and ENE(-)
Gui, Add, Checkbox, vY5 y430 x710, N3a: Metastasis in a lymph node > 6 cm in greatest dimension and ENE(-).
Gui, Add, Checkbox, vY6 y450 x710, N3b: Metastasis in any node(s) and clinically overt ENE(+).
  Gui, Add, Text, y475 x710, Maximal size of the largest positive node: 
 Gui, Add, Edit, vY7 y470 x958 w60
  Gui, Add, Text, y475 x1019, mm (long axis)
Gui, Add, Text, y495 x710, Location: Left level:
 Gui, Add, Checkbox, vY8 y495 x830, I
 Gui, Add, Checkbox, vY9 y495 x870, II
 Gui, Add, Checkbox, vY10 y495 x910, III
 Gui, Add, Checkbox, vY11 y495 x950, IV
 Gui, Add, Checkbox, vY12 y495 x990, V
 Gui, Add, Checkbox, vY13 y495 x1030, VI
 Gui, Add, Checkbox, vY14 y495 x1070, VII
Gui, Add, Text, y515 x758, Right level:

 Gui, Add, Checkbox, vY15 y515 x830, I
 Gui, Add, Checkbox, vY16 y515 x870, II
 Gui, Add, Checkbox, vY17 y515 x910, III
 Gui, Add, Checkbox, vY18 y515 x950, IV
 Gui, Add, Checkbox, vY19 y515 x990, V
 Gui, Add, Checkbox, vY20 y515 x1030, VI
 Gui, Add, Checkbox, vY21 y515 x1070, VII
 Gui, Add, Text, y540 x758, Others: 
 Gui, Add, Edit, vY22 y535 x815 w200
;
;; ---------------Distant Metastasis---------------
   Gui, Font, s12 bold, Arial   ; 改大改粗體
  Gui, Add, Text, y570 x670, 4. Distant metastasis
  Gui, Font ; 重置字體設置(不加這個 粗體改不回來)
  Gui, Font, s10, Arial   ; 恢復
  Gui, Add, Text, y570 x815, (in this study)
  Gui, Add, Checkbox, vDM0 y590 x690, No
 Gui, Add, Checkbox, vDM1 y615 x690, Equivocal, location: 
 Gui, Add, Edit, vDM2 y610 x824 w250
 Gui, Add, Checkbox, vDM3 y640 x690, Yes, location:
Gui, Add, Edit, vDM4 y635 x792 w250


 
; ---------------Other Findings---------------
 Gui, Font, s12 bold, Arial   ; 改大改粗體
 Gui, Add, Text, y670 x670, 5. Other findings
 Gui, Font ; 重置字體設置(不加這個 粗體改不回來)
 Gui, Font, s10, Arial   ; 恢復
 Gui, Add, Edit, vOF0 y690 x690 w500



; Buttons
 ;Gui, Font, s12 bold, Arial   ; 改大改粗體
 Gui, Add, Button, Default gGenerateReport y740 x670, Generate Report
 Gui, Add, Button, gExit y740 x800, Exit



; Show GUI
Gui, Show,  w1350 h880 x0 y0, Laryngeal Carcinoma Imaging Report Generator
return

; === 生成報告===
GenerateReport:
    ; Collect data from GUI
    Gui, Submit, NoHide
     ; 刪除現有的 test.txt 文件
    FileDelete, c:\temp\test.txt
    ; 將結果逐行輸入test.txt中
FormatTime, CurrentDate,, yyyy/MM/dd
FileAppend,  Addtional report for cancer staging on %CurrentDate% `n, c:\temp\test.txt    ; 輸入空白行幫助排版
FileAppend,   =========================================== `n, c:\temp\test.txt 
    FileAppend, MCH Imaging Report for Laryngeal Carcinoma (AJCC 8th)`n, c:\temp\test.txt
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
 FileAppend,  %4_Space%Location:  , c:\temp\test.txt
if L3 = 1
 {
   FileAppend,  %2_Space%■ Supraglottis:, c:\temp\test.txt
}
  if L3 = 0
 {
   FileAppend,  %2_Space%□ Supraglottis:,  c:\temp\test.txt
}
if L4= 1
 {
   FileAppend,  %2_Space%■ False vocal cords, c:\temp\test.txt
}
  if L4 = 0
 {
   FileAppend,  %2_Space%□ False vocal cords,  c:\temp\test.txt
}
if L5 = 1
 {
   FileAppend,  %2_Space%■ Arytenoids , c:\temp\test.txt
}
  if L5 = 0
 {
   FileAppend,  %2_Space%□ Arytenoids ,  c:\temp\test.txt
}
if L6 = 1
 {
   FileAppend,  %2_Space%■ Epiglottis `n, c:\temp\test.txt
}
  if L6 = 0
 {
   FileAppend,  %2_Space%□ Epiglottis `n,  c:\temp\test.txt
}
if L7= 1
 {
   FileAppend,  %12_Space%%12_Space%%12_Space%%12_Space%%2_Space%■ Aryepiglottic folds `n, c:\temp\test.txt
}
  if L7 = 0
 {
   FileAppend,  %12_Space%%12_Space%%12_Space%%12_Space%%2_Space%□ Aryepiglottic folds `n,  c:\temp\test.txt
}
if L8 = 1
 {
   FileAppend,  %12_Space%%12_Space%■ Glottis `n , c:\temp\test.txt
}
  if L8 = 0
 {
   FileAppend,  %12_Space%%12_Space%□ Glottis  `n ,  c:\temp\test.txt
}
if L9 = 1
 {
   FileAppend,  %12_Space%%12_Space%■ Subglottis `n , c:\temp\test.txt
}
  if L9 = 0
 {
   FileAppend,  %12_Space%%12_Space%□ Subglottis  `n ,  c:\temp\test.txt
}
if L10 = 1
 {
   FileAppend,  %12_Space%%12_Space%■ Others: __%L11%__  `n , c:\temp\test.txt
}
  if L10 = 0
 {
   FileAppend,  %12_Space%%12_Space%□ Others: __%L11%__  `n ,  c:\temp\test.txt
}

FileAppend,  %4_Space%Size: , c:\temp\test.txt
if L12 = 1
 {
   FileAppend,  %2_Space%■ Non-measurable, c:\temp\test.txt
}
  if L12 = 0
 {
   FileAppend,  %2_Space%□ Non-measurable,  c:\temp\test.txt
}
if L13 = 1
 {
   FileAppend,  %2_Space%■ Measurable: Largest diameter __%L14%__cm `n, c:\temp\test.txt
}
  if L13 = 0
 {
   FileAppend,  %2_Space%□ Measurable: Largest diameter__%L14%__cm `n,  c:\temp\test.txt
}   
FileAppend,  %3_Space%%24_Space%%24_Space%%24_Space% Thickness: __%L15%__cm `n,  c:\temp\test.txt
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
 {   ; T3 supraglottis的括號
   FileAppend,  %4_Space%■ Supraglottis `n, c:\temp\test.txt
if T4= 1
 {
   FileAppend,  %4_Space%■ T1: Tumor limited to one subsite of supraglottis. `n, c:\temp\test.txt
}
  if T4= 0
 {
   FileAppend,  %4_Space%□ T1: Tumor limited to one subsite of supraglottis. `n, c:\temp\test.txt
}
if T5= 1
 {
   FileAppend,  %4_Space%■ T2: Tumor invades at least 2 subsites of supraglottis or glottis or regions outside the supraglottis.`n, c:\temp\test.txt
}
  if T5= 0
 {
   FileAppend,  %4_Space%□ T2: Tumor invades at least 2 subsites of supraglottis or glottis or regions outside the supraglottis. `n, c:\temp\test.txt
}
   FileAppend,  %4_Space% (e.g.`,` mucosa of base of tongue`,` vallecula`,` medial wall of pyriform sinus) `n, c:\temp\test.txt



if T6= 1
 {
   FileAppend,  %4_Space%■ T3: Tumor invades any of the following:  `n, c:\temp\test.txt
}
  if T6= 0
 {
   FileAppend,  %4_Space%□ T3: Tumor invades any of the following:  `n, c:\temp\test.txt
}
if T7= 1
 {
   FileAppend,  %4_Space%%4_Space%■ Postcricoid area , c:\temp\test.txt
}
  if T7= 0
 {
   FileAppend,  %4_Space%%4_Space%□ Postcricoid area , c:\temp\test.txt
}
if T8= 1
 {
   FileAppend,  %2_Space%■ Pre-epiglottic space `n, c:\temp\test.txt
}
  if T8= 0
 {
   FileAppend,  %2_Space%□ Pre-epiglottic space `n, c:\temp\test.txt
}
if T9= 1
 {
   FileAppend,  %8_Space%■ Paraglottic space  `n, c:\temp\test.txt
}
  if T9= 0
 {
   FileAppend,  %8_Space%□ Paraglottic space   `n, c:\temp\test.txt
}
if T10= 1
 {
   FileAppend,  %8_Space%■ Inner cortex of thyroid cartilage `n , c:\temp\test.txt
}
  if T10= 0
 {
   FileAppend,  %8_Space%□ Inner cortex of thyroid cartilage `n, c:\temp\test.txt
}
if T11= 1
 {
   FileAppend,  %4_Space%■ T4a: Moderately advanced local disease. Tumor invades: `n, c:\temp\test.txt
}
  if T11= 0
 {   
FileAppend, %4_Space%□ T4a: Moderately advanced local disease. Tumor invades: `n, c:\temp\test.txt
}
if T12= 1
 {
   FileAppend,  %8_Space%■ Through the outer cortex of thyroid cartilage. `n, c:\temp\test.txt
}
  if T12= 0
 {
   FileAppend,  %8_Space%□ Through the outer cortex of thyroid cartilage. `n, c:\temp\test.txt
}
if T13= 1
 {
   FileAppend,  %8_Space%■ Invades tissues beyond larynx. `n , c:\temp\test.txt
}
  if T13= 0
 {
   FileAppend,  %8_Space%□ Invades tissues beyond larynx. `n , c:\temp\test.txt
}
if T14= 1
 {
   FileAppend, %8_Space%■ Trachea   , c:\temp\test.txt
}
  if T14= 0
 {
   FileAppend,  %8_Space%□ Trachea  , c:\temp\test.txt
}
if T15= 1
 {
   FileAppend, %2_Space%■  Deep extrinsic muscle of the tongue `n, c:\temp\test.txt
}
  if T15= 0
 {
   FileAppend,  %2_Space%□ Deep extrinsic muscle of the tongue `n, c:\temp\test.txt
}
if T16= 1
 {
   FileAppend, %8_Space%■  Strap muscles, c:\temp\test.txt
}
  if T16= 0
 {
   FileAppend,  %8_Space%□  Strap muscles, c:\temp\test.txt
}
if T17= 1
 {
   FileAppend,  %2_Space%■ Thyroid , c:\temp\test.txt
}
  if T17= 0
 {
   FileAppend,  %2_Space%□ Thyroid , c:\temp\test.txt
}
if T18= 1
 {
   FileAppend,  %2_Space%■ Esophagus `n, c:\temp\test.txt
}
  if T18= 0
 {
   FileAppend,  %2_Space%□ Esophagus `n, c:\temp\test.txt
}
if T19= 1
 {
   FileAppend,  %4_Space%■ T4b: Very advanced local disease. Tumor invades: `n, c:\temp\test.txt
}
  if T19= 0
 {
   FileAppend,  %4_Space%□ T4b: Very advanced local disease. Tumor invades: `n, c:\temp\test.txt
}
if T20= 1
 {
   FileAppend,  %4_Space%%4_Space%■ Prevertebral space, c:\temp\test.txt
}
  if T20= 0
 {
   FileAppend,  %4_Space%%4_Space%□ Prevertebral space, c:\temp\test.txt
}
if T21= 1
 {
   FileAppend,  %2_Space%■ Encases carotid artery, c:\temp\test.txt
}
  if T21= 0
 {
   FileAppend,  %2_Space%□ Encases carotid artery, c:\temp\test.txt
}
if T22= 1
 {
   FileAppend,  %2_Space%■ Mediastinal structures `n, c:\temp\test.txt
}
  if T22= 0
 {
   FileAppend,  %2_Space%□ Mediastinal structures`n, c:\temp\test.txt
}
if T23= 1
 {
   FileAppend,  %4_Space%%4_Space%■ Others: __%T24%__ `n, c:\temp\test.txt
}
  if T23= 0
 {
   FileAppend,  %4_Space%%4_Space%□ Others: __%T24%__ `n, c:\temp\test.txt
}

}    ; T3 supraglottis的括號

; =============================
if T25= 1
 {   ; T25 glottis的括號
   FileAppend,  %4_Space%■ Glottis `n, c:\temp\test.txt

if T26= 1
 {
   FileAppend,  %4_Space%■ T1: Tumor limited to the vocal cord(s) (may involve anterior or posterior commissure). `n, c:\temp\test.txt
}
  if T26= 0
 {
   FileAppend,  %4_Space%□ T1: Tumor limited to the vocal cord(s) (may involve anterior or posterior commissure). `n, c:\temp\test.txt
}
if T27= 1
 {
   FileAppend,  %8_Space%■ T1a: Limited to one vocal cord. `n, c:\temp\test.txt
}
  if T27= 0
 {
   FileAppend,  %8_Space%□ T1a: Limited to one vocal cord.  `n, c:\temp\test.txt
}
if T28= 1
 {
   FileAppend,  %8_Space%■  T1b: Involves both vocal cords. `n, c:\temp\test.txt
}
  if T28= 0
 {
   FileAppend,  %8_Space%□ T1b: Involves both vocal cords.  `n, c:\temp\test.txt
}

if T29= 1
 {
   FileAppend,  %4_Space%■ T2: Tumor extends to supraglottis and/or subglottis.  `n, c:\temp\test.txt
}
  if T29= 0
 {
   FileAppend,  %4_Space%□ T2: Tumor extends to supraglottis and/or subglottis.  `n, c:\temp\test.txt
}
if T30= 1
 {
   FileAppend,  %4_Space%■ T3: Tumor limited to larynx with vocal cord fixation and/or invasion of  `n, c:\temp\test.txt
}
  if T30= 0
 {
   FileAppend,  %4_Space%□ T3: Tumor limited to larynx with vocal cord fixation and/or invasion of `n, c:\temp\test.txt
}
if T31= 1
 {
   FileAppend,  %8_Space%■ Paraglottic space  , c:\temp\test.txt
}
  if T31= 0
 {
   FileAppend,  %8_Space%□ Paraglottic space  , c:\temp\test.txt
}
if T32= 1
 {
   FileAppend,  %2_Space%■ Inner cortex of thyroid cartilage `n, c:\temp\test.txt
}
  if T32= 0
 {
   FileAppend,  %2_Space%□ Inner cortex of thyroid cartilage `n, c:\temp\test.txt
}
if T33= 1
 {
   FileAppend,  %4_Space%■ T4a: Moderately advanced local disease. Tumor invades:  `n, c:\temp\test.txt
}
  if T33= 0
 {
   FileAppend,  %4_Space%□ T4a: Moderately advanced local disease. Tumor invades:   `n, c:\temp\test.txt
}
if T34= 1
 {
   FileAppend,  %8_Space%■ Through the outer cortex of thyroid cartilage. `n, c:\temp\test.txt
}
  if T34= 0
 {
   FileAppend,  %8_Space%□ Through the outer cortex of thyroid cartilage. `n, c:\temp\test.txt
}
if T35= 1
 {
   FileAppend,  %8_Space%■ Trachea  , c:\temp\test.txt
}
  if T35= 0
 {
   FileAppend,  %8_Space%□ Trachea , c:\temp\test.txt
}
if T36= 1
 {
   FileAppend,  %8_Space%■ Cricoid cartilage `n  , c:\temp\test.txt
}
  if T36= 0
 {
   FileAppend,  %8_Space%□ Cricoid cartilage `n , c:\temp\test.txt
}
if T37= 1
 {
   FileAppend, %8_Space%■ Soft tissues of neck including deep extrinsic muscles of the tongue. `n  , c:\temp\test.txt
}
  if T37= 0
 {
   FileAppend,  %8_Space%□ Soft tissues of neck including deep extrinsic muscles of the tongue. `n  , c:\temp\test.txt
}
if T38= 1
 {
   FileAppend, %8_Space%■  Strap muscles, c:\temp\test.txt
}
  if T38= 0
 {
   FileAppend,  %8_Space%□  Strap muscles, c:\temp\test.txt
}
if T39= 1
 {
   FileAppend,  %2_Space%■ Thyroid , c:\temp\test.txt
}
  if T39= 0
 {
   FileAppend,  %2_Space%□ Thyroid , c:\temp\test.txt
}
if T40= 1
 {
   FileAppend,  %2_Space%■ Esophagus `n, c:\temp\test.txt
}
  if T40= 0
 {
   FileAppend,  %2_Space%□ Esophagus `n, c:\temp\test.txt
}
if T41= 1
 {
   FileAppend,  %4_Space%■ T4b: Very advanced local disease. Tumor invades: `n, c:\temp\test.txt
}
  if T41= 0
 {
   FileAppend,  %4_Space%□ T4b: Very advanced local disease. Tumor invades: `n, c:\temp\test.txt
}
if T42= 1
 {
   FileAppend,  %4_Space%%4_Space%■ Prevertebral space, c:\temp\test.txt
}
  if T42= 0
 {
   FileAppend,  %4_Space%%4_Space%□ Prevertebral space, c:\temp\test.txt
}
if T43= 1
 {
   FileAppend,  %2_Space%■ Encases carotid artery, c:\temp\test.txt
}
  if T43= 0
 {
   FileAppend,  %2_Space%□ Encases carotid artery, c:\temp\test.txt
}
if T44= 1
 {
   FileAppend,  %2_Space%■ Mediastinal structures `n, c:\temp\test.txt
}
  if T44= 0
 {
   FileAppend,  %2_Space%□ Mediastinal structures`n, c:\temp\test.txt
}
if T45= 1
 {
   FileAppend,  %4_Space%%4_Space%■ Others: __%T46%__ `n, c:\temp\test.txt
}
  if T45= 0
 {
   FileAppend,  %4_Space%%4_Space%□ Others: __%T46%__ `n, c:\temp\test.txt
}

}    ; T25 glottis的括號
; =============================

if T47= 1
 {   ; T47 subglottis的括號
   FileAppend,  %4_Space%■ Subglottis `n, c:\temp\test.txt

  

 
if T48= 1
 {
   FileAppend,  %4_Space%■ T1: T1: Tumor limited to the subglottis. `n, c:\temp\test.txt
}
  if T48= 0
 {
   FileAppend,  %4_Space%□ T1: Tumor limited to the subglottis. `n, c:\temp\test.txt
}
if T49= 1
 {
   FileAppend,  %4_Space%■ T2: Tumor extends to vocal cord(s) with normal or impaired mobility.  `n, c:\temp\test.txt
}
  if T49= 0
 {
   FileAppend,  %4_Space%□ T2: Tumor extends to vocal cord(s) with normal or impaired mobility.  `n, c:\temp\test.txt
}
if T50= 1
 {
   FileAppend,  %4_Space%■  T3: Tumor limited to larynx and invasion of  `n, c:\temp\test.txt
}
  if T50= 0
 {
   FileAppend,  %4_Space%□  T3: Tumor limited to larynx and invasion of `n, c:\temp\test.txt
}
if T51= 1
 {
   FileAppend,  %8_Space%■ Paraglottic space  , c:\temp\test.txt
}
  if T51= 0
 {
   FileAppend,  %8_Space%□ Paraglottic space  , c:\temp\test.txt
}
if T52= 1
 {
   FileAppend,  %2_Space%■ Inner cortex of thyroid cartilage `n, c:\temp\test.txt
}
  if T52= 0
 {
   FileAppend,  %2_Space%□ Inner cortex of thyroid cartilage `n, c:\temp\test.txt
}
if T53= 1
 {
   FileAppend,  %4_Space%■ T4a: Moderately advanced local disease. Tumor invades:  `n, c:\temp\test.txt
}
  if T53= 0
 {
   FileAppend,  %4_Space%□ T4a: Moderately advanced local disease. Tumor invades:   `n, c:\temp\test.txt
}
if T54= 1
 {
   FileAppend,  %8_Space%■ Cricoid , c:\temp\test.txt
}
  if T54= 0
 {
   FileAppend,  %8_Space%□ Cricoid, c:\temp\test.txt
}
if T55= 1
 {
   FileAppend,  %2_Space%■ Thyroid cartilage , c:\temp\test.txt
}
  if T55= 0
 {
   FileAppend,  %2_Space%□ Thyroid cartilage , c:\temp\test.txt
}
if T56= 1
 {
   FileAppend,  %2_Space%■ Trachea `n , c:\temp\test.txt
}
  if T56= 0
 {
   FileAppend,  %2_Space%□ Trachea `n , c:\temp\test.txt
}
if T57= 1
 {
   FileAppend,  %8_Space%■ Soft tissues of neck including deep extrinsic muscles of the tongue. `n  , c:\temp\test.txt
}
  if T57= 0
 {
   FileAppend,  %8_Space%□ Soft tissues of neck including deep extrinsic muscles of the tongue. `n , c:\temp\test.txt
}
if T58= 1
 {
   FileAppend, %8_Space%■  Strap muscles, c:\temp\test.txt
}
  if T58= 0
 {
   FileAppend,  %8_Space%□  Strap muscles, c:\temp\test.txt
}
if T59= 1
 {
   FileAppend,  %2_Space%■ Thyroid , c:\temp\test.txt
}
  if T59= 0
 {
   FileAppend,  %2_Space%□ Thyroid , c:\temp\test.txt
}
if T60= 1
 {
   FileAppend,  %2_Space%■ Esophagus `n, c:\temp\test.txt
}
  if T60= 0
 {
   FileAppend,  %2_Space%□ Esophagus `n, c:\temp\test.txt
}
if T61= 1
 {
   FileAppend,  %4_Space%■ T4b: Very advanced local disease. Tumor invades: `n, c:\temp\test.txt
}
  if T61= 0
 {
   FileAppend,  %4_Space%□ T4b: Very advanced local disease. Tumor invades: `n, c:\temp\test.txt
}
if T62= 1
 {
   FileAppend,  %4_Space%%4_Space%■ Prevertebral space, c:\temp\test.txt
}
  if T62= 0
 {
   FileAppend,  %4_Space%%4_Space%□ Prevertebral space, c:\temp\test.txt
}
if T63= 1
 {
   FileAppend,  %2_Space%■ Encases carotid artery, c:\temp\test.txt
}
  if T63= 0
 {
   FileAppend,  %2_Space%□ Encases carotid artery, c:\temp\test.txt
}
if T64= 1
 {
   FileAppend,  %2_Space%■ Mediastinal structures `n, c:\temp\test.txt
}
  if T64= 0
 {
   FileAppend,  %2_Space%□ Mediastinal structures`n, c:\temp\test.txt
}
if T65= 1
 {
   FileAppend,  %4_Space%%4_Space%■ Others: __%T66%__ `n, c:\temp\test.txt
}
  if T65= 0
 {
   FileAppend,  %4_Space%%4_Space%□ Others: __%T66%__ `n, c:\temp\test.txt
}

}    ; T47 subglottis的括號
; =============================

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
