; Script generated with the Venis Install Wizard

!include x64.nsh

; Define your application name
!define APPNAME "Private Blog"
!define APPNAMEANDVERSION "Private Blog"

; Main Install settings
Name "${APPNAMEANDVERSION}"
InstallDir "$PROFILE\privblog"
InstallDirRegKey HKLM "Software\${APPNAME}" ""
OutFile "output\pb_setup.exe"

ComponentText "Choose which features of ${APPNAMEANDVERSION} you want to install."

DirText "Choose the folder in which to install ${APPNAMEANDVERSION}."

ShowInstDetails show

Var EmerConfPath

Section "VC redist"

	; Set Section properties
	SectionIn RO
	SetOverwrite on

	; Set Section Files and Shortcuts
	DetailPrint "Installing vc_redist..."
	SetOutPath "$TEMP\pblog.tmp\"
	
	${If} ${IsNativeAMD64}
     DetailPrint "System Architecture: x64"
		 File "vcredist\vc_redist.x64.exe"
		 ExecWait "$TEMP\pblog.tmp\vc_redist.x64.exe /S"
		 Delete "$TEMP\pblog.tmp\vc_redist.x64.exe"		 
   ${ElseIf} ${IsNativeIA32}
     DetailPrint "System Architecture: x86"
		 File "vcredist\vc_redist.x86.exe"
		 ExecWait "$TEMP\pblog.tmp\vc_redist.x86.exe /S"
		 Delete "$TEMP\pblog.tmp\vc_redist.x86.exe"		 
   ${Else}
     DetailPrint "Unsupported CPU architecture!"
   ${EndIf}

SectionEnd

Section -SetPaths
	IfFileExists "$APPDATA\Emercoin\emercoin.conf" 0 DupaConf ;emercoin config check
	DetailPrint "emmercoin.conf found!"
	WriteINIStr "$TEMP\launcher.ini.tmp" "paths" "emercoin-conf" "$INSTDIR\emercoin.conf"
	Goto EndSect
	DupaConf: ; user select path to emercoin.conf
		SetOutPath "$TEMP\pblog.tmp\"
		File "insthelpers\findemerconf.exe"
		ExecWait "$TEMP\pblog.tmp\findemerconf.exe"
		ReadINIStr $R0 "$TEMP\launcher.ini.tmp" "paths" "emercoin-conf"
		StrCmp '"$R0"' '"NONE"' 0 EndSect ; user not select path
		MessageBox MB_OK "You not selct emercoin.conf (emercoin wallet not installed?). You must fix variable EMCCONF value in launcher BAT file."
		
	EndSect:
		Delete "$TEMP\pblog.tmp\findemerconf.exe"
		RMDir "$TEMP\pblog.tmp\"
SectionEnd

