; Lung cancer Imaging Report Generator
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

; ---------------Tumor Location and Size---------------
Gui, Font, s12 bold, Arial   ; 改大改粗體
Gui, Add, Text, y15 x20, Tumor location / Size
Gui, Font ; 重置字體設置(不加這個 粗體改不回來)
Gui, Font, s10, Arial   ; 恢復
Gui, Add, Text, y18 x183, (
Gui, Add, Checkbox, vTLS y18 x190, Not assessable)

Gui, Font, s12 bold, Arial   ; 改大改粗體
Gui, Add, Text, y35 x40, Location:
Gui, Font ; 重置字體設置(不加這個 粗體改不回來)
Gui, Font, s10, Arial   ; 恢復
Gui, Add, Checkbox, vRUL y38 x120, RUL
Gui, Add, Checkbox, vRML y38 x170, RML
Gui, Add, Checkbox, vRLL y38 x220, RLL
Gui, Add, Checkbox, vLUL y38 x270, LUL
Gui, Add, Checkbox, vLLL y38 x320, LLL
Gui, Add, Checkbox, vOther y38 x370, Other:
Gui, Add, Edit, vOther1 y32 x430 w80
Gui, Font, s12 bold, Arial   ; 改大改粗體
Gui, Add, Text, y55 x40, Size:
Gui, Font ; 重置字體設置(不加這個 粗體改不回來)
Gui, Font, s10, Arial   ; 恢復
Gui, Add, Checkbox, vNonM y58 x90, Non-measurable
Gui, Add, Checkbox, vMeas1 y58 x220, Measurable: 
Gui, Add, Edit, vMeas y52 x315 w60
Gui, Add, Text, y58 x383, cm(greatest dimension)
; ---------------Tumor invasion---------------
Gui, Font, s12 bold, Arial   ; 改大改粗體
Gui, Add, Text, y80 x20, Tumor Invasion
Gui, Font ; 重置字體設置(不加這個 粗體改不回來)
Gui, Font, s10, Arial   ; 恢復
Gui, Add, Text, y82 x140, (
Gui, Add, Checkbox, vNonM1 y82 x145, Not assessable)
Gui, Add, Checkbox, vNoE y100 x40, No or Equivocal 
Gui, Add, Checkbox, vYes y120 x40, Yes, if yes:
Gui, Add, Text, y140 x40, T1
Gui, Add, Text, y160 x60, Tumor <= 3cm: 
Gui, Add, Checkbox, vT1a y180 x80, Tumor <=1cm(T1a)
Gui, Add, Checkbox, vT1b y180 x220, 1cm<Tumor <=2cm(T1b)
Gui, Add, Checkbox, vT1c y180 x400, 2cm<Tumor <=3cm(T1c)
Gui, Add, Checkbox, vT1d y200 x60, Surrounded by lung or visceral pleura
Gui, Add, Checkbox, vT13 y200 x310, Not more proximal than lobar bronchus
Gui, Add, Text, y220 x40, T2
Gui, Add, Text, y240 x60, 3cm<Tumor <= 5cm:
Gui, Add, Checkbox, vT2a y260 x80, 3cm<Tumor <=4cm(T2a)
Gui, Add, Checkbox, vT2b y260 x250, 4cm<Tumor <=5cm(T2b)
Gui, Add, Checkbox, vT2c y280 x60, involves the main bronchus
Gui, Add, Checkbox, vT2d y280 x250, invades visceral pleura
Gui, Add, Checkbox, vT2e y300 x60, Atelectasis or obstructive pneumonitis to hilum (focal or total)
Gui, Add, Text, y320 x40, T3
Gui, Add, Checkbox, vT3a y340 x60, 5cm<Tumor <=7cm
Gui, Add, Checkbox, vT3b y360 x60, Invasion of 
Gui, Add, Checkbox, vT3c y380 x80, parietal pleura
Gui, Add, Checkbox, vT3d y380 x190, chest wall
Gui, Add, Checkbox, vT3e y380 x275, phrenic nerve
Gui, Add, Checkbox, vT3f y380 x380, parietal pericardium
Gui, Add, Checkbox, vT3g y400 x60, Separate tumor nodule(s) in same lobe
Gui, Add, Text, y420 x40, T4
Gui, Add, Checkbox, vT4a y440 x60, Tumor >7cm
Gui, Add, Checkbox, vT4b y460 x60, Invasion of 
Gui, Add, Checkbox, vT4c y480 x80, diaphragm
Gui, Add, Checkbox, vT4d y480 x165, mediastinum
Gui, Add, Checkbox, vT4e y480 x260, heart
Gui, Add, Checkbox, vT4f y480 x315, great vessels
Gui, Add, Checkbox, vT4g y480 x415, trachea
Gui, Add, Checkbox, vT4h y500 x80, recurrent laryngeal nerve 
Gui, Add, Checkbox, vT4i y500 x250, esophagus
Gui, Add, Checkbox, vT4j y500 x345, vertebral body
Gui, Add, Checkbox, vT4k y500 x455, carina
Gui, Add, Checkbox, vT4l y520 x60, Separate tumor nodule(s) in a different lobe of the ipsilateral lung
; ---------------Regional nodal metastasis---------------
Gui, Font, s12 bold, Arial   ; 改大改粗體
Gui, Add, Text, y545 x20, Regional nodal metastasis
Gui, Font ; 重置字體設置(不加這個 粗體改不回來)
Gui, Font, s10, Arial   ; 恢復
Gui, Add, Checkbox, vNo y565 x40, No
Gui, Add, Checkbox, vNequ y585 x40, Equivocal, location: 
Gui, Add, Checkbox, vNip y605 x60, Ipilateral peribronchieal LNs
Gui, Add, Checkbox, vNih y605 x240, Ipsilateral hilar LNS
Gui, Add, Checkbox, vNipu y605 x375, Intrapulmonary Nodes
Gui, Add, Checkbox, vNsub y625 x60, Ipsilateral mediastinal and/or subcarinal LNs
Gui, Add, Checkbox, vNch y645 x60, Contralateral hilar LNs
Gui, Add, Checkbox, vNcm y645 x213, Contrallateral mediastinal LNs 
Gui, Add, Checkbox, vNsc y645 x410, Supraclavicular LNs
Gui, Add, Checkbox, vNis y665 x60, Ipsilateral or contralateral scalene

