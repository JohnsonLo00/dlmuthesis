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
  echo （1）当前新项目，在独立文件方面只生成了：
  echo - 主文档
  echo - 中文摘要
  echo - 英文摘要
  echo - 第1章
  echo - 结论
  echo - 致谢
  echo 其余的独立文件请自行按需创建。
  echo （2）请自行创建放置图片的文件夹（如需）。
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
echo.
set /a "Comments=2"
goto :rounds
)


REM 文本片段编号对应：
REM --- 主文档：
REM [1] - BAstem：本科-理工科
REM [2] - BAhumanities：本科-人文社科
REM [3] - MA：硕士
REM [4] - MAlaw：硕士-法学/法律
REM [5] - MAmarxism：硕士-马克思主义理论
REM [6] - DOC：博士
REM [7] - DOClaw：博士-法学/法律
REM [8] - DOCmarxism：博士-马克思主义理论
REM --- 章节文件：
REM [9] - 中文摘要页
REM [10] - 英文摘要页
REM [11] - 第1章
REM [12] - 结论
REM [13] - 致谢

REM 1#==#==#==#
% !Mode:: "TeX:UTF-8"
% !TeX program = xelatex

% ---------- 声明文档类 ---------- %
\documentclass[BAstem,<PLATFORM>]{dlmuthesis}
%% 输出模式：
%% 注：默认为电子版模式，即不添加任何空白页
%%% printed：打印模式（仅适用于硕博论文；打印时请采用双面打印）
% ================================================== %

% -------------------- 填写论文信息 -------------------- %
\cntitle{低分辨率视频基于的手势运动方向检测} %【中文题目(若横线数量超过1, 则在可选参数处填所需横线数量)】
\entitle[2]{Detection of Gesture Motion Direction based on Low-Resolution Video} %【英文题目(若横线数量超过1, 则在可选参数处填所需横线数量)】
\aauthor{阿海} %【作者姓名】
\sdtID{222020xxxx} %【学号】
\faculty{理学院} %【学院】
\majorinCOVERPAGE{数学与应用数学2020-1} %【专业年级班级】
\mentorONE{海老师（教授）} %【指导教师（职称）】
\mentorTWO{无} %【第二指导教师（职称）】
\completiondate{2024}{5} %【完成日期（年、月）】
% ================================================== %

% --------------- 可以在此处添加命令 --------------- %

% ================================================== %

\begin{document}

\makepages %【封面页】


% ---------- 中文摘要 ---------- %
\presetupOFabstractCN%
\input{mainbody/<FOLDER>/abstract_zh}
\nextpages{abstractCN}
% =================================== %	


% ---------- 英文摘要 ---------- %
\presetupOFabstractEN%
\input{mainbody/<FOLDER>/abstract_en}
\nextpages{abstractEN}
% =================================== %	


% ---------- 目录 ---------- %
\presetupOFtocs%
\tableofcontents
\nextpages{tocs}
% ============================== %


% ----- 正文（划分为多个独立文件依次导入） ----- %
\pesudohookOFpremainbody
\input{mainbody/<FOLDER>/ch1} \clearpage\vspace*{0pt}
\input{mainbody/<FOLDER>/conclusion} \clearpage % 结论
% ================================================== %


% ---------- 参考文献 ---------- %
%% 方式一：
%\bibliography{refs/} %bib文件导入的形式生成参考文献列表
%% 方式二：
%\begin{thebibliography}{100}
%\bibitem{文献x的标签}{文献x的信息}
%\end{thebibliography}
%\clearpage
% =================================== %	


% ---------- 致谢 ---------- %
\input{mainbody/<FOLDER>/acknowledgment}
\clearpage
% =================================== %	


% ---------- 附录 ---------- %

% =================================== %	

\end{document} 

REM 2#==#==#==#
% !Mode:: "TeX:UTF-8"
% !TeX program = xelatex

% ---------- 声明文档类 ---------- %
\documentclass[BAhumanities,<PLATFORM>]{dlmuthesis}
%% 输出模式：
%% 注：默认为电子版模式，即不添加任何空白页
%%% printed：打印模式（仅适用于硕博论文；打印时请采用双面打印）
% ================================================== %

