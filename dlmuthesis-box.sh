#!/bin/bash

#
# This is file "dlmuthesis-box.bat"
#
# Copyright (C) 2023-2024 by JL <yhlaozero2@163.com>
#
# This work may be distributed and/or modified under the
# conditions of the LaTeX Project Public License, either version 1.3
# of this license or (at your option) any later version.
# The latest version of this license is in
#   https://www.latex-project.org/lppl.txt
# and version 1.3c or later is part of all distributions of LaTeX
# version 2008 or later.
#

#############################
# 检测操作系统环境
#############################

if [ "$(uname)" = "Darwin" ]
then
  echo "----- macOS 系统下的 dlmuthesis-box -----"
elif [ "$(uname)" = "Linux" ]
then
  echo "----- Linux 系统下的 dlmuthesis-box -----"
  # 检查是否安装了gnome-terminal
  if ! command -v gnome-terminal &> /dev/null
  then
    echo "gnome-terminal could not be found, please install it first."
    exit 1
  fi
else
    echo "未知的操作系统"
fi

#############################
# 函数：打印界面欢迎语
#############################

welcometext(){
  echo "----------------------------------------------------------------------------------------------"
  echo "                                                                                              "
  echo " oooooooo.       oooo       oooo           oooooooo                                           "
  echo " '88'  'Y8boooo  '888.     d'88'oooo   oooo8' 88 '8oooo oooooooooooo .oooooo. oooo .ooooo..o  "
  echo "  88     88'88'   88 Y8. .P  88 '88'   '88'   88   '88' '88''88'  '8d8P'   'Y8'88'd8P'   'Y8  "
  echo "  88     88 88    88    Y    88  88     88    88    88ooo88  88oo8   ''Y888o.  88  ''Y888o.   "
  echo " o88bod8P'  88  oo88o       o88o 88.   .88    88    88   88  88    ooo    .d8P 88 oo    .d8P  "
  echo "           o888ood8              'YPbodPP'   o88o  o88o o88oo88oood88''8888P' o88o8''8888P'   "
  echo "                                                                                              "
  echo "----------------------------------------------------------------------------------------------"
  if [ $1 == 1 ]; then
      echo " "
      echo "---------- 欢迎使用 dlmuthesis ! ----------"
      echo " "
  else
      echo " "
      echo "---------- 欢迎回到 dlmuthesis ! ----------"
      echo " "
  fi
}

#############################
# 待生成的文本
#############################

mainfile_BAstem=$(cat <<EOL
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
\nocite{*} %注：当添加上自己的引用之后，务必删除该行
\bibliography{refs/ref_<MAINFILENAME>} %bib文件导入的形式生成参考文献列表
%% 方式二：
%\begin{thebibliography}{100}
%\bibitem{文献x的标签}{文献x的信息}
%\end{thebibliography}
\clearpage
% =================================== %	


% ---------- 致谢 ---------- %
\input{mainbody/<FOLDER>/acknowledgement}
\clearpage
% =================================== %	


% ---------- 附录 ---------- %

% =================================== %	

\end{document} 
EOL
)

mainfile_BAhumanities=$(cat <<EOL
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
\begin{thebibliography}{100}
\input{refs/ref_<MAINFILENAME>}
\end{thebibliography}
\clearpage
% =================================== %	


% ---------- 致谢 ---------- %
\input{mainbody/<FOLDER>/acknowledgement}
\clearpage
% =================================== %	

% ---------- 附录 ---------- %

% =================================== %	

\end{document} 
EOL
)

mainfile_MA=$(cat <<EOL
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
\nocite{*} %注：当添加上自己的引用之后，务必删除该行
\bibliography{refs/ref_<MAINFILENAME>} %bib文件导入的形式生成参考文献列表
%% 方式二：
%\begin{thebibliography}{100}
%\bibitem{文献x的标签}{文献x的信息}
%\end{thebibliography}
\clearpage
% ============================== %


% ---------- 附录 ---------- %

% ========================= %


% ---------- 致谢 ---------- %
\input{mainbody/<FOLDER>/acknowledgement}
\clearpage
% ============================== %


% ----- 作者简历及攻读硕士学位期间的科研成果 ----- %
\input{mainbody/<FOLDER>/personalcvs}
\presetupOFpersonalcv
\nextpages{personalcv}
% ================================================== %


\AuthorizationStatement %【授权使用声明】

\end{document} 
EOL
)

