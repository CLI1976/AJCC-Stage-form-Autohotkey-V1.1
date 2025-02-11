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
Gui, Add, Text, y160 x60, Tumor <= 3cm, surrounded by lung or visceral pleura or in a lobar or more peripheral bronchus: 
Gui, Add, Checkbox, vT1a y180 x80, Tumor <=1cm(T1a)
Gui, Add, Checkbox, vT1b y180 x220, 1cm<Tumor <=2cm(T1b)
Gui, Add, Checkbox, vT1c y180 x400, 2cm<Tumor <=3cm(T1c)
Gui, Add, Checkbox, vT1d y200 x60, Surrounded by lung or visceral pleura
Gui, Add, Checkbox, vT13 y200 x310, Not more proximal than lobar bronchus
Gui, Add, Text, y220 x40, T2
Gui, Add, Text, y240 x60, 3cm<Tumor <= 5cm:
Gui, Add, Checkbox, vT2a y260 x80, 3cm<Tumor <=4cm(T2a)
Gui, Add, Checkbox, vT2b y260 x250, 4cm<Tumor <=5cm(T2b)
Gui, Add, Checkbox, vT2c y280 x60, involves the main bronchus (not including the carina)
Gui, Add, Checkbox, vT2d y300 x60, invades visceral pleura
Gui, Add, Checkbox, vT2f y300 x250, invades an adjacent lobe  ; 新增vT2f
Gui, Add, Checkbox, vT2e y320 x60, Atelectasis or obstructive pneumonitis to hilum (focal or total)
Gui, Add, Text, y340 x40, T3
Gui, Add, Checkbox, vT3a y360 x60, 5cm<Tumor <=7cm
Gui, Add, Checkbox, vT3b y380 x60, Invasion of 
Gui, Add, Checkbox, vT3c y400 x80, parietal pleura
Gui, Add, Checkbox, vT3d y400 x190, chest wall
Gui, Add, Checkbox, vT3e y400 x275, phrenic nerve
Gui, Add, Checkbox, vT3f y400 x380, parietal pericardium
Gui, Add, Checkbox, vT3h y400 x520, azygos vein   ; 新增vT3h
Gui, Add, Checkbox, vT3i y420 x60, Invades thoracic nerve roots (i.e. T1, T2) or stellate ganglion   ; 新增vT3i
Gui, Add, Checkbox, vT3g y440 x60, Separate tumor nodule(s) in same lobe
Gui, Add, Text, y460 x40, T4
Gui, Add, Checkbox, vT4a y480 x60, Tumor >7cm
Gui, Add, Checkbox, vT4b y500 x60, Invasion of 
Gui, Add, Checkbox, vT4c y520 x80, diaphragm
Gui, Add, Checkbox, vT4d y520 x165, mediastinum
Gui, Add, Checkbox, vT4e y520 x260, heart
Gui, Add, Checkbox, vT4f y520 x315, great vessels
Gui, Add, Checkbox, vT4g y520 x415, trachea
Gui, Add, Checkbox, vT4h y540 x80, recurrent laryngeal nerve 
Gui, Add, Checkbox, vT4i y540 x250, esophagus
Gui, Add, Checkbox, vT4j y540 x345, vertebral body
Gui, Add, Checkbox, vT4k y540 x455, carina
Gui, Add, Checkbox, vT4m y560 x80, thymus ; 新增vT4m-vT4v
Gui, Add, Checkbox, vT4n y560 x150, vagus nerve
Gui, Add, Checkbox, vT4o y560 x250, supra-aortic arteries
Gui, Add, Checkbox, vT4p y560 x395, brachiocephalic veins
Gui, Add, Checkbox, vT4q y580 x80, subclavian vessels
Gui, Add, Checkbox, vT4r y580 x220, vertebral body
Gui, Add, Checkbox, vT4s y580 x330, lamina
Gui, Add, Checkbox, vT4t y580 x395, spinal canal 
Gui, Add, Checkbox, vT4u y600 x80, cervical nerve roots
Gui, Add, Checkbox, vT4v y600 x220, brachial plexus (i.e., trunks, divisions, cords or terminal nerves)
; 新增vT4m-vT4v
Gui, Add, Checkbox, vT4l y620 x60, Separate tumor nodule(s) in a different lobe of the ipsilateral lung