Gui, Add, Checkbox, vNyes y685 x40, Yes, location: 
Gui, Add, Text, y705 x60, N1:
Gui, Add, Checkbox, vNyip y705 x85, Ipilateral peribronchieal LNs
Gui, Add, Checkbox, vNyih y705 x265, Ipsilateral hilar LNS
Gui, Add, Checkbox, vNyipu y705 x400, Intrapulmonary Nodes
Gui, Add, Text, y725 x60, N2:
Gui, Add, Checkbox, vNysub y725 x85, Ipsilateral mediastinal and/or subcarinal LNs
Gui, Add, Text, y745 x60, N3:
Gui, Add, Checkbox, vNych y745 x85, Contralateral hilar LNs
Gui, Add, Checkbox, vNycm y745 x238, Contrallateral mediastinal LNs 
Gui, Add, Checkbox, vNysc y745 x435, Supraclavicular LNs
Gui, Add, Checkbox, vNyis y765 x85, Ipsilateral or contralateral scalene

; ---------------Distant Metastasis---------------
  Gui, Font, s12 bold, Arial   ; 改大改粗體
Gui, Add, Text, y790 x20, Distant metastasis
Gui, Font ; 重置字體設置(不加這個 粗體改不回來)
Gui, Font, s10, Arial   ; 恢復
Gui, Add, Text, y792 x165, (in this study)
Gui, Add, Checkbox, vDM0 y810 x40, No
Gui, Add, Checkbox, vDM1 y830 x40, Yes or Equivocal: 
  Gui, Font, s12 bold, Arial   ; 改大改粗體
Gui, Add, Text, y850 x40, Thoracic
Gui, Font ; 重置字體設置(不加這個 粗體改不回來)
Gui, Font, s10, Arial   ; 恢復
Gui, Add, Checkbox, vMT1 y870 x60, Yes
Gui, Add, Checkbox, vMT2 y870 x105, equivocal: Separate tumor nodule(s) in a contralateral lobe(M1a)
Gui, Add, Checkbox, vMT3 y890 x60, Yes
Gui, Add, Checkbox, vMT4 y890 x105, equivocal: Pleural nodules or malignant pleural or pericardial effusion(M1a)

  Gui, Font, s12 bold, Arial   ; 改大改粗體
