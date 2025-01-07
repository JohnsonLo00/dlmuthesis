@echo off
chcp 936
title dlmuthesis box

REM ------------------------------
REM dlmuthesis box v1.0.0 2025-1-15
REM <JL, yhlaozero2@163.com>
REM ------------------------------

set /a "Comments=1"

REM 开始进入循环

:rounds

set /a "CarPoint=1"

REM 设置欢迎语

echo ----------------------------------------------------------------------------------------------
echo.
echo  oooooooo.       oooo       oooo           oooooooo                                             
echo  `88'  `Y8boooo  `888.     d'88'oooo   oooo8' 88 `8oooo oooooooooooo .oooooo. oooo .ooooo..o 
echo   88     88`88'   88 Y8. .P  88 `88'   `88'   88   `88' `88'`88'  `8d8P'   `Y8`88'd8P'   `Y8 
echo   88     88 88    88    Y    88  88     88    88    88ooo88  88oo8   `"Y888o.  88  `"Y888o.  
echo  o88bod8P'  88  oo88o       o88o 88.   .88    88    88   88  88    ooo    .d8P 88 oo    .d8P 
echo            o888ood8              `YPbodPP'   o88o  o88o o88oo88oood88""8888P' o88o8""8888P'  
echo.
echo ----------------------------------------------------------------------------------------------
echo.
if %Comments% equ 1 (
echo ---------- 欢迎使用 dlmuthesis ! ----------
) else (
echo ---------- 欢迎回到 dlmuthesis ! ----------
)
echo.

REM 输入操作选项

echo 请选择您想执行的操作（输入选项前的数字）
echo -----------------------------
echo [1]: 编译当前项目
echo [2]: 新建空白项目
echo [3]: 清理辅助文件（不含PDF文档）
echo [0]: 退出
echo -----------------------------
echo.
set /p "Option=-->在这里输入："

REM 开始处理Option

if %Option% equ 1 (
  echo.
  echo ----------------------------------------
  echo 请输入该项目的主文档名称（不含文件后缀.tex）
  echo ----------------------------------------
  echo.
  set /p "CurrentMainFile=-->在这里输入："
  setlocal enabledelayedexpansion
  if exist !CurrentMainFile!.tex (
    echo.
    echo ----------------------------------------------------
    echo ---------- 正在编译 !CurrentMainFile!.tex ----------
    echo ----------------------------------------------------
    echo.
    @echo on
    latexmk !CurrentMainFile!.tex
    @echo off
    echo.
    echo ------------------------------
    echo ---------- 编译完成！ ----------
    echo ------------------------------
    echo.
  ) else (
    echo.
    echo ----------------------------------------------------------
    echo 文件 !CurrentMainFile!.tex 不存在，请检查有效的文件名称！
    echo ----------------------------------------------------------
    echo.
  )
  endlocal
) else if %Option% equ 3 (
  @echo on
  latexmk -c
  @echo off
  echo.
  echo ------------------------------
  echo ---------- 清理完成！ ----------
  echo ------------------------------
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
  if !NewDegree! geq 1 (
    if !NewDegree! leq 8 (
      echo.
    ) else (
      echo.
      echo ---------------------------
      echo 无效的输入，请注意界面提示语！
      echo ---------------------------
      echo.
      goto :ending
    )
  ) else (
    echo.
    echo ---------------------------
    echo 无效的输入，请注意界面提示语！
    echo ---------------------------
    echo.
    goto :ending
  )
  echo.
  echo -----------------------------
  echo 请输入新项目的[主文档]名称
  echo 注意：（1）不含文件后缀.tex
  echo       （2）不要使用中文
  echo -----------------------------
  echo.
  set /p "NewMainFile=-->在这里输入："
  echo.
  echo 请输入当前使用LaTeX的[平台]名称（输入选项前的数字）
  echo ----------------------------
  echo [1]: Windows
  echo [2]: macOS
  echo [3]: Ubuntu
  echo [4]: Web
  echo [5]: Customization
  echo ----------------------------
  echo.
  set /p "MyPlatform=-->在这里输入："
  echo.
  if !MyPlatform! geq 1 (
    if !MyPlatform! leq 5 (
      echo.
    ) else (
      echo.
      echo ---------------------------
      echo 无效的输入，请注意界面提示语！
      echo ---------------------------
      echo.
      goto :ending
    )
  ) else (
    echo.
    echo ---------------------------
    echo 无效的输入，请注意界面提示语！
    echo ---------------------------
    echo.
    goto :ending
  )
  echo.
  echo ---------------------------------------------
  echo 请输入新项目的[章节文件夹]名称（注：不要使用中文）
  echo ---------------------------------------------
  echo.
  set /p "NewFolder=-->在这里输入："
  echo.
  echo ------------------------------
  echo ---------- 正在创建 ----------
  echo ------------------------------
  echo.
  REM 创建[主文档]
  CALL :TextProcess 1,!NewFolder!,!NewDegree!,!NewMainFile!,!MyPlatform!
  REM 创建[中文摘要页]
  CALL :TextProcess 2,!NewFolder!,9,"abstract_zh",!MyPlatform!
  REM 创建[英文摘要页]
  CALL :TextProcess 2,!NewFolder!,10,"abstract_en",!MyPlatform!
  REM 创建[第1章]
  CALL :TextProcess 2,!NewFolder!,11,"ch1",!MyPlatform!
  REM 创建[结论]
  CALL :TextProcess 2,!NewFolder!,12,"conclusion",!MyPlatform!
  REM 创建[致谢]
  CALL :TextProcess 2,!NewFolder!,13,"acknowledgment",!MyPlatform!
  endlocal
  echo.
  echo -----------------------------------------
  echo --------------- 创建完成！ ---------------
  echo ---- 请自行创建放置图片的文件夹（如需） ----
  echo -----------------------------------------
  echo.
) else if %Option% equ 0 (
  echo.
  echo ------------------------------------------------
  echo ---------- 程序已结束，祝写作顺利！ ----------
  echo ------------------------------------------------
  echo.
  set /a "CarPoint=0"
) else (
  echo.
  echo ------------------------------------------------------------
  echo ---------- 无效的输入，请注意界面提示语！ ----------
  echo ------------------------------------------------------------
  echo.
)

:ending
if %CarPoint% equ 0 (
  pause
  exit
) else (
pause
set /a "Comments=2"
goto :rounds
)


REM 文本片段编号对应：
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
\documentclass[BAstem,<platform>]{dlmuthesis}

REM 2#==#==#==#
<BAhumanities：本科-人文社科>
\documentclass[BAhumanities,<platform>]{dlmuthesis}

REM 3#==#==#==#
<MA：硕士>
\documentclass[MA,<platform>]{dlmuthesis}

REM 4#==#==#==#
<MAlaw：硕士-法学/法律>
\documentclass[MAlaw,<platform>]{dlmuthesis}

REM 5#==#==#==#
<MAmarxism：硕士-马克思主义理论>
\documentclass[MAmarxism,<platform>]{dlmuthesis}

REM 6#==#==#==#
<DOC：博士>
\documentclass[DOC,<platform>]{dlmuthesis}

REM 7#==#==#==#
<DOClaw：博士-法学/法律>
\documentclass[DOClaw,<platform>]{dlmuthesis}

REM 8#==#==#==#
<DOCmarxism：博士-马克思主义理论>
\documentclass[DOCmarxism,<platform>]{dlmuthesis}

REM 9#==#==#==#
<中文摘要页>
<platform>

REM 10#==#==#==#
<英文摘要页>

REM 11#==#==#==#
<第1章>
<platform>

REM 12#==#==#==#
<结论>

REM 13#==#==#==#
<致谢>

REM 14#==#==#==#

:RangeDecision
if %~1 geq %~2 && %~1 leq %~3 (
  set /a "%~4=1"
) else (
  set /a "%~4=0"
)
EXIT /B 0


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
echo,PlatformMode=WScript.Arguments.Item^(3^)
echo,sWriteStr = ReadFile^(sFile, "GB2312"^) 
echo,set reg=new regexp
echo,reg.ignorecase=True 
echo,reg.global=true 
echo,reg.MultiLine = True  
echo,REM 抓取特定文本片段
echo,reg.pattern="^[\s\S]+?\nREM\s+" ^& ContentMode ^& "#==#==#==#.*?\r\n"
echo,sWriteStr = reg.replace^(sWriteStr,""^)
echo,reg.pattern="\r\nREM\s+" ^& CStr^(ContentMode+1^) ^& "#==#==#==#[\s\S]*$"
echo,sWriteStr = reg.replace^(sWriteStr,""^)
echo,REM 处理文本
echo,CodePage = "Utf-8" 
echo,WriteFileStr  sFilePath,sWriteStr,CodePage,ContentMode
echo,Public Function WriteFileStr^(sFilePath , sWriteStr, CodePage, ContentMode^)
echo,    Dim fxt,txt
echo,    Set Astream=CreateObject^("Adodb.Stream"^)
echo,    Astream.type=2  
echo,    Astream.Mode = 3
echo,    Astream.open
echo,    Astream.CharSet = CodePage 
echo,    Assp=Astream.size
echo,    Astream.Position = 0
echo,    If int^(ContentMode^) ^> 0 And int^(ContentMode^) ^< 9 Then
echo,    Select Case PlatformMode
echo,    Case "1"
echo,    sWriteStr = Replace^(sWriteStr,"<platform>","windows"^)
echo,    Case "2"
echo,    sWriteStr = Replace^(sWriteStr,"<platform>","macos"^)
echo,    Case "3"
echo,    sWriteStr = Replace^(sWriteStr,"<platform>","ubuntu"^)
echo,    Case "4"
echo,    sWriteStr = Replace^(sWriteStr,"<platform>","web"^)
echo,    Case "5"
echo,    sWriteStr = Replace^(sWriteStr,"<platform>","customization"^)
echo,    End Select
echo,    End If
echo,    Astream.Writetext sWriteStr,0 
echo,    Astream.SaveToFile sFilePath,2
echo,    Astream.close
echo,    Set Astream = Nothing
echo,    WriteFileUtf8WithNoBOM sFilePath 
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
)>".\_TempVbsCode.vbs"
cscript.exe /nologo ".\_TempVbsCode.vbs" "%~dpnx0" "%_OutPath%" "%~3" "%~5"
del /f /q ".\_TempVbsCode.vbs" >nul 2>nul
EXIT /B 0