mainfile_MAlaw=$(cat <<EOL
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
\begin{thebibliography}{100}
\input{refs/ref_<MAINFILENAME>}
\end{thebibliography}
\clearpage
% ============================== %


% ---------- 附录 ---------- %

% ========================= %


% ----- 攻读学位期间公开发表论文 ----- %
\input{mainbody/<FOLDER>/authorachievements}
\clearpage
% =================================== %	


% ---------- 致谢 ---------- %
\input{mainbody/<FOLDER>/acknowledgement}
\clearpage
% ============================== %


% ----- 作者简介 ----- %
\input{mainbody/<FOLDER>/authorintroduction}
\presetupOFpersonalcv
\nextpages{personalcv}
% ============================== %


\AuthorizationStatement %【授权使用声明】

\end{document} 
EOL
)

mainfile_MAmarxism=$(cat <<EOL
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
\begin{thebibliography}{100}
\input{refs/ref_<MAINFILENAME>}
\end{thebibliography}
\clearpage
% ============================== %


% ---------- 附录 ---------- %

% ========================= %


% ----- 科研成果 ----- %
\input{mainbody/<FOLDER>/authorachievements}
\clearpage
% =================================== %	


% ---------- 致谢 ---------- %
\input{mainbody/<FOLDER>/acknowledgement}
\clearpage
% ============================== %


% ----- 作者简介 ----- %
\input{mainbody/<FOLDER>/authorintroduction}
\presetupOFpersonalcv
\nextpages{personalcv}
% =================================== %	

\end{document}
EOL
)

mainfile_DOC=$(cat <<EOL
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
\input{mainbody/<FOLDER>/abstract_innovation}
\nextpages{abstractINNOVATION}
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
\nocite{*} %注：当添加上自己的引用之后，务必删除该行
\bibliography{refs/ref_<MAINFILENAME>} %bib文件导入的形式生成参考文献列表
%% 方式二：
%\begin{thebibliography}{100}
%\bibitem{文献x的标签}{文献x的信息}
%\end{thebibliography}
\clearpage
% ============================== %


% ---------- 附录 ---------- %

% ========================= %


% ----- 作者简历及攻读硕士学位期间的科研成果 ----- %
\input{mainbody/<FOLDER>/personalcvs}
\presetupOFpersonalcv
\nextpages{personalcv}
% ================================================== %


% ---------- 致谢 ---------- %
\input{mainbody/<FOLDER>/acknowledgement}
% ============================== %

\end{document} 
EOL
)

mainfile_DOClaw=$(cat <<EOL
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
\input{mainbody/<FOLDER>/abstract_innovation}
\nextpages{abstractINNOVATION}
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
\begin{thebibliography}{100}
\input{refs/ref_<MAINFILENAME>}
\end{thebibliography}
\clearpage
% ============================== %


% ---------- 附录 ---------- %

% ========================= %


% ----- 攻读学位期间公开发表论文 ----- %
\input{mainbody/<FOLDER>/authorachievements}
\clearpage
% =================================== %	


% ---------- 致谢 ---------- %
\input{mainbody/<FOLDER>/acknowledgement}
\clearpage
% ============================== %


% ----- 作者简介 ----- %
\input{mainbody/<FOLDER>/authorintroduction}
\presetupOFpersonalcv
\nextpages{personalcv}
% ============================== %

\end{document} 
EOL
)