Gui, Add, Text, y910 x40, Extrathoracic
Gui, Font ; 重置字體設置(不加這個 粗體改不回來)
Gui, Font, s10, Arial   ; 恢復
Gui, Add, Checkbox, vME1 y930 x60, Yes
Gui, Add, Checkbox, vME2 y930 x105, equivocal: Singal lesions(M1b), Location: 
Gui, Add, Edit, vME5 y925 x365 w140
Gui, Add, Checkbox, vME3 y960 x60, Yes
Gui, Add, Checkbox, vME4 y960 x105, equivocal: Multiple lesions(M1c), Location: 
Gui, Add, Edit, vME6 y955 x375 w130

; ---------------Other Findings---------------
  Gui, Font, s12 bold, Arial   ; 改大改粗體
Gui, Add, Text, y980 x20, Other findings
Gui, Font ; 重置字體設置(不加這個 粗體改不回來)
Gui, Font, s10, Arial   ; 恢復
Gui, Add, Edit, vOF0 y1000 x20 w500

; Buttons
Gui, Font, s12 bold, Arial   ; 改大改粗體
Gui, Add, Button, Default gGenerateReport y1050 x20, Generate Report
Gui, Add, Button, gExit y1050 x170, Exit

; Show GUI
Gui, Show, w600 h1100 x0 y0, Lung Cancer Imaging Report Generator
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
    FileAppend, MCH Imaging Report for Lung Carcinoma (AJCC 8th)  `n, c:\temp\test.txt
    FileAppend,    `n, c:\temp\test.txt    ; 輸入空白行幫助排版
    FileAppend, *本表單僅依據單次影像進行分期供腫瘤團隊參考，並不代表病人的臨床分期，臨床分期需綜合病人臨床發現、各種影像(包括各種內視鏡及超音波檢查)及病理表現來進行判斷，病人的最終臨床分期可能因癌症團隊討論有所異動，敬請參閱病歷首頁。`n, c:\temp\test.txt
    FileAppend,   %2_Space% `n, c:\temp\test.txt    ; 輸入空白行幫助排版
;-------------------------------------------------------------

;--------------第二段-----------------------------------------------
    FileAppend,  1. %1_Space%Tumor location / Size ( , c:\temp\test.txt  
if TLS = 1
 {
   FileAppend,  ■ Not assessable)  `n, c:\temp\test.txt
}
  if TLS = 0
 {
   FileAppend,  □ Not assessable)  `n, c:\temp\test.txt
}
    FileAppend, %4_Space%Location:  , c:\temp\test.txt
if RUL = 1
 {
   FileAppend,  %1_Space%■ RUL %2_Space%, c:\temp\test.txt
}
  if RUL = 0
 {
   FileAppend,  %1_Space%□ RUL %2_Space%, c:\temp\test.txt
}
if RML = 1
 {
   FileAppend,  ■ RML %2_Space%, c:\temp\test.txt
}
  if RML = 0
 {
   FileAppend,  □ RML %2_Space%, c:\temp\test.txt
}
if RLL = 1
 {
   FileAppend,  ■ RLL %2_Space%, c:\temp\test.txt
}
  if RLL = 0
 {
   FileAppend,  □ RLL %2_Space%, c:\temp\test.txt
}
if LUL = 1
 {
   FileAppend,  ■ LUL %2_Space%, c:\temp\test.txt
}
  if LUL = 0
 {
   FileAppend,  □ LUL %2_Space%, c:\temp\test.txt
}  
if LLL = 1
 {
   FileAppend,  ■ LLL %2_Space%, c:\temp\test.txt
}
  if LLL = 0
 {
   FileAppend,  □ LLL %2_Space%, c:\temp\test.txt
}  
if Other = 1
 {
   FileAppend,  ■ Other:%1_Space%, c:\temp\test.txt
}
  if Other = 0
 {
   FileAppend,  □ Other:%1_Space%, c:\temp\test.txt
}  

  FileAppend,__%Other1%__ `n, c:\temp\test.txt
   FileAppend, %4_Space%Size:  , c:\temp\test.txt
if NonM = 1
 {
   FileAppend,  %1_Space%■ Non-measurable %2_Space%, c:\temp\test.txt
}
  if NonM = 0
 {
   FileAppend,  %1_Space%□ Non-measurable %2_Space%, c:\temp\test.txt
}
if Meas1 = 1
 {
   FileAppend,  %1_Space%■ Measurable: %1_Space%, c:\temp\test.txt
}
  if Meas1 = 0
 {
   FileAppend,  %1_Space%□ Measurable: %1_Space%, c:\temp\test.txt
}
  FileAppend,__%Meas%__ cm(greatest dimension)`n, c:\temp\test.txt