% -------------------- 填写论文信息 -------------------- %
\cntitle{提高我国医疗保障水平问题研究} %【中文题目(若横线数量超过1, 则在可选参数处填所需横线数量)】
\entitle[2]{Study on the Issue of Improving the Level of Medical Insurance in China} %【英文题目(若横线数量超过1, 则在可选参数处填所需横线数量)】
\aauthor{阿海} %【作者姓名】
\sdtID{222020xxxx} %【学号】
\faculty{公共管理与人文艺术学院} %【学院】
\majorinCOVERPAGE{公共事业管理2020-1} %【专业年级班级】
\mentorONE{海老师（教授）} %【指导教师（职称）】
\mentorTWO{无} %【第二指导教师（职称）】
\completiondate{2024}{5} %【完成日期（年、月）】
% ================================================== %

% ----- 脚注编号类型的选择 ----- %
%% 填“1”：1, 2, ...
%% 填“2”：[1], [2], ...
%% 填“3”：(1), (2), ...
%% 填“4”：带圈的阿拉伯数字
%% 填“5”：【1】, 【2】, ...
\footnotemode{4}
% ============================== %

% --------------- 可以在此处添加命令 --------------- %

% ================================================== %

\begin{document}

\makepages %【封面页】


% ---------- 中文摘要 ---------- %
\presetupOFabstractCN%
\input{mainbody/<FOLDER>/abstract_zh}
\nextpages{abstractCN}
% ============================== %	


% ---------- 英文摘要 ---------- %
\presetupOFabstractEN%
\input{mainbody/<FOLDER>/abstract_en}
\nextpages{abstractEN}
% ============================== %


% ---------- 目录 ---------- %
\presetupOFtocs%
\tableofcontents
\nextpages{tocs}
% ============================== %


% ----- 正文（划分为多个独立文件依次导入） ----- %
\pesudohookOFpremainbody
\input{mainbody/<FOLDER>/ch1} \clearpage\vspace*{0pt}
\input{mainbody/<FOLDER>/conclusion} \clearpage % 总结
% ================================================== %


% ---------- 参考文献 ---------- %
%\begin{thebibliography}{100}
%\input{refs/}
%\end{thebibliography}
%\clearpage
% =================================== %	


% ---------- 致谢 ---------- %
\input{mainbody/<FOLDER>/acknowledgment}
\clearpage
% =================================== %	

% ---------- 附录 ---------- %

% =================================== %	

\end{document} 

REM 3#==#==#==#
% !Mode:: "TeX:UTF-8"
% !TeX program = xelatex

% ---------- 声明文档类 ---------- %
\documentclass[MA,<PLATFORM>]{dlmuthesis}
%% 输出模式：
%% 注：默认为电子版模式，即不添加任何空白页
%%% printed：打印模式（仅适用于硕博论文；打印时请采用双面打印）
% ================================================== %

% -------------------- 填写论文信息 -------------------- %
%% ---------- 封面页 ---------- %
\cntitle{基于低分辨率视频的手势运动方向检测} %【中文题目(若横线数量超过1, 则在可选参数处填所需横线数量)】
\entitle{Detection of Gesture Motion Direction based on Low-Resolution Video} %【英文题目(若横线数量超过1, 则在可选参数处填所需横线数量)】
\aauthor{阿海} %【作者姓名】
\majorinCOVERPAGE{应用数学} %【学科专业（若为工程硕士，则可选参数填 “engineering”）】
\sdtID{112020xxxx} %【学号】
\mentorONE{海老师（教授）} %【指导教师（职称）】
\degree{理学硕士}{academic} %【学位类别】
% 第二个参数：学硕填“academic”，专硕（含工程硕士、MBA、EMBA、MPA等）填“professional”
\faculty{理学院} %【培养单位】
\completiondate{2024}{5} %【答辩时间（年、月）】
%% ============================== %

%% ---------- 原创性声明 & 授权使用声明 ---------- %
\signofstudent{\includegraphics[width=0.2\textwidth]{signatures/阿海.png}} %【作者签名（将图片导入文件夹、修改此处文件名即可）】
\dateforstudent{2024}{5}{21} %【作者签名日期（年、月、日）】
\signofmentor{\includegraphics[width=0.2\textwidth]{signatures/海老师.png}} %【导师签名（将图片导入文件夹、修改此处文件名即可）】
\dateformentor{2024}{5}{21} %【导师签名日期（年、月、日）】
%% ======================================== %
% ======================================================= %

