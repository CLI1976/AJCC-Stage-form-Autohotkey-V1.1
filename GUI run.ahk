; 創建GUI窗口
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
; Gui, Color, 85ddda ; 綠
; Gui, Color, cca6bf ; 紅藤色 
; Gui, Color, a3a3a2 ; 薄墨色 よエォノゆボ
; Gui, Color, ee827c ; 甚三紅 ェモゥパノ
Gui, Color, ee827c ; 甚三紅 ェモゥパノ
Gui, Font, cDefault, Arial

Menu, Tray, Icon, C:\Green software\Icon\favicon-20181225093349134.ico, 1
; 顯示GUI窗口，在螢幕的左上角位置（x=0, y=0），窗口大小為200x300
Gui, Show, x1720 y850 w200 h280, Stage form
return

; 按鈕1的處理程序Colon
RunScript1:
Run, "C:\Program Files\AutoHotkey\AutoHotkey.exe" "C:\Green software\AHK compiler\Staging form\colon.ahk"
return

; 按鈕2的處理程序Esophagus
RunScript2:
Run, "C:\Program Files\AutoHotkey\AutoHotkey.exe" "C:\Green software\AHK compiler\Staging form\esophageal.ahk"
return

; 按鈕3的處理程序Gastric
RunScript3:
Run, "C:\Program Files\AutoHotkey\AutoHotkey.exe" "C:\Green software\AHK compiler\Staging form\Gastric.ahk"
return

; 按鈕4的處理程序HCC
RunScript4:
Run, "C:\Program Files\AutoHotkey\AutoHotkey.exe" "C:\Green software\AHK compiler\Staging form\HCC.ahk"
return

; 按鈕5的處理程序Lung
RunScript5:
Run, "C:\Program Files\AutoHotkey\AutoHotkey.exe" "C:\Green software\AHK compiler\Staging form\Lung.ahk"
return

; 按鈕6的處理程序Prostate
RunScript6:
Run, "C:\Program Files\AutoHotkey\AutoHotkey.exe" "C:\Green software\AHK compiler\Staging form\Prostate.ahk"
return

; 按鈕7的處理程序Endometria
RunScript7:
Run, "C:\Program Files\AutoHotkey\AutoHotkey.exe" "C:\Green software\AHK compiler\Staging form\endometrial.ahk"
return

; 按鈕8的處理程序Cervical
RunScript8:
Run, "C:\Program Files\AutoHotkey\AutoHotkey.exe" "C:\Green software\AHK compiler\Staging form\cervical.ahk"
return

; 按鈕9的處理程序Ovarian
RunScript9:
Run, "C:\Program Files\AutoHotkey\AutoHotkey.exe" "C:\Green software\AHK compiler\Staging form\ovarian.ahk"
return

; 按鈕10的處理程序Ovarian
RunScript10:
Run, "C:\Program Files\AutoHotkey\AutoHotkey.exe" "C:\Green software\AHK compiler\Staging form\pancreatic.ahk"
return

; 按鈕11的處理程序Colangio
RunScript11:
Run, "C:\Program Files\AutoHotkey\AutoHotkey.exe" "C:\Green software\AHK compiler\Staging form\Colangio.ahk"
return

; 按鈕12的處理程序Nasopharynx
RunScript12:
Run, "C:\Program Files\AutoHotkey\AutoHotkey.exe" "C:\Green software\AHK compiler\Staging form\Nasopharyngeal.ahk"
return

; 按鈕13的處理程序Oral
RunScript13:
Run, "C:\Program Files\AutoHotkey\AutoHotkey.exe" "C:\Green software\AHK compiler\Staging form\Oral.ahk"
return

; 按鈕14的處理程序Oropharynx
RunScript14:
Run, "C:\Program Files\AutoHotkey\AutoHotkey.exe" "C:\Green software\AHK compiler\Staging form\Oropharynx.ahk"
return

; 按鈕15的處理程序Hypopharynx
RunScript15:
Run, "C:\Program Files\AutoHotkey\AutoHotkey.exe" "C:\Green software\AHK compiler\Staging form\Hypopharygeal.ahk"
return

; 按鈕16的處理程序GIST
RunScript16:
Run, "C:\Program Files\AutoHotkey\AutoHotkey.exe" "C:\Green software\AHK compiler\Staging form\GIST.ahk"
return

; 按鈕17的處理程序RCC
RunScript17:
Run, "C:\Program Files\AutoHotkey\AutoHotkey.exe" "C:\Green software\AHK compiler\Staging form\RCC.ahk"
return

; 按鈕18的處理程序Urinary bladder
RunScript18:
Run, "C:\Program Files\AutoHotkey\AutoHotkey.exe" "C:\Green software\AHK compiler\Staging form\Urinary bladder.ahk"
return

; 按鈕19的處理程序Larynx
RunScript19:
Run, "C:\Program Files\AutoHotkey\AutoHotkey.exe" "C:\Green software\AHK compiler\Staging form\Larygeal.ahk"
return

; 關閉GUI窗口
GuiClose:
ExitApp
