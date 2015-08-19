@echo off
rem Variáveis do programa -------
set VER=1.0
set TITLE=PenCleaner [Limpador de PenDriver] v%VER%
set CODER=Rosberg N. F. Rodrigues
set EMAIL=dev@rosberg.com.br
set SITEPE=www.activetech.com.br [PE]
set SITEP=www.rosberg.com.br [PESSOAL]
set AVISO=3
set FINAL=5
rem -----------------------------
title %TITLE%
goto inicio

:aviso
cls
echo +-------------------------+-------------------------+
echo   %TITLE% - AVISO
echo +-------------------------+-------------------------+
echo.
echo  Voce precisa informar, a letra correspondente  +
echo  ao seu PENDRIVER
echo .....................................................
timeout %AVISO%
cls

:inicio
cls
echo +-------------------------+-------------------------+
echo   %TITLE%
echo +-------------------------+-------------------------+
echo.
echo  Digite apenas a letra correspondente ao seu
echo  PENDRIVER sem os ":" (dois-pontos)
echo  EX: D
echo.
echo  Digite 0 (ZERO) para sair
echo .....................................................
echo.
set /p PEN=PENDRIVER: 
if "%PEN%" == "" goto aviso
if "%PEN%" == "0" goto final
set PEN=%PEN%:
cls

:limpa
rem --------------------------
rem Acessando o PenDriver    |
rem --------------------------
%PEN%

rem --------------------------
rem Deletando os arquivos:   |
rem - Atalho (LNK)           |
rem - auturun.inf            |
rem --------------------------
del /F /Q %PEN%\*.lnk
del /F /Q %PEN%\autorun.inf

rem --------------------------
rem Removendo atributos:     |
rem - De sistema         -S  |
rem - Oculto             -H  |
rem - Somente de Leitura -R  |
rem - Arquivo Morto      -A  |
rem - Recursivamente  /S /D  |
rem --------------------------
attrib -S -H -A -R /S /D %PEN%\*

rem --------------------------
rem Devolvendo atributos     |
rem aos arquivos do sistema  |
rem --------------------------
attrib +H "%PEN%\System Volume Information"
attrib +H "%PEN%\$RECYCLE.BIN"
start %PEN% /MAX /WAIT
:final
cls
echo +-------------------------+-------------------------+
echo #                 Processo concluido                #
echo +-------------------------+-------------------------+
echo.
echo.
echo  %TITLE%
echo.
echo   %CODER% - %EMAIL%
echo    %SITEP%
echo    %SITEPE%
echo.
echo  Obrigado por usar este software
echo ....................................................
echo.
echo.
echo.
echo.
echo.
echo.
echo.
timeout %FINAL%
