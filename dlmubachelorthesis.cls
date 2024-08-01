%
% This is file "dlmubachelorthesis.cls"
%
% Copyright (C) 2023-2024 by JL <yhlaozero2@163.com>
%
% This work may be distributed and/or modified under the
% conditions of the LaTeX Project Public License, either version 1.3
% of this license or (at your option) any later version.
% The latest version of this license is in
%   https://www.latex-project.org/lppl.txt
% and version 1.3c or later is part of all distributions of LaTeX
% version 2008 or later.
%


% --------------- 全局设置 --------------- %
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{dlmubachelorthesis}[2024/07/10 v2.0 Unofficial LaTeX Template for DLMU Bachelor Thesis]
% ======================================== %


% --------------- 编译器约束 --------------- %
\RequirePackage{ifxetex}
\RequireXeTeX
\ifxetex\else
\ClassError{dlmubachelorthesis}{You must use the `xelatex' driver\MessageBreak Please choose `xelatex'}{%
Just choose `xelatex', no `pdflatex' or `latex' and so on.}
\fi
% ======================================== %


% ---------- 文档类声明命令的可选参数初始化 ---------- %
\RequirePackage{zhnumber} %【中文数字】
\newif\if@dlmuthesis@bachelors %【理工科模式，初始值为真，下同】
\newif\if@dlmuthesis@bachelorh %【文科模式，初始值为真，下同】

\DeclareOption{bachelors}{\@dlmuthesis@bachelorstrue}
\DeclareOption{bachelorh}{\@dlmuthesis@bachelorhtrue}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax %【这句万万不可改动】
\LoadClass[a4paper, 12pt]{article} %【导入正规文档类】
% ======================================== %


% --------------- ctex宏集设置 --------------- %
\RequirePackage[UTF8, heading=true, zihao = -4]{ctex}
\RequirePackage{totcount}

\if@dlmuthesis@bachelors
\ctexset{
  abstractname = {\zihao{3}摘\hspace{2em}要},
  contentsname = \hfill{\zihao{3}目\hspace{2em}录}\hfill,
  bibname = \hfill{\zihao{3}参~ 考~ 文~ 献}\hfill,
  section = {
    format = {\zihao{3}\bfseries},
    name = {第,章},
    beforeskip=6.75pt,
    afterskip=6.75pt,
  },
  subsection = {
    format={\zihao{4}\bfseries},
    beforeskip=6.75pt,
    afterskip=6.75pt,
  },
  subsubsection = {
    format={\zihao{-4}\bfseries},
	beforeskip=6.75pt,
    afterskip=6.75pt,
  }
}
\else\if@dlmuthesis@bachelorh
\renewcommand\thesubsection{\arabic{subsection}} %重设二级标题计数器格式
\renewcommand\thesubsubsection{\arabic{subsubsection}} %重设三级标题计数器格式
\renewcommand\theparagraph{\arabic{paragraph}} %重设四级标题计数器格式
\ctexset{
  abstractname = {\zihao{3}摘\hspace{2em}要},
  contentsname = \hfill{\zihao{3}目\hspace{2em}录}\hfill,
  bibname = \hfill{\zihao{3}参~ 考~ 文~ 献}\hfill,
  section = {
    format = {\zihao{3}\bfseries},
    name = {,、},
    number = \zhnumber{\thesection},
    aftername = {},
    beforeskip=6.75pt,
    afterskip=6.75pt,
  },
  subsection = {
    format={\zihao{4}\bfseries},
    name = {（,）},
    number = \zhnumber{\thesubsection},
    aftername = {},
    beforeskip=6.75pt,
    afterskip=6.75pt,
  },
  subsubsection = {
    format={\zihao{-4}\bfseries},
    name = {,.~},
    aftername = {},
    beforeskip=6.75pt,
    afterskip=6.75pt,
  },
  paragraph={
    format={\zihao{-4}\bfseries},
    name = {（,）},
    aftername = {},
    aftertitle = \par,
    beforeskip=6.75pt,
    afterskip=6.75pt,
  }
}
\fi\fi

% ======================================== %


% --------------- 限定标题页三要素为空 --------------- %
\title{}
\author{}
\date{}
% ======================================== %