; ---往下y+100
; ---------------Regional nodal metastasis---------------
Gui, Font, s12 bold, Arial   ; 改大改粗體
Gui, Add, Text, y645 x20, Regional nodal metastasis
Gui, Font ; 重置字體設置(不加這個 粗體改不回來)
Gui, Font, s10, Arial   ; 恢復
Gui, Add, Checkbox, vNo y665 x40, No tumor involvement of regional lymph node(s)
Gui, Add, Checkbox, vNequ y685 x40, Equivocal, location: 
Gui, Add, Checkbox, vNip y705 x60, Ipsilateral peribronchial LNs
Gui, Add, Checkbox, vNih y705 x240, Ipsilateral hilar LNS
Gui, Add, Checkbox, vNipu y705 x375, Intrapulmonary Nodes
Gui, Add, Checkbox, vNsub y725 x60, Single ipsilateral mediastinal or subcarinal LNs ; 變內容vNsub
Gui, Add, Checkbox, vNsub1 y745 x60, Multiple ipsilateral mediastinal with/without subcarinal LNs ; 新增vNsub1
Gui, Add, Checkbox, vNch y765 x60, Contralateral hilar LNs
Gui, Add, Checkbox, vNcm y765 x213, Contrallateral mediastinal LNs 
Gui, Add, Checkbox, vNsc y765 x410, Supraclavicular LNs
Gui, Add, Checkbox, vNis y785 x60, Ipsilateral or contralateral scalene

Gui, Add, Checkbox, vNyes y805 x40, Yes, location: 
Gui, Add, Text, y825 x60, N1:
Gui, Add, Checkbox, vNyip y825 x90, Ipsilateral peribronchial LNs
Gui, Add, Checkbox, vNyih y825 x273, Ipsilateral hilar LNS
Gui, Add, Checkbox, vNyipu y825 x408, Intrapulmonary Nodes
Gui, Add, Text, y845 x60, N2a:
Gui, Add, Checkbox, vNysub y845 x90, Single ipsilateral mediastinal or subcarinal LNs  ; 變內容vNysub
Gui, Add, Text, y865 x60, N2b:
Gui, Add, Checkbox, vNysub1 y865 x90, Multiple ipsilateral mediastinal with/without subcarinal LNs ; 新增vNysub1
Gui, Add, Text, y885 x60, N3:
Gui, Add, Checkbox, vNych y885 x90, Contralateral hilar LNs
Gui, Add, Checkbox, vNycm y885 x243, Contrallateral mediastinal LNs 
Gui, Add, Checkbox, vNysc y885 x440, Supraclavicular LNs
Gui, Add, Checkbox, vNyis y905 x90, Ipsilateral or contralateral scalene
; ---往下y+140
; ---------------Distant Metastasis---------------
  Gui, Font, s12 bold, Arial   ; 改大改粗體
Gui, Add, Text, y930 x20, Distant metastasis
Gui, Font ; 重置字體設置(不加這個 粗體改不回來)
Gui, Font, s10, Arial   ; 恢復
Gui, Add, Text, y932 x165, (in this study)
Gui, Add, Checkbox, vDM0 y950 x40, No
Gui, Add, Checkbox, vDM1 y970 x40, Yes or Equivocal: 
  Gui, Font, s12 bold, Arial   ; 改大改粗體
Gui, Add, Text, y990 x40, Thoracic
Gui, Font ; 重置字體設置(不加這個 粗體改不回來)
Gui, Font, s10, Arial   ; 恢復
Gui, Add, Checkbox, vMT1 y1010 x60, Yes
Gui, Add, Checkbox, vMT2 y1010 x105, equivocal: Separate tumor nodule(s) in a contralateral lobe(M1a)
Gui, Add, Checkbox, vMT3 y1030 x60, Yes
Gui, Add, Checkbox, vMT4 y1030 x105, equivocal: Pleural or pericardial nodules or malignant pleural or pericardial effusion(M1a)

  Gui, Font, s12 bold, Arial   ; 改大改粗體
Gui, Add, Text, y1050 x40, Extrathoracic
Gui, Font ; 重置字體設置(不加這個 粗體改不回來)
Gui, Font, s10, Arial   ; 恢復
Gui, Add, Checkbox, vME1 y1070 x60, Yes
Gui, Add, Checkbox, vME2 y1070 x105, equivocal: Single lesions(M1b), Location: 
Gui, Add, Edit, vME5 y1065 x365 w140
Gui, Add, Checkbox, vME3 y1100 x60, Yes
Gui, Add, Checkbox, vME4 y1100 x105, equivocal: Multiple lesions(M1c), Location: 
Gui, Add, Edit, vME6 y1095 x375 w130

; ---------------Other Findings---------------
  Gui, Font, s12 bold, Arial   ; 改大改粗體