% --------------- 可以在此处添加命令 --------------- %

% ================================================== %

\begin{document}

\makepages %【封面页】

\OriginalityStatement %【原创性声明】


% ---------- 中文摘要 ---------- %
\presetupOFabstractCN%
\input{mainbody/<FOLDER>/abstract_zh}
\nextpages{abstractCN}
% =================================== %	


% ---------- 英文摘要 ---------- %
\presetupOFabstractEN%
\input{mainbody/<FOLDER>/abstract_en}
\nextpages{abstractEN}
% =================================== %	


% -------------------- 目录 -------------------- %
\presetupOFtocs%
\tableofcontents
\listoffigures %图目录
\listoftables %表目录
\nextpages{tocs}
% ================================================== %	


% ---------- 正文（划分为多个独立文件依次导入） ---------- %
\pesudohookOFpremainbody
\input{mainbody/<FOLDER>/ch1} \clearpage
\input{mainbody/<FOLDER>/conclusion} \clearpage\vspace*{0pt} % 结论
% ================================================== %


% ---------- 参考文献 ---------- %
%% 方式一：
%\bibliography{refs/} %bib文件导入的形式生成参考文献列表
%% 方式二：
%\begin{thebibliography}{100}
%\bibitem{文献x的标签}{文献x的信息}
%\end{thebibliography}
%\clearpage
% ============================== %


% ---------- 附录 ---------- %

% ========================= %


% ---------- 致谢 ---------- %
\input{mainbody/<FOLDER>/acknowledgment}
\clearpage
% ============================== %


% ----- 作者简历及攻读硕士学位期间的科研成果 ----- %
%\input{mainbody/<FOLDER>/}
\presetupOFpersonalcv
%\nextpages{personalcv}
% ================================================== %


\AuthorizationStatement %【授权使用声明】

\end{document} 

REM 4#==#==#==#
% !Mode:: "TeX:UTF-8"
% !TeX program = xelatex

% ---------- 声明文档类 ---------- %
\documentclass[MAlaw,<PLATFORM>]{dlmuthesis}
%% 输出模式：
%% 注：默认为电子版模式，即不添加任何空白页
%%% printed：打印模式（仅适用于硕博论文；打印时请采用双面打印）
% ================================================== %

% -------------------- 填写论文信息 -------------------- %
%% ---------- 封面页 ---------- %
\cntitle{提高我国医疗保障水平问题研究} %【中文题目(若横线数量超过1, 则在可选参数处填所需横线数量)】
\entitle{Study on the Issue of Improving the Level of Medical Insurance in China} %【英文题目(若横线数量超过1, 则在可选参数处填所需横线数量)】
\aauthor{阿海} %【作者姓名】
\majorinCOVERPAGE{法学} %【学科专业（若为工程硕士，则可选参数填 “engineering”）】
\sdtID{112020xxxx} %【学号】
\mentorONE{海老师（教授）} %【指导教师（职称）】
\degree{法学硕士}{academic} %【学位类别】
% 第二个参数：学硕填“academic”，专硕（含工程硕士、MBA、EMBA、MPA等）填“professional”
\faculty{法学院} %【培养单位】
\completiondate{2024}{5} %【答辩时间（年、月）】
%% ============================== %

%% ---------- 原创性声明 & 授权使用声明 ---------- %
\signofstudent{\includegraphics[width=0.2\textwidth]{signatures/阿海.png}} %【作者签名（将图片导入文件夹、修改此处文件名即可）】
\dateforstudent{2024}{5}{21} %【作者签名日期（年、月、日）】
\signofmentor{\includegraphics[width=0.2\textwidth]{signatures/海老师.png}} %【导师签名（将图片导入文件夹、修改此处文件名即可）】
\dateformentor{2024}{5}{21} %【导师签名日期（年、月、日）】
%% ======================================== %
% ======================================================= %

% ----- 脚注编号类型的选择 ----- %
%% 填“1”：1, 2, ...
%% 填“2”：[1], [2], ...
%% 填“3”：(1), (2), ...
%% 填“4”：带圈的阿拉伯数字
%% 填“5”：【1】, 【2】, ...
\footnotemode{4}
% ============================== %