FileAppend,   %2_Space% `n, c:\temp\test.txt    ; 輸入空白行幫助排版
    
;--------------第三段-----------------------------------------------
FileAppend,  2. %1_Space%Tumor invasion( , c:\temp\test.txt  
if NonM1= 1
 {
   FileAppend,  ■ Not assessable) %1_Space% `n, c:\temp\test.txt
}
  if NonM1= 0
 {
   FileAppend,  □ Not assessable)%1_Space% `n, c:\temp\test.txt
}
If NoE= 1
 {
   FileAppend,  %4_Space%■ No or Equivocal `n , c:\temp\test.txt
}
  if NoE= 0
 {
   FileAppend,  %4_Space%□ No or Equivocal `n , c:\temp\test.txt
}
If Yes= 1
 {
   FileAppend,  
(
%4_Space%■ Yes, if yes:  `n
), c:\temp\test.txt
}
  if yes= 0
 {
   FileAppend, 
(
 %4_Space%□ Yes, if yes: `n
) , c:\temp\test.txt
}
   FileAppend,  %4_Space%T1 `n , c:\temp\test.txt
   FileAppend,  %4_Space%%4_Space%Tumor<=3cm: `n , c:\temp\test.txt
If T1a= 1
 {
   FileAppend,  %4_Space%%4_Space%%2_Space%■ Tumor <=1cm(T1a) , c:\temp\test.txt
}
  if T1a= 0
 {
   FileAppend,  %4_Space%%4_Space%%2_Space%□ Tumor <=1cm(T1a) , c:\temp\test.txt
}
If T1b= 1
 {
   FileAppend,  %2_Space%■ 1cm<Tumor <=2cm(T1b) , c:\temp\test.txt
}
  if T1b= 0
 {
   FileAppend,  %2_Space%□ 1cm<Tumor <=2cm(T1b) , c:\temp\test.txt
}
If T1c= 1
 {
   FileAppend,  %2_Space%■ 2cm<Tumor <=3cm(T1c)`n , c:\temp\test.txt
}
  if T1c= 0
 {
   FileAppend,  %2_Space%□ 2cm<Tumor <=3cm(T1c)`n , c:\temp\test.txt
}

If T1d= 1
 {
   FileAppend,  %4_Space%%4_Space%■ Surrounded by lung or visceral pleura , c:\temp\test.txt
}
  if T1d= 0
 {
   FileAppend,  %4_Space%%4_Space%□ Surrounded by lung or visceral pleura , c:\temp\test.txt
}
If T13= 1
 {
   FileAppend,  %4_Space%■ Not more proximal than lobar bronchus `n , c:\temp\test.txt
}
  if T13= 0
 {
   FileAppend,  %4_Space%□ Not more proximal than lobar bronchus `n , c:\temp\test.txt
}
   FileAppend,  %4_Space%T2 `n , c:\temp\test.txt
   FileAppend,  %4_Space%%4_Space%3cm<Tumor <= 5cm: `n , c:\temp\test.txt
If T2a= 1
 {
   FileAppend,  %4_Space%%4_Space%%2_Space%■ 3cm<Tumor <=4cm(T2a) , c:\temp\test.txt
}
  if T2a= 0
 {
   FileAppend,  %4_Space%%4_Space%%2_Space%□ 3cm<Tumor <=4cm(T2a) , c:\temp\test.txt
}
If T2b= 1
 {
   FileAppend,  %4_Space%■ 4cm<Tumor <=5cm(T2b) `n , c:\temp\test.txt
}
  if T2b= 0
 {
   FileAppend,  %4_Space%□ 4cm<Tumor <=5cm(T2b) `n , c:\temp\test.txt
}
If T2c= 1
 {
   FileAppend,  %4_Space%%4_Space%■ involves the main bronchus , c:\temp\test.txt
}
  if T2c= 0
 {
   FileAppend,  %4_Space%%4_Space%□ involves the main bronchus , c:\temp\test.txt
}
If T2d= 1
 {
   FileAppend,  %4_Space%■ invades visceral pleura `n , c:\temp\test.txt
}
  if T2d= 0
 {
   FileAppend,  %4_Space%□ invades visceral pleura `n , c:\temp\test.txt
}
If T2e= 1
 {
   FileAppend,  %4_Space%%4_Space%■ Atelectasis or obstructive pneumonitis to hilum (focal or total) `n , c:\temp\test.txt
}
  if T2e= 0
 {
   FileAppend,  %4_Space%%4_Space%□ Atelectasis or obstructive pneumonitis to hilum (focal or total) `n , c:\temp\test.txt
}
   FileAppend,  %4_Space%T3 `n , c:\temp\test.txt
If T3a= 1
 {
   FileAppend,  %4_Space%%4_Space%■ 5cm<Tumor <=7cm `n, c:\temp\test.txt
}
  if T3a= 0
 {
   FileAppend,  %4_Space%%4_Space%□ 5cm<Tumor <=7cm `n , c:\temp\test.txt
}
If T3b= 1
 {
   FileAppend,  %4_Space%%4_Space%■ Invasion of  `n , c:\temp\test.txt
}
  if T3b= 0
 {
   FileAppend,  %4_Space%%4_Space%□ Invasion of  `n , c:\temp\test.txt
}
If T3c= 1
 {
   FileAppend,  %4_Space%%4_Space%%2_Space%■ parietal pleura , c:\temp\test.txt
}
  if T3c= 0
 {
   FileAppend,  %4_Space%%4_Space%%2_Space%□ parietal pleura , c:\temp\test.txt
}
If T3d= 1
 {
   FileAppend,  %4_Space%■ chest wall , c:\temp\test.txt
}
  if T3d= 0
 {
   FileAppend,  %4_Space%□ chest wall , c:\temp\test.txt
}
If T3e= 1
 {
   FileAppend,  %4_Space%■ phrenic nerve , c:\temp\test.txt
}
  if T3e= 0
 {
   FileAppend,  %4_Space%□ phrenic nerve , c:\temp\test.txt
}
If T3f= 1
 {
   FileAppend,  %4_Space%■ parietal pericardium`n , c:\temp\test.txt
}
  if T3f= 0
 {
   FileAppend,  %4_Space%□ parietal pericardium`n, c:\temp\test.txt
}
If T3g= 1
 {
   FileAppend,  %4_Space%%4_Space%■ Separate tumor nodule(s) in same lobe `n , c:\temp\test.txt
}
  if T3g= 0
 {
   FileAppend,  %4_Space%%4_Space%□ Separate tumor nodule(s) in same lobe `n, c:\temp\test.txt
}

   FileAppend,  %4_Space%T4 `n , c:\temp\test.txt
If T4a= 1
 {
   FileAppend,  %4_Space%%4_Space%■ Tumor >7cm `n, c:\temp\test.txt
}
  if T4a= 0
 {
   FileAppend,  %4_Space%%4_Space%□ Tumor >7cm `n , c:\temp\test.txt
}
If T4b= 1
 {
   FileAppend,  %4_Space%%4_Space%■ Invasion of  `n , c:\temp\test.txt
}
  if T4b= 0
 {
   FileAppend,  %4_Space%%4_Space%□ Invasion of  `n , c:\temp\test.txt
}
If T4c= 1
 {
   FileAppend,  %4_Space%%4_Space%%2_Space%■ diaphragm , c:\temp\test.txt
}
  if T4c= 0
 {
   FileAppend,  %4_Space%%4_Space%%2_Space%□ diaphragm , c:\temp\test.txt
}
If T4d= 1
 {
   FileAppend,  %4_Space%■ mediastinum , c:\temp\test.txt
}
  if T4d= 0
 {
   FileAppend,  %4_Space%□ mediastinum , c:\temp\test.txt
}
If T4e= 1
 {
   FileAppend,  %4_Space%■ heart , c:\temp\test.txt
}
  if T4e= 0
 {
   FileAppend,  %4_Space%□ heart , c:\temp\test.txt
}
If T4f= 1
 {
   FileAppend,  %4_Space%■ great vessels , c:\temp\test.txt
}
  if T4f= 0
 {
   FileAppend,  %4_Space%□ great vessels, c:\temp\test.txt
}
If T4g= 1
 {
   FileAppend,  %4_Space%■ trachea`n , c:\temp\test.txt
}
  if T4g= 0
 {
   FileAppend,  %4_Space%□ trachea`n, c:\temp\test.txt
}
If T4h= 1
 {
   FileAppend,  %4_Space%%4_Space%%2_Space%■ recurrent laryngeal nerve , c:\temp\test.txt
}
  if T4h= 0
 {
   FileAppend,  %4_Space%%4_Space%%2_Space%□ recurrent laryngeal nerve , c:\temp\test.txt
}
If T4i= 1
 {
   FileAppend,  %4_Space%■ esophagus , c:\temp\test.txt
}
  if T4i= 0
 {
   FileAppend,  %4_Space%□ esophagus , c:\temp\test.txt
}
If T4j= 1
 {
   FileAppend,  %4_Space%■ vertebral body , c:\temp\test.txt
}
  if T4j= 0
 {
   FileAppend,  %4_Space%□ vertebral body, c:\temp\test.txt
}
If T4k= 1
 {
   FileAppend,  %4_Space%■ carina`n , c:\temp\test.txt
}
  if T4k= 0
 {
   FileAppend,  %4_Space%□ carina`n, c:\temp\test.txt
}
If T4l= 1
 {
   FileAppend,  %4_Space%%4_Space%■ Separate tumor nodule(s) in a different lobe of the ipsilateral lung`n , c:\temp\test.txt
}
  if T4l= 0
 {
   FileAppend,  %4_Space%%4_Space%□ Separate tumor nodule(s) in a different lobe of the ipsilateral lung`n , c:\temp\test.txt
}
FileAppend,   %2_Space% `n, c:\temp\test.txt    ; 輸入空白行幫助排版
;--------------第四段-----------------------------------------------

FileAppend,  3. %1_Space%Regional node metastasis%2_Space%`n, c:\temp\test.txt  
if No= 1
 {
   FileAppend,  %4_Space%■ No `n, c:\temp\test.txt
}
  if No= 0
 {
   FileAppend,  %4_Space%□ No `n, c:\temp\test.txt
}
if Nequ= 1
 {
   FileAppend,  
(
%4_Space%■ Equivocal, location: `n
), c:\temp\test.txt
}
  if Nequ= 0
 {
   FileAppend,  
(
%4_Space%□ Equivocal, location: `n
), c:\temp\test.txt
}
if Nip= 1
 {
   FileAppend,  
(
%4_Space%%4_Space%■ Ipilateral peribronchieal LNs
), c:\temp\test.txt
}
  if Nip= 0
 {
   FileAppend,  
(
%4_Space%%4_Space%□ Ipilateral peribronchieal LNs
), c:\temp\test.txt
}
if Nih= 1
 {
   FileAppend,  %4_Space%■ Ipsilateral hilar LNS, c:\temp\test.txt
}
  if Nih= 0
 {
   FileAppend,  %4_Space%□ Ipsilateral hilar LNS, c:\temp\test.txt
}
if Nipu= 1
 {
   FileAppend,  %4_Space%■ Intrapulmonary Nodes`n, c:\temp\test.txt
}
  if Nipu= 0
 {
   FileAppend,  %4_Space%□ Intrapulmonary Nodes`n, c:\temp\test.txt
}
if Nsub= 1
 {
   FileAppend,  %4_Space%%4_Space%■ Ipsilateral mediastinal and/or subcarinal LNs`n, c:\temp\test.txt
}
  if Nsub= 0
 {
   FileAppend,  %4_Space%%4_Space%□ Ipsilateral mediastinal and/or subcarinal LNs`n, c:\temp\test.txt
}
if Nch= 1
 {
   FileAppend,  %4_Space%%4_Space%■ Contralateral hilar LNs, c:\temp\test.txt
}
  if Nch= 0
 {
   FileAppend,  %4_Space%%4_Space%□ Contralateral hilar LNs, c:\temp\test.txt
}
if Ncm= 1
 {
   FileAppend,  %4_Space%■ Contrallateral mediastinal LNs , c:\temp\test.txt
}
  if Ncm= 0
 {
   FileAppend,  %4_Space%□ Contrallateral mediastinal LNs , c:\temp\test.txt
}
if Nsc= 1
 {
   FileAppend,  %4_Space%■ Supraclavicular LNs`n, c:\temp\test.txt
}
  if Nsc= 0
 {
   FileAppend,  %4_Space%□ Supraclavicular LNs`n, c:\temp\test.txt
}
if Nis= 1
 {
   FileAppend,  %4_Space%%4_Space%■ Ipsilateral or contralateral scalene`n, c:\temp\test.txt
}
  if Nis= 0
 {
   FileAppend,  %4_Space%%4_Space%□ Ipsilateral or contralateral scalene`n, c:\temp\test.txt
}

if Nyes= 1
 {
   FileAppend,  
(
%4_Space%■ Yes, location: `n
), c:\temp\test.txt
}
  if Nyes= 0
 {
   FileAppend,  
(
%4_Space%□ Yes, location: `n
), c:\temp\test.txt
}


   FileAppend,  %4_Space%%4_Space%N1:, c:\temp\test.txt
if Nyip= 1
 {
   FileAppend,  
(
%2_Space%■ Ipilateral peribronchieal LNs
), c:\temp\test.txt
}
  if Nyip= 0
 {
   FileAppend,  
(
%2_Space%□ Ipilateral peribronchieal LNs
), c:\temp\test.txt
}
if Nyih= 1
 {
   FileAppend,  %4_Space%■ Ipsilateral hilar LNS, c:\temp\test.txt
}
  if Nyih= 0
 {
   FileAppend,  %4_Space%□ Ipsilateral hilar LNS, c:\temp\test.txt
}
if Nyipu= 1
 {
   FileAppend,  %4_Space%■ Intrapulmonary Nodes`n, c:\temp\test.txt
}
  if Nyipu= 0
 {
   FileAppend,  %4_Space%□ Intrapulmonary Nodes`n, c:\temp\test.txt
}


FileAppend,  %4_Space%%4_Space%N2:, c:\temp\test.txt
if Nysub= 1
 {
   FileAppend,  %2_Space%■ Ipsilateral mediastinal and/or subcarinal LNs`n, c:\temp\test.txt
}
  if Nysub= 0
 {
   FileAppend,  %2_Space%□ Ipsilateral mediastinal and/or subcarinal LNs`n, c:\temp\test.txt
}


FileAppend,  %4_Space%%4_Space%N3:, c:\temp\test.txt
if Nych= 1
 {
   FileAppend,  %2_Space%■ Contralateral hilar LNs, c:\temp\test.txt
}
  if Nych= 0
 {
   FileAppend,  %2_Space%□ Contralateral hilar LNs, c:\temp\test.txt
}
if Nycm= 1
 {
   FileAppend,  %4_Space%■ Contrallateral mediastinal LNs , c:\temp\test.txt
}
  if Nycm= 0
 {
   FileAppend,  %4_Space%□ Contrallateral mediastinal LNs , c:\temp\test.txt
}
if Nysc= 1
 {
   FileAppend,  %4_Space%■ Supraclavicular LNs`n, c:\temp\test.txt
}
  if Nysc= 0
 {
   FileAppend,  %4_Space%□ Supraclavicular LNs`n, c:\temp\test.txt
}
if Nyis= 1
 {
   FileAppend, %4_Space%%4_Space%%4_Space%%4_Space%■ Ipsilateral or contralateral scalene`n, c:\temp\test.txt
}
  if Nyis= 0
 {
   FileAppend,  %4_Space%%4_Space%%4_Space%%4_Space%□ Ipsilateral or contralateral scalene`n, c:\temp\test.txt
}

FileAppend,   %2_Space% `n, c:\temp\test.txt    ; 輸入空白行幫助排版

;--------------第五段--Distant metastasis---------------------------------------------

   FileAppend,  4. %1_Space%Distant metastasis(in this study)`n, c:\temp\test.txt  
if DM0= 1
 {
   FileAppend,  %4_Space%%4_Space%■ No %1_Space%`n, c:\temp\test.txt
}
  if DM0 = 0
 {
   FileAppend,  %4_Space%%4_Space%□ No %1_Space%`n, c:\temp\test.txt
}
if DM1= 1
 {
   FileAppend,  
(
%4_Space%%4_Space%■ Yes or Equivocal:`n
), c:\temp\test.txt
}
  if DM1 = 0
 {
   FileAppend,  
(
%4_Space%%4_Space%□ Yes or Equivocal: `n
), c:\temp\test.txt
}
FileAppend,   %4_Space%%4_Space%Thoracic:`n, c:\temp\test.txt 
if MT1= 1
 {
   FileAppend,  %2_Space%%4_Space%%4_Space%■ Yes, c:\temp\test.txt
}
  if MT1 = 0
 {
    FileAppend,  %2_Space%%4_Space%%4_Space%□ Yes, c:\temp\test.txt
}
if MT2= 1
 {
   FileAppend,  %2_Space%■ equivocal: Separate tumor nodule(s) in a contralateral lobe(M1a)`n, c:\temp\test.txt
}
  if MT2 = 0
 {
    FileAppend,  %2_Space%□ equivocal: Separate tumor nodule(s) in a contralateral lobe(M1a)`n, c:\temp\test.txt
}
if MT3= 1
 {
   FileAppend,  %2_Space%%4_Space%%4_Space%■ Yes, c:\temp\test.txt
}
  if MT3 = 0
 {
    FileAppend,  %2_Space%%4_Space%%4_Space%□ Yes, c:\temp\test.txt
}
if MT4= 1
 {
   FileAppend,  %2_Space%■ equivocal: Pleural nodules or malignant pleural or pericardial effusion(M1a)`n, c:\temp\test.txt
}
  if MT4 = 0
 {
    FileAppend,  %2_Space%□ equivocal: Pleural nodules or malignant pleural or pericardial effusion(M1a)`n, c:\temp\test.txt
}

FileAppend,   %4_Space%%4_Space%Extra-thoracic:`n, c:\temp\test.txt 
if ME1= 1
 {
   FileAppend,  %2_Space%%4_Space%%4_Space%■ Yes, c:\temp\test.txt
}
  if ME1 = 0
 {
    FileAppend,  %2_Space%%4_Space%%4_Space%□ Yes, c:\temp\test.txt
}
if ME2= 1
 {
   FileAppend,  
(
%2_Space%■ equivocal: Singal lesions(M1b), Location: _%ME5%_
)`n, c:\temp\test.txt
}
  if ME2 = 0
 {
    FileAppend,  
(
%2_Space%□ equivocal: Singal lesions(M1b), Location: _%ME5%_
)`n, c:\temp\test.txt
}
if ME3= 1
 {
   FileAppend,  %2_Space%%4_Space%%4_Space%■ Yes, c:\temp\test.txt
}
  if ME3 = 0
 {
    FileAppend,  %2_Space%%4_Space%%4_Space%□ Yes, c:\temp\test.txt
}
if ME4= 1
 {
   FileAppend,  
(
%2_Space%■ equivocal: Multiple lesions(M1c), Location: _%ME6%_
)`n, c:\temp\test.txt
}
  if ME4 = 0
 {
    FileAppend,  
(
%2_Space%□ equivocal: Multiple lesions(M1c), Location: _%ME6%_
)`n, c:\temp\test.txt
}

    FileAppend,   %2_Space% `n, c:\temp\test.txt    ; 輸入空白行幫助排版
;-------------------------------------------------------------
    FileAppend,  5. %1_Space%Other findings: `n, c:\temp\test.txt 
    FileAppend,  %4_Space%%4_Space%_%OF0%_ `n, c:\temp\test.txt 
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
