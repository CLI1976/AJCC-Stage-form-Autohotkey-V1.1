; Esophageal cancer Imaging Report Generator
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

; Title
; Gui, Add, Text,  Section vTitle, Colorectal Carcinoma Imaging Report


; ---------------Tumor Location---------------
Gui, Font, s12 bold, Arial   ; ��j�����
Gui, Add, Text, y15 x20, 1. Tumor location
Gui, Font ; ���m�r��]�m(���[�o�� ����藍�^��)
Gui, Font, s10, Arial   ; ��_
Gui, Add, Text, y15 x157, (
Gui, Add, Checkbox, vTLS y15 x165, Not assessable)
Gui, Add, Text, y35 x40, Location:
Gui, Add, Checkbox, vL1 y55 x40, Cervical segement( hypopharynx to sternal notch)
Gui, Add, Checkbox, vL2 y75 x40, Upper third of thoracic segment(Stenernal nodth to azygos vein)
Gui, Add, Checkbox, vL3 y95 x40, Middle third of thoracic segment(Azygos vein to inferior pulmonary vein)
Gui, Add, Checkbox, vL4 y115 x40, Lower third of thoracic segment(inferior pulmonary vein to esophagogastric junction)
Gui, Add, Text, y140 x40, Size: 
Gui, Add, Checkbox, vL5 y140 x77, Non-measurable 
Gui, Add, Checkbox, vL6 y140 x197, Measurable:   Length:
Gui, Add, Edit, vL7 y135 x340 w40
Gui, Add, Text, y140 x383, cm; Max thickness: 
Gui, Add, Edit, vL8 y135 x500 w40
Gui, Add, Text, y140 x546, cm
; ---------------Tumor Invastion---------------
 Gui, Font, s12 bold, Arial   ; ��j�����
 Gui, Add, Text, y170 x20, 2. Tumor invasion
 Gui, Font ; ���m�r��]�m(���[�o�� ����藍�^��)
 Gui, Font, s10, Arial   ; ��_
 Gui, Add, Text, y170 x160, (
 Gui, Add, Checkbox, vNota y170 x168, Not assessable)
Gui, Add, Checkbox, vT1 y190 x40, No or Equivocal
Gui, Add, Checkbox, vT2 y210 x40, Yes. if yes:
Gui, Add, Checkbox, vT3 y230 x60, Esophagus
Gui, Add, Checkbox, vT4 y230 x147, Pleura
Gui, Add, Checkbox, vT5 y230 x207, Pericardium
Gui, Add, Checkbox, vT6 y230 x300, Diaphragm
Gui, Add, Checkbox, vT7 y230 x387, Peritoneum
Gui, Add, Checkbox, vT8 y230 x478, Aortic wall
Gui, Add, Checkbox, vT9 y250 x60, Carina
Gui, Add, Checkbox, vT10 y250 x120, Posterior wall of trachea
Gui, Add, Checkbox, vT11 y250 x283, Posterior wall of main bronchus
Gui, Add, Checkbox, vT12 y250 x487, Left atrial wall

; ---------------Regional nodal metastasis---------------
 Gui, Font, s12 bold, Arial   ; ��j�����
 Gui, Add, Text, y280 x20, 3. Regional nodal metastasis(short axis >= 1cm)
 Gui, Font ; ���m�r��]�m(���[�o�� ����藍�^��)
 Gui, Font, s10, Arial   ; ��_
Gui, Add, Text, y280 x390, (
 Gui, Add, Checkbox, vNot y280 x398, Not assessable)
Gui, Add, Checkbox, vNo y300 x40, No or Equivocal
Gui, Add, Checkbox, vYes y325 x40, Yes. if yes: Numer of suspicious lymph node:
Gui, Add, Edit, vN1 y320 x325 w40
Gui, Add, Text, y325 x370, (N1: 1-2; N2: 3-6; N3: 7 or more)
Gui, Add, Text, y345 x60, Location:
Gui, Add, Text, y365 x60, Lower cervical (
Gui, Add, Checkbox, vN2 y365 x150, Right
Gui, Add, Checkbox, vN3 y365 x208, Left)
Gui, Add, Text, y385 x60, Upper paratracheal (
Gui, Add, Checkbox, vN4 y385 x180, Right
Gui, Add, Checkbox, vN5 y385 x238, Left)
Gui, Add, Text, y405 x60, Thoracic paraesophageal(
Gui, Add, Checkbox, vN6 y405 x213, Upper
Gui, Add, Checkbox, vN7 y405 x277, Middle
Gui, Add, Checkbox, vN8 y405 x346, Lower)
Gui, Add, Text, y425 x60, Pulmonary ligament (
Gui, Add, Checkbox, vN9 y425 x185, Right
Gui, Add, Checkbox, vN10 y425 x243, Left)
Gui, Add, Checkbox, vN11 y445 x60, Subcarinal
 Gui, Add, Checkbox, vN12 y445 x146, Diaphragmatic
Gui, Add, Checkbox, vN13 y445 x254, Paracardial 
 Gui, Add, Checkbox, vN14 y445 x340, Left gastric
Gui, Add, Checkbox, vN15 y445 x428, Common hepatic
Gui, Add, Checkbox, vN16 y445 x549, Splenic 
Gui, Add, Checkbox, vN17 y470 x60, Celiac
Gui, Add, Checkbox, vN18 y470 x120, Others:
Gui, Add, Edit, vN19 y465 x184 w250
; ---------------Distant Metastasis---------------
   Gui, Font, s12 bold, Arial   ; ��j�����
 Gui, Add, Text, y500 x20, 4. Distant metastasis
 Gui, Font ; ���m�r��]�m(���[�o�� ����藍�^��)
 Gui, Font, s10, Arial   ; ��_
 Gui, Add, Text, y500 x165, (in this study)

 Gui, Add, Checkbox, vDM0 y520 x40, No or Equivocal
 Gui, Add, Checkbox, vDM2 y545 x40, Yes, location
 Gui, Add, Edit, vDM1 y540 x138 w250

; ---------------Other Findings---------------
 Gui, Font, s12 bold, Arial   ; ��j�����
 Gui, Add, Text, y575 x20, 5. Other findings
 Gui, Font ; ���m�r��]�m(���[�o�� ����藍�^��)
 Gui, Font, s10, Arial   ; ��_
 Gui, Add, Edit, vOF0 y595 x20 w500

; Buttons
 Gui, Font, s12 bold, Arial   ; ��j�����
 Gui, Add, Button, Default gGenerateReport y635 x20, Generate Report
 Gui, Add, Button, gExit y635 x170, Exit

; Show GUI
Gui, Show, w615 h685, Esophageal Cancer Imaging Report Generator
return

; === �ͦ����i===
GenerateReport:
    ; Collect data from GUI
    Gui, Submit, NoHide
     ; �R���{���� test.txt ���
    FileDelete, c:\temp\test.txt
    ; �N���G�v���Jtest.txt��
FormatTime, CurrentDate,, yyyy/MM/dd
FileAppend,  Addtional report for cancer staging on %CurrentDate%  `n, c:\temp\test.txt    ; ��J�ťզ����U�ƪ�
FileAppend,   =========================================== `n, c:\temp\test.txt   
    FileAppend, MCH Imaging Report for Esophgeal Carcinoma (AJCC 8th)  `n, c:\temp\test.txt
    FileAppend,    `n, c:\temp\test.txt    ; ��J�ťզ����U�ƪ�
    FileAppend, **�����Ȩ̾ڳ榸�v���i������Ѹ~�F�ζ��ѦҡA�ä��N��f�H���{�ɤ����A�{�ɤ����ݺ�X�f�H�{�ɵo�{�B�U�ؼv��(�]�A�U�ؤ�����ζW���i�ˬd)�ίf�z��{�Ӷi��P�_�A�f�H���̲��{�ɤ����i��]���g�ζ��Q�צ��Ҳ��ʡA�q�аѾ\�f�������C  `n, c:\temp\test.txt
    FileAppend,   %2_Space% `n, c:\temp\test.txt    ; ��J�ťզ����U�ƪ�
;-------------------------------------------------------------
    
;--------------�ĤG�q-----------------------------------------------
FileAppend,  1. %1_Space%Tumor location (, c:\temp\test.txt  
if TLS = 1
 {
   FileAppend,  �� Not assessable)  `n, c:\temp\test.txt
}
  if TLS = 0
 {
   FileAppend,  �� Not assessable)  `n, c:\temp\test.txt
}
   FileAppend, %4_Space%Location: `n, c:\temp\test.txt
if L1 = 1
 {
   FileAppend,  %4_Space%�� Cervical segement( hypopharynx to sternal notch) `n, c:\temp\test.txt
}
  if L1 = 0
 {
   FileAppend,  %4_Space%�� Cervical segement( hypopharynx to sternal notch) `n, c:\temp\test.txt
}
if L2 = 1
 {
   FileAppend,  %4_Space%�� Upper third of thoracic segment(Stenernal nodth to azygos vein) `n, c:\temp\test.txt
}
  if L2 = 0
 {
   FileAppend,  %4_Space%�� Upper third of thoracic segment(Stenernal nodth to azygos vein)`n,  c:\temp\test.txt
}
if L3 = 1
 {
   FileAppend,  %4_Space%�� Middle third of thoracic segment(Azygos vein to inferior pulmonary vein)`n, c:\temp\test.txt
}
  if L3 = 0
 {
   FileAppend,  %4_Space%�� Middle third of thoracic segment(Azygos vein to inferior pulmonary vein)`n, c:\temp\test.txt
}
if L4 = 1
 {
   FileAppend,  %4_Space%�� Lower third of thoracic segment(inferior pulmonary vein to esophagogastric junction)`n, c:\temp\test.txt
}
  if L4 = 0
 {
   FileAppend,  %4_Space%�� Lower third of thoracic segment(inferior pulmonary vein to esophagogastric junction)`n, c:\temp\test.txt
}
   FileAppend, %4_Space%Size: , c:\temp\test.txt
if L5 = 1
 {
   FileAppend,  %4_Space%�� Non-measurable , c:\temp\test.txt
}
  if L5 = 0
 {
   FileAppend,  %4_Space%�� Non-measurable , c:\temp\test.txt
}
if L6 = 1
 {
   FileAppend,  
(
%4_Space%��Measurable:   Length:_%L7%_cm ;  Max thickness_%L8%_cm
)`n, c:\temp\test.txt
}
  if L6 = 0
 {
   FileAppend, 
(
 %4_Space%��Measurable:   Length:_%L7%_cm ;  Max thickness_%L8%_cm
)`n, c:\temp\test.txt
}
FileAppend,   %2_Space% `n, c:\temp\test.txt    ; ��J�ťզ����U�ƪ�
;--------------�ĤT�q-----------------------------------------------
FileAppend,  2. %1_Space%Tumor invasion( , c:\temp\test.txt  

if Nota= 1
 {
   FileAppend,  �� Not assessable) %1_Space% `n, c:\temp\test.txt
}
  if Nota= 0
 {
   FileAppend,  �� Not assessable)%1_Space% `n, c:\temp\test.txt
}
if T1= 1
 {
   FileAppend,  %4_Space%�� No or Equivocal`n, c:\temp\test.txt
}
  if T1= 0
 {
   FileAppend,  %4_Space%�� No or Equivocal`n, c:\temp\test.txt
}
if T2= 1
 {
   FileAppend,  %4_Space%�� Yes. if yes:`n, c:\temp\test.txt
}
  if T2= 0
 {
   FileAppend,  %4_Space%�� Yes. if yes:`n, c:\temp\test.txt
}
if T3= 1
 {
   FileAppend,  %4_Space%%4_Space%�� Esophagus, c:\temp\test.txt
}
  if T3= 0
 {
   FileAppend,  %4_Space%%4_Space%�� Esophagus, c:\temp\test.txt
}
if T4= 1
 {
   FileAppend,  %2_Space%�� Pleura, c:\temp\test.txt
}
  if T4= 0
 {
   FileAppend,  %2_Space%�� Pleura, c:\temp\test.txt
}
if T5= 1
 {
   FileAppend,  %2_Space%�� Pericardium, c:\temp\test.txt
}
  if T5= 0
 {
   FileAppend,  %2_Space%�� Pericardium, c:\temp\test.txt
}
if T6= 1
 {
   FileAppend,  %2_Space%�� Diaphragm, c:\temp\test.txt
}
  if T6= 0
 {
   FileAppend,  %2_Space%�� Diaphragm, c:\temp\test.txt
}
if T7= 1
 {
   FileAppend,  %2_Space%�� Peritoneum, c:\temp\test.txt
}
  if T7= 0
 {
   FileAppend,  %2_Space%�� Peritoneum, c:\temp\test.txt
}
if T8= 1
 {
   FileAppend,  %2_Space%�� Aortic wall`n, c:\temp\test.txt
}
  if T8= 0
 {
   FileAppend,  %2_Space%�� Aortic wall`n, c:\temp\test.txt
}
if T9= 1
 {
   FileAppend,  %4_Space%%4_Space%�� Carina, c:\temp\test.txt
}
  if T9= 0
 {
   FileAppend,  %4_Space%%4_Space%�� Carina, c:\temp\test.txt
}
if T10= 1
 {
   FileAppend,  %2_Space%�� Posterior wall of trachea, c:\temp\test.txt
}
  if T10= 0
 {
   FileAppend,  %2_Space%�� Posterior wall of trachea, c:\temp\test.txt
}
if T11= 1
 {
   FileAppend,  %2_Space%�� Posterior wall of main bronchus, c:\temp\test.txt
}
  if T11= 0
 {   
FileAppend,  %2_Space%�� Posterior wall of main bronchus, c:\temp\test.txt
}
if T12= 1
 {
   FileAppend,  %2_Space%�� Left atrial wall`n, c:\temp\test.txt
}
  if T12= 0
 {
   FileAppend,  %2_Space%�� Left atrial wall`n, c:\temp\test.txt
}
    FileAppend,   %2_Space% `n, c:\temp\test.txt    ; ��J�ťզ����U�ƪ�

;--------------�ĥ|�q-----------------------------------------------

FileAppend,  3. %1_Space%Regional nodal metastasis(short axis >= 1cm)(, c:\temp\test.txt  
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
   FileAppend,  %4_Space%�� No or Equivocal `n, c:\temp\test.txt
}
  if No= 0
 {
   FileAppend,  %4_Space%�� No or Equivocal `n, c:\temp\test.txt
}
if Yes= 1
 {
   FileAppend,  
(
%4_Space%�� Yes. if yes: Numer of suspicious lymph node:_%N1%_(N1: 1-2; N2: 3-6; N3: 7 or more)
)`n, c:\temp\test.txt
}
  if Yes= 0
 {
   FileAppend,  
(
%4_Space%�� Yes. if yes: Numer of suspicious lymph node:_%N1%_(N1: 1-2; N2: 3-6; N3: 7 or more)
)`n, c:\temp\test.txt
}
   FileAppend,  %4_Space%%4_Space%Location:`n , c:\temp\test.txt
   FileAppend,  %4_Space%%4_Space%Lower cervical ( , c:\temp\test.txt
if N2= 1
 {
   FileAppend,  
(
�� Right%4_Space%
), c:\temp\test.txt
}
  if N2= 0
 {
   FileAppend,  
(
��  Right%4_Space%
), c:\temp\test.txt
}
if N3= 1
 {
   FileAppend,  
(
�� Left)%2_Space%
)`n, c:\temp\test.txt
}
  if N3= 0
 {
   FileAppend,  
(
�� Left)%2_Space%
)`n, c:\temp\test.txt
}
   FileAppend,  %4_Space%%4_Space%Upper paratracheal (, c:\temp\test.txt
if N4= 1
 {
   FileAppend,  
(
�� Right%4_Space%
), c:\temp\test.txt
}
  if N4= 0
 {
   FileAppend,  
(
��  Right%4_Space%
), c:\temp\test.txt
}
if N5= 1
 {
   FileAppend,  
(
�� Left)%2_Space%
)`n, c:\temp\test.txt
}
  if N5= 0
 {
   FileAppend,  
(
�� Left)%2_Space%
)`n, c:\temp\test.txt
}
   FileAppend,  %4_Space%%4_Space%Thoracic paraesophageal(, c:\temp\test.txt
if N6= 1
 {
   FileAppend,  
(
�� Upper%4_Space%
), c:\temp\test.txt
}
  if N6= 0
 {
   FileAppend,  
(
��  Upper%4_Space%
), c:\temp\test.txt
}
if N7= 1
 {
   FileAppend,  
(
�� Middle%4_Space%
), c:\temp\test.txt
}
  if N7= 0
 {
   FileAppend,  
(
�� Middle%4_Space%
), c:\temp\test.txt
}
if N8= 1
 {
   FileAppend,  
(
�� Lower)
)`n, c:\temp\test.txt
}
  if N8= 0
 {
   FileAppend,  
(
�� Lower)
)`n, c:\temp\test.txt
}
   FileAppend,  %4_Space%%4_Space%Pulmonary ligament (, c:\temp\test.txt
if N9= 1
 {
   FileAppend,  
(
�� Right%4_Space%
), c:\temp\test.txt
}
  if N9= 0
 {
   FileAppend,  
(
��  Right%4_Space%
), c:\temp\test.txt
}
if N10= 1
 {
   FileAppend,  
(
�� Left)%2_Space%
)`n, c:\temp\test.txt
}
  if N10= 0
 {
   FileAppend,  
(
�� Left)%2_Space%
)`n, c:\temp\test.txt
}
if N11= 1
 {
   FileAppend,  %4_Space%%4_Space%�� Subcarinal, c:\temp\test.txt
}
  if N11= 0
 {
   FileAppend,  %4_Space%%4_Space%�� Subcarinal, c:\temp\test.txt
}
if N12= 1
 {
   FileAppend,  %2_Space%�� Diaphragmatic, c:\temp\test.txt
}
  if N12= 0
 {
   FileAppend,  %2_Space%�� Diaphragmatic, c:\temp\test.txt
}
if N13= 1
 {
   FileAppend,  %2_Space%�� Paracardial , c:\temp\test.txt
}
  if N13= 0
 {
   FileAppend,  %2_Space%�� Paracardial , c:\temp\test.txt
}
if N14= 1
 {
   FileAppend,  %2_Space%��  Left gastric, c:\temp\test.txt
}
  if N14= 0
 {
   FileAppend,  %2_Space%��  Left gastric, c:\temp\test.txt
}
if N15= 1
 {
   FileAppend,  %2_Space%�� Common hepatic, c:\temp\test.txt
}
  if N15= 0
 {
   FileAppend,  %2_Space%�� Common hepatic, c:\temp\test.txt
}
if N16= 1
 {
   FileAppend,  %2_Space%�� Splenic`n, c:\temp\test.txt
}
  if N16= 0
 {
   FileAppend,  %2_Space%�� Splenic`n, c:\temp\test.txt
}
if N17= 1
 {
   FileAppend,  %4_Space%%4_Space%�� Celiac , c:\temp\test.txt
}
  if N17= 0
 {
   FileAppend,  %4_Space%%4_Space%�� Celiac, c:\temp\test.txt
}
if N18= 1
 {
   FileAppend,  
(
%2_Space%�� Others:_%N19%_
), c:\temp\test.txt
}
  if N18= 0
 {
   FileAppend,
(
  %2_Space%�� Others:_%N19%_
)`n, c:\temp\test.txt
}
FileAppend,   %2_Space% `n, c:\temp\test.txt    ; ��J�ťզ����U�ƪ�

;--------------�Ĥ��q-----------------------------------------------

   FileAppend,  4. %1_Space%Distant metastasis(in this study)`n, c:\temp\test.txt  
if DM0= 1
 {
   FileAppend,  %4_Space%�� No or Equivocal%1_Space%, c:\temp\test.txt
}
  if DM0 = 0
 {
   FileAppend,  %4_Space%�� No or Equivocal%1_Space%, c:\temp\test.txt
}
    FileAppend,  `n, c:\temp\test.txt  ;����
if DM2= 1
 {
   FileAppend,  
(
%4_Space%�� Yes, location: _%DM1%_`n
), c:\temp\test.txt
}
  if DM2 = 0
 {
   FileAppend,  
(
%4_Space%�� Yes, location: _%DM1%_`n
), c:\temp\test.txt
}

    FileAppend,   %2_Space% `n, c:\temp\test.txt    ; ��J�ťզ����U�ƪ�
;-------------------------------------------------------------
    FileAppend,  5. %1_Space%Other findings: `n, c:\temp\test.txt 
    FileAppend,  %4_Space%_%OF0%_ `n, c:\temp\test.txt 
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
