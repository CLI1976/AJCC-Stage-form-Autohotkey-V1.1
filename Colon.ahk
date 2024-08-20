; Colorectal Carcinoma Imaging Report Generator
; �H�U�ܼƥΩ�bfileappend���}�Y�������J�ťեΪ�
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
Gui, Add, Text, y15 x20, 1. Tumor 
Gui, Font ; ���m�r��]�m(���[�o�� ����藍�^��)
Gui, Font, s10, Arial   ; ��_
Gui, Add, Checkbox, vTLS y15 x100, Not assessable
Gui, Font, s12 bold, Arial   ; ��j�����
Gui, Add, Text, y35 x40, Location:
Gui, Font ; ���m�r��]�m(���[�o�� ����藍�^��)
Gui, Font, s10, Arial   ; ��_
Gui, Add, Checkbox, vCecum y55 x60, Cecum
Gui, Add, Checkbox, vAscending y55 x130, Ascending
Gui, Add, Checkbox, vHepati y55 x218, Hepatic flexure
Gui, Add, Checkbox, vTransverse y55 x330, Transverse
Gui, Add, Checkbox, vSplenic y55 x430, Splenic flexure
Gui, Add, Checkbox, vDescending y80 x60, Descending 
Gui, Add, Checkbox, vSigmoid y80 x160, Sigmoid 
Gui, Add, Checkbox, vRectum y80 x240, Rectum
Gui, Add, Checkbox, vOther y80 x315, Other:
Gui, Add, Edit, vOtherL y75 x375 w120
Gui, Font, s12 bold, Arial   ; ��j�����
Gui, Add, Text, y100 x40, Size:
Gui, Font ; ���m�r��]�m(���[�o�� ����藍�^��)
Gui, Font, s10, Arial   ; ��_
Gui, Add, Checkbox, vNonM y100 x85, Non-Measurable
Gui, Add, Checkbox, vMeasurable y100 x200, Measurable:
Gui, Add, Edit, vMeasure y95 x295 w45
Gui, Add, Text, y100 x345, cm (largest diameter)

; ---------------Tumor Invasion---------------
Gui, Font, s12 bold, Arial   ; ��j�����
Gui, Add, Text, y130 x20, 2. Tumor invasion
Gui, Font ; ���m�r��]�m(���[�o�� ����藍�^��)
Gui, Font, s10, Arial   ; ��_
Gui, Add, Checkbox, vInvasion0 y150 x30, No or Equivocal
Gui, Add, Checkbox, vInvasion1 y170 x30, Colonic or rectal wall(T1-T2)
Gui, Add, Checkbox, vInvasion2 y190 x30, Invades non-peritonealized pericolic or perirectal tissues(T3)
Gui, Add, Checkbox, vInvasion3 y210 x30, Invades visceral peritoneum(T4a)
Gui, Add, Checkbox, vInvasion4 y235 x30, Invades or adheres to adjacent organs or structures(T4b):
Gui, Add, Edit, vInvasion5 y230 x378 w150

; ---------------Regional Nodal Metastasis---------------
Gui, Font, s12 bold, Arial   ; ��j�����
Gui, Add, Text, y265 x20, 3. Regional Nodal Metastasis
Gui, Font ; ���m�r��]�m(���[�o�� ����藍�^��)
Gui, Font, s10, Arial   ; ��_
Gui, Add, Checkbox, vLN0 y285 x30, No 
Gui, Add, Checkbox, vLN1 y310 x30, Equivocal, Number: 
Gui, Add, Edit, vLN21 y305 x170 w50
Gui, Add, Text, y330 x45, Location:
Gui, Add, Checkbox, vLN2 y350 x45, Pericolic/perirectal 
Gui, Add, Checkbox, vLN3 y350 x175, Ileocolic
Gui, Add, Checkbox, vLN4 y350 x245, Right colic
Gui, Add, Checkbox, vLN5 y350 x330, Middle Colic 
Gui, Add, Checkbox, vLN6 y350 x425, Left colic
Gui, Add, Checkbox, vLN7 y350 x500, Superior rectal
Gui, Add, Checkbox, vLN8 y375 x45, Superior mesenteric artery
Gui, Add, Checkbox, vLN9 y375 x223, Inferior mesenteric artery
Gui, Add, Checkbox, vLN10 y375 x390, Other: 
Gui, Add, Edit, vLN22 y370 x445 w120
Gui, Add, Checkbox, vLN11 y395 x30, Yes, Number: 
Gui, Add, Edit, vLN23 y390 x130 w50
Gui, Add, Text, y395 x185, (N1a:1; N1b:2-3; N2a:4-6; N2b:>=7)
Gui, Add, Text, y415 x45, Location:
Gui, Add, Checkbox, vLN12 y435 x45, Pericolic/perirectal 
Gui, Add, Checkbox, vLN13 y435 x175, Ileocolic
Gui, Add, Checkbox, vLN14 y435 x245, Right colic
Gui, Add, Checkbox, vLN15 y435 x330, Middle Colic 
Gui, Add, Checkbox, vLN16 y435 x425, Left colic
Gui, Add, Checkbox, vLN17 y435 x500, Superior rectal
Gui, Add, Checkbox, vLN18 y460 x45, Superior mesenteric artery
Gui, Add, Checkbox, vLN19 y460 x223, Inferior mesenteric artery
Gui, Add, Checkbox, vLN20 y460 x390, Other: 
Gui, Add, Edit, vLN24 y455 x445 w120
  
; ---------------Distant Metastasis---------------
Gui, Font, s12 bold, Arial   ; ��j�����
Gui, Add, Text, y490 x20, 4. Distant metastasis
Gui, Font ; ���m�r��]�m(���[�o�� ����藍�^��)
Gui, Font, s10, Arial   ; ��_
Gui, Add, Text, y490 x180, (in this study)
Gui, Add, Checkbox, vDM0 y510 x30, No
Gui, Add, Checkbox, vDM1 y535 x30, Equivocal, location: 
Gui, Add, Edit, vDM3 y530 x160 w250
Gui, Add, Checkbox, vDM2 y560 x30, Yes, location: 
Gui, Add, Edit, vDM4 y555 x130 w250

; ---------------Other Findings---------------
Gui, Font, s12 bold, Arial   ; ��j�����
Gui, Add, Text, y590 x20, 5. Other Findings
Gui, Font ; ���m�r��]�m(���[�o�� ����藍�^��)
Gui, Font, s10, Arial   ; ��_
Gui, Add, Edit, vOF0 y615 x30 w500

; Buttons
Gui, Add, Button, Default gGenerateReport y650 x20, Generate Report
Gui, Add, Button, gExit y650 x130, Exit

; Show GUI
Gui, Show, w650 h690, Colorectal Carcinoma Imaging Report Generator
return

; === �ͦ����i===
GenerateReport:
    ; Collect data from GUI
    Gui, Submit, NoHide

; ===vvvvv ���²���ˮ�vvvvv===
   ; �ˬdtumor location�O�_ �������Ŀ�
    if ( TLS  != 1 and Cecum  != 1 and Ascending != 1  and Hepati != 1  and Transverse != 1 and Splenic != 1 and Descending != 1 and Sigmoid != 1 and Rectum != 1 and Other != 1)
    {
        MsgBox, T location����
    }
    ; �ˬd�Ŀ��������location structure����
    if (Other= 1 and OtherL = "" )
    {
        MsgBox, Location structure����
    }

   ; �ˬdtumor location�O�_ �������Ŀ�
    if ( NonM  != 1 and Measurable  != 1 )
    {
        MsgBox, Measure��쥼��
    }
    ; �ˬd�Ŀ��������location structure����
    if (Measurable = 1 and Measure = "" )
    {
        MsgBox, Measure size����
    }

   ; �ˬdtumor invasion�O�_�������Ŀ�
    if ( Invasion0  != 1 and Invasion1  != 1 and Invasion2 != 1  and Invasion3 != 1  and Invasion4 != 1)
    {
        MsgBox, T stage����|����쥼��
    }
    ; �ˬd�Ŀ��������invasion structure����
    if (Invasion4= 1 and Invasion5 = "" )
    {
        MsgBox, invasion structure����
    }

    ; �ˬdvLN0, vLN1, vLN11�O�_�������Ŀ�
    if ( LN0 != 1 and LN1 != 1 and LN11 != 1)
    {
        MsgBox, N stage����|����쥼��
    }
    ; �ˬdvLN1��vLN11�O�_�Q�Ŀ��������LN21��LN23����
    if ((LN1 = 1 and LN21 = "") or (LN11 = 1 and LN23 = "" ))
    {
        MsgBox, LN�ƥإ���
    }

   ; �ˬdDistent meta�O�_ �������Ŀ�
    if ( DM0  != 1 and DM1  != 1 and DM2 != 1 )
    {
        MsgBox, Distent meta��쥼��
    }
    ; �ˬd�Ŀ��������Meta location����
  if ((DM1 = 1 and DM3 = "") or (DM2 = 1 and DM4 = "" ))
    {
        MsgBox, Meta location����
    }
; === ^^^���²���ˮ�^^^===

     ; �R���{���� test.txt ���
    FileDelete, c:\temp\test.txt
    ; �N���G�v���Jtest.txt��
FormatTime, CurrentDate,, yyyy/MM/dd
FileAppend,  Addtional report for cancer staging on %CurrentDate%  `n, c:\temp\test.txt    ; ��J�ťզ����U�ƪ�
FileAppend,   =========================================== `n, c:\temp\test.txt 
    FileAppend, MCH Imaging Report for Colorectal Carcinoma (AJCC 8th) `n, c:\temp\test.txt  
FileAppend,   %2_Space% `n, c:\temp\test.txt    ; ��J�ťզ����U�ƪ�
    FileAppend, *�����Ȩ̾ڳ榸�v���i������Ѹ~�F�ζ��ѦҡA�ä��N��f�H���{�ɤ����A�{�ɤ����ݺ�X�f�H�{�ɵo�{�B�U�ؼv��(�]�A�U�ؤ�����ζW���i�ˬd)�ίf�z��{�Ӷi��P�_�A�f�H���̲��{�ɤ����i��]���g�ζ��Q�צ��Ҳ��ʡA�q�аѾ\�f�������C  `n, c:\temp\test.txt
    FileAppend,   %2_Space% `n, c:\temp\test.txt    ; ��J�ťզ����U�ƪ�

;-------------------------------------------------------------
    FileAppend,  1. %1_Space%Tumor location ( , c:\temp\test.txt  
if TLS = 1
 {
   FileAppend,  �� Not assessable)  `n, c:\temp\test.txt
}
  if TLS = 0
 {
   FileAppend,  �� Not assessable)  `n, c:\temp\test.txt
}
    FileAppend, %4_Space% Location:  `n, c:\temp\test.txt
if Cecum = 1
 {
   FileAppend,  %4_Space%%4_Space%�� Cecum %1_Space%, c:\temp\test.txt
}
  if Cecum = 0
 {
   FileAppend,  %4_Space%%4_Space%�� Cecum %1_Space%, c:\temp\test.txt
}
if Ascending = 1
 {
   FileAppend,  �� Ascending %1_Space%, c:\temp\test.txt
}
  if Ascending = 0
 {
   FileAppend,  �� Ascending %1_Space%, c:\temp\test.txt
}
if Hepati = 1
 {
   FileAppend,  �� Hepatic flexure %1_Space%, c:\temp\test.txt
}
  if Hepati = 0
 {
   FileAppend,  �� Hepatic flexure %1_Space%, c:\temp\test.txt
}
if Transverse = 1
 {
   FileAppend,  �� Transverse %1_Space%, c:\temp\test.txt
}
  if Transverse = 0
 {
   FileAppend,  �� Transverse %1_Space%, c:\temp\test.txt
}
if Splenic = 1
 {
   FileAppend,  �� Splenic flexure %1_Space%, c:\temp\test.txt
}
  if Splenic = 0
 {
   FileAppend,  �� Splenic flexure %1_Space%, c:\temp\test.txt
}
   FileAppend,  %1_Space% `n, c:\temp\test.txt   ; ����
if Descending = 1
 {
   FileAppend,  %4_Space%%4_Space%�� Descending %1_Space%, c:\temp\test.txt
}
  if Descending = 0
 {
   FileAppend,  %4_Space%%4_Space%�� Descending %1_Space%, c:\temp\test.txt
}
if Sigmoid = 1
 {
   FileAppend,  �� Sigmoid %1_Space%, c:\temp\test.txt
}
  if Sigmoid = 0
 {
   FileAppend,  �� Sigmoid %1_Space%, c:\temp\test.txt
}
if Rectum = 1
 {
   FileAppend,  �� Rectum %1_Space%, c:\temp\test.txt
}
  if Rectum = 0
 {
   FileAppend,  �� Rectum %1_Space%, c:\temp\test.txt
}
if Other = 1
 {
   FileAppend,  �� Other:  %1_Space%, c:\temp\test.txt
}
  if Other = 0
 {
   FileAppend,  �� Other:  %1_Space%, c:\temp\test.txt
}
   FileAppend, __%OtherL%__, c:\temp\test.txt
   FileAppend,  %1_Space% `n, c:\temp\test.txt   ; ����
   FileAppend, %4_Space% Size: %2_Space% , c:\temp\test.txt
if NonM = 1
 {
   FileAppend,  �� Non-measurable  %1_Space%, c:\temp\test.txt
}
  if NonM = 0
 {
   FileAppend,  �� Non-measurable  %1_Space%, c:\temp\test.txt
}
if Measurable = 1
 {
   FileAppend,  �� Measurable : %1_Space%, c:\temp\test.txt
}
  if Measurable = 0
 {
    FileAppend,  �� Measurable:  %1_Space%, c:\temp\test.txt
}
    FileAppend, __%Measure%__, c:\temp\test.txt
; FileAppend �n��S��r���ݭn�A���ӥB�n����
    FileAppend, 
(
cm (largest diametrer)
) `n, c:\temp\test.txt
    FileAppend,   %2_Space% `n, c:\temp\test.txt    ; ��J�ťզ����U�ƪ�
;-------------------------------------------------------------
    FileAppend,  2. %1_Space%Tumor invasion `n, c:\temp\test.txt  
if Invasion0 = 1
 {
   FileAppend,  %4_Space%�� No or equivocal%1_Space%, c:\temp\test.txt
}
  if Invasion0 = 0
 {
   FileAppend,  %4_Space%�� No or equivocal %1_Space%, c:\temp\test.txt
}
FileAppend,  `n, c:\temp\test.txt  ;����
if Invasion1 = 1
 {
   FileAppend,  %4_Space%�� Colonic or rectal wall(T1-T2)%1_Space%, c:\temp\test.txt
}
  if Invasion1 = 0
 {
   FileAppend,  %4_Space%�� Colonic or rectal wall(T1-T2) %1_Space%, c:\temp\test.txt
}
FileAppend,  `n, c:\temp\test.txt  ;����
if Invasion2= 1
 {
   FileAppend,  %4_Space%�� Invades non-peritonealized pericolic or perirectal tissues(T3) %1_Space%, c:\temp\test.txt
}
  if Invasion2 = 0
 {
   FileAppend,  %4_Space%�� Invades non-peritonealized pericolic or perirectal tissues(T3) %1_Space%, c:\temp\test.txt
}
FileAppend,  `n, c:\temp\test.txt  ;����
if Invasion3= 1
 {
   FileAppend,  %4_Space%�� Invades visceral peritoneum(T4a)`n, c:\temp\test.txt
}
  if Invasion3 = 0
 {
   FileAppend,  %4_Space%�� Invades visceral peritoneum(T4a) `n, c:\temp\test.txt
}
if Invasion4= 1
 {
   FileAppend,  %4_Space%�� Invades or adheres to adjacent organs or structures(T4b) %1_Space%__%Invasion5%__ `n, c:\temp\test.txt
}
  if Invasion4 = 0
 {
   FileAppend,  %4_Space%�� Invades or adheres to adjacent organs or structures(T4b) %1_Space%__%Invasion5%__ `n, c:\temp\test.txt
}
    
    FileAppend,   %2_Space% `n, c:\temp\test.txt    ; ��J�ťզ����U�ƪ�
;-------------------------------------------------------------
    FileAppend,  3. %1_Space%Regional node metastasis `n, c:\temp\test.txt  
if LN0= 1
 {
   FileAppend,  %4_Space%�� No %1_Space%, c:\temp\test.txt
}
  if LN0 = 0
 {
   FileAppend,  %4_Space%�� No %1_Space%, c:\temp\test.txt
}
    FileAppend,  `n, c:\temp\test.txt  ;����
if LN1= 1
 {
   FileAppend,  
(
%4_Space%�� Equivocal, Number:  %1_Space%
), c:\temp\test.txt
}
  if LN1 = 0
 {
   FileAppend,  
(
%4_Space%�� Equivocal, Number:  %1_Space%
), c:\temp\test.txt
}
    FileAppend,   __%LN21% __`n, c:\temp\test.txt 
    FileAppend,   %4_Space%%4_Space%Location: `n, c:\temp\test.txt 
if LN2= 1
 {
   FileAppend,  %4_Space%%4_Space%�� Pericolic/perirectal %1_Space%, c:\temp\test.txt
}
  if LN2 = 0
 {
   FileAppend,  %4_Space%%4_Space%�� Pericolic/perirectal  %1_Space%, c:\temp\test.txt
}
if LN3= 1
 {
   FileAppend,  �� Ileocolic %1_Space%, c:\temp\test.txt
}
  if LN3 = 0
 {
   FileAppend,  �� Ileocolic%1_Space%, c:\temp\test.txt
}
if LN4= 1
 {
   FileAppend,  �� Right colic %1_Space%, c:\temp\test.txt
}
  if LN4 = 0
 {
   FileAppend,  �� Right colic%1_Space%, c:\temp\test.txt
}
if LN5= 1
 {
   FileAppend,  �� Middle colic %1_Space%, c:\temp\test.txt
}
  if LN5 = 0
 {
   FileAppend,  �� Middle colic%1_Space%, c:\temp\test.txt
}
if LN6= 1
 {
   FileAppend,  �� Left colic %1_Space%, c:\temp\test.txt
}
  if LN6 = 0
 {
   FileAppend,  �� Left colic%1_Space%, c:\temp\test.txt
}
if LN7= 1
 {
   FileAppend,  �� Superior rectal %1_Space% `n, c:\temp\test.txt
}
  if LN7 = 0
 {
   FileAppend,  �� Superior rectal%1_Space% `n, c:\temp\test.txt
}
if LN8= 1
 {
   FileAppend,  %4_Space%%4_Space%�� Superior mesenteric artery %1_Space%, c:\temp\test.txt
}
  if LN8 = 0
 {
   FileAppend,  %4_Space%%4_Space%��  Superior mesenteric artery %1_Space%, c:\temp\test.txt
}
if LN9= 1
 {
   FileAppend,  �� Inferior mesenteric artery %1_Space%, c:\temp\test.txt
}
  if LN9 = 0
 {
   FileAppend,  �� Inferior mesenteric artery %1_Space%, c:\temp\test.txt
}
if LN10= 1
 {
   FileAppend,  �� Other: %1_Space%__%LN22%__`n, c:\temp\test.txt
}
  if LN10 = 0
 {
   FileAppend,  �� Other: %1_Space%__%LN22%__`n, c:\temp\test.txt
}
if LN11= 1
 {
   FileAppend,  
(
%4_Space%�� Yes, Number:   %1_Space%
), c:\temp\test.txt
}
  if LN11 = 0
 {
   FileAppend,  
(
%4_Space%�� Yes, Number:  %1_Space%
), c:\temp\test.txt
}
    FileAppend,   __%LN23%__%1_Space%(N1a:1; N1b:2-3; N2a:4-6; N2b:>=7) `n, c:\temp\test.txt 
    FileAppend,   %4_Space%%4_Space%Location: `n, c:\temp\test.txt 
if LN12= 1
 {
   FileAppend,  %4_Space%%4_Space%�� Pericolic/perirectal %1_Space%, c:\temp\test.txt
}
  if LN12 = 0
 {
   FileAppend,  %4_Space%%4_Space%�� Pericolic/perirectal  %1_Space%, c:\temp\test.txt
}
if LN13= 1
 {
   FileAppend,  �� Ileocolic %1_Space%, c:\temp\test.txt
}
  if LN13 = 0
 {
   FileAppend,  �� Ileocolic%1_Space%, c:\temp\test.txt
}
if LN14= 1
 {
   FileAppend,  �� Right colic %1_Space%, c:\temp\test.txt
}
  if LN14 = 0
 {
   FileAppend,  �� Right colic%1_Space%, c:\temp\test.txt
}
if LN15= 1
 {
   FileAppend,  �� Middle colic %1_Space%, c:\temp\test.txt
}
  if LN15 = 0
 {
   FileAppend,  �� Middle colic%1_Space%, c:\temp\test.txt
}
if LN16= 1
 {
   FileAppend,  �� Left colic %1_Space%, c:\temp\test.txt
}
  if LN16 = 0
 {
   FileAppend,  �� Left colic%1_Space%, c:\temp\test.txt
}
if LN17= 1
 {
   FileAppend,  �� Superior rectal %1_Space% `n, c:\temp\test.txt
}
  if LN17 = 0
 {
   FileAppend,  �� Superior rectal%1_Space% `n, c:\temp\test.txt
}
if LN18= 1
 {
   FileAppend,  %4_Space%%4_Space%�� Superior mesenteric artery %1_Space%, c:\temp\test.txt
}
  if LN18 = 0
 {
   FileAppend,  %4_Space%%4_Space%��  Superior mesenteric artery %1_Space%, c:\temp\test.txt
}
if LN19= 1
 {
   FileAppend,  �� Inferior mesenteric artery %1_Space%, c:\temp\test.txt
}
  if LN19 = 0
 {
   FileAppend,  �� Inferior mesenteric artery %1_Space%, c:\temp\test.txt
}
if LN20= 1
 {
   FileAppend,  �� Other: %1_Space%__%LN24%__`n, c:\temp\test.txt
}
  if LN20 = 0
 {
   FileAppend,  �� Other: %1_Space%__%LN24%__`n, c:\temp\test.txt
}
    FileAppend,   %2_Space% `n, c:\temp\test.txt    ; ��J�ťզ����U�ƪ�
;-------------------------------------------------------------
    FileAppend,  4. %1_Space%Distant metastasis(in this study)`n, c:\temp\test.txt  
if DM0= 1
 {
   FileAppend,  %4_Space%�� No %1_Space%, c:\temp\test.txt
}
  if DM0 = 0
 {
   FileAppend,  %4_Space%�� No %1_Space%, c:\temp\test.txt
}
    FileAppend,  `n, c:\temp\test.txt  ;����
if DM1= 1
 {
   FileAppend,  
(
%4_Space%�� Equivocal, location:  %1_Space%%DM3%
), c:\temp\test.txt
}
  if DM1 = 0
 {
   FileAppend,  
(
%4_Space%�� Equivocal, location:  _____%DM3%______
), c:\temp\test.txt
}
    FileAppend,   %2_Space%`n, c:\temp\test.txt 
if DM2= 1
 {
   FileAppend,  
(
%4_Space%�� Yes, location:  %1_Space%%DM4%
)`n, c:\temp\test.txt
}
  if DM2 = 0
 {
   FileAppend,  
(
%4_Space%�� Yes, location:  _____%DM4%______
)`n, c:\temp\test.txt
}
    FileAppend,   %2_Space%`n, c:\temp\test.txt 
;-------------------------------------------------------------
    FileAppend,  5. %1_Space%Other findings: `n, c:\temp\test.txt 
    FileAppend,  %4_Space%______ %OF0%________ `n, c:\temp\test.txt 
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