% --------------- 可以在此处添加命令 --------------- %

% ================================================== %

\begin{document}

\makepages %【封面页】

\OriginalityStatement %【原创性声明】


% ---------- 中文摘要 ---------- %
\presetupOFabstractCN%
\input{mainbody/<FOLDER>/abstract_zh}
\nextpages{abstractCN}
% =================================== %	


% ---------- 英文摘要 ---------- %
\presetupOFabstractEN%
\input{mainbody/<FOLDER>/abstract_en}
\nextpages{abstractEN}
% =================================== %	


% -------------------- 目录 -------------------- %
\presetupOFtocs%
\tableofcontents
\listoffigures %图目录
\listoftables %表目录
\nextpages{tocs}
% ================================================== %	


% ---------- 正文（划分为多个独立文件依次导入） ---------- %
\pesudohookOFpremainbody
\input{mainbody/<FOLDER>/ch1} \clearpage
\input{mainbody/<FOLDER>/conclusion} \clearpage % 结论
% ================================================== %


% ---------- 参考文献 ---------- %
%% [硕士-法学/法律]中，参考文献需按照特定规则分类列举
%\begin{thebibliography}{100}
%\input{refs/}
%\end{thebibliography}
%\clearpage
% ============================== %


% ---------- 附录 ---------- %

% ========================= %


% ----- 攻读学位期间公开发表论文 ----- %
%\input{mainbody/<FOLDER>/}
%\clearpage
% =================================== %	


% ---------- 致谢 ---------- %
\input{mainbody/<FOLDER>/acknowledgment}
\clearpage
% ============================== %


% ----- 作者简介 ----- %
%\input{mainbody/<FOLDER>/}
\presetupOFpersonalcv
%\nextpages{personalcv}
% ============================== %


\AuthorizationStatement %【授权使用声明】

\end{document} 


REM 5#==#==#==#
% !Mode:: "TeX:UTF-8"
% !TeX program = xelatex

% ---------- 声明文档类 ---------- %
\documentclass[MAmarxism,<PLATFORM>]{dlmuthesis}
%% 输出模式：
%% 注：默认为电子版模式，即不添加任何空白页
%%% printed：打印模式（仅适用于硕博论文；打印时请采用双面打印）
% ================================================== %

% -------------------- 填写论文信息 -------------------- %
%% ---------- 封面页 ---------- %
\cntitle{提高我国医疗保障水平问题研究} %【中文题目(若横线数量超过1, 则在可选参数处填所需横线数量)】
\entitle{Study on the Issue of Improving the Level of Medical Insurance in China} %【英文题目(若横线数量超过1, 则在可选参数处填所需横线数量)】
\aauthor{阿海} %【作者姓名】
\majorinCOVERPAGE{马克思主义理论} %【学科专业（若为工程硕士，则可选参数填 “engineering”）】
\sdtID{112020xxxx} %【学号】
\mentorONE{海老师（教授）} %【指导教师（职称）】
\degree{法学硕士}{academic} %【学位类别】
% 第二个参数：学硕填“academic”，专硕（含工程硕士、MBA、EMBA、MPA等）填“professional”
\faculty{马克思主义学院} %【培养单位】
\completiondate{2024}{5} %【答辩时间（年、月）】
%% ============================== %

%% ---------- 原创性声明 & 授权使用声明 ---------- %
\signofstudent{\includegraphics[width=0.2\textwidth]{signatures/阿海.png}} %【作者签名（将图片导入文件夹、修改此处文件名即可）】
\dateforstudent{2024}{5}{21} %【作者签名日期（年、月、日）】
\signofmentor{\includegraphics[width=0.2\textwidth]{signatures/海老师.png}} %【导师签名（将图片导入文件夹、修改此处文件名即可）】
\dateformentor{2024}{5}{21} %【导师签名日期（年、月、日）】
%% ======================================== %
% ======================================================= %

% ----- 脚注编号类型的选择 ----- %
%% 填“1”：1, 2, ...
%% 填“2”：[1], [2], ...
%% 填“3”：(1), (2), ...
%% 填“4”：带圈的阿拉伯数字
%% 填“5”：【1】, 【2】, ...
\footnotemode{4}
% ============================== %