% --------------- 页面样式 --------------- %
\RequirePackage{fancyhdr} %定制页眉页脚
\RequirePackage{geometry} %定制页面
\geometry{bindingoffset=5mm, top=2.5cm, bottom=2.5cm, left=3.0cm, right=2.5cm, headsep=0.5cm}

\pagestyle{fancy}
\lhead{} %在'heading=true'下，默认左页眉为当前二级标题名称，因此要赋值为空
\rhead{} %'heading=true'下，默认右页眉为当前一级标题名称，，因此要赋值为空
\chead{\zihao{-5} \dlmuthesis@tokens@cntitle}
\cfoot{\zihao{-5} \thepage}
\renewcommand{\headrulewidth}{0.4pt} %疑惑：setlength命令不起作用
\renewcommand{\footrulewidth}{0pt}
% ======================================== %


% --------------- 字体 --------------- %
\RequirePackage{fontspec}
% (1) 一般地，MacOS, WindowsOS内部都会安装有simsun字体（即宋体&新宋体）。
% 因此在本地编译时，LaTeX引擎会调用本地自带的字体文件。
% 若本地未安装该字体，双击字体文件simsun.ttc即可安装。
% (2) 然而，采用云端编译时（即：overleaf等在线编辑器），就需要调用文件夹下的字体文件simsun.ttc。
% 因此，该文件不可删掉。
\setCJKmainfont[AutoFakeBold=3.0, AutoFakeSlant=0.3]{simsun.ttc} %中文字体设置
\setmainfont{Times New Roman} %英文字体设置
% ======================================== %


% --------------- 目录样式 --------------- %
\RequirePackage{titletoc}
%% ---------- 一级标题样式 ---------- %
\titlecontents{section}
[0pt]
{\addvspace{2pt}\filright}
{\contentspush{\thecontentslabel\ }}
{}
{\titlerule*[8pt]{.}\contentspage}
%% =================================== %
%% ---------- 二级标题样式 ---------- %
\if@dlmuthesis@bachelorh
\titlecontents{subsubsection}
[5em]
{}
{\contentslabel{1em}}
{\hspace*{5pt}}
{\titlerule*[8pt]{.}\contentspage}
\else
\fi
%% =================================== %
% ======================================== %


