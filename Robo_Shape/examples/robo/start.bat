
..\..\bin\tvla.bat main.tvp playfield.tvs
if %errorlevel% EQU 0 (
echo OK 
) Else ( 
Echo ERROR FAILED &color CF 
)
pause