% --------------- 可以在此处添加命令 --------------- %

% ================================================== %

\begin{document}

\makepages %【封面页】

\OriginalityANDAuthorization %【原创性声明 + 授权使用声明】


% ---------- 中文摘要 ---------- %
\presetupOFabstractCN%
\input{mainbody/<FOLDER>/abstract_zh}
\nextpages{abstractCN}
% =================================== %	


% ---------- 英文摘要 ---------- %
\presetupOFabstractEN%
\input{mainbody/<FOLDER>/abstract_en}
\nextpages{abstractEN}
% =================================== %	


% -------------------- 目录 -------------------- %
\presetupOFtocs%
\tableofcontents
\listoffigures %图目录
\listoftables %表目录
\nextpages{tocs}
% ================================================== %	


% ---------- 正文（划分为多个独立文件依次导入） ---------- %
\pesudohookOFpremainbody
\input{mainbody/<FOLDER>/ch1} \clearpage
\input{mainbody/<FOLDER>/conclusion} \clearpage % 结论
% ================================================== %


% ---------- 参考文献 ---------- %
%% [硕士-马克思主义理论]中，参考文献需按照特定规则分类列举
%\begin{thebibliography}{100}
%\input{refs/}
%\end{thebibliography}
%\clearpage
% ============================== %


% ---------- 附录 ---------- %

% ========================= %


% ----- 科研成果 ----- %
%\input{mainbody/<FOLDER>/}
%\clearpage
% =================================== %	


% ---------- 致谢 ---------- %
\input{mainbody/<FOLDER>/acknowledgment}
\clearpage
% ============================== %


% ----- 作者简介 ----- %
%\input{mainbody/<FOLDER>/}
\presetupOFpersonalcv
%\nextpages{personalcv}
% =================================== %	

\end{document}

REM 6#==#==#==#
% !Mode:: "TeX:UTF-8"
% !TeX program = xelatex

% ---------- 声明文档类 ---------- %
\documentclass[DOC,<PLATFORM>]{dlmuthesis}
%% 输出模式：
%% 注：默认为电子版模式，即不添加任何空白页
%%% printed：打印模式（仅适用于硕博论文；打印时请采用双面打印）
% ================================================== %

% -------------------- 填写论文信息 -------------------- %
%% ---------- 封面页 ---------- %
\cntitle{基于低分辨率视频的手势运动方向检测} %【中文题目(若横线数量超过1, 则在可选参数处填所需横线数量)】
\entitle{Detection of Gesture Motion Direction based on Low-Resolution Video} %【英文题目(若横线数量超过1, 则在可选参数处填所需横线数量)】
\aauthor{阿海} %【作者姓名】
\majorinCOVERPAGE{数学} %【学科专业（若为工程硕士，则可选参数填 “MEng”）】
\sdtID{112020xxxx} %【学号】
\mentorONE{海老师（教授）} %【指导教师（职称）】
\degree{理学博士}{academic} %【学位类别】
% 第二个参数：研究型博士填“academic”，工程博士填“engineering”
\faculty{理学院} %【培养单位】
\completiondate{2024}{5} %【答辩时间（年、月）】
%% ============================== %

%% ---------- 原创性声明 & 授权使用声明 ---------- %
\signofstudent{\includegraphics[width=0.2\textwidth]{signatures/阿海.png}} %【作者签名（将图片导入文件夹、修改此处文件名即可）】
\dateforstudent{2024}{5}{21} %【作者签名日期（年、月、日）】
\signofmentor{\includegraphics[width=0.2\textwidth]{signatures/海老师.png}} %【导师签名（将图片导入文件夹、修改此处文件名即可）】
\dateformentor{2024}{5}{21} %【导师签名日期（年、月、日）】
%% ======================================== %
% ======================================================= %

% --------------- 可以在此处添加命令 --------------- %

% ================================================== %

\begin{document}

\makepages %【封面页】

\OriginalityANDAuthorization %【原创性声明 + 授权使用声明】


% ---------- 创新点摘要 ---------- %
\presetupOFabstractINNOVATION%
%\input{mainbody/<FOLDER>/}
%\nextpages{abstractINNOVATION}
% =================================== %	


