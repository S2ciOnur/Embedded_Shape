@ECHO OFF

SET PROG=%1

SET TVLA_HOME="C:\Users\%USERNAME%\OneDrive\Dokumente\Embedded_Shape\Robo_Shape"
SET TVLA_JAR="C:\Users\%USERNAME%\OneDrive\Dokumente\Embedded_Shape\Robo_Shape\lib\tvla.jar%"

REM This allows for an unlimited number of command-line arguments
SET ARGS=
:SETUP_ARGS
IF %1a==a GOTO DONE_ARGS
SET ARGS=%ARGS% %1
SHIFT
GOTO SETUP_ARGS
:DONE_ARGS

java -Dtvla.home="%TVLA_HOME%" -mx800m -jar %TVLA_HOME%\lib\tvla.jar %ARGS% -dot %PROG%.dt

IF EXIST %PROG%.dt GOTO CREATE_POSTSCRIPT
GOTO EXIT

:CREATE_POSTSCRIPT
ECHO Converting output to PostScript...
"C:\Program Files (x86)\Graphviz2.38\bin\dot" -Tps -o%PROG%.ps < %PROG%.dt

:EXIT