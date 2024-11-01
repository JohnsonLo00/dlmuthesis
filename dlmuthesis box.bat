@echo off
chcp 936
title dlmuthesis box

REM ------------------------------
REM dlmuthesis box v1.0.0 2025-1-15
REM <JL, yhlaozero2@163.com>
REM ------------------------------

REM 设置欢迎语

echo ----------------------------------------------------------------------------------------------
echo.
echo  oooooooo.         oooo       oooo           oooooooo                                             
echo  `88'  `Y8boooo    `888.     d'88'oooo   oooo8' 88 `8oooo oooooooooooo .oooooo. oooo .ooooo..o 
echo   88     88`88'     88 Y8. .P  88 `88'   `88'   88   `88' `88'`88'  `8d8P'   `Y8`88'd8P'   `Y8 
echo   88     88 88      88    Y    88  88     88    88    88ooo88  88oo8   `"Y888o.  88  `"Y888o.  
echo  o88bod8P'  88    oo88o       o88o 88.   .88    88    88   88  88    ooo    .d8P 88 oo    .d8P 
echo            o888ood8                `YPbodPP'   o88o  o88o o88oo88oood88""8888P' o88o8""8888P'  
echo.
echo ----------------------------------------------------------------------------------------------
echo.
echo ---------- 欢迎使用 dlmuthesis ! ----------
echo.

REM 输入操作选项

echo 请选择您想执行的操作(输入选项前的数字)
echo -----------------------------
echo [1]: 编译当前项目
echo [2]: 新建空白项目
echo [3]: 清理辅助文件（不含PDF文档）
echo -----------------------------
echo.
set /p "Option=-->在这里输入："

REM 处理 Option 为空的情况【异常】

REM 开始处理Option

if %Option% equ 1 (
  echo.
  echo 请输入该项目的主文档名称（不含文件后缀.tex）
  echo.
  set /p "CurrentMainFile=-->在这里输入："
  setlocal enabledelayedexpansion
  if exist !CurrentMainFile!.tex (
    echo.
    echo ---------- 正在编译 !CurrentMainFile!.tex ----------
    echo.
    latexmk !CurrentMainFile!.tex
    echo.
    echo ---------- 编译完成 ----------
    echo.
  ) else (
    echo.
    echo 文件 !CurrentMainFile!.tex 不存在，程序已强制退出，请重新启动！
    echo.
  )
  endlocal
) else if %Option% equ 3 (
  latexmk -c
  echo.
  echo ---------- 清理完成 ----------
  echo.
) else if %Option% equ 2 (
  echo.
  echo 请选择新项目的学位类别（输入选项前的数字）
  echo -----------------------------
  echo [1]: BAstem（本科-理工科）
  echo [2]: BAhumanities（本科-人文社科）
  echo [3]: MA（硕士）
  echo [4]: MAlaw（硕士-法学/法律）
  echo [5]: MAmarxism（硕士-马克思主义理论）
  echo [6]: DOC（博士）
  echo [7]: DOClaw（博士-法学/法律）
  echo [8]: DOCmarxism（博士-马克思主义理论）
  echo -----------------------------
  echo.
  setlocal enabledelayedexpansion
  set /p "NewDegree=-->在这里输入："
  echo.
  echo 请输入新项目的[主文档]名称
  echo 注意：（1）不含文件后缀.tex
  echo       （2）不要使用中文
  echo.
  set /p "NewMainFile=-->在这里输入："
  echo.
  echo 请输入新项目的[章节文件夹]名称（注：不要使用中文）
  echo.
  set /p "NewFolder=-->在这里输入："
  echo.
  echo ---------- 正在创建 ----------
  echo.
  REM 创建[主文档]
  CALL :TextProcess 1,!NewFolder!,!NewDegree!,!NewMainFile!
  REM 创建[中文摘要页]
  CALL :TextProcess 2,!NewFolder!,9,"abstract_zh"
  REM 创建[英文摘要页]
  CALL :TextProcess 2,!NewFolder!,10,"abstract_en"
  REM 创建[第1章]
  CALL :TextProcess 2,!NewFolder!,11,"ch1"
  REM 创建[结论]
  CALL :TextProcess 2,!NewFolder!,12,"conclusion"
  REM 创建[致谢]
  CALL :TextProcess 2,!NewFolder!,13,"acknowledgment"
  endlocal
  echo.
  echo ---------- 创建完成 ----------
  echo.
) else (
  echo.
  echo ---------- 无效输入，程序已强制退出，请重新启动！ ----------
  echo.
)

pause
exit

REM 文本片段编号对应
REM [1] - BAstem：本科-理工科
REM [2] - BAhumanities：本科-人文社科
REM [3] - MA：硕士
REM [4] - MAlaw：硕士-法学/法律
REM [5] - MAmarxism：硕士-马克思主义理论
REM [6] - DOC：博士
REM [7] - DOClaw：博士-法学/法律
REM [8] - DOCmarxism：博士-马克思主义理论
REM [9] - 中文摘要页
REM [10] - 英文摘要页
REM [11] - 第1章
REM [12] - 结论
REM [13] - 致谢

REM 1#==#==#==#
<BAstem：本科-理工科>

REM 2#==#==#==#
<BAhumanities：本科-人文社科>

REM 3#==#==#==#
<MA：硕士>

REM 4#==#==#==#
<MAlaw：硕士-法学/法律>

REM 5#==#==#==#
<MAmarxism：硕士-马克思主义理论>

REM 6#==#==#==#
<DOC：博士>

REM 7#==#==#==#
<DOClaw：博士-法学/法律>

REM 8#==#==#==#
<DOCmarxism：博士-马克思主义理论>

REM 9#==#==#==#
<中文摘要页>

REM 10#==#==#==#
<英文摘要页>

REM 11#==#==#==#
<第1章>

REM 12#==#==#==#
<结论>

REM 13#==#==#==#
<致谢>

REM 14#==#==#==#


:TextProcess 
if %~1 equ 1 (
  REM 与bat脚本同一路径
  set "_OutPath=%~dp0%~4.tex"
) else (
  REM 创建文件下的文件路径
  md "%~dp0mainbody\%~2"
  set "_OutPath=%~dp0mainbody\%~2\%~4.tex"
)
(echo,sFile = WScript.Arguments.Item^(0^)
echo,sFilePath = WScript.Arguments.Item^(1^)
echo,ContentMode=WScript.Arguments.Item^(2^)
echo,sWriteStr = ReadFile^(sFile, "GB2312"^) 
echo,set reg=new regexp
echo,reg.ignorecase=true 
echo,reg.global=true 
echo,reg.MultiLine = True  
echo,REM 抓取特定文本片段
echo,reg.pattern="^[\s\S]+?\nREM\s+" ^& ContentMode ^& "#==#==#==#.*?\r\n"
echo,sWriteStr = reg.replace^(sWriteStr,""^)
echo,reg.pattern="\r\nREM\s+" ^& CStr^(ContentMode+1^) ^& "#==#==#==#[\s\S]*$"
echo,sWriteStr = reg.replace^(sWriteStr,""^)
echo,REM 处理文本
echo,CodePage = "Utf-8" 
echo,WriteFileStr  sFilePath,sWriteStr,CodePage 
echo,Public Function WriteFileStr^(sFilePath , sWriteStr, CodePage^)
echo,    Dim fxt,txt
echo,    Set Astream=CreateObject^("Adodb.Stream"^)
echo,    Astream.type=2  
echo,    Astream.Mode = 3
echo,    Astream.open
echo,    Astream.CharSet = CodePage 
echo,    Assp=Astream.size
echo,    Astream.Position = 0 
echo,    Astream.Writetext sWriteStr,0 
echo,    Astream.SaveToFile sFilePath,2
echo,    Astream.close
echo,    Set Astream = Nothing
echo,	WriteFileUtf8WithNoBOM sFilePath 
echo,End function
echo,Public Function WriteFileUtf8WithNoBOM^(sFilePath^)
echo,    Set Astream = CreateObject^("Adodb.Stream"^)
echo,    Astream.Type = 1 
echo,    Astream.Mode = 3 
echo,    Astream.Open
echo,    Astream.LoadFromFile^(sFilePath^)
echo,    sBOM = Astream.Read^(5^)
echo,    If AscB^(MidB^(sBOM, 1, 1^)^) = 239 _
echo,        And AscB^(MidB^(sBOM, 2, 1^)^) = 187 _
echo,        And AscB^(MidB^(sBOM, 3, 1^)^) = 191 Then    
echo,        Astream.Position = 3 
echo,        Set AstreamOut = CreateObject^("adodb.stream"^)
echo,        AstreamOut.Type = 1 
echo,        AstreamOut.Mode = 3 
echo,        AstreamOut.Open
echo,        Astream.CopyTo AstreamOut
echo,        AstreamOut.SaveToFile sFilePath, 2 
echo,        AstreamOut.Flush
echo,        AstreamOut.Close
echo,		Set AstreamOut = Nothing
echo,    End If
echo,    Set Astream = Nothing	
echo,End function
echo,Public Function ReadFile^(FileUrl, CharSet^) 
echo,       Dim Str 
echo,       Set stm = CreateObject^("Adodb.Stream"^) 
echo,       stm.Type = 2 
echo,       stm.mode = 3 
echo,       stm.Open
echo,       stm.charset = CharSet
echo,       stm.loadfromfile FileUrl 
echo,       Str = stm.readtext 
echo,       stm.Close 
echo,       Set stm = Nothing 
echo,       ReadFile = Str 
echo,End Function
)>"%tmp%\_TempVbsCode.vbs"
cscript.exe /nologo "%tmp%\_TempVbsCode.vbs" "%~dpnx0" "%_OutPath%" "%~3"
del /f /q "%tmp%\_TempVbsCode.vbs" >nul 2>nul
EXIT /B 0