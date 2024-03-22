; Oropharynx Carcinoma Imaging Report Generator
; �H�U�ܼƥΩ�bfileappend���}�Y�������J�ťեΪ�
; ���`���� Y+20; ��edit, text+25 edit+20 ; �q��+30
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
Gui, Font, s12 bold, Arial   ; ��j�����
Gui, Add, Text, y15 x20, 1. Tumor location/Size
Gui, Font ; ���m�r��]�m(���[�o�� ����藍�^��)
Gui, Font, s10, Arial   ; ��_
Gui, Add, Text, y15 x197, (
Gui, Add, Checkbox, vL1 y15 x203, Not assessable)
Gui, Add, Checkbox, vL2 y35 x40, No evidence of primary tumor.
Gui, Add, Text, y55 x40, Location: 
Gui, Add, Checkbox, vL3 y55 x105, Base of the tongue
Gui, Add, Checkbox, vL4 y55 x240, Tonsillar fossa
Gui, Add, Checkbox, vL5 y55 x360, Soft palate
Gui, Add, Checkbox, vL6 y80 x105, Oropharyngeal walls
Gui, Add, Checkbox, vL7 y80 x253, Others: 
 Gui, Add, Edit, vL8 y75 x320 w120
 Gui, Add, Text, y105 x40, Size: 
 Gui, Add, Checkbox, vL9 y105 x80, Non-measurable
 Gui, Add, Checkbox, vL10 y105 x205, Measurable: 
 Gui, Add, Edit, vL11 y100 x300 w40
 Gui, Add, Text, y105 x348, cm(largest diameter)

; ---------------Tumor Invastion---------------
 Gui, Font, s12 bold, Arial   ; ��j�����
 Gui, Add, Text, y135 x20, 2. Tumor invasion
 Gui, Font ; ���m�r��]�m(���[�o�� ����藍�^��)
 Gui, Font, s10, Arial   ; ��_
 Gui, Add, Text, y135 x161, (
 Gui, Add, Checkbox, vT1 y135 x168, Not assessable)
 Gui, Add, Checkbox, vT2 y155 x40, T0: No regional invasion.
 Gui, Add, Checkbox, vT3 y175 x40, T1: <= 2 cm in greatest dimension.
 Gui, Add, Checkbox, vT4 y195 x40, T2: > 2 cm but <= 4 cm in greatest dimension.
 Gui, Add, Checkbox, vT5 y215 x40, T3: > 4 cm in greatest dimension.
Gui, Add, Checkbox, vT6 y235 x40, T3: Extension to lingual surface of epiglottis.
 Gui, Add, Checkbox, vT7 y255 x40, T4a: Moderately advanced local disease. Tumor invades:
 Gui, Add, Checkbox, vT8 y275 x60, Larynx
 Gui, Add, Checkbox, vT9 y275 x155, Extrinsic muscle of tongue 
 Gui, Add, Checkbox, vT10 y275 x333, Medial pterygoid muscle
 Gui, Add, Checkbox, vT11 y295 x60, Hard palate
 Gui, Add, Checkbox, vT12 y295 x155, Mandible
  Gui, Add, Checkbox, vT13 y315 x40, T4b: Very advanced local disease. Tumor invades:
 Gui, Add, Checkbox, vT14 y335 x60, Lateral pterygoid muscle
 Gui, Add, Checkbox, vT15 y335 x228, Pterygoid plates
 Gui, Add, Checkbox, vT16 y335 x352, Lateral nasopharynx
 Gui, Add, Checkbox, vT17 y360 x60, Skull base
Gui, Add, Checkbox, vT18 y360 x150, Encasement of carotid artery
 Gui, Add, Checkbox, vT19 y360 x340, Others: 
 Gui, Add, Edit, vT20 y355 x405 w200

; ---------------Regional nodal metastasis---------------
  Gui, Font, s12 bold, Arial   ; ��j�����
  Gui, Add, Text, y390 x20, 3. Regional nodal metastasis
  Gui, Font ; ���m�r��]�m(���[�o�� ����藍�^��)
  Gui, Font, s10, Arial   ; ��_
 Gui, Add, Text, y390 x245, (
  Gui, Add, Checkbox, vNot y390 x253, Not assessable)
 Gui, Add, Checkbox, vNo y410 x40, No regional nodal metastasis.
 Gui, Add, Checkbox, vYes y430 x40, Yes. If yes, involved lymph nodes:
 Gui, Add, Checkbox, vY1 y450 x60, N1: Single ipsilateral lymph node <= 3 cm in greatest dimension and ENE(-).
 Gui, Add, Checkbox, vY2 y470 x60, N2a: Single ipsilateral lymph node > 3 cm, <= 6 cm in greatest dimension and ENE(-).
 Gui, Add, Checkbox, vY3 y490 x60, N2b: Multiple ipsilateral lymph nodes, <= 6 cm in greatest dimension and ENE(-).
Gui, Add, Checkbox, vY4 y510 x60, N2c: Bilateral or contralateral lymph nodes, <= 6 cm in greatest dimension and ENE(-)
Gui, Add, Checkbox, vY5 y530 x60, N3a: Metastasis in a lymph node > 6 cm in greatest dimension and ENE(-).
Gui, Add, Checkbox, vY6 y550 x60, N3b: Metastasis in any node(s) and clinically overt ENE(+).
  Gui, Add, Text, y575 x60, Maximal size of the largest positive node: 
 Gui, Add, Edit, vY7 y570 x308 w60
  Gui, Add, Text, y575 x369, mm (long axis)
Gui, Add, Text, y595 x60, Location: Left level:
 Gui, Add, Checkbox, vY8 y595 x180, I
 Gui, Add, Checkbox, vY9 y595 x220, II
 Gui, Add, Checkbox, vY10 y595 x260, III
 Gui, Add, Checkbox, vY11 y595 x300, IV
 Gui, Add, Checkbox, vY12 y595 x340, V
 Gui, Add, Checkbox, vY13 y595 x380, VI
 Gui, Add, Checkbox, vY14 y595 x420, VII
Gui, Add, Text, y615 x108, Right level:
 Gui, Add, Checkbox, vY15 y615 x180, I
 Gui, Add, Checkbox, vY16 y615 x220, II
 Gui, Add, Checkbox, vY17 y615 x260, III
 Gui, Add, Checkbox, vY18 y615 x300, IV
 Gui, Add, Checkbox, vY19 y615 x340, V
 Gui, Add, Checkbox, vY20 y615 x380, VI
 Gui, Add, Checkbox, vY21 y615 x420, VII
 Gui, Add, Text, y640 x108, Others: 
 Gui, Add, Edit, vY22 y635 x165 w200

; ---------------Distant Metastasis---------------
   Gui, Font, s12 bold, Arial   ; ��j�����
  Gui, Add, Text, y670 x20, 4. Distant metastasis
  Gui, Font ; ���m�r��]�m(���[�o�� ����藍�^��)
  Gui, Font, s10, Arial   ; ��_
  Gui, Add, Text, y670 x165, (in this study)
  Gui, Add, Checkbox, vDM0 y690 x40, No
 Gui, Add, Checkbox, vDM1 y715 x40, Equivocal, location: 
 Gui, Add, Edit, vDM2 y710 x174 w250
 Gui, Add, Checkbox, vDM3 y740 x40, Yes, location:
Gui, Add, Edit, vDM4 y735 x142 w250
 
; ---------------Other Findings---------------
 Gui, Font, s12 bold, Arial   ; ��j�����
 Gui, Add, Text, y770 x20, 5. Other findings
 Gui, Font ; ���m�r��]�m(���[�o�� ����藍�^��)
 Gui, Font, s10, Arial   ; ��_
 Gui, Add, Edit, vOF0 y790 x40 w500

; Buttons
 Gui, Font, s12 bold, Arial   ; ��j�����
 Gui, Add, Button, Default gGenerateReport y830 x20, Generate Report
 Gui, Add, Button, gExit y830 x170, Exit

; Show GUI
Gui, Show,  w615 h880, Oropharynx Carcinoma Imaging Report Generator
return

; === �ͦ����i===
GenerateReport:
    ; Collect data from GUI
    Gui, Submit, NoHide
     ; �R���{���� test.txt ���
    FileDelete, c:\temp\test.txt
    ; �N���G�v���Jtest.txt��
FileAppend,  Addtional report for cancer staging  `n, c:\temp\test.txt    ; ��J�ťզ����U�ƪ�
FileAppend,   =========================================== `n, c:\temp\test.txt 
    FileAppend, MCH Imaging Report for Oropharynx Carcinoma (AJCC 8th)`n, c:\temp\test.txt
    FileAppend,    `n, c:\temp\test.txt    ; ��J�ťզ����U�ƪ�
    FileAppend, �����Ȩ̾ڳ榸�v���i������Ѹ~�F�ζ��ѦҡA�ä��N��f�H���{�ɤ����A�{�ɤ����ݺ�X�f�H�{�ɵo�{�B�U�ؼv��(�]�A�U�ؤ�����ζW���i�ˬd)�ίf�z��{�Ӷi��P�_�A�f�H���̲��{�ɤ����i��]���g�ζ��Q�צ��Ҳ��ʡA�q�аѾ\�f�������C `n, c:\temp\test.txt
    FileAppend,   %2_Space% `n, c:\temp\test.txt    ; ��J�ťզ����U�ƪ�
;-------------------------------------------------------------
    
;--------------�ĤG�q-----------------------------------------------
FileAppend,  1. %1_Space%Tumor location / size , c:\temp\test.txt  
if L1 = 1
 {
   FileAppend,  %2_Space%(�� Not assessable)  `n, c:\temp\test.txt
}
  if L1 = 0
 {
   FileAppend,  %2_Space%(�� Not assessable)  `n, c:\temp\test.txt
}
if L2 = 1
 {
   FileAppend,  %4_Space%�� No evidence of primary tumor. `n, c:\temp\test.txt
}
  if L2 = 0
 {
   FileAppend,  %4_Space%�� No evidence of primary tumor. `n, c:\temp\test.txt
}
 FileAppend,  %4_Space%Location: , c:\temp\test.txt
if L3 = 1
 {
   FileAppend,  %2_Space%�� Base of the tongue, c:\temp\test.txt
}
  if L3 = 0
 {
   FileAppend,  %2_Space%�� Base of the tongue,  c:\temp\test.txt
}
if L4= 1
 {
   FileAppend,  %2_Space%�� Tonsillar fossa, c:\temp\test.txt
}
  if L4 = 0
 {
   FileAppend,  %2_Space%�� Tonsillar fossa,  c:\temp\test.txt
}
if L5 = 1
 {
   FileAppend,  %2_Space%�� Soft palate `n , c:\temp\test.txt
}
  if L5 = 0
 {
   FileAppend,  %2_Space%�� Soft palate `n ,  c:\temp\test.txt
}
if L6 = 1
 {
   FileAppend,  %4_Space%%4_Space%%4_Space%%4_Space%%4_Space%�� Oropharyngeal walls, c:\temp\test.txt
}
  if L6 = 0
 {
   FileAppend,  %4_Space%%4_Space%%4_Space%%4_Space%%4_Space%�� Oropharyngeal walls,  c:\temp\test.txt
}
if L7 = 1
 {
   FileAppend,  %2_Space%�� Others: __%L8%__  `n, c:\temp\test.txt
}
  if L7 = 0
 {
   FileAppend,  %2_Space%�� Others: __%L8%__ `n,  c:\temp\test.txt
}

FileAppend,  %4_Space%Size: , c:\temp\test.txt
if L9 = 1
 {
   FileAppend,  %2_Space%�� Non-measurable, c:\temp\test.txt
}
  if L9 = 0
 {
   FileAppend,  %2_Space%�� Non-measurable,  c:\temp\test.txt
}
if L10 = 1
 {
   FileAppend,  %2_Space%�� Measurable: __%L11%__cm(largest diameter)`n, c:\temp\test.txt
}
  if L10 = 0
 {
   FileAppend,  %2_Space%�� Measurable: __%L11%__cm(largest diameter) `n,  c:\temp\test.txt
}   
 FileAppend,   %2_Space% `n, c:\temp\test.txt    ; ��J�ťզ����U�ƪ�
;--------------�ĤT�q-----------------------------------------------
FileAppend,  2. %1_Space%Tumor invasion  , c:\temp\test.txt  

if T1= 1
 {
   FileAppend,  %2_Space%�� Not assessable`n, c:\temp\test.txt
}
  if T1= 0
 {
   FileAppend,  %2_Space%�� Not assessable`n, c:\temp\test.txt
}
if T2= 1
 {
   FileAppend,  %4_Space%�� T0: No regional invasion.`n, c:\temp\test.txt
}
  if T2= 0
 {
   FileAppend,  %4_Space%�� T0: No regional invasion.`n, c:\temp\test.txt
}
if T3= 1
 {
   FileAppend,  %4_Space%�� T1: <= 2 cm in greatest dimension. `n, c:\temp\test.txt
}
  if T3= 0
 {
   FileAppend,  %4_Space%�� T1: <= 2 cm in greatest dimension. `n, c:\temp\test.txt
}
if T4= 1
 {
   FileAppend,  %4_Space%�� T2: > 2 cm but <= 4 cm in greatest dimension. `n, c:\temp\test.txt
}
  if T4= 0
 {
   FileAppend,  %4_Space%�� T2: > 2 cm but <= 4 cm in greatest dimension.`n, c:\temp\test.txt
}
if T5= 1
 {
   FileAppend,  %4_Space%�� T3: > 4 cm in greatest dimension. `n, c:\temp\test.txt
}
  if T5= 0
 {
   FileAppend,  %4_Space%�� T3: > 4 cm in greatest dimension. `n, c:\temp\test.txt
}
if T6= 1
 {
   FileAppend,  %4_Space%�� T3: Extension to lingual surface of epiglottis.`n, c:\temp\test.txt
}
  if T6= 0
 {
   FileAppend,  %4_Space%�� T3: Extension to lingual surface of epiglottis. `n, c:\temp\test.txt
}
if T7= 1
 {
   FileAppend,  %4_Space%�� T4a: Moderately advanced local disease. Tumor invades:`n , c:\temp\test.txt
}
  if T7= 0
 {
   FileAppend,  %4_Space%�� T4a: Moderately advanced local disease. Tumor invades: `n, c:\temp\test.txt
}
if T8= 1
 {
   FileAppend,  %4_Space%%4_Space%�� Larynx, c:\temp\test.txt
}
  if T8= 0
 {
   FileAppend,  %4_Space%%4_Space%�� Larynx, c:\temp\test.txt
}
if T9= 1
 {
   FileAppend,  %2_Space%�� Extrinsic muscle of tongue  , c:\temp\test.txt
}
  if T9= 0
 {
   FileAppend,  %2_Space%�� Extrinsic muscle of tongue  , c:\temp\test.txt
}
if T10= 1
 {
   FileAppend,  %2_Space%�� Medial pterygoid muscle `n  , c:\temp\test.txt
}
  if T10= 0
 {
   FileAppend,  %2_Space%�� Medial pterygoid muscle `n , c:\temp\test.txt
}
if T11= 1
 {
   FileAppend,  %4_Space%%4_Space%�� Hard palate , c:\temp\test.txt
}
  if T11= 0
 {   
FileAppend, %4_Space%%4_Space%�� Hard palate, c:\temp\test.txt
}
if T12= 1
 {
   FileAppend,  %2_Space%�� Mandible `n, c:\temp\test.txt
}
  if T12= 0
 {
   FileAppend,  %2_Space%�� Mandible `n, c:\temp\test.txt
}
if T13= 1
 {
   FileAppend,  %4_Space%�� T4b: Very advanced local disease. Tumor invades: `n, c:\temp\test.txt
}
  if T13= 0
 {
   FileAppend,  %4_Space%�� T4b: Very advanced local disease. Tumor invades: `n, c:\temp\test.txt
}
if T14= 1
 {
   FileAppend, %4_Space%%4_Space%�� Lateral pterygoid muscle, c:\temp\test.txt
}
  if T14= 0
 {
   FileAppend,  %4_Space%%4_Space%�� Lateral pterygoid muscle, c:\temp\test.txt
}
if T15= 1
 {
   FileAppend, %2_Space%�� Pterygoid plates , c:\temp\test.txt
}
  if T15= 0
 {
   FileAppend,  %2_Space%�� Pterygoid plates , c:\temp\test.txt
}
if T16= 1
 {
   FileAppend, %2_Space%�� Lateral nasopharynx `n, c:\temp\test.txt
}
  if T16= 0
 {
   FileAppend,  %2_Space%�� Lateral nasopharynx `n, c:\temp\test.txt
}
if T17= 1
 {
   FileAppend,  %4_Space%%4_Space%�� Skull base, c:\temp\test.txt
}
  if T17= 0
 {
   FileAppend,  %4_Space%%4_Space%�� Skull base, c:\temp\test.txt
}
if T18= 1
 {
   FileAppend,  %2_Space%�� Encasement of carotid artery, c:\temp\test.txt
}
  if T18= 0
 {
   FileAppend,  %2_Space%�� Encasement of carotid artery, c:\temp\test.txt
}
if T19= 1
 {
   FileAppend,  %2_Space%�� Others: __%T20%__ `n, c:\temp\test.txt
}
  if T19= 0
 {
   FileAppend,  %2_Space%�� Others: __%T20%__  `n, c:\temp\test.txt
}
    FileAppend,   %2_Space% `n, c:\temp\test.txt    ; ��J�ťզ����U�ƪ�

;--------------�ĥ|�q-----------------------------------------------

FileAppend,  3. %1_Space%Regional nodal metastasis(, c:\temp\test.txt  
if Not= 1
 {
   FileAppend,  �� Not assessable) %1_Space% `n, c:\temp\test.txt
}
  if Not= 0
 {
   FileAppend,  �� Not assessable)%1_Space% `n, c:\temp\test.txt
}
if No= 1
 {
   FileAppend,  %4_Space%�� No regional nodal metastasis. `n, c:\temp\test.txt
}
  if No= 0
 {
   FileAppend,  %4_Space%�� No regional nodal metastasis. `n, c:\temp\test.txt
}
if Yes= 1
 {
   FileAppend,  
(
%4_Space%�� Yes. If yes, involved lymph nodes: 
)`n, c:\temp\test.txt
}
  if Yes= 0
 {
   FileAppend,  
(
%4_Space%�� Yes. If yes, involved lymph nodes: 
)`n, c:\temp\test.txt
}
if Y1= 1
 {
   FileAppend,  
(
%4_Space%%4_Space%�� N1: Single ipsilateral lymph node <=3cm in greatest dimension and ENE(-). 
)`n , c:\temp\test.txt
}
  if Y1= 0
 {
   FileAppend,  
(
%4_Space%%4_Space%�� N1: Single ipsilateral lymph node <=3cm in greatest dimension and ENE(-). 
)`n, c:\temp\test.txt
}
if Y2= 1
 {
   FileAppend,  
(
%4_Space%%4_Space%�� N2a: Single ipsilateral lymph node >3cm, <=6cm in greatest dimension and ENE(-). 
)`n, c:\temp\test.txt
}
  if Y2= 0
 {
   FileAppend,
(
%4_Space%%4_Space%�� N2a: Single ipsilateral lymph node >3cm, <=6cm in greatest dimension and ENE(-). 
)`n , c:\temp\test.txt
}
if Y3= 1
 {
   FileAppend,  
(
%4_Space%%4_Space%�� N2b: Multiple ipsilateral lymph nodes, <=6cm in greatest dimension and ENE(-). 
)`n, c:\temp\test.txt
}
  if Y3= 0
 {
   FileAppend,  
(
%4_Space%%4_Space%�� N2b: Multiple ipsilateral lymph nodes, <=6cm in greatest dimension and ENE(-). 
)`n, c:\temp\test.txt
}
if Y4= 1
 {
   FileAppend,  
(
%4_Space%%4_Space%�� N2c: Bilateral or contralateral lymph nodes, <=6cm in greatest dimension and ENE(-)
)`n, c:\temp\test.txt
}
  if Y4= 0
 {
   FileAppend,  
(
%4_Space%%4_Space%�� N2c: Bilateral or contralateral lymph nodes, <=6cm in greatest dimension and ENE(-)
)`n, c:\temp\test.txt
}
if Y5= 1
 {
   FileAppend,  
(
%4_Space%%4_Space%�� N3a: Metastasis in a lymph node >6cm in greatest dimension and ENE(-).
)`n, c:\temp\test.txt
}
  if Y5= 0
 {
   FileAppend,  
(
%4_Space%%4_Space%�� N3a: Metastasis in a lymph node >6cm in greatest dimension and ENE(-).
)`n, c:\temp\test.txt
}
if Y6= 1
 {
   FileAppend,  
(
%4_Space%%4_Space%�� N3b: Metastasis in any node(s) and clinically overt ENE(+).
)`n, c:\temp\test.txt
}
  if Y6= 0
 {
   FileAppend,  
(
%4_Space%%4_Space%�� N3b: Metastasis in any node(s) and clinically overt ENE(+).
)`n, c:\temp\test.txt
}
FileAppend,  %4_Space%%4_Space%Maximal size of the largest positive node: __%Y7%__ mm (long axis)`n , c:\temp\test.txt
FileAppend,  %4_Space%%4_Space%Location: Left level:  , c:\temp\test.txt
if Y8= 1
 {
   FileAppend,  %2_Space%�� I, c:\temp\test.txt
}
  if Y8= 0
 {
   FileAppend,  %2_Space%�� I, c:\temp\test.txt
}
if Y9= 1
 {
   FileAppend,  %3_Space%�� II, c:\temp\test.txt
}
  if Y9= 0
 {
   FileAppend,  %3_Space%�� II, c:\temp\test.txt
}
if Y10= 1
 {
   FileAppend,  %3_Space%�� III, c:\temp\test.txt
}
  if Y10= 0
 {
   FileAppend,  %3_Space%�� III, c:\temp\test.txt
}
if Y11= 1
 {
   FileAppend,  %3_Space%�� IV, c:\temp\test.txt
}
  if Y11= 0
 {
   FileAppend,  %3_Space%�� IV, c:\temp\test.txt
}
if Y12= 1
 {
   FileAppend,  %3_Space%�� V, c:\temp\test.txt
}
  if Y12= 0
 {
   FileAppend,  %3_Space%�� V, c:\temp\test.txt
}
if Y13= 1
 {
   FileAppend,  %3_Space%�� VI, c:\temp\test.txt
}
  if Y13= 0
 {
   FileAppend,  %3_Space%�� VI, c:\temp\test.txt
}
if Y14= 1
 {
   FileAppend,  %3_Space%�� VII`n, c:\temp\test.txt
}
  if Y14= 0
 {
   FileAppend,  %3_Space%�� VII`n, c:\temp\test.txt
}
FileAppend,  %4_Space%%4_Space%%4_Space%%4_Space%%4_Space%%4_Space%Right level:  , c:\temp\test.txt
if Y15= 1
 {
   FileAppend,  %2_Space%�� I, c:\temp\test.txt
}
  if Y15= 0
 {
   FileAppend,  %2_Space%�� I, c:\temp\test.txt
}
if Y16= 1
 {
   FileAppend,  %3_Space%�� II, c:\temp\test.txt
}
  if Y16= 0
 {
   FileAppend,  %3_Space%�� II, c:\temp\test.txt
}
if Y17= 1
 {
   FileAppend,  %3_Space%�� III, c:\temp\test.txt
}
  if Y17= 0
 {
   FileAppend,  %3_Space%�� III, c:\temp\test.txt
}
if Y18= 1
 {
   FileAppend,  %3_Space%�� IV, c:\temp\test.txt
}
  if Y18= 0
 {
   FileAppend,  %3_Space%�� IV, c:\temp\test.txt
}
if Y19= 1
 {
   FileAppend,  %3_Space%�� V, c:\temp\test.txt
}
  if Y19= 0
 {
   FileAppend,  %3_Space%�� V, c:\temp\test.txt
}
if Y20= 1
 {
   FileAppend,  %3_Space%�� VI, c:\temp\test.txt
}
  if Y20= 0
 {
   FileAppend,  %3_Space%�� VI, c:\temp\test.txt
}
if Y21= 1
 {
   FileAppend,  %3_Space%�� VII`n, c:\temp\test.txt
}
  if Y21= 0
 {
   FileAppend,  %3_Space%�� VII`n, c:\temp\test.txt
}
FileAppend,  %4_Space%%4_Space%%4_Space%%4_Space%%4_Space%%4_Space%Others: __%Y22%__  `n, c:\temp\test.txt

FileAppend,   %2_Space% `n, c:\temp\test.txt    ; ��J�ťզ����U�ƪ�

;--------------�Ĥ��q-----------------------------------------------

   FileAppend,  4. %1_Space%Distant metastasis(in this study)`n, c:\temp\test.txt  
if DM0= 1
 {
   FileAppend,  
(
%4_Space%�� No
)`n, c:\temp\test.txt
}
  if DM0 = 0
 {
   FileAppend,  
(
%4_Space%�� No
)`n, c:\temp\test.txt
}
if DM1= 1
 {
   FileAppend,  
(
%4_Space%�� Equivocal, location: __%DM2%__
)`n, c:\temp\test.txt
}
  if DM1 = 0
 {
   FileAppend,  
(
%4_Space%�� Equivocal, location: _%DM2%__
)`n, c:\temp\test.txt
}    
if DM3= 1
 {
   FileAppend,  
(
%4_Space%�� Yes, location: _%DM4%__
)`n, c:\temp\test.txt
}
  if DM3 = 0
 {
   FileAppend,  
(
%4_Space%�� Yes, location: _%DM4%__
)`n, c:\temp\test.txt
}


    FileAppend,   %2_Space% `n, c:\temp\test.txt    ; ��J�ťզ����U�ƪ�
;-------------------------------------------------------------
    FileAppend,  5. %1_Space%Other findings: `n, c:\temp\test.txt 
    FileAppend,  %4_Space%__%OF0%__ `n, c:\temp\test.txt 
; ==================================
   FileRead, ClipboardContent, c:\temp\test.txt
    ; �N���e�ƻs��ŶKï
    Clipboard := ClipboardContent
    MsgBox, %Clipboard%
return

Exit:
    GuiClose:
    ExitApp
return