% ---------- 中文摘要 ---------- %
\presetupOFabstractCN%
\input{mainbody/<FOLDER>/abstract_zh}
\nextpages{abstractCN}
% =================================== %	


% ---------- 英文摘要 ---------- %
\presetupOFabstractEN%
\input{mainbody/<FOLDER>/abstract_en}
\nextpages{abstractEN}
% =================================== %	


% -------------------- 目录 -------------------- %
\presetupOFtocs%
\tableofcontents
\listoffigures %图目录
\listoftables %表目录
\nextpages{tocs}
% ================================================== %	


% ---------- 正文（划分为多个独立文件依次导入） ---------- %
\pesudohookOFpremainbody
\input{mainbody/<FOLDER>/ch1} \clearpage
\input{mainbody/<FOLDER>/conclusion} \clearpage\vspace*{0pt} % 结论
% ================================================== %


% ---------- 参考文献 ---------- %
%% 参考文献的著录，按论文中引用顺序排列。
%% 要求不少于120篇，其中英文参考文献不少于60%。采用数字序号标注法。
%% 文献类型标志参考国家标准 GB/T 7714 - 2005。
%% 方式一：
%\bibliography{refs/} %bib文件导入的形式生成参考文献列表
%% 方式二：
%\begin{thebibliography}{100}
%\bibitem{文献x的标签}{文献x的信息}
%\end{thebibliography}
%\clearpage
% ============================== %


% ---------- 附录 ---------- %

% ========================= %


% ----- 作者简历及攻读硕士学位期间的科研成果 ----- %
%\input{mainbody/<FOLDER>/}
\presetupOFpersonalcv
%\nextpages{personalcv}
% ================================================== %


% ---------- 致谢 ---------- %
\input{mainbody/<FOLDER>/acknowledgment}
% ============================== %

\end{document} 


REM 7#==#==#==#
% !Mode:: "TeX:UTF-8"
% !TeX program = xelatex

% ---------- 声明文档类 ---------- %
\documentclass[DOClaw,<PLATFORM>]{dlmuthesis}
%% 输出模式：
%% 注：默认为电子版模式，即不添加任何空白页
%%% printed：打印模式（仅适用于硕博论文；打印时请采用双面打印）
% ================================================== %

% -------------------- 填写论文信息 -------------------- %
%% ---------- 封面页 ---------- %
\cntitle{提高我国医疗保障水平问题研究} %【中文题目(若横线数量超过1, 则在可选参数处填所需横线数量)】
\entitle{Study on the Issue of Improving the Level of Medical Insurance in China} %【英文题目(若横线数量超过1, 则在可选参数处填所需横线数量)】
\aauthor{阿海} %【作者姓名】
\majorinCOVERPAGE{法学} %【学科专业（若为工程硕士，则可选参数填 “MEng”）】
\sdtID{112020xxxx} %【学号】
\mentorONE{海老师（教授）} %【指导教师（职称）】
\degree{法学博士}{} %【学位类别】
\faculty{法学院} %【培养单位】
\completiondate{2024}{5} %【答辩时间（年、月）】
%% ============================== %

%% ---------- 原创性声明 & 授权使用声明 ---------- %
\signofstudent{\includegraphics[width=0.2\textwidth]{signatures/阿海.png}} %【作者签名（将图片导入文件夹、修改此处文件名即可）】
\dateforstudent{2024}{5}{21} %【作者签名日期（年、月、日）】
\signofmentor{\includegraphics[width=0.2\textwidth]{signatures/海老师.png}} %【导师签名（将图片导入文件夹、修改此处文件名即可）】
\dateformentor{2024}{5}{21} %【导师签名日期（年、月、日）】
%% ======================================== %
% ======================================================= %

% ----- 脚注编号类型的选择 ----- %
%% 填“1”：1, 2, ...
%% 填“2”：[1], [2], ...
%% 填“3”：(1), (2), ...
%% 填“4”：带圈的阿拉伯数字
%% 填“5”：【1】, 【2】, ...
\footnotemode{4}
% ============================== %

% --------------- 可以在此处添加命令 --------------- %

% ================================================== %

\begin{document}

\makepages %【封面页】

\OriginalityANDAuthorization %【原创性声明 + 授权使用声明】


