@echo off

chcp 65001 > nul

title ---【提取 aligned_debug 删掉的人脸】---【神农汉化】---【QQ交流群 747439134】

set "filename=%~nx0"

if not "%filename:~0,2%"=="0-" (
    copy "%~nx0" "0-%~nx0" > nul
    echo [最近使用] 已写入，如果需要清空历史请手动删除！
)

echo.

call _internal\setenv.bat

"%PYTHON_EXECUTABLE%" "%DFL_ROOT%\main.py" extract ^
    --input-dir "%WORKSPACE%\data_dst" ^
    --output-dir "%WORKSPACE%\data_dst\aligned" ^
    --detector manual ^
    --max-faces-from-image 0 ^
    --output-debug ^
    --manual-output-debug-fix
    

pause