mainfile_DOCmarxism=$(cat <<EOL
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
\input{mainbody/<FOLDER>/abstract_innovation}
\nextpages{abstractINNOVATION}
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
\begin{thebibliography}{100}
\input{refs/ref_<MAINFILENAME>}
\end{thebibliography}
\clearpage
% ============================== %


% ---------- 附录 ---------- %

% ========================= %


% ----- 科研成果 ----- %
\input{mainbody/<FOLDER>/authorachievements}
\clearpage
% =================================== %	


% ---------- 致谢 ---------- %
\input{mainbody/<FOLDER>/acknowledgement}
\clearpage
% ============================== %


% ----- 作者简介 ----- %
\input{mainbody/<FOLDER>/authorintroduction}
\presetupOFpersonalcv
\nextpages{personalcv}
% =================================== %	

\end{document}
EOL
)

subfile_abstractCN=$(cat <<EOL
% ---------- 中文摘要内容 ---------- %
\begin{abstract}

\zhlipsum[1-2]

\keywordsCN{词一；词二；词三}

\end{abstract}%
EOL
)

subfile_abstractEN=$(cat <<EOL
% ---------- 英文摘要内容 ---------- %
\begin{abstract}

\lipsum[1-2]

\keywordsEN{Word One; Word Two; Word Three}

\end{abstract}%
EOL
)

subfile_chapterone=$(cat <<EOL
\section{绪论}

\subsection{研究背景}

\subsection{国内外相关研究现状及进展}

\subsection{本文主要研究思路（工作设想，可附技术路线图）}

\subsection{研究目的和研究意义}

\subsection{本章小结}

\zhlipsum[1-2]
EOL
)

subfile_conclusion=$(cat <<EOL
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

\zhlipsum[1-2]

\end{conclusion}
EOL
)

subfile_acknowledgement=$(cat <<EOL
\begin{acknowledgement}

\zhlipsum[1-2]

\end{acknowledgement}
EOL
)

subfile_abstractINNOVATION=$(cat <<EOL
% ---------- 创新点摘要内容 ---------- %
\begin{abstract}

\zhlipsum[1-2]

\end{abstract}%
EOL
)

subfile_personalcvs=$(cat <<EOL
\begin{personalcv}{作者简历及攻读【硕/博】士学位期间的科研成果}[addtotoc]

{\bf 作者简介}

姓名：

性别：

出生年月：XXXX 年 XX 月

民族：

籍贯：

研究方向：

{\bf 主要教育经历}

(从大学起)

{\bf 工作经历}

（工作经历内容）

{\bf 攻读【硕/博】士学位期间的科研成果}

首先，列出在攻读【硕/博】士学位期间发表与学位论文有关的学术论文（含已录用），并注明属于学位论文内容的部分（章节），作者（最多三个）、论文题目、刊物名称、时间、卷期号、页码以及检索信息、与学位论文相关章节。{\bf\itshape 在攻读【硕/博】士学位期间以外的时间或与学位论文内容(章节)无关的论文不得列出。}

其次，列出在攻读【硕/博】士学位期间参加学术会议发表的会议论文，参与的科研项目（如国家自然科学基金或国家“863”计划等），发明专利、科研奖励等。

书写格式说明：

本人的姓名应加粗和标记下划线。每段落首行缩进2字（即：将每个成果作为一个独立的段落）。

例：

1. 发表学术论文
\begin{enumerate}[nosep, label=$\lbrack$\arabic*$\rbrack$]
  \item{\underline{\bf Xiaoming Zhang}, Yi Li, John R. E., et al. Carbon isotope evidence for the stepwise oxidation of the Proterozoic environment [J]. Nature, 1992,359(1):605-609. (SCI检索号：123DX) （本学位论文第一章）.}
\end{enumerate}{}\vspace{1em}

2. 会议论文
\begin{enumerate}[nosep, label=$\lbrack$\arabic*$\rbrack$]
  \item{\underline{\bf 张晓明}，会议论文题目，会议名称，口头报告或墙报，会议地点，时间。}
  \item{\underline{\bf Xiaoming Zhang}, Development of cellular biology. Proceedings of the Fifth Canadian Mathematical Congress (oral presentation), Tokyo, 2018.}
\end{enumerate}{}\vspace{1em}

3. 参与科研项目
\begin{enumerate}[nosep, label=$\lbrack$\arabic*$\rbrack$]
  \item{国家自然科学基金项目(51276055)：西南喀斯特山区土地利用和土地覆被变化及其对土地资源可持续性影响研究，2013.1 – 2016.12，负责人：李文。} %负责人一般应为指导教师
\end{enumerate}{}\vspace{1em}

4. 发明专利
\begin{enumerate}[nosep, label=$\lbrack$\arabic*$\rbrack$]
  \item{\underline{\bf 张晓明}，发明人2，发明人3. 多功能一次性压舌板:中国,92214985.2[P]. 发明类别：发明专利，公开（或授权）日期：1993,04,14。}
\end{enumerate}{}\vspace{1em}

5. 获得奖励情况
\begin{enumerate}[nosep, label=$\lbrack$\arabic*$\rbrack$]
  \item{“大型C/E复合材料构件高质高效加工关键技术及其工艺装备”，机械工业科学技术奖-科技进步一等奖，2013.10，本人排序第1。}
\end{enumerate}

\end{personalcv}
EOL
)

