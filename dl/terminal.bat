@echo off
setlocal
rem %%%%%%%%%%%%% 各種設定
rem Rubyをインストールしたフォルダ名（c:\直下を想定）
rem 20210917-Ruby3.0に対応
rem 20220330-Ruby3.1に対応
rem set RUBY_DIR_NAME=Ruby30-x64
set RUBY_DIR_NAME=Ruby31-x64
set SYSBIT=64
set MSYS=msys%SYSBIT%
rem set MSYSTEM=MINGW%systembit%
rem 20220401-MSYSTEMの32/64bit指定のfix
set MSYSTEM=MINGW%SYSBIT%
rem ホームディレクトリの場所 
set Home=
set home=
set HOME=C:\home
rem %%%%%%%%%%%%% 各種設定ここまで

rem %a%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
rem % MSYS2のパスを決定 %%
rem %a%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
set MSYS2PATH=C:\%RUBY_DIR_NAME%\%MSYS%
if not exist %MSYS2PATH% (
	set SYSBIT=64
	set MSYS2PATH=C:\msys%SYSBIT%
	set MSYSTEM=MINGW%SYSBIT%
	if not exist %MSYS2PATH% ( 
		echo "[ERROR]MSYS2がインストールされていません!"
		pause
		exit
	)
)
  
rem %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
rem % パスを通す
rem %a%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
set PATH=%MSYS2PATH%\mingw%SYSBIT%\bin;%MSYS2PATH%\usr\local\bin;%MSYS2PATH%\usr\bin;%MSYS2PATH%\bin;%PATH%
set MSYS2_PATH_TYPE=inherit

rem %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
rem bashを立ち上げる
rem %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
cls
C:\Windows\System32\cmd.exe /E:ON /c "bash -l"
endlocal