Section "PHP"

	; Set Section properties
	SectionIn RO
	SetOverwrite on
	
	DetailPrint "Installing PHP..."
	${If} ${IsNativeAMD64}
    DetailPrint "System Architecture: x64"
		SetOutPath "$INSTDIR\php\"		 
		File "php\x64\deplister.exe"
		File "php\x64\glib-2.dll"
		File "php\x64\gmodule-2.dll"
		File "php\x64\icudt64.dll"
		File "php\x64\icuin64.dll"
		File "php\x64\icuio64.dll"
		File "php\x64\icuuc64.dll"
		File "php\x64\install.txt"
		File "php\x64\libcrypto-1_1-x64.dll"
		File "php\x64\libenchant.dll"
		File "php\x64\libpq.dll"
		File "php\x64\libsasl.dll"
		File "php\x64\libsodium.dll"
		File "php\x64\libssh2.dll"
		File "php\x64\libssl-1_1-x64.dll"
		File "php\x64\license.txt"
		File "php\x64\news.txt"
		File "php\x64\nghttp2.dll"
		File "php\x64\phar.phar.bat"
		File "php\x64\pharcommand.phar"
		File "php\x64\php-cgi.exe"
		File "php\x64\php-win.exe"
		File "php\x64\php.exe"
		File "php\x64\php.gif"
		File "php\x64\php.ini"
		File "php\x64\php7apache2_4.dll"
		File "php\x64\php7embed.lib"
		File "php\x64\php7phpdbg.dll"
		File "php\x64\php7ts.dll"
		File "php\x64\phpdbg.exe"
		File "php\x64\readme-redist-bins.txt"
		File "php\x64\snapshot.txt"
		SetOutPath "$INSTDIR\php\dev\"
		File "php\x64\dev\php7ts.lib"
		SetOutPath "$INSTDIR\php\ext\"
		File "php\x64\ext\php_bz2.dll"
		File "php\x64\ext\php_com_dotnet.dll"
		File "php\x64\ext\php_curl.dll"
		File "php\x64\ext\php_dba.dll"
		File "php\x64\ext\php_enchant.dll"
		File "php\x64\ext\php_exif.dll"
		File "php\x64\ext\php_fileinfo.dll"
		File "php\x64\ext\php_ftp.dll"
		File "php\x64\ext\php_gd2.dll"
		File "php\x64\ext\php_gettext.dll"
		File "php\x64\ext\php_gmp.dll"
		File "php\x64\ext\php_imap.dll"
		File "php\x64\ext\php_interbase.dll"
		File "php\x64\ext\php_intl.dll"
		File "php\x64\ext\php_ldap.dll"
		File "php\x64\ext\php_mbstring.dll"
		File "php\x64\ext\php_mysqli.dll"
		File "php\x64\ext\php_oci8_12c.dll"
		File "php\x64\ext\php_odbc.dll"
		File "php\x64\ext\php_opcache.dll"
		File "php\x64\ext\php_openssl.dll"
		File "php\x64\ext\php_pdo_firebird.dll"
		File "php\x64\ext\php_pdo_mysql.dll"
		File "php\x64\ext\php_pdo_oci.dll"
		File "php\x64\ext\php_pdo_odbc.dll"
		File "php\x64\ext\php_pdo_pgsql.dll"
		File "php\x64\ext\php_pdo_sqlite.dll"
		File "php\x64\ext\php_pgsql.dll"
		File "php\x64\ext\php_phpdbg_webhelper.dll"
		File "php\x64\ext\php_shmop.dll"
		File "php\x64\ext\php_snmp.dll"
		File "php\x64\ext\php_soap.dll"
		File "php\x64\ext\php_sockets.dll"
		File "php\x64\ext\php_sodium.dll"
		File "php\x64\ext\php_sqlite3.dll"
		File "php\x64\ext\php_sysvshm.dll"
		File "php\x64\ext\php_tidy.dll"
		File "php\x64\ext\php_xmlrpc.dll"
		File "php\x64\ext\php_xsl.dll"
		File "php\x64\ext\php_zend_test.dll"
		SetOutPath "$INSTDIR\php\extras\ssl\"
		File "php\x64\extras\ssl\openssl.cnf"
		SetOutPath "$INSTDIR\php\lib\enchant\"
		File "php\x64\lib\enchant\libenchant_ispell.dll"
		File "php\x64\lib\enchant\libenchant_myspell.dll"
		SetOutPath "$INSTDIR\php\sasl2\"
		File "php\x64\sasl2\saslANONYMOUS.dll"
		File "php\x64\sasl2\saslCRAMMD5.dll"
		File "php\x64\sasl2\saslDIGESTMD5.dll"
		File "php\x64\sasl2\saslLOGIN.dll"
		File "php\x64\sasl2\saslNTLM.dll"
		File "php\x64\sasl2\saslOTP.dll"
		File "php\x64\sasl2\saslPLAIN.dll"
		File "php\x64\sasl2\saslSASLDB.dll"
		File "php\x64\sasl2\saslSCRAM.dll"
		File "php\x64\sasl2\saslSQLITE.dll"
   ${ElseIf} ${IsNativeIA32}
		DetailPrint "System Architecture: x86"
		SetOutPath "$INSTDIR\php\"
		File "php\x86\deplister.exe"
		File "php\x86\glib-2.dll"
		File "php\x86\gmodule-2.dll"
		File "php\x86\icudt64.dll"
		File "php\x86\icuin64.dll"
		File "php\x86\icuio64.dll"
		File "php\x86\icuuc64.dll"
		File "php\x86\install.txt"
		File "php\x86\libcrypto-1_1.dll"
		File "php\x86\libenchant.dll"
		File "php\x86\libpq.dll"
		File "php\x86\libsasl.dll"
		File "php\x86\libsodium.dll"
		File "php\x86\libssh2.dll"
		File "php\x86\libssl-1_1.dll"
		File "php\x86\license.txt"
		File "php\x86\news.txt"
		File "php\x86\nghttp2.dll"
		File "php\x86\phar.phar.bat"
		File "php\x86\pharcommand.phar"
		File "php\x86\php-cgi.exe"
		File "php\x86\php-win.exe"
		File "php\x86\php.exe"
		File "php\x86\php.gif"
		File "php\x86\php.ini"
		File "php\x86\php7apache2_4.dll"
		File "php\x86\php7embed.lib"
		File "php\x86\php7phpdbg.dll"
		File "php\x86\php7ts.dll"
		File "php\x86\phpdbg.exe"
		File "php\x86\readme-redist-bins.txt"
		File "php\x86\snapshot.txt"
		SetOutPath "$INSTDIR\php\dev\"
		File "php\x86\dev\php7ts.lib"
		SetOutPath "$INSTDIR\php\ext\"
		File "php\x86\ext\php_bz2.dll"
		File "php\x86\ext\php_com_dotnet.dll"
		File "php\x86\ext\php_curl.dll"
		File "php\x86\ext\php_dba.dll"
		File "php\x86\ext\php_enchant.dll"
		File "php\x86\ext\php_exif.dll"
		File "php\x86\ext\php_fileinfo.dll"
		File "php\x86\ext\php_ftp.dll"
		File "php\x86\ext\php_gd2.dll"
		File "php\x86\ext\php_gettext.dll"
		File "php\x86\ext\php_gmp.dll"
		File "php\x86\ext\php_imap.dll"
		File "php\x86\ext\php_interbase.dll"
		File "php\x86\ext\php_intl.dll"
		File "php\x86\ext\php_ldap.dll"
		File "php\x86\ext\php_mbstring.dll"
		File "php\x86\ext\php_mysqli.dll"
		File "php\x86\ext\php_oci8_12c.dll"
		File "php\x86\ext\php_odbc.dll"
		File "php\x86\ext\php_opcache.dll"
		File "php\x86\ext\php_openssl.dll"
		File "php\x86\ext\php_pdo_firebird.dll"
		File "php\x86\ext\php_pdo_mysql.dll"
		File "php\x86\ext\php_pdo_oci.dll"
		File "php\x86\ext\php_pdo_odbc.dll"
		File "php\x86\ext\php_pdo_pgsql.dll"
		File "php\x86\ext\php_pdo_sqlite.dll"
		File "php\x86\ext\php_pgsql.dll"
		File "php\x86\ext\php_phpdbg_webhelper.dll"
		File "php\x86\ext\php_shmop.dll"
		File "php\x86\ext\php_snmp.dll"
		File "php\x86\ext\php_soap.dll"
		File "php\x86\ext\php_sockets.dll"
		File "php\x86\ext\php_sodium.dll"
		File "php\x86\ext\php_sqlite3.dll"
		File "php\x86\ext\php_sysvshm.dll"
		File "php\x86\ext\php_tidy.dll"
		File "php\x86\ext\php_xmlrpc.dll"
		File "php\x86\ext\php_xsl.dll"
		File "php\x86\ext\php_zend_test.dll"
		SetOutPath "$INSTDIR\php\extras\ssl\"
		File "php\x86\extras\ssl\openssl.cnf"
		SetOutPath "$INSTDIR\php\lib\enchant\"
		File "php\x86\lib\enchant\libenchant_ispell.dll"
		File "php\x86\lib\enchant\libenchant_myspell.dll"
		SetOutPath "$INSTDIR\php\sasl2\"
		File "php\x86\sasl2\saslANONYMOUS.dll"
		File "php\x86\sasl2\saslCRAMMD5.dll"
		File "php\x86\sasl2\saslDIGESTMD5.dll"
		File "php\x86\sasl2\saslLOGIN.dll"
		File "php\x86\sasl2\saslNTLM.dll"
		File "php\x86\sasl2\saslOTP.dll"
		File "php\x86\sasl2\saslPLAIN.dll"
		File "php\x86\sasl2\saslSASLDB.dll"
		File "php\x86\sasl2\saslSCRAM.dll"
		File "php\x86\sasl2\saslSQLITE.dll"
   ${Else}
     DetailPrint "Unsupported CPU architecture!"
   ${EndIf}
	;modify php.ini
	CreateDirectory "$INSTDIR\php\tmp"
	WriteINIStr "$INSTDIR\php\php.ini" "PHP" "extension_dir" "$INSTDIR\php\ext"
	WriteINIStr "$INSTDIR\php\php.ini" "PHP" "sys_temp_dir" "$INSTDIR\php\tmp"
	