subfile_authorintroduction=$(cat <<EOL
\begin{personalcv}{作者简介}[addtotoc]

姓名：

性别：

出生年月：XXXX 年 XX 月

民族：

籍贯：

研究方向：

{\bf 主要教育经历：}

(从大学起)

{\bf 工作经历：}

（工作经历内容）

\end{personalcv}
EOL
)

subfile_authorachievements=$(cat <<EOL
\begin{personalcv}{攻读学位期间公开发表论文}[addtotoc]

首先，列出在攻读【硕/博】学位期间发表与学位论文有关的学术论文（含已录用），并注明属于学位论文内容的部分（章节），作者（最多三个）、论文题目、刊物名称、时间、卷期号、页码以及检索信息、与学位论文相关章节。{\bf\itshape 在攻读【硕/博】士学位期间以外的时间或与学位论文内容(章节)无关的论文不得列出。}

其次，列出在攻读【硕/博】士学位期间参加学术会议发表的会议论文，参与的科研项目（如国家自然科学基金或国家“863”计划等），发明专利、科研奖励等。

书写格式说明：

本人的姓名应加粗和标记下划线。每段落首行缩进2字（即：将每个成果作为一个独立的段落）。

例：

1. 发表学术论文
\begin{enumerate}[nosep, label=$\lbrack$\arabic*$\rbrack$]
  \item{\underline{\bf Xiaoming Zhang}, Yi Li, John R. E., et al. Carbon isotope evidence for the stepwise oxidation of the Proterozoic environment [J]. Nature, 1992,359(1):605-609. (SCI检索号：123DX) （本学位论文第一章）.}
\end{enumerate}{}\vspace{1em}

2. 会议论文
\begin{enumerate}[nosep, label=$\lbrack$\arabic*$\rbrack$]
  \item{\underline{\bf 张晓明}，会议论文题目，会议名称，口头报告或墙报，会议地点，时间。}
  \item{\underline{\bf Xiaoming Zhang}, Development of cellular biology. Proceedings of the Fifth Canadian Mathematical Congress (oral presentation), Tokyo, 2018.}
\end{enumerate}{}\vspace{1em}

3. 参与科研项目
\begin{enumerate}[nosep, label=$\lbrack$\arabic*$\rbrack$]
  \item{国家自然科学基金项目(51276055)：西南喀斯特山区土地利用和土地覆被变化及其对土地资源可持续性影响研究，2013.1 – 2016.12，负责人：李文。} %负责人一般应为指导教师
\end{enumerate}{}\vspace{1em}

4. 发明专利
\begin{enumerate}[nosep, label=$\lbrack$\arabic*$\rbrack$]
  \item{\underline{\bf 张晓明}，发明人2，发明人3. 多功能一次性压舌板:中国,92214985.2[P]. 发明类别：发明专利，公开（或授权）日期：1993,04,14。}
\end{enumerate}{}\vspace{1em}

5. 获得奖励情况
\begin{enumerate}[nosep, label=$\lbrack$\arabic*$\rbrack$]
  \item{“大型C/E复合材料构件高质高效加工关键技术及其工艺装备”，机械工业科学技术奖-科技进步一等奖，2013.10，本人排序第1。}
\end{enumerate}

\end{personalcv}
EOL
)

