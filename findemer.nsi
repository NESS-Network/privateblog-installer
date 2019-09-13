; Script generated with the Venis Install Wizard

; Define your application name
!define APPNAME "FindEmercoinConf"
!define APPNAMEANDVERSION "Select emercoin.conf"

; Main Install settings
Name "${APPNAMEANDVERSION}"
InstallDir "$APPDATA\Emercoin"
OutFile "output\findemerconf.exe"

DirText "Choose the folder with emercoin.conf"

ShowInstDetails show

Section FindEmerConf
	IfFileExists "$INSTDIR\emercoin.conf" 0 Dupa
	DetailPrint "emmercoin.conf found!"
	WriteINIStr "$TEMP\launcher.ini.tmp" "paths" "emercoin-conf" "$INSTDIR\emercoin.conf"
	Goto EndSect
	Dupa:
		DetailPrint "emmercoin.conf NOT FOUND!"
		WriteINIStr "$TEMP\launcher.ini.tmp" "paths" "emercoin-conf" "NONE"
	EndSect:
SectionEnd

; eof