SectionEnd

Section "Private Blog"

	; Set Section properties
	SectionIn RO
	SetOverwrite on

	; Set Section Files and Shortcuts
	SetOutPath "$INSTDIR\pblog\"
	File "pblog\pblog.phar"
	File "pblog\config.php"
	
	SetOutPath "$INSTDIR\"
	File "pblog.ico"
	
	DetailPrint "Create launcher..."
	ReadINIStr $EmerConfPath "$TEMP\launcher.ini.tmp" "paths" "emercoin-conf"
	
	FileOpen $R0 '$INSTDIR\launcher.bat' w
	FileWrite $R0 '@echo off $\r$\n'
	FileWrite $R0 '@SET EMCCONF="$EmerConfPath"$\r$\n'
	;FileWrite $R0 '@SET PATH=%PATH%;"$INSTDIR\php"$\r$\n'
	FileWrite $R0 '$\r$\n'
	FileWrite $R0 'cd "$INSTDIR\pblog" $\r$\n'
	FileWrite $R0 'echo Configure PrivateBlog...$\r$\n'
	FileWrite $R0 '"$INSTDIR\php\php.exe" config.php -f="%EMCCONF%" $\r$\n'
	FileWrite $R0 'echo Starting PrivateBlog...$\r$\n'
	FileWrite $R0 '"$INSTDIR\php\php.exe" -S localhost:8000 pblog.phar $\r$\n'
	FileClose $R0
	
	MessageBox MB_YESNO "Create icons on Desktop?" IDNO NoCreate
	CreateShortCut "$DESKTOP\Launch Private Blog.lnk" "$INSTDIR\launcher.bat" "" "$INSTDIR\pblog.ico"
	CreateShortCut "$DESKTOP\Go Private Blog.lnk" "http://localhost:8000" "" "$INSTDIR\pblog.ico"
	
	NoCreate:
	CreateDirectory "$SMPROGRAMS\Private Blog"
	CreateShortCut "$SMPROGRAMS\Private Blog\Launch Private Blog.lnk" "$INSTDIR\launcher.bat" "" "$INSTDIR\pblog.ico"
	CreateShortCut "$SMPROGRAMS\Private Blog\Go Private Blog.lnk" "http://localhost:8000" "" "$INSTDIR\pblog.ico"
	CreateShortCut "$SMPROGRAMS\Private Blog\Uninstall.lnk" "$INSTDIR\uninstall.exe"