% ---------- 创新点摘要 ---------- %
\presetupOFabstractINNOVATION%
%\input{mainbody/<FOLDER>/}
%\nextpages{abstractINNOVATION}
% =================================== %	


% ---------- 中文摘要 ---------- %
\presetupOFabstractCN%
\input{mainbody/<FOLDER>/abstract_zh}
\nextpages{abstractCN}
% =================================== %	


% ---------- 英文摘要 ---------- %
\presetupOFabstractEN%
\input{mainbody/<FOLDER>/abstract_en}
\nextpages{abstractEN}
% =================================== %	



% -------------------- 目录 -------------------- %
\presetupOFtocs%
\tableofcontents
\listoffigures %图目录
\listoftables %表目录
\nextpages{tocs}
% ================================================== %	


% ---------- 正文（划分为多个独立文件依次导入） ---------- %
\pesudohookOFpremainbody
\input{mainbody/<FOLDER>/ch1} \clearpage
\input{mainbody/<FOLDER>/conclusion} \clearpage % 结论
% ================================================== %


% ---------- 参考文献 ---------- %
%% [博士-法学/法律]中，参考文献需按照特定规则分类列举
%\begin{thebibliography}{100}
%\input{refs/}
%\end{thebibliography}
%\clearpage
% ============================== %


% ---------- 附录 ---------- %

% ========================= %


% ----- 攻读学位期间公开发表论文 ----- %
%\input{mainbody/<FOLDER>/}
%\clearpage
% =================================== %	


% ---------- 致谢 ---------- %
\input{mainbody/<FOLDER>/acknowledgment}
\clearpage
% ============================== %


% ----- 作者简介 ----- %
%\input{mainbody/<FOLDER>/}
\presetupOFpersonalcv
%\nextpages{personalcv}
% ============================== %

\end{document} 

REM 8#==#==#==#
% !Mode:: "TeX:UTF-8"
% !TeX program = xelatex

% ---------- 声明文档类 ---------- %
\documentclass[DOCmarxism,<PLATFORM>]{dlmuthesis}
%% 输出模式：
%% 注：默认为电子版模式，即不添加任何空白页
%%% printed：打印模式（仅适用于硕博论文；打印时请采用双面打印）
% ================================================== %

% -------------------- 填写论文信息 -------------------- %
%% ---------- 封面页 ---------- %
\cntitle{提高我国医疗保障水平问题研究} %【中文题目(若横线数量超过1, 则在可选参数处填所需横线数量)】
\entitle{Study on the Issue of Improving the Level of Medical Insurance in China} %【英文题目(若横线数量超过1, 则在可选参数处填所需横线数量)】
\aauthor{阿海} %【作者姓名】
\majorinCOVERPAGE{马克思主义理论} %【学科专业（若为工程硕士，则可选参数填 “MEng”）】
\sdtID{112020xxxx} %【学号】
\mentorONE{海老师（教授）} %【指导教师（职称）】
\degree{法学博士}{academic} %【学位类别】
% 第二个参数：学硕填“academic”，专硕（含工程硕士、MBA、EMBA、MPA等）填“professional”
\faculty{马克思主义学院} %【培养单位】
\completiondate{2024}{5} %【答辩时间（年、月）】
%% ============================== %

%% ---------- 原创性声明 & 授权使用声明 ---------- %
\signofstudent{\includegraphics[width=0.2\textwidth]{signatures/阿海.png}} %【作者签名（将图片导入文件夹、修改此处文件名即可）】
\dateforstudent{2024}{5}{21} %【作者签名日期（年、月、日）】
\signofmentor{\includegraphics[width=0.2\textwidth]{signatures/海老师.png}} %【导师签名（将图片导入文件夹、修改此处文件名即可）】
\dateformentor{2024}{5}{21} %【导师签名日期（年、月、日）】
%% ======================================== %
% ======================================================= %

% ----- 脚注编号类型的选择 ----- %
%% 填“1”：1, 2, ...
%% 填“2”：[1], [2], ...
%% 填“3”：(1), (2), ...
%% 填“4”：带圈的阿拉伯数字
%% 填“5”：【1】, 【2】, ...
\footnotemode{4}
% ============================== %

% --------------- 可以在此处添加命令 --------------- %

% ================================================== %

\begin{document}

\makepages %【封面页】