subfile_bibref=$(cat <<EOL
@book{图书2025,
  title={图书题目},
  author={作者1 and 作者2 and 作者3},
  publisher={所在省市：出版社名称},
  year={2025},
  page={x-y}
}

@phdthesis{学位论文2025,
  author = {作者},
  title = {学位论文题目},
  school = {XX大学},
  year = {2025}
}

@article{期刊论文2025,
  author = {作者1 and 作者2 and 作者3 and 作者4 and 作者5},
  title = {期刊论文题目},
  journal = {期刊名称},
  volume = {25},
  number = {01},
  pages = {x-y},
  year = {2025},
  issn = {xxxx-yyyy}
}
EOL
)

subfile_texref_BAhumanities=$(cat <<EOL
\bibitem{图书2025}{作者.图书题目[M].所在省市：出版社名称,2025.}
\bibitem{学位论文2025}{作者.学位论文题目[D].XX大学,2025.}
EOL
)

subfile_texref=$(cat <<EOL
% 每一类文献的排列方式：
%% 对于中文文献，按照作者名字拼音的首字母顺序
%% 对于外文文献，先按照国别首字母顺序、再按照作者名字拼音的首字母顺序
\subsection{中文文献}
\subsubsection{著作类}
  \bibitem{}{康晓光、冯利主编：《2012中国第三部门观察报告》，社会科学文献出版社2012年版。}
  \bibitem{}{资中筠：《财富的归宿——美国现代公益基金会述评》，三联书店2011年版。}
\subsubsection{译著类}
  \bibitem{}{[德]卡尔·拉伦茨：《法学方法论》，陈爱娥译，商务印书馆2003年版。}
  \bibitem{}{[德]柯武刚、史漫飞：《制度经济学：社会秩序与公共政策》，韩朝华译，商务印书馆2000年版。}
\subsubsection{期刊论文类}
  \bibitem{}{高丙中：“社会团体的合法性问题”，载《中国社会科学》2000年第2期。}
  \bibitem{}{税兵：“非营利法人解释”，载《法学研究》2007年第5期。}
\subsubsection{学位论文类}
  \bibitem{}{李韬：《美国的慈善基金会与美国政治》，中国社会科学院2003年博士学位论文。}
  \bibitem{}{刘春湘：《非营利组织治理结构研究》，中南大学2006年博士学位论文。}
\subsubsection{报刊文献类}
  \bibitem{}{陈小路：《河南宋庆龄基金会：“慈善集资”——中国最“富”慈善组织的钱从哪来》，《南方周末》2011年9月8日C14版。}
  \bibitem{}{朱卫国：《基金会管理条例评析》，《中国社会报》2004年3月20日第1版。}
\subsubsection{电子文献类}
  \bibitem{}{《基金会数据在线》，基金会中心网：\url{http://www.foundationcenter.org.cn/search/orders}. 最后访问日期：2015年10月1日。}
  \bibitem{}{《李连杰壹基金的黑与白》，腾讯网：\url{http://view.news.qq.com/zt2010/1foundation/index.htm}. 最后访问日期：2015年10月1日。}
  \bibitem{}{《全国民政事业统计数据》，民政部官网：\url{http://cws.mca.gov.cn/article/tjsj/qgsj/}.最后访问日期：2015年10月1日。}
\subsubsection{案例类}
  \bibitem{}{包郑照诉苍南县人民政府强制拆除房屋案，浙江省高级人民法院（1988）浙法民上字 7 号民事判决书。}
  \bibitem{}{陆红霞诉南通市发改委政府信息公开案，《最高人民法院公报》2015年第 11 期。}
\subsection{外文文献}
\subsubsection{著作类}
  \bibitem{}{Dennis Young, If Not for Profit, for What? D.C. Heath and Company Lexington, 2013.}
  \bibitem{}{Peter  Frumkin, On Being Nonprofit, Harvard University Press, 2002.}
  \bibitem{}{ Rrichard P. Chait, Governance as Leadership: Reforming the Work of Nonprofit Boards, John Wiley \& Sons Inc., 2005.}
\subsubsection{英文论文}
  \bibitem{}{Melanie B. Leslie, ‘The Wisdom of Crows? Groupthink and Nonprofit Governance’, 62 Florida Law Review 1179（2010）}
  \bibitem{}{Rebecca Lee, ‘Modernizing Charity Law in China’, 18 Pacific Rim Law \& Policy Journal 347 (2009).}
  \bibitem{}{Terri Lynn Helge, ‘Policing The Good Guys: Regulation of The Charitable Sector Through A Federal Charity Oversight Board’, 19 Cornell Journal of Law \& Public Policy 1 (2009).}
\subsubsection{案例类}
  \bibitem{}{Brown v. Board of Education, 347 U.S. 483 (1954).}
  \bibitem{}{Davis v. Johnson [1978] 2 WLR 182.}
  \bibitem{}{Knuller v. DPP [1973] AC 435.}
  \bibitem{}{ Runyon v. McCrary, 427 U.S. 160 (1976).}
EOL
)

#############################
# 数组：平台类型、待生成的文本
#############################

PlatformList=("windows" "macos" "ubuntu" "web" "customization")

DegreeList[0]=$mainfile_BAstem
DegreeList[1]=$mainfile_BAhumanities
DegreeList[2]=$mainfile_MA
DegreeList[3]=$mainfile_MAlaw
DegreeList[4]=$mainfile_MAmarxism
DegreeList[5]=$mainfile_DOC
DegreeList[6]=$mainfile_DOClaw
DegreeList[7]=$mainfile_DOCmarxism

#############################
# 主程序
#############################

CarPoint=1
Comments=1

echo $'\014' #清屏
echo $'\n\e[8;25;110t' #调整页面大小

while(($CarPoint==1))
do
  welcometext $Comments
  echo "请选择您想执行的操作（输入选项前的数字）"
  echo "-----------------------------"
  echo "[1]: 编译当前项目"
  echo "[2]: 新建空白项目"
  echo "[3]: 清理辅助文件（不含PDF文档）"
  echo "[0]: 退出"
  echo "-----------------------------"
  read -p "-->在这里输入：" Option
  if [ $Option == 0 ]
  then
    echo " "
    echo "------------------------------------"
    echo "----- box已关闭，祝写作顺利！-----"
    echo "------------------------------------"
    echo " "
    CarPoint=0
  elif [ $Option == 1 ]
  then
    echo " "
    echo "--------------------------------------"
    echo "请输入该项目的主文档名称（不含文件后缀.tex）"
    echo "--------------------------------------"
    echo " "
    read -p "-->在这里输入：" CurrentMainFile
    if [ -f "$CurrentMainFile.tex" ]
    then
      echo " "
      echo "----------------------------------------"
      echo "----- 正在编译 $CurrentMainFile.tex -----"
      echo "----------------------------------------"
      echo " "
      sleep 1
      latexmk $CurrentMainFile.tex
      echo " "
      echo "--------------------"
      echo "----- 编译完成！-----"
      echo "--------------------"
      echo " "
    else
      echo " "
      echo "--------------------------------------------------"
      echo "文件 $CurrentMainFile.tex 不存在，请检查有效的文件名称！"
      echo "--------------------------------------------------"
      echo " "
    fi
  elif [ $Option == 3 ]
  then
    sleep 1
    latexmk -c
    echo " "
    echo "--------------------"
    echo "----- 清理完成！-----"
    echo "--------------------"
    echo " "
  elif [ $Option == 2 ]
  then
    echo " "
    echo "请选择新项目的学位类别（输入选项前的数字）"
    echo "-----------------------------"
    echo "[1]: BAstem（本科-理工科）"
    echo "[2]: BAhumanities（本科-人文社科）"
    echo "[3]: MA（硕士）"
    echo "[4]: MAlaw（硕士-法学/法律）"
    echo "[5]: MAmarxism（硕士-马克思主义理论）"
    echo "[6]: DOC（博士）"
    echo "[7]: DOClaw（博士-法学/法律）"
    echo "[8]: DOCmarxism（博士-马克思主义理论）"
    echo "-----------------------------"
    echo " "
    read -p "-->在这里输入：" NewDegree
    if [ $NewDegree -ge 1 -a $NewDegree -le 8 ] #排错
    then
      echo " "
    else
      echo "--------------------------"
      echo "无效的输入，请注意界面提示语！"
      echo "--------------------------"
      echo " "
      Comments=2
      read -rsn1 -p "按任意键继续："
      echo $'\n'
      continue
    fi
    ##################################
    echo " "
    echo "请输入当前使用LaTeX的[平台]名称（输入选项前的数字）"
    echo "----------------------------"
    echo "[1]: Windows"
    echo "[2]: macOS"
    echo "[3]: Ubuntu"
    echo "[4]: Web"
    echo "[5]: Customization"
    echo "----------------------------"
    echo " "
    read -p "-->在这里输入：" MyPlatform
    if [ $MyPlatform -ge 1 -a $MyPlatform -le 5 ] #排错
    then
      echo " "
    else
      echo "--------------------------"
      echo "无效的输入，请注意界面提示语！"
      echo "--------------------------"
      echo " "
      Comments=2
      read -rsn1 -p "按任意键继续："
      echo $'\n'
      continue
    fi
    ####################################
    echo "------------------------"
    echo "请输入新项目的[主文档]名称"
    echo "注意：（1）不含文件后缀.tex"
    echo "    （2）不要使用中文"
    echo "------------------------"
    echo " "
    read -p "-->在这里输入（如需中止创建请输入0）：" NewMainFile
    if [ $NewMainFile = "0" ] #主动中止
    then
      echo " "
      echo "---------------------"
      echo "----- 创建已中止！-----"
      echo "---------------------"
      echo " "
      Comments=2
      read -rsn1 -p "按任意键继续："
      echo $'\n'
      continue
    elif [ -f "$NewMainFile.tex" ] 
    then 
      echo " "
      echo "-----------------------------------"
      echo "$NewMainFile.tex 已存在，请重新命名！"
      echo "-----------------------------------"
      echo " "
      read -rsn1 -p "按任意键继续："
      echo $'\n'
      continue
    fi
    ##################################
    echo " "
    echo "-------------------------------------------"
    echo "请输入新项目的[章节文件夹]名称（注：不要使用中文）"
    echo "-------------------------------------------"
    echo " "
    read -p "-->在这里输入（如需中止创建请输入0）：" NewFolder
    echo " "
    if [ $NewFolder = "0" ] #主动中止
    then
      echo " "
      echo "---------------------"
      echo "----- 创建已中止！-----"
      echo "---------------------"
      echo " "
      Comments=2
      read -rsn1 -p "按任意键继续："
      echo $'\n'
      continue
    elif [ -e "./mainbody/$NewFolder" ]
    then 
      echo " "
      echo "-----------------------------------"
      echo "文件夹 $NewFolder 已存在，请重新命名！"
      echo "-----------------------------------"
      echo " "
      read -rsn1 -p "按任意键继续："
      echo $'\n'
      continue
    fi
    # 开始生成
    echo "-------------------"
    echo "----- 正在创建 -----"
    echo "-------------------"
    echo " "
    resone=${DegreeList[$NewDegree-1]//<PLATFORM>/${PlatformList[$MyPlatform-1]}}
    restwo=${resone//<FOLDER>/$NewFolder}
    resthree=${restwo//<MAINFILENAME>/$NewMainFile}
    ## 公共项目
    echo "$resthree" >> $NewMainFile.tex
    mkdir ./mainbody/$NewFolder
    echo "$subfile_abstractCN" >> ./mainbody/$NewFolder/abstract_zh.tex
    echo "$subfile_abstractEN" >> ./mainbody/$NewFolder/abstract_en.tex
    echo "$subfile_chapterone" >> ./mainbody/$NewFolder/ch1.tex
    echo "$subfile_conclusion" >> ./mainbody/$NewFolder/conclusion.tex
    echo "$subfile_acknowledgement" >> ./mainbody/$NewFolder/acknowledgement.tex
    ## 单独项目
    case $NewDegree in
    1) 
      ### [本科-理工科]：bib类型的ref文件
      echo "$subfile_bibref" >> ./refs/ref_$NewMainFile.bib
      ;;
    2)
      ### [本科-人文社科]：tex类型的ref文件
      echo "$subfile_texref_BAhumanities" >> ./refs/ref_$NewMainFile.tex
      ;;
    3)
      ### [硕士]：bib类型的ref文件、personalcvs
      echo "$subfile_bibref" >> ./refs/ref_$NewMainFile.bib
      echo "$subfile_personalcvs" >> ./mainbody/$NewFolder/personalcvs.tex
      ;;
    4)
      ### [硕士-法学/法律]：tex类型的ref文件、作者简介、科研成果
      echo "$subfile_texref" >> ./refs/ref_$NewMainFile.tex
      echo "$subfile_authorintroduction" >> ./mainbody/$NewFolder/authorintroduction.tex
      echo "$subfile_authorachievements" >> ./mainbody/$NewFolder/authorachievements.tex
      ;;
    5)
      ### [硕士-马克思主义理论]：tex类型的ref文件、作者简介、科研成果
      echo "$subfile_texref" >> ./refs/ref_$NewMainFile.tex
      echo "$subfile_authorintroduction" >> ./mainbody/$NewFolder/authorintroduction.tex
      echo "$subfile_authorachievements" >> ./mainbody/$NewFolder/authorachievements.tex
      ;;
    6)
      ### [博士]：创新点摘要、bib类型的ref文件、personalcvs
      echo "$subfile_abstractINNOVATION" >> ./mainbody/$NewFolder/abstract_innovation.tex
      echo "$subfile_bibref" >> ./refs/ref_$NewMainFile.bib
      echo "$subfile_personalcvs" >> ./mainbody/$NewFolder/personalcvs.tex
      ;;
    7)
      ### [博士-法学/法律]：创新点摘要、tex类型的ref文件、作者简介、科研成果
      echo "$subfile_abstractINNOVATION" >> ./mainbody/$NewFolder/abstract_innovation.tex
      echo "$subfile_texref" >> ./refs/ref_$NewMainFile.tex
      echo "$subfile_authorintroduction" >> ./mainbody/$NewFolder/authorintroduction.tex
      echo "$subfile_authorachievements" >> ./mainbody/$NewFolder/authorachievements.tex
      ;;
    8)
      ### [博士-马克思主义理论]：创新点摘要、tex类型的ref文件、作者简介、科研成果
      echo "$subfile_abstractINNOVATION" >> ./mainbody/$NewFolder/abstract_innovation.tex
      echo "$subfile_texref" >> ./refs/ref_$NewMainFile.tex
      echo "$subfile_authorintroduction" >> ./mainbody/$NewFolder/authorintroduction.tex
      echo "$subfile_authorachievements" >> ./mainbody/$NewFolder/authorachievements.tex
      ;;
    esac
    echo "--------------------------------------------------"
    echo "-------------------- 创建完成！--------------------"
    echo "（1）当前新项目，在独立文件方面只生成了必要部分的文件："
    echo "- 创新点摘要"
    echo "- 中文摘要"
    echo "- 英文摘要"
    echo "- 第1章"
    echo "- 结论"
    echo "- 参考文献"
    echo "- 作者简历及攻读【硕/博】士学位期间的科研成果"
    echo "- 致谢"
    echo "其余的独立文件（引言，正文其他，附录，etc）请自行按需创建。"
    echo "（2）请自行创建放置图片的文件夹。"
    echo "--------------------------------------------------"
    echo " "
  else
    echo " "
    echo "--------------------------"
    echo "无效的输入，请注意界面提示语！"
    echo "--------------------------"
    echo " "
  fi
  Comments=2
  read -rsn1 -p "按任意键继续："
  echo $'\n'
done