SectionEnd


Section -FinishSection

	WriteRegStr HKLM "Software\${APPNAME}" "" "$INSTDIR"
	WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APPNAME}" "DisplayName" "${APPNAME}"
	WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APPNAME}" "UninstallString" "$INSTDIR\uninstall.exe"
	WriteUninstaller "$INSTDIR\uninstall.exe"

SectionEnd

;Uninstall section
Section Uninstall

	SetDetailsView show
	;Remove from registry...
	DeleteRegKey HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APPNAME}"
	DeleteRegKey HKLM "SOFTWARE\${APPNAME}"

	; Delete self
	Delete "$INSTDIR\uninstall.exe"

	; Delete Shortcuts
	Delete "$DESKTOP\Launch Private Blog.lnk"
	Delete "$DESKTOP\Go Private Blog.lnk"	
	Delete "$SMPROGRAMS\Private Blog\Go Private Blog.lnk"
	Delete "$SMPROGRAMS\Private Blog\Launch Private Blog.lnk"
	Delete "$SMPROGRAMS\Private Blog\Uninstall.lnk"

	; Clean up Private Blog
	Delete "$INSTDIR\pblog\pblog.phar"
	Delete "$INSTDIR\pblog\database.db"
	Delete "$INSTDIR\pblog\config.php"
	Delete "$INSTDIR\pblog\config.json"
	Delete "$INSTDIR\launcher.bat"
	Delete "$INSTDIR\pblog.ico"

	; Clean up VC redist
	Delete "$TEMP\pblog.tmp\vc_redist.x64.exe"
	Delete "$TEMP\pblog.tmp\vc_redist.x86.exe"

	; Clean up PHP
	
	Delete "$INSTDIR\php\deplister.exe"
	Delete "$INSTDIR\php\glib-2.dll"
	Delete "$INSTDIR\php\gmodule-2.dll"
	Delete "$INSTDIR\php\icudt64.dll"
	Delete "$INSTDIR\php\icuin64.dll"
	Delete "$INSTDIR\php\icuio64.dll"
	Delete "$INSTDIR\php\icuuc64.dll"
	Delete "$INSTDIR\php\install.txt"
	Delete "$INSTDIR\php\libcrypto-1_1.dll"
	Delete "$INSTDIR\php\libenchant.dll"
	Delete "$INSTDIR\php\libpq.dll"
	Delete "$INSTDIR\php\libsasl.dll"
	Delete "$INSTDIR\php\libsodium.dll"
	Delete "$INSTDIR\php\libssh2.dll"
	Delete "$INSTDIR\php\libssl-1_1.dll"
	Delete "$INSTDIR\php\license.txt"
	Delete "$INSTDIR\php\news.txt"
	Delete "$INSTDIR\php\nghttp2.dll"
	Delete "$INSTDIR\php\phar.phar.bat"
	Delete "$INSTDIR\php\pharcommand.phar"
	Delete "$INSTDIR\php\php-cgi.exe"
	Delete "$INSTDIR\php\php-win.exe"
	Delete "$INSTDIR\php\php.exe"
	Delete "$INSTDIR\php\php.gif"
	Delete "$INSTDIR\php\php.ini"
	Delete "$INSTDIR\php\php7apache2_4.dll"
	Delete "$INSTDIR\php\php7embed.lib"
	Delete "$INSTDIR\php\php7phpdbg.dll"
	Delete "$INSTDIR\php\php7ts.dll"
	Delete "$INSTDIR\php\phpdbg.exe"
	Delete "$INSTDIR\php\readme-redist-bins.txt"
	Delete "$INSTDIR\php\snapshot.txt"
	Delete "$INSTDIR\php\libcrypto-1_1-x64.dll"
	Delete "$INSTDIR\php\libssl-1_1-x64.dll"
	Delete "$INSTDIR\php\dev\php7ts.lib"
	Delete "$INSTDIR\php\ext\php_bz2.dll"
	Delete "$INSTDIR\php\ext\php_com_dotnet.dll"
	Delete "$INSTDIR\php\ext\php_curl.dll"
	Delete "$INSTDIR\php\ext\php_dba.dll"
	Delete "$INSTDIR\php\ext\php_enchant.dll"
	Delete "$INSTDIR\php\ext\php_exif.dll"
	Delete "$INSTDIR\php\ext\php_fileinfo.dll"
	Delete "$INSTDIR\php\ext\php_ftp.dll"
	Delete "$INSTDIR\php\ext\php_gd2.dll"
	Delete "$INSTDIR\php\ext\php_gettext.dll"
	Delete "$INSTDIR\php\ext\php_gmp.dll"
	Delete "$INSTDIR\php\ext\php_imap.dll"
	Delete "$INSTDIR\php\ext\php_interbase.dll"
	Delete "$INSTDIR\php\ext\php_intl.dll"
	Delete "$INSTDIR\php\ext\php_ldap.dll"
	Delete "$INSTDIR\php\ext\php_mbstring.dll"
	Delete "$INSTDIR\php\ext\php_mysqli.dll"
	Delete "$INSTDIR\php\ext\php_oci8_12c.dll"
	Delete "$INSTDIR\php\ext\php_odbc.dll"
	Delete "$INSTDIR\php\ext\php_opcache.dll"
	Delete "$INSTDIR\php\ext\php_openssl.dll"
	Delete "$INSTDIR\php\ext\php_pdo_firebird.dll"
	Delete "$INSTDIR\php\ext\php_pdo_mysql.dll"
	Delete "$INSTDIR\php\ext\php_pdo_oci.dll"
	Delete "$INSTDIR\php\ext\php_pdo_odbc.dll"
	Delete "$INSTDIR\php\ext\php_pdo_pgsql.dll"
	Delete "$INSTDIR\php\ext\php_pdo_sqlite.dll"
	Delete "$INSTDIR\php\ext\php_pgsql.dll"
	Delete "$INSTDIR\php\ext\php_phpdbg_webhelper.dll"
	Delete "$INSTDIR\php\ext\php_shmop.dll"
	Delete "$INSTDIR\php\ext\php_snmp.dll"
	Delete "$INSTDIR\php\ext\php_soap.dll"
	Delete "$INSTDIR\php\ext\php_sockets.dll"
	Delete "$INSTDIR\php\ext\php_sodium.dll"
	Delete "$INSTDIR\php\ext\php_sqlite3.dll"
	Delete "$INSTDIR\php\ext\php_sysvshm.dll"
	Delete "$INSTDIR\php\ext\php_tidy.dll"
	Delete "$INSTDIR\php\ext\php_xmlrpc.dll"
	Delete "$INSTDIR\php\ext\php_xsl.dll"
	Delete "$INSTDIR\php\ext\php_zend_test.dll"
	Delete "$INSTDIR\php\extras\ssl\openssl.cnf"
	Delete "$INSTDIR\php\lib\enchant\libenchant_ispell.dll"
	Delete "$INSTDIR\php\lib\enchant\libenchant_myspell.dll"
	Delete "$INSTDIR\php\sasl2\saslANONYMOUS.dll"
	Delete "$INSTDIR\php\sasl2\saslCRAMMD5.dll"
	Delete "$INSTDIR\php\sasl2\saslDIGESTMD5.dll"
	Delete "$INSTDIR\php\sasl2\saslLOGIN.dll"
	Delete "$INSTDIR\php\sasl2\saslNTLM.dll"
	Delete "$INSTDIR\php\sasl2\saslOTP.dll"
	Delete "$INSTDIR\php\sasl2\saslPLAIN.dll"
	Delete "$INSTDIR\php\sasl2\saslSASLDB.dll"
	Delete "$INSTDIR\php\sasl2\saslSCRAM.dll"
	Delete "$INSTDIR\php\sasl2\saslSQLITE.dll"

	; Remove remaining directories	
	RMDir "$SMPROGRAMS\Private Blog"	
	RMDir "$INSTDIR\php\sasl2\"
	RMDir "$INSTDIR\php\lib\enchant\"
	RMDir "$INSTDIR\php\lib\"
	RMDir "$INSTDIR\php\extras\ssl\"
	RMDir "$INSTDIR\php\extras\"
	RMDir "$INSTDIR\php\ext\"
	RMDir "$INSTDIR\php\dev\"
	RMDir "$INSTDIR\php\tmp"
	RMDir "$INSTDIR\php\"
	RMDir "$INSTDIR\pblog\"
	RMDir "$INSTDIR\"

SectionEnd

Function un.onInit

	MessageBox MB_YESNO|MB_DEFBUTTON2|MB_ICONQUESTION "Remove ${APPNAMEANDVERSION} and all of its components?" IDYES DoUninstall
		Abort
	DoUninstall:

FunctionEnd

; eof