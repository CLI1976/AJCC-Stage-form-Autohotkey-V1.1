; �Ы�GUI���f
Gui, Add, Button, gRunScript1 w80 h20 y15 x10 , Colon
Gui, Add, Button, gRunScript2 w80 h20 y15 x105, Esophagus
Gui, Add, Button, gRunScript3 w80 h20 y40 x10, Gastric
Gui, Add, Button, gRunScript4 w80 h20 y40 x105, HCC
Gui, Add, Button, gRunScript5 w80 h20 y65 x10, Lung
Gui, Add, Button, gRunScript6 w80 h20 y65 x105, Prostate
Gui, Add, Button, gRunScript7 w80 h20 y90 x10, Endometria
Gui, Add, Button, gRunScript8 w80 h20 y90 x105, Cervical
Gui, Add, Button, gRunScript9 w80 h20 y115 x10, Ovarian
Gui, Add, Button, gRunScript10 w80 h20 y115 x105, Pancreas
Gui, Add, Button, gRunScript11 w80 h20 y140 x10, Colangio
Gui, Add, Button, gRunScript12 w80 h20 y140 x105, Nasopharynx
Gui, Add, Button, gRunScript13 w80 h20 y165 x10, Oral
Gui, Add, Button, gRunScript14 w80 h20 y165 x105, Oropharynx
Gui, Add, Button, gRunScript15 w80 h20 y190 x10, Hypopharynx
Gui, Add, Button, gRunScript16 w80 h20 y190 x105, GIST
Gui, Add, Button, gRunScript17 w80 h20 y215 x10, RCC
Gui, Add, Button, gRunScript18 w80 h20 y215 x105, Urinary bladder 
Gui, Add, Button, gRunScript19 w80 h20 y240 x10, Larynx

; GUI Configuration
; Gui, Color, 85ddda ; ��
; Gui, Color, cca6bf ; ���æ� 
; Gui, Color, a3a3a2 ; ������ ���@�A�f���t
; Gui, Color, ee827c ; �ƤT�� ���z���i�f
Gui, Color, ee827c ; �ƤT�� ���z���i�f
Gui, Font, cDefault, Arial

Menu, Tray, Icon, C:\Green software\Icon\favicon-20181225093349134.ico, 1
; ���GUI���f�A�b�ù������W����m�]x=0, y=0�^�A���f�j�p��200x300
Gui, Show, x1720 y850 w200 h280, Stage form
return

; ���s1���B�z�{��Colon
RunScript1:
Run, "C:\Program Files\AutoHotkey\AutoHotkey.exe" "C:\Green software\AHK compiler\Staging form\colon.ahk"
return

; ���s2���B�z�{��Esophagus
RunScript2:
Run, "C:\Program Files\AutoHotkey\AutoHotkey.exe" "C:\Green software\AHK compiler\Staging form\esophageal.ahk"
return

; ���s3���B�z�{��Gastric
RunScript3:
Run, "C:\Program Files\AutoHotkey\AutoHotkey.exe" "C:\Green software\AHK compiler\Staging form\Gastric.ahk"
return

; ���s4���B�z�{��HCC
RunScript4:
Run, "C:\Program Files\AutoHotkey\AutoHotkey.exe" "C:\Green software\AHK compiler\Staging form\HCC.ahk"
return

; ���s5���B�z�{��Lung
RunScript5:
Run, "C:\Program Files\AutoHotkey\AutoHotkey.exe" "C:\Green software\AHK compiler\Staging form\Lung.ahk"
return

; ���s6���B�z�{��Prostate
RunScript6:
Run, "C:\Program Files\AutoHotkey\AutoHotkey.exe" "C:\Green software\AHK compiler\Staging form\Prostate.ahk"
return

; ���s7���B�z�{��Endometria
RunScript7:
Run, "C:\Program Files\AutoHotkey\AutoHotkey.exe" "C:\Green software\AHK compiler\Staging form\endometrial.ahk"
return

; ���s8���B�z�{��Cervical
RunScript8:
Run, "C:\Program Files\AutoHotkey\AutoHotkey.exe" "C:\Green software\AHK compiler\Staging form\cervical.ahk"
return

; ���s9���B�z�{��Ovarian
RunScript9:
Run, "C:\Program Files\AutoHotkey\AutoHotkey.exe" "C:\Green software\AHK compiler\Staging form\ovarian.ahk"
return

; ���s10���B�z�{��Ovarian
RunScript10:
Run, "C:\Program Files\AutoHotkey\AutoHotkey.exe" "C:\Green software\AHK compiler\Staging form\pancreatic.ahk"
return

; ���s11���B�z�{��Colangio
RunScript11:
Run, "C:\Program Files\AutoHotkey\AutoHotkey.exe" "C:\Green software\AHK compiler\Staging form\Colangio.ahk"
return

; ���s12���B�z�{��Nasopharynx
RunScript12:
Run, "C:\Program Files\AutoHotkey\AutoHotkey.exe" "C:\Green software\AHK compiler\Staging form\Nasopharyngeal.ahk"
return

; ���s13���B�z�{��Oral
RunScript13:
Run, "C:\Program Files\AutoHotkey\AutoHotkey.exe" "C:\Green software\AHK compiler\Staging form\Oral.ahk"
return

; ���s14���B�z�{��Oropharynx
RunScript14:
Run, "C:\Program Files\AutoHotkey\AutoHotkey.exe" "C:\Green software\AHK compiler\Staging form\Oropharynx.ahk"
return

; ���s15���B�z�{��Hypopharynx
RunScript15:
Run, "C:\Program Files\AutoHotkey\AutoHotkey.exe" "C:\Green software\AHK compiler\Staging form\Hypopharygeal.ahk"
return

; ���s16���B�z�{��GIST
RunScript16:
Run, "C:\Program Files\AutoHotkey\AutoHotkey.exe" "C:\Green software\AHK compiler\Staging form\GIST.ahk"
return

; ���s17���B�z�{��RCC
RunScript17:
Run, "C:\Program Files\AutoHotkey\AutoHotkey.exe" "C:\Green software\AHK compiler\Staging form\RCC.ahk"
return

; ���s18���B�z�{��Urinary bladder
RunScript18:
Run, "C:\Program Files\AutoHotkey\AutoHotkey.exe" "C:\Green software\AHK compiler\Staging form\Urinary bladder.ahk"
return

; ���s19���B�z�{��Larynx
RunScript19:
Run, "C:\Program Files\AutoHotkey\AutoHotkey.exe" "C:\Green software\AHK compiler\Staging form\Larygeal.ahk"
return

; ����GUI���f
GuiClose:
ExitApp
