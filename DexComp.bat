@echo off
COLOR 0A
mode con:cols=30
CLS
:MENU
CLS
echo  --------------------------
echo  --------------------------
echo  Decmpile and Recompile Dex
echo  --------------------------
echo  --------------------------
echo.
echo.
echo.
echo  --------------------------
echo  --------------------------
echo   =================                                        
echo     Main Options                                            
echo   =================                                              
echo.
echo 1. Decompile classes.dex             
echo 2. Recompile classes.dex              
echo                                       
echo 0. Exit
echo  -------------------------
echo  -------------------------
SET /P option=Choose any option:
IF %option%==1 (goto dec)
IF %option%==2 (goto rec)
IF %option%==0 (goto exit)
:WHAT
echo Please Choose correct option from one of these
PAUSE
goto MENU
:dec
IF EXIST "decompiled/classout" (rmdir /S /Q "decompiled/classout")
IF NOT EXIST "input/classes.dex" GOTO notclass
java -jar tools/baksmali.jar -o decompiled/classout/ input/classes.dex
ECHO DONE
PAUSE
GOTO MENU
:rec
IF EXIST "output/classes.dex" (DEL /Q "output\classes.dex")
IF EXIST "output/classes.dex" (rmdir /S /Q "output/classes.dex")
IF NOT EXIST "decompiled/classout" GOTO notout
java -Xmx512M -jar tools/smali.jar -o output/classes.dex decompiled/classout/
ECHO Done
PAUSE
GOTO MENU
:notclass
ECHO classes.dex not present in input folder
ECHO Please place it there
PAUSE
GOTO MENU
:notout
ECHO classes.dex not decompiled
ECHO First decompile it and then recompile
PAUSE
GOTO MENU
:egg
cd tools
ECHO.
Start "Easter Egg" fun 1
cd ..
GOTO MENU
:exit
exit