Gui, Add, Text, y1120 x20, Other findings
Gui, Font ; 重置字體設置(不加這個 粗體改不回來)
Gui, Font, s10, Arial   ; 恢復
Gui, Add, Edit, vOF0 y1140 x20 w500

; Buttons
Gui, Font, s12 bold, Arial   ; 改大改粗體
Gui, Add, Button, Default gGenerateReport y1190 x20, Generate Report
Gui, Add, Button, gExit y1190 x170, Exit

; Show GUI
Gui, Show, x180 y0 w640 h1240, Lung Cancer Imaging Report Generator
return

; === 生成報告===
GenerateReport:
    ; Collect data from GUI
    Gui, Submit, NoHide

; ===vvvvv 欄位簡易檢核vvvvv===
   ; 檢查tumor location是否 全部未勾選
    if ( TLS !=1 and RUL  != 1 and RML  != 1 and RLL != 1  and LUL != 1  and LLL != 1 and Other != 1)
    {
        MsgBox, T location未填
    }
    ; 檢查勾選Other 但對應的location structure為空
    if (Other= 1 and Other1 = "" )
    {
        MsgBox, Other Location structure未填
    }
   ; 檢查Measure欄位 是否 全部未勾選
    if (  TLS  != 1 and NonM  != 1 and Meas1  != 1)
    {
        MsgBox, Measure欄位未填
    }
    ; 檢查勾選但對應的location structure為空
    if (Meas1 = 1 and Meas = "" )
    {
        MsgBox, Measure size未填
    }
   ; 檢查tumor invasion是否全部未勾選
    if ( NonM1  != 1 and NoE  != 1 and Yes != 1  )
    {
        MsgBox, T invasion Yes or No or Not assessable未填
    }
    ; 檢查對應的tumor size的欄位空
    if (Yes = 1 and T1a != 1 and T1b != 1 and T1c != 1 and  T2a != 1 and T2b != 1 and T3a!= 1 and T4a != 1)
    {
        MsgBox, Invasion中tumor size的欄位完全沒有勾
    }
    ; 檢查對應的T3 invasion的欄位空
    if (T3b = 1 and T3c != 1 and T3d != 1 and T3e != 1 and  T3f != 1)
    {
        MsgBox, T3 invasion的欄位缺
    }
    ; 檢查對應的T4 invasion的欄位空
    if (T4b = 1 and T4c != 1 and T4d != 1 and T4e != 1 and  T4f != 1 and T4g != 1 and T4h != 1 and T4i != 1 and  T4j != 1 and  T4k != 1)
    {
        MsgBox, T4 invasion的欄位缺
    }
        ; 檢查LN Yes NO or equivocal是否全部未勾選
    if ( No != 1 and Nequ != 1  and Nyes != 1)
    {
        MsgBox, N stage有遺漏的欄位未填
    }
    ; 檢查對應的LN location的欄位空
    if (Nequ = 1 and Nip != 1 and Nih != 1 and Nipu != 1 and  Nsub != 1 and Nsub1 != 1and Nch != 1 and Ncm != 1 and Nsc != 1 and  Nis != 1)
    {
        MsgBox, equivocal LN location的欄位缺
    }
; 檢查對應的LN location的欄位空
    if (Nyes = 1 and Nyip != 1 and Nyih != 1 and Nyipu != 1 and  Nysub != 1 and  Nysub1 != 1 and Nych != 1 and Nycm != 1 and Nysc != 1 and  Nyis != 1)
    {
        MsgBox, Yes LN location的欄位缺
    }
   ; 檢查Distent meta是否 全部未勾選
    if ( DM0  != 1 and DM1  != 1 )
    {
        MsgBox, Distent meta欄位未填
    }
; 檢查對應的Distant meta的位置
    if (DM1 = 1 and MT1 != 1 and MT2 != 1 and MT3 != 1 and  MT4 != 1 and ME1 != 1 and ME2 != 1 and ME3 != 1 and  ME4 != 1)
    {
        MsgBox, Distant meta的位置缺
    }
    ; 檢查勾選Distant meta但對應的location structure為空
    if( ( ME1 = 1 and  ME5 = "" ) or( ME2 = 1 and  ME5 = "" ))
    {
        MsgBox, Distant meta的location未填
    }
    ; 檢查勾選Distant meta但對應的location structure為空
    if( ( ME3 = 1 and  ME6 = "" ) or( ME4 = 1 and  ME6 = "" ))
    {
        MsgBox, Distant meta的location未填
    }
    ; 檢查勾選Distant meta但對應的location structure為空
    if( ( ME1 = 1 and  ME2 = 1 ) or( ME3 = 1 and  ME4 = 1 ))
    {
        MsgBox, Distant meta是yes還是equivocal
    }