% --------------- 摘要环境 --------------- %
\RequirePackage{abstract}
\setlength{\absleftindent}{0pt} %取消左自动缩进
\setlength{\absrightindent}{0pt} %取消右自动缩进
\newcommand{\keywordsCN}[1]{\vspace{\baselineskip}{}\noindent\bf 关键词: #1} %插入关键词
\newcommand{\keywordsEN}[1]{\vspace{\baselineskip}{}\noindent\bf Keywords: #1} %插入关键词
% ======================================== %


% --------------- 列表环境 --------------- %
\RequirePackage[inline]{enumitem}
\if@dlmuthesis@bachelors
\setlist{leftmargin=0pt, itemindent=2\parindent, itemsep=0pt, parsep=0pt}
\else\if@dlmuthesis@bachelorh
\setlist{leftmargin=0pt, itemindent=2\parindent, itemsep=0pt, nosep}
\fi\fi
% ======================================== %


% --------------- 数学环境 --------------- %
\RequirePackage{amsmath, amssymb, mathrsfs} %数学公式三件套
\numberwithin{equation}{section} %将一级章节编号添加到公式编号
\RequirePackage{siunitx} %SI制单位
\newcommand\bk{\boldsymbol}
\newcommand\lt{\left}
\newcommand\rt{\right}
\DeclareMathOperator{\diff}{\,\mathrm{d}\hspace{-1.5pt}} %微分算子

\RequirePackage{amsthm}
\newtheoremstyle{newthmstyle}
  {3pt} %Space above
  {3pt} %Space below
  {\rm} %Body font
  {\parindent} %Indent amount
  {\bf} %Theorem head font
  {} %Punctuation after theorem head
  {1.0em} %Space after theorem head
  {} %Theorem head spec (can be left empty, meaning ‘normal’)
\theoremstyle{newthmstyle}
\newtheorem{Definition}{定义}[section]
\newtheorem{Proposition}{命题}[section]
\newtheorem{Lemma}{引理}[section]
\newtheorem{Theorem}{定理}[section]
\newtheorem{Example}{例}[section]
\newtheorem{Problem}{问题}[section]
\newtheorem{Corollary}{推论}[section]
\newtheorem{Remark}{注}[section]
\renewcommand{\proofname}{\zihao{-4}\bfseries 证明}
% ======================================== %


% --------------- 部分学科高相关度宏包 --------------- %
\RequirePackage{braket} %量子力学算符
\RequirePackage{qcircuit} %量子电路绘制
\RequirePackage[version=4]{mhchem} %化学式、反应方程的书写
\RequirePackage{chemfig} %结构式绘制
\RequirePackage{tikz} %一般图绘制
\RequirePackage{tikz-network} %神经网络图示绘制
\RequirePackage{circuitikz} %数字电路绘制
% ================================================== %


% --------------- 代码环境 --------------- %
\RequirePackage{verbatim} %简易代码环境（提供：verbatim 环境。缺点：不能解决断行问题。）
\RequirePackage{listings} %定制代码环境
\RequirePackage{matlab-prettifier} %MATLAB专门的代码环境
%代码环境定制
\lstset{
  basicstyle=\small\ttfamily, %整体的字号、字体
  stringstyle=\ttfamily, %字符串样式
  backgroundcolor=\color{gray!30}, %背景颜色
  breaklines=true, %自动断行
  showstringspaces=false, %取消特别的字符间距
  framexleftmargin=5pt, %内部左边距
}
% ======================================== %


% --------------- 伪代码 --------------- %
\RequirePackage[ruled, lined]{algorithm2e}
\renewcommand{\algorithmcfname}{算法}
% ======================================== %


% --------------- 标题样式：章、节、条、款、项 --------------- %
\RequirePackage{titlesec}
\setcounter{secnumdepth}{4}

\if@dlmuthesis@bachelors
\titleformat{\paragraph}
  {\normalsize\bfseries} %字体
  {\theparagraph} %标题前的标签
  {1em} %标题和标签之间的间距
  {} %标题前没有额外的命令或内容
\else\if@dlmuthesis@bachelorh
\titleformat{\paragraph}
  {\normalsize\bfseries} %字体
  {（\theparagraph）} %标题前的标签
  {1em} %标题和标签之间的间距
  {} %标题前没有额外的命令或内容
\fi\fi
\titlespacing{\paragraph}
  {0pt} %标题左间距
  {0.5ex \@plus 1ex \@minus.2ex} %标题上间距
  {0.5ex \@plus .2ex} %标题下间距

\newcommand{\fourthsection}[1]{\paragraph{#1}} %将命令\paragraph改名为四级标题
% ============================================================ %


% --------------- 图、表标题样式 --------------- %
\RequirePackage{caption}
\DeclareCaptionLabelSeparator{doublespace}{~~}
\captionsetup{font=small, labelsep=doublespace, labelfont=bf, textfont=bf}
\RequirePackage[labelformat=brace]{subcaption} %(与 subfigure 宏包冲突)也能提供 subfigure 环境（需设置宽度），并使环境中的标题变成副标题样式
\numberwithin{figure}{section} %numberwithin命令必须放在amsmath宏包之后
\numberwithin{table}{section}
% ======================================== %


% --------------- 插图环境 --------------- %
\RequirePackage{graphicx}
\RequirePackage{float} %引入参数H
\graphicspath{{figures/}{figures/STEM/}{figures/humanities/}} %可添加多个路径
% ======================================== %


% --------------- 表格环境 --------------- %
\RequirePackage{makecell}
\RequirePackage{booktabs} %【三线表】
\RequirePackage{longtable} %【跨页表格】
\RequirePackage{tabularx} %【定制表格宽度】
\RequirePackage{multirow} %【实现表格行合并】
\RequirePackage{diagbox} %【表头反斜线】
\RequirePackage{bigstrut} %【在跨行表格中输入定界符】
\RequirePackage{makecell} %【封面表格横线的宽度】
\RequirePackage{multicol} %【实现双栏/多栏环境】
\RequirePackage{threeparttable} %【给表格下方添加注释】
% ======================================== %


% --------------- 调整行间距 --------------- %
\RequirePackage{setspace}
% ======================================== %


% --------------- 设置脚注样式（文科类专业专用） --------------- %
\RequirePackage{xfp} %在latex代码中执行数值加减运算
\RequirePackage{pifont} %提供带圈的阿拉伯数字编号
\RequirePackage[perpage]{footmisc} %设置简单的脚注样式
%% 填“1”：仅阿拉伯数字
%% 填“2”：[1], [2], ...
%% 填“3”：(1), (2), ...
%% 填“4”：带圈的阿拉伯数字
\newcommand\footnotemode[1]{
\ifthenelse{#1=1}{}{ %模式1
  \ifthenelse{#1=2}{
    \renewcommand{\thefootnote}{[\arabic{footnote}]} %模式2
  }{
    \ifthenelse{#1=3}{
      \renewcommand{\thefootnote}{(\arabic{footnote})} %模式3
    }{
      \ifthenelse{#1=4}{
        %% --------------- 模式4 --------------- %
        \renewcommand{\thefootnote}{\ding{ \fpeval{171+\arabic{footnote}} }}
        %% ======================================== %
      }
    }
  }
} %第一个\ifthenelse
} %\renewcommand
% ============================================================ %


% --------------- 杂项 --------------- %
\RequirePackage{comment} % 提供注释环境
\RequirePackage{xcolor} %颜色定制
\RequirePackage{lipsum, zhlipsum} %随机文本（用于调试）
% ======================================== %


% --------------- 参考文献 --------------- %
\RequirePackage[numbers,square,comma]{natbib}
\setlength{\bibsep}{0ex}
\bibliographystyle{thuthesis-bachelor} %借鉴使用：清华大学(本科)学位论文模板bst样式文件，来源：https://mirrors.tuna.tsinghua.edu.cn/github-release/tuna/thuthesis/
\newcommand{\upcite}[1]{$^{\mbox{\footnotesize\cite{#1}}}${}} %《手册》要求：“当提及的参考文献为文中直接说明时，则用小4号字与正文排齐。”因此单独设置一个上标引用的命令。
% ======================================== %


% --------------- 附录与自定义附录 --------------- %
\RequirePackage{appendix} %设置附录样式

% 自定义附录章标题、在目录中的样式
\newcounter{appendixcounting} %定义专属于附录的计数器
\addtocounter{appendixcounting}{1} %附录标题计数器的初始值设为1
\newcommand{\appendixsec}[1]{ \zihao{4}{\section*{附录\arabic{appendixcounting}\quad #1}}\addcontentsline{toc}{section}{附录\theappendixcounting\quad #1}\addtocounter{appendixcounting}{1}} %注：一定要先添加到目录、再将计数器值增1
% ======================================== %


% ------------------------- 关于论文信息的全局变量导入 ------------------------- %

\RequirePackage{ifthen} %【引入条件判断逻辑】
\RequirePackage{etoolbox} %【文档类与宏包的命令自定义】
\RequirePackage[absolute,overlay]{textpos} %【提供基于坐标的文本框环境，其中overlay为绝对坐标】
%% -------------------- 图片&表格 -------------------- %
\RequirePackage{array} %【与表格相关】
%% ============================================================ %


%% -------------------- 变量预定义 -------------------- %
\newcommand{\dlmuthesis@tokens@cntitle}{~} %【中文标题】
\newcommand{\dlmuthesis@tokens@entitle}{~} %【英文标题】
\newcommand{\dlmuthesis@tokens@aauthor}{~} %【作者姓名】
\newcommand{\dlmuthesis@tokens@sdtID}{~} %【学号】
\newcommand{\dlmuthesis@tokens@faculty}{~} %【学院】
\newcommand{\dlmuthesis@tokens@majorinCOVERPAGE}{~} %【专业年级班级(coverpage专用)】
\newcommand{\dlmuthesis@tokens@majorinTITLEPAGE}{~} %【专业班级(titlepage专用)】
\newcommand{\dlmuthesis@tokens@mentorONE}{~} %【指导教师(及其职称)】
\newcommand{\dlmuthesis@tokens@mentorONEinTITLEPAGE}{~} %【指导教师（无职称，标题页专用）】
\newcommand{\dlmuthesis@tokens@mentorTWO}{~} %【第二指导教师(及其职称)】
\newcommand{\dlmuthesis@tokens@completiondateinCOVERPAGE}{XXXX 年 X 月} %【完成日期（年、月），coverpage专用】
\newcommand{\dlmuthesis@tokens@completiondateinBINDINGPAGE}{XXXX 年 X 月} %【完成日期（年、月），bindingpage专用】
%% ============================================================ %


%% -------------------- 正式变量定义 -------------------- %
\newcommand{\cntitle}[1]{
\renewcommand{\dlmuthesis@tokens@cntitle}{#1}
\newcommand{\cntitleinMAINBODY}{\vspace*{1ex}{}\begin{center}{\zihao{3}\bfseries #1}\end{center}{}\vspace*{1ex}{}} %【正文第1页顶部的中文标题】
} %【中文标题】
\newcommand{\entitle}[1]{\renewcommand{\dlmuthesis@tokens@entitle}{#1}} %【英文标题】
\newcommand{\aauthor}[1]{\renewcommand{\dlmuthesis@tokens@aauthor}{#1}} %【作者姓名】
\newcommand{\sdtID}[1]{\renewcommand{\dlmuthesis@tokens@sdtID}{#1}} %【学号】
\newcommand{\faculty}[1]{\renewcommand{\dlmuthesis@tokens@faculty}{#1}} %【学院】
\newcommand{\majorinCOVERPAGE}[1]{\renewcommand{\dlmuthesis@tokens@majorinCOVERPAGE}{#1}} %【专业年级班级(coverpage专用)】
\newcommand{\majorinTITLEPAGE}[1]{\renewcommand{\dlmuthesis@tokens@majorinTITLEPAGE}{#1}} %【专业班级（titlepage专用）】
\newcommand{\mentorONE}[2]{
  \renewcommand{\dlmuthesis@tokens@mentorONEinTITLEPAGE}{#1} %【指导教师（无职称，标题页专用）】
  \renewcommand{\dlmuthesis@tokens@mentorONE}{#1（#2）}
} %【指导教师(及其职称)】
\newcommand{\mentorTWO}[2]{
  \ifthenelse{\equal{#2}{0}}{
    \renewcommand{\dlmuthesis@tokens@mentorTWO}{#1}
  }{
    \renewcommand{\dlmuthesis@tokens@mentorTWO}{#1（#2）}
  }
} %【第二指导教师(及其职称)】【若无，则第一个变量填“无”，第二个填0】
\newcommand{\completiondate}[2]{
  \renewcommand{\dlmuthesis@tokens@completiondateinCOVERPAGE}{{#1}~年~{#2}~月} %【完成日期（年、月），coverpage专用】
  \renewcommand{\dlmuthesis@tokens@completiondateinBINDINGPAGE}{\zhdigits{#1}~年~\zhdigits{#2}~月} %【完成日期（年、月），bindingpage专用
}
%% ============================================================ %

% ================================================================================ %


% ------------------------- 封面页的创建 ------------------------- %
\newcommand{\makecoverpage}{
  \thispagestyle{empty} %【无页眉页脚】
  \setlength{\extrarowheight}{9pt} %【设置表格行间距】
  \setlength{\TPHorizModule}{1cm} % 设置textblock环境的水平单位
  \setlength{\TPVertModule}{1cm} % 设置textblock环境的垂直单位

  ~\newline %【起到将封面页与正文隔离的预作用(该文件最后是正式作用)，少了这句不行】

  %%% ---------- 封面顶部LOGO ---------- %
  \begin{textblock}{15}(3,5)
    \centering
    \includegraphics[width=11.11cm, height=2.4cm]{figures/logo/LogoAndName_dlmu.png}
  \end{textblock}
  %%% ======================================== %

  %%% ---------- LOGO下方的大字号标题 ---------- %
  \begin{textblock}{10}(5.5,9.85)
    \centering
    \fontsize{40pt}{26pt}\selectfont{\heiti 本科毕业论文}\\
  \end{textblock}
  %%% ======================================== %

  %%% ---------- 大字号标题下方的中、英论文题目 ---------- %
  \begin{textblock}{15}(3.3,13.0)
    \centering
    \renewcommand{\arraystretch}{0.75} %【调整表格行间距】
    \begin{tabular}
      {
      m{1.4cm}<{\vspace{-0.3\baselineskip}\centering}
      m{11.4cm}<{\vspace{-0.3\baselineskip}\centering}
      }
      \bfseries\fontsize{16pt}{16pt}\selectfont 题\hfil 目: &
      \multirow[t]{2}{12.0cm}{\centering\bfseries\fontsize{16pt}{16pt}\selectfont\dlmuthesis@tokens@cntitle}
      \\ \cline{2-2} %【为论文题目添加下划线，但需手动添加（目前只有两行）】
      \\ \cline{2-2}
      \bfseries\fontsize{16pt}{16pt}\selectfont Title: &
      \multirow[t]{2}{12.0cm}{\centering\bfseries\fontsize{16pt}{16pt}\selectfont\dlmuthesis@tokens@entitle}
      \\ \cline{2-2}
      \\ \cline{2-2}
      \\ \cline{2-2}
    \end{tabular}
  \end{textblock}
  %%% ================================================== %

  %%% -------------------- 封面信息栏 -------------------- %
  \begin{textblock}{16}(3.3,16.9)
    \centering
    \renewcommand{\arraystretch}{1.2}
    \begin{tabular}
      {
      >{\fontsize{16pt}{16pt}\selectfont}m{3.8cm}
      >{\centering\arraybackslash\fontsize{16pt}{16pt}\selectfont} p{8.0cm}
      }
      \selectfont\fangsong 姓\hfill 名: & \selectfont\fangsong\dlmuthesis@tokens@aauthor \\
      \cline{2-2}
      \selectfont\fangsong 学\hfill 号: & \selectfont\fangsong\dlmuthesis@tokens@sdtID \\
      \cline{2-2}
      \selectfont\fangsong 学\hfill 院: & \selectfont\fangsong\dlmuthesis@tokens@faculty \\
      \cline{2-2}
      \selectfont\fangsong 专\hfill 业\hfill 年\hfill 级\hfill 班\hfill 级: & \selectfont\fangsong\dlmuthesis@tokens@majorinCOVERPAGE \\
      \cline{2-2}
      \selectfont\fangsong 指\hfill 导\hfill 教\hfill 师: & \selectfont\fangsong\dlmuthesis@tokens@mentorONE \\
      \cline{2-2}
      \selectfont\fangsong 第\hfill 二\hfill 导\hfill 师: & \selectfont\fangsong\dlmuthesis@tokens@mentorTWO \\
      \cline{2-2}
      \selectfont\fangsong 完\hfill 成\hfill 日\hfill 期: & \selectfont\fangsong\dlmuthesis@tokens@completiondateinCOVERPAGE \\
      \cline{2-2}
    \end{tabular}
  \end{textblock}
  %%% ================================================== %

  %% ---------- 由于之前将\extrarowheight的值设为8pt，为保证往后正文表格的间距正常，需重新设置回来 ---------- %
  \setlength{\extrarowheight}{2pt}
  %%% ==================================================================================================== %

  \newpage %【起到将封面页与正文隔离开的正式作用】
} %【\newcommand{\makecoverpage}】
% ============================================================ %


% --------------- 封面页的导入 --------------- %
\newcommand{\makepages}{
\makecoverpage
}
% ======================================== %


% --------------- 对sty,cls的命令的定制 --------------- %
\RequirePackage{etoolbox}

\apptocmd{\makepages}{
\pagestyle{plain} %从摘要到目录，设置为无页眉、有页脚的模式
\pagenumbering{Roman} %《手册》要求：从摘要到目录，设置罗马数字页码
\renewcommand{\baselinestretch}{1.25}
}{\typeout{succeeds: edit the style of page using package etoolbox}}{\PackageError{fails: edit the style of page using package etoolbox}}

\BeforeBeginEnvironment{thebibliography}{
\addcontentsline{toc}{section}{参~ 考~ 文~ 献} %不能放在导言区
\vspace*{0pt}
}{\typeout{succeeds: pre-style of env thebibliography}}{\typeout{fails: pre-style of env thebibliography}}

\AfterEndEnvironment{thebibliography}{
\clearpage\vspace*{0pt}
}{\typeout{succeeds: aft-style of env thebibliography}}{\typeout{fails: aft-style of env thebibliography}}

\pretocmd{\appendixsec}{
\newpage
}{\typeout{成功：附录环境下在下一个章节前前换页}}{\PackageError{失败：附录环境下在下一个章节前前换页}}

% ======================================== %


% --------------- 超链接与交叉引用 --------------- %
\RequirePackage[hidelinks, bookmarksnumbered=true, breaklinks=true, bookmarksopen=true]{hyperref}
% ======================================== %