\OriginalityANDAuthorization %【原创性声明 + 授权使用声明】


% ---------- 创新点摘要 ---------- %
\presetupOFabstractINNOVATION%
%\input{mainbody/<FOLDER>/}
%\nextpages{abstractINNOVATION}
% =================================== %	


% ---------- 中文摘要 ---------- %
\presetupOFabstractCN%
\input{mainbody/<FOLDER>/abstract_zh}
\nextpages{abstractCN}
% =================================== %	


% ---------- 英文摘要 ---------- %
\presetupOFabstractEN%
\input{mainbody/<FOLDER>/abstract_en}
\nextpages{abstractEN}
% =================================== %	


% -------------------- 目录 -------------------- %
\presetupOFtocs%
\tableofcontents
\listoffigures %图目录
\listoftables %表目录
\nextpages{tocs}
% ================================================== %	


% ---------- 正文（划分为多个独立文件依次导入） ---------- %
\pesudohookOFpremainbody
\input{mainbody/<FOLDER>/ch1} \clearpage
\input{mainbody/<FOLDER>/conclusion} \clearpage % 结论
% ================================================== %


% ---------- 参考文献 ---------- %
%% [博士-马克思主义理论]中，参考文献需按照特定规则分类列举
%\begin{thebibliography}{100}
%\input{refs/}
%\end{thebibliography}
%\clearpage
% ============================== %


% ---------- 附录 ---------- %

% ========================= %


% ----- 科研成果 ----- %
%\input{mainbody/<FOLDER>/}
%\clearpage
% =================================== %	


% ---------- 致谢 ---------- %
\input{mainbody/<FOLDER>/acknowledgment}
\clearpage
% ============================== %


% ----- 作者简介 ----- %
%\input{mainbody/<FOLDER>/}
\presetupOFpersonalcv
%\nextpages{personalcv}
% =================================== %	

\end{document}

REM 9#==#==#==#
% ---------- 中文摘要内容 ---------- %
\begin{abstract}

\zhlipsum[1-2]

\keywordsCN{词一；词二；词三}

\end{abstract}%

REM 10#==#==#==#
% ---------- 英文摘要内容 ---------- %
\begin{abstract}

\lipsum[1-2]

\keywordsEN{Word One; Word Two; Word Three}

\end{abstract}%

REM 11#==#==#==#
\section{绪论}

\subsection{研究背景}

\subsection{国内外相关研究现状及进展}

\subsection{本文主要研究思路（工作设想，可附技术路线图）}

\subsection{研究目的和研究意义}

\subsection{本章小结}

\zhlipsum[1-2]

REM 12#==#==#==#
% 学位类别为【博士】的，使用如下被注释的结构：
%\section{结论与展望}
%
%\subsection{结论}
%
%\zhlipsum[1]
%
%\subsection{展望}
%
%\zhlipsum[2]

% 否则，使用如下结构：
\begin{conclusion}

\lipsum[1-2]

\end{conclusion}

REM 13#==#==#==#
\begin{acknowledgment}

\zhlipsum[1-2]

\end{acknowledgment}

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
echo,PlatformMode=WScript.Arguments.Item^(3^)
echo,ProjectFolder=WScript.Arguments.Item^(4^)
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
echo,    sWriteStr = Replace^(sWriteStr,"<FOLDER>",ProjectFolder^)
echo,    Select Case PlatformMode
echo,    Case "1"
echo,    sWriteStr = Replace^(sWriteStr,"<PLATFORM>","windows"^)
echo,    Case "2"
echo,    sWriteStr = Replace^(sWriteStr,"<PLATFORM>","macos"^)
echo,    Case "3"
echo,    sWriteStr = Replace^(sWriteStr,"<PLATFORM>","ubuntu"^)
echo,    Case "4"
echo,    sWriteStr = Replace^(sWriteStr,"<PLATFORM>","web"^)
echo,    Case "5"
echo,    sWriteStr = Replace^(sWriteStr,"<PLATFORM>","customization"^)
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
cscript.exe /nologo ".\_TempVbsCode.vbs" "%~dpnx0" "%_OutPath%" "%~3" "%~5" "%~2"
del /f /q ".\_TempVbsCode.vbs" >nul 2>nul
EXIT /B 0