; === ^^^欄位簡易檢核^^^===

     ; 刪除現有的 test.txt 文件
    FileDelete, c:\temp\test.txt
    ; 將結果逐行輸入test.txt中
FormatTime, CurrentDate,, yyyy/MM/dd
FileAppend,  Additional report for cancer staging on %CurrentDate%  `n, c:\temp\test.txt    ; 輸入空白行幫助排版
FileAppend,   =========================================== `n, c:\temp\test.txt 
    FileAppend, MCH Imaging Report for Lung Carcinoma (AJCC 9th)  `n, c:\temp\test.txt
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
   FileAppend,  %4_Space%%4_Space%Tumor<=3cm`,` surrounded by lung or visceral pleura or in a lobar or more peripheral bronchus: `n , c:\temp\test.txt
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
   FileAppend,  %4_Space%%4_Space%■ involves the main bronchus (not including the carina)`n, c:\temp\test.txt
}
  if T2c= 0
 {
   FileAppend,  %4_Space%%4_Space%□ involves the main bronchus (not including the carina)`n, c:\temp\test.txt
}
If T2d= 1
 {
   FileAppend,  %4_Space%%4_Space%■ invades visceral pleura  , c:\temp\test.txt
}
  if T2d= 0
 {
   FileAppend,  %4_Space%%4_Space%□ invades visceral pleura  , c:\temp\test.txt
}

