@echo off

setlocal
rem %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
rem 各種設定
rem %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
rem ホームフォルダ
set HOME=C:\home
rem ベースURL
set BASEURL=https://raw.githubusercontent.com/mokab/createrubyenv/main/dl
set RUBY_DIR_NAME=Ruby31-x64


rem %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% tmpdir
set MSYS=msys64
set MSYS2PATH=C:\%RUBY_DIR_NAME%\%MSYS%
set TMPPATH=C:\%RUBY_DIR_NAME%\%MSYS%\tmp

rem %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
rem 事前準備
rem %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
mkdir %HOME%

mkdir %HOME%\winconf
bitsadmin.exe /TRANSFER htmlget %BASEURL%/terminal.bat %HOME%\winconf\terminal.bat
bitsadmin.exe /TRANSFER htmlget %BASEURL%/mkshortcut.vbs %HOME%\winconf\mkshortcut.vbs
bitsadmin.exe /TRANSFER htmlget %BASEURL%/terminal.ico %HOME%\winconf\terminal.ico
cscript %HOME%\winconf\mkshortcut.vbs

rem %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
rem emacsインストール
rem %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
rem emcas

if not exist %TMPPATH% (
	mkdir %TMPPATH%
)

if not exist "C:\emacs" (
	bitsadmin.exe /TRANSFER htmlget %BASEURL%/emacs-27.1-W64.zip %HOME%\emacs.zip
	powershell Expand-Archive -Path %HOME%\emacs.zip -DestinationPath C:\
	del %HOME%\emacs.zip
)

rem %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
rem ダウンロード
rem %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
mkdir %HOME%\.emacs.d
bitsadmin.exe /TRANSFER htmlget %BASEURL%/bashrc %HOME%\.bashrc
bitsadmin.exe /TRANSFER htmlget %BASEURL%/init.el %HOME%\.emacs.d\init.el
bitsadmin.exe /TRANSFER htmlget %BASEURL%/inputrc %HOME%\.inputrc
bitsadmin.exe /TRANSFER htmlget %BASEURL%/profile %HOME%\.profile
bitsadmin.exe /TRANSFER htmlget %BASEURL%/bash_profile %HOME%\.bash_profile
bitsadmin.exe /TRANSFER htmlget %BASEURL%/bash_logout %HOME%\.bash_logout

endlocal