If T2f= 1
  {
    FileAppend,  %4_Space%■ invades an adjacent lobe `n , c:\temp\test.txt
 }
   if T2f= 0
  {
    FileAppend,  %4_Space%□ invades an adjacent lobe `n , c:\temp\test.txt
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
   FileAppend,  %4_Space%■ parietal pericardium , c:\temp\test.txt
}
  if T3f= 0
 {
   FileAppend,  %4_Space%□ parietal pericardium, c:\temp\test.txt
}
If T3h= 1
  {
    FileAppend,  %4_Space%■ azygos vein`n , c:\temp\test.txt
 }
   if T3h= 0
  {
    FileAppend,  %4_Space%□ azygos vein`n, c:\temp\test.txt
 }

 If T3i= 1
  {
    FileAppend,  %4_Space%%4_Space%■ Invades thoracic nerve roots (e.g.`,` T1`,` T2) or stellate ganglion `n , c:\temp\test.txt
 }
   if T3i= 0
  {
    FileAppend,  %4_Space%%4_Space%□ Invades thoracic nerve roots (e.g.`,` T1`,` T2) or stellate ganglion `n, c:\temp\test.txt
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

If T4m= 1
  {
    FileAppend,  %4_Space%%4_Space%%2_Space%■ thymus , c:\temp\test.txt
 }
   if T4m= 0
  {
    FileAppend,  %4_Space%%4_Space%%2_Space%□ thymus , c:\temp\test.txt
 }
 If T4n= 1
  {
    FileAppend,  %4_Space%■ vagus nerve , c:\temp\test.txt
 }
   if T4n= 0
  {
    FileAppend,  %4_Space%□ vagus nerve , c:\temp\test.txt
 }
 If T4o= 1
  {
    FileAppend,  %4_Space%■ supra-aortic arteries, c:\temp\test.txt
 }
   if T4o= 0
  {
    FileAppend,  %4_Space%□ supra-aortic arteries, c:\temp\test.txt
 }
 If T4p= 1
  {
    FileAppend,  %4_Space%■ brachiocephalic veins`n , c:\temp\test.txt
 }
   if T4p= 0
  {
    FileAppend,  %4_Space%□ brachiocephalic veins`n, c:\temp\test.txt
 }
 If T4q= 1
  {
    FileAppend,  %4_Space%%4_Space%%2_Space%■ subclavian vessels , c:\temp\test.txt
 }
   if T4q= 0
  {
    FileAppend,  %4_Space%%4_Space%%2_Space%□ subclavian vessels , c:\temp\test.txt
 }
 If T4r= 1
  {
    FileAppend,  %4_Space%■ vertebral body , c:\temp\test.txt
 }
   if T4r= 0
  {
    FileAppend,  %4_Space%□ vertebral body , c:\temp\test.txt
 }
 If T4s= 1
  {
    FileAppend,  %4_Space%■ lamina , c:\temp\test.txt
 }
   if T4s= 0
  {
    FileAppend,  %4_Space%□ lamina, c:\temp\test.txt
 }
 If T4t= 1
  {
    FileAppend,  %4_Space%■ spinal canal `n , c:\temp\test.txt
 }
   if T4t= 0
  {
    FileAppend,  %4_Space%□ spinal canal `n, c:\temp\test.txt
 }
 If T4u= 1
  {
    FileAppend,  %4_Space%%4_Space%%2_Space%■ cervical nerve roots , c:\temp\test.txt
 }
   if T4u= 0
  {
    FileAppend,  %4_Space%%4_Space%%2_Space%□ cervical nerve roots , c:\temp\test.txt
 }
 If T4v= 1
  {
    FileAppend,  %4_Space%■ brachial plexus (e.g.`,` trunks`,` divisions`,` cords or terminal nerves)`n , c:\temp\test.txt
 }
   if T4v= 0
  {
    FileAppend,  %4_Space%□ brachial plexus (e.g.`,` trunks`,` divisions`,` cords or terminal nerves)`n, c:\temp\test.txt
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
   FileAppend,  %4_Space%■ No tumor involvement of regional lymph node(s) `n, c:\temp\test.txt
}
  if No= 0
 {
   FileAppend,  %4_Space%□ No tumor involvement of regional lymph node(s) `n, c:\temp\test.txt
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
%4_Space%%4_Space%■ Ipsilateral peribronchial LNs
), c:\temp\test.txt
}
  if Nip= 0
 {
   FileAppend,  
(
%4_Space%%4_Space%□ Ipsilateral peribronchial LNs
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
   FileAppend,  %4_Space%%4_Space%■ Single ipsilateral mediastinal or subcarinal LNs`n, c:\temp\test.txt
}
  if Nsub= 0
 {
   FileAppend,  %4_Space%%4_Space%□ Single ipsilateral mediastinal or subcarinal LNs`n, c:\temp\test.txt
}
if Nsub1= 1
  {
    FileAppend,  %4_Space%%4_Space%■ Multiple ipsilateral mediastinal with/without subcarinal LNs`n, c:\temp\test.txt
 }
   if Nsub1= 0
  {
    FileAppend,  %4_Space%%4_Space%□ Multiple ipsilateral mediastinal with/without subcarinal LNs`n, c:\temp\test.txt
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
   FileAppend,  %4_Space%■ Contralateral mediastinal LNs , c:\temp\test.txt
}
  if Ncm= 0
 {
   FileAppend,  %4_Space%□ Contralateral mediastinal LNs , c:\temp\test.txt
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
%2_Space%■ Ipsilateral peribronchial LNs
), c:\temp\test.txt
}
  if Nyip= 0
 {
   FileAppend,  
(
%2_Space%□ Ipsilateral peribronchial LNs
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


FileAppend,  %4_Space%%4_Space%N2a:, c:\temp\test.txt
if Nysub= 1
 {
   FileAppend,  %2_Space%■ Single ipsilateral mediastinal or subcarinal LNs `n, c:\temp\test.txt
}
  if Nysub= 0
 {
   FileAppend,  %2_Space%□ Single ipsilateral mediastinal or subcarinal LNs `n, c:\temp\test.txt
}

FileAppend,  %4_Space%%4_Space%N2b:, c:\temp\test.txt
if Nysub1= 1
 {
   FileAppend,  %2_Space%■ Multiple ipsilateral mediastinal with/without subcarinal LNs `n, c:\temp\test.txt
}
  if Nysub1= 0
 {
   FileAppend,  %2_Space%□ Multiple ipsilateral mediastinal with/without subcarinal LNs `n, c:\temp\test.txt
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
   FileAppend,  %4_Space%■ Contralateral mediastinal LNs , c:\temp\test.txt
}
  if Nycm= 0
 {
   FileAppend,  %4_Space%□ Contralateral mediastinal LNs , c:\temp\test.txt
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
   FileAppend,  %2_Space%■ equivocal: Pleural  or pericardial nodules or malignant pleural or pericardial effusion(M1a)`n, c:\temp\test.txt
}
  if MT4 = 0
 {
    FileAppend,  %2_Space%□ equivocal: Pleural or pericardial nodules or malignant pleural or pericardial effusion(M1a)`n, c:\temp\test.txt
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
%2_Space%■ equivocal: Single lesions(M1b), Location: _%ME5%_
)`n, c:\temp\test.txt
}
  if ME2 = 0
 {
    FileAppend,  
(
%2_Space%□ equivocal: Single lesions(M1b), Location: _%ME5%_
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
