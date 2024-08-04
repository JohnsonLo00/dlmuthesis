%
% This is file "dlmuthesis.cls"
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
\ProvidesClass{dlmuthesis}[2024/07/10 v3.0.0 Unofficial Thesis LaTeX Template for DLMU]
% ======================================== %


% --------------- 编译器约束 --------------- %
\RequirePackage{ifthen}
\RequirePackage{ifxetex}
\RequireXeTeX
\ifxetex\else
\ClassError{dlmuthesis}{You must use the `xelatex' driver\MessageBreak Please choose `xelatex'}{%
Just choose `xelatex', no `pdflatex' or `latex' and so on.}
\fi
% ======================================== %


% ---------- 文档类声明命令的可选参数初始化 ---------- %
\RequirePackage{zhnumber} %【中文数字】
\newif\if@dlmuthesis@BAstem %【理工科模式，初始值为真，下同】
\newif\if@dlmuthesis@BAhumanities %【人文社科模式，初始值为真，下同】
\newif\if@dlmuthesis@MA %【硕士模式，初始值为真，下同】

\newcounter{optionofdegree} %【用于计算关于学位类别的可选参数用了多少个】
\setcounter{optionofdegree}{0}
\DeclareOption{BAstem}{
\@dlmuthesis@BAstemtrue
\addtocounter{optionofdegree}{1}
}
\DeclareOption{BAhumanities}{
\@dlmuthesis@BAhumanitiestrue
\addtocounter{optionofdegree}{1}
}
\DeclareOption{MA}{
\@dlmuthesis@MAtrue
\addtocounter{optionofdegree}{1}
}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax %【这句万万不可改动】
\LoadClass[a4paper, 12pt]{article} %【导入正规文档类】
% ======================================== %


% ---------- 限定只能出现一个学位类别参数 ---------- %
\ifthenelse{\value{optionofdegree}>1}{
\ClassError{dlmuthesis}{documentclass命令中导入了多个关于学位类别的可选参数}{}
}{}
% ================================================== %


% --------------- ctex宏集设置 --------------- %
\RequirePackage[UTF8, heading=true, zihao = -4]{ctex}
\RequirePackage{totcount}

\if@dlmuthesis@BAstem %本科-理工科
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
\else\if@dlmuthesis@BAhumanities %本科-人文社科
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
\else\if@dlmuthesis@MA %硕士
\ctexset{
  abstractname = {\zihao{-3}\heiti 摘\hspace{2em}要},
  contentsname = \hfill{\heiti\zihao{-3}目\hspace{2em}录}\hfill,
  listfigurename = \hfill{\songti\zihao{-3}图目录}\hfill,
  listtablename = \hfill{\songti\zihao{-3}表目录}\hfill,
  figurename = {图},
  tablename = {表},
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
\fi\fi\fi

% ======================================== %


% --------------- 限定标题页三要素为空 --------------- %
\title{}
\author{}
\date{}
% ======================================== %


% --------------- 页面样式 --------------- %
\RequirePackage{fancyhdr} %定制页眉页脚
\RequirePackage{geometry} %定制页面
\if@dlmuthesis@BAstem %本科-理工科
\geometry{bindingoffset=5mm, top=2.5cm, bottom=2.5cm, left=3.0cm, right=2.5cm, headsep=0.5cm}
\else\if@dlmuthesis@BAhumanities %本科-人文社科
\geometry{bindingoffset=5mm, top=2.5cm, bottom=2.5cm, left=3.0cm, right=2.5cm, headsep=0.5cm}
\else\if@dlmuthesis@MA %硕士
\geometry{bindingoffset=5mm, top=2.5cm, bottom=2.5cm, left=3.0cm, right=2.5cm, headsep=24.0pt}
\fi\fi\fi

\lhead{} %在'heading=true'下，默认左页眉为当前二级标题名称，因此要赋值为空
\rhead{} %'heading=true'下，默认右页眉为当前一级标题名称，，因此要赋值为空
\chead{\zihao{-5} \dlmuthesis@tokens@cntitle}
\cfoot{\zihao{-5} \thepage}
\renewcommand{\headrulewidth}{0.4pt}
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


% --------------- 颜色定制 --------------- %
\RequirePackage{xcolor}
\definecolor{keywordincode}{RGB}{000,000,255}
\definecolor{stringincode}{RGB}{128,128,000}
\definecolor{commentincode}{RGB}{106,153,85}
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
\if@dlmuthesis@BAhumanities
\titlecontents{subsubsection}
[5em]
{}
{\contentslabel{1em}}
{\hspace*{5pt}}
{\titlerule*[8pt]{.}\contentspage}
\else
\fi
%% =================================== %
%% ---------- 目录到图(/表)目录之间的样式 ---------- %
\if@dlmuthesis@MA
\newcommand\toctolof{
\newpage
\begin{center}\heiti\zihao{-3}图表目录\end{center}
}
\fi
%% ============================================== %
%% ---------- 图目录样式 ---------- %
\titlecontents{figure}
  [0pt] %左边缩进为0
  {\addvspace{0pt}} %每一行之间的垂直间距
  {\figurename{~~}\thecontentslabel\quad} %条目样式
  {\hfill} %填充对齐
  {\titlerule*[6pt]{.}\contentspage} % 用点线间隔，并显示页面号
%% =================================== %
%% ---------- 表目录样式 ---------- %
\titlecontents{table}
  [0pt] %左边缩进为0
  {\addvspace{0pt}} %每一行之间的垂直间距
  {\tablename{~~}\thecontentslabel\quad} %条目样式
  {\hfill} %填充对齐
  {\titlerule*[6pt]{.}\contentspage} % 用点线间隔，并显示页面号
%% =================================== %
% ======================================== %


% -------------------- 摘要环境 -------------------- %
\RequirePackage{abstract}
\setlength{\absleftindent}{0pt} %取消左自动缩进
\setlength{\absrightindent}{0pt} %取消右自动缩进
%% ---------- 中文版摘要插入关键词 ---------- %
\newcommand{\keywordsCN}[1]{
\if@dlmuthesis@BAstem %本科-理工科
\vspace{\baselineskip}{}\noindent\bf 关键词: #1
\else\if@dlmuthesis@BAhumanities %本科-人文社科
\vspace{\baselineskip}{}\noindent\bf 关键词: #1
\else\if@dlmuthesis@MA %硕士
\vspace{\baselineskip}{}{\bf\heiti 关键词}: #1
\fi\fi\fi
}
%% ======================================== %
%% ---------- 英文版摘要插入关键词 ---------- %
\newcommand{\keywordsEN}[1]{
\if@dlmuthesis@BAstem %本科-理工科
\vspace{\baselineskip}{}\noindent\bf Keywords: #1
\else\if@dlmuthesis@BAhumanities %本科-人文社科
\vspace{\baselineskip}{}\noindent\bf Keywords: #1
\else\if@dlmuthesis@MA %硕士
\vspace{\baselineskip}{}{\bf Key Words}: #1
\fi\fi\fi
}
%% ======================================== %
% ================================================== %


% --------------- 列表环境 --------------- %
\RequirePackage[inline]{enumitem}
\if@dlmuthesis@BAstem
\setlist{leftmargin=0pt, itemindent=2\parindent, itemsep=0pt, parsep=0pt}
\else\if@dlmuthesis@BAhumanities
\setlist{leftmargin=0pt, itemindent=2\parindent, itemsep=0pt, nosep}
\else\if@dlmuthesis@MA
\setlist{leftmargin=0pt, itemindent=2\parindent, itemsep=0pt, parsep=0pt}
\fi\fi\fi
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
  backgroundcolor=\color{gray!30}, %背景颜色
  breaklines=true, %自动断行
  showstringspaces=false, %取消特别的字符间距
  framexleftmargin=5pt, %内部左边距
  keywordstyle=\color{keywordincode}, %关键字样式
  stringstyle=\color{stringincode}, %字符串样式
  commentstyle=\color{commentincode}, %注释样式
}
% ======================================== %


% --------------- 伪代码 --------------- %
\RequirePackage[ruled, lined]{algorithm2e}
\renewcommand{\algorithmcfname}{算法}
% ======================================== %


% --------------- 标题样式：章、节、条、款、项 --------------- %
\RequirePackage{titlesec}
\setcounter{secnumdepth}{4}

\if@dlmuthesis@BAstem
\titleformat{\paragraph}
  {\normalsize\bfseries} %字体
  {\theparagraph} %标题前的标签
  {1em} %标题和标签之间的间距
  {} %标题前没有额外的命令或内容
\else\if@dlmuthesis@BAhumanities
\titleformat{\paragraph}
  {\normalsize\bfseries} %字体
  {（\theparagraph）} %标题前的标签
  {1em} %标题和标签之间的间距
  {} %标题前没有额外的命令或内容
\else\if@dlmuthesis@MA
\titleformat{\paragraph}
  {\normalsize\bfseries} %字体
  {\theparagraph} %标题前的标签
  {1em} %标题和标签之间的间距
  {} %标题前没有额外的命令或内容
\fi\fi\fi
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


% --------------- 设置脚注样式（人文社科专业专用） --------------- %
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
\newcommand{\appendixsec}[1]{ \zihao{4}{\section*{附录\arabic{appendixcounting}\quad #1}}\phantomsection\addcontentsline{toc}{section}{附录\theappendixcounting\quad #1}\addtocounter{appendixcounting}{1}} %注：一定要先添加到目录、再将计数器值增1
% ======================================== %


% ------------------------- 关于论文信息的全局变量导入 ------------------------- %

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
\newcommand{\dlmuthesis@tokens@majorinCOVERPAGE}{~} %【专业年级班级(coverpage专用)】
\newcommand{\dlmuthesis@tokens@mentorONE}{~} %【指导教师（职称）】
\newcommand{\dlmuthesis@tokens@faculty}{~} %【学院】
\newcommand{\dlmuthesis@tokens@completiondate}{XXXX 年 X 月} %【完成日期（年、月），coverpage专用】

%%% ---------- 本科论文专用 ---------- %
\newcommand{\dlmuthesis@tokens@mentorTWO}{~} %【第二指导教师(及其职称)】
%%% ======================================== %

%%% ---------- 硕士论文专用 ---------- %
\newcommand{\dlmuthesis@tokens@degree}{~} %【学位类别】
%%% ======================================== %

%%% ---------- 博士论文专用 ---------- %
%%% ======================================== %

%% ============================================================ %


%% -------------------- 正式变量定义 -------------------- %

\newcommand{\cntitle}[1]{
\renewcommand{\dlmuthesis@tokens@cntitle}{#1}
\newcommand{\cntitleinMAINBODY}{\vspace*{1ex}{}\begin{center}{\zihao{3}\bfseries #1}\end{center}{}\vspace*{1ex}{}} %【正文第1页顶部的中文标题】
} %【中文标题】
\newcommand{\entitle}[1]{\renewcommand{\dlmuthesis@tokens@entitle}{#1}} %【英文标题】
\newcommand{\aauthor}[1]{\renewcommand{\dlmuthesis@tokens@aauthor}{#1}} %【作者姓名】
\newcommand{\sdtID}[1]{\renewcommand{\dlmuthesis@tokens@sdtID}{#1}} %【学号】
\newcommand{\majorinCOVERPAGE}[1]{\renewcommand{\dlmuthesis@tokens@majorinCOVERPAGE}{#1}} %【专业年级班级(coverpage专用)】
\newcommand{\mentorONE}[1]{\renewcommand{\dlmuthesis@tokens@mentorONE}{#1}} %【指导教师（职称）】
\newcommand{\faculty}[1]{\renewcommand{\dlmuthesis@tokens@faculty}{#1}} %【学院】
\newcommand{\completiondate}[2]{
  \renewcommand{\dlmuthesis@tokens@completiondate}{{#1}~年~{#2}~月} %【完成日期（年、月），coverpage专用】
}

%%% ---------- 本科论文专用 ---------- %
\newcommand{\mentorTWO}[1]{\renewcommand{\dlmuthesis@tokens@mentorTWO}{#1}} %【第二指导教师（职称）】
%%% ======================================== %

%%% ---------- 硕士论文专用 ---------- %
\newcommand{\headerinCOVERPAGEMA}{硕~士~}
\newcommand{\degree}[2]{
  \renewcommand{\dlmuthesis@tokens@degree}{#1}
  \ifthenelse{\equal{#2}{academic}}{
    % maintain original
  }{
    \ifthenelse{\equal{#2}{professional}}{
      \renewcommand{\headerinCOVERPAGEMA}{专~业~学~位~硕~士~}
    }{
      % no commands
    }
  }
} %【学位类别】

%%% ======================================== %

%%% ---------- 博士论文专用 ---------- %
%%% ======================================== %

%% ============================================================ %

% ================================================================================ %


% ------------------------- 封面页的创建 ------------------------- %

%% -------------------- 封面页-本科论文 -------------------- %
\newcommand{\makecoverpageBA}{
  \thispagestyle{empty} %【无页眉页脚】
  \setlength{\extrarowheight}{9pt} %【设置表格行间距】
  \setlength{\TPHorizModule}{1cm} % 设置textblock环境的水平单位
  \setlength{\TPVertModule}{1cm} % 设置textblock环境的垂直单位

  ~\newline %【起到将封面页与正文隔离的预作用(该文件最后是正式作用)，少了这句不行】

  %%% ---------- 封面顶部LOGO ---------- %
  \begin{textblock}{15}(3,5)
    \centering
    \includegraphics[width=11.11cm, height=2.4cm]{figures/logo/LogoBA.png}
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
      \selectfont\fangsong 完\hfill 成\hfill 日\hfill 期: & \selectfont\fangsong\dlmuthesis@tokens@completiondate \\
      \cline{2-2}
    \end{tabular}
  \end{textblock}
  %%% ================================================== %

  %% ---------- 由于之前将\extrarowheight的值设为9pt，为保证往后正文表格的间距正常，需重新设置回来 ---------- %
  \setlength{\extrarowheight}{2pt}
  %%% ================================================================================ %

  \newpage %【起到将封面页与正文隔离开的正式作用】
} %【\newcommand{\makecoverpageBA}】
%% ============================================================ %

%% -------------------- 封面页-硕士论文 -------------------- %
\newcommand{\makecoverpageMA}{
  \thispagestyle{empty} %【无页眉页脚】
  \setlength{\extrarowheight}{18pt} %【设置表格行间距】

  ~\vspace{24pt}
  \begin{center}{\bf\zihao{-1}
  \headerinCOVERPAGEMA 学~位~论~文}
  \end{center}{}\vspace{24.0pt}

  \begin{center}
  {\zihao{2}\heiti\dlmuthesis@tokens@cntitle}\\
  {\zihao{3}\bfseries\dlmuthesis@tokens@entitle}
  \end{center}{}\vspace{132.0pt}

  \begin{table}[H]
    \centering
    \begin{tabular}
      {
      >{\fontsize{16pt}{16pt}\selectfont}m{2.8cm}
      >{\centering\arraybackslash\fontsize{16pt}{16pt}\selectfont} p{8.0cm}
      }
      作\hfill 者\hfill 姓\hfill 名： & \dlmuthesis@tokens@aauthor \\
      \cline{2-2}
      学\hfill 科\hfill 专\hfill 业： & \dlmuthesis@tokens@majorinCOVERPAGE \\
      \cline{2-2}
      学\hfill 号： & \dlmuthesis@tokens@sdtID \\
      \cline{2-2}
      指\hfill 导\hfill 教\hfill 师： & \dlmuthesis@tokens@mentorONE \\
      \cline{2-2}
      学\hfill 位\hfill 类\hfill 别： & \dlmuthesis@tokens@degree \\
      \cline{2-2}
      培\hfill 养\hfill 单\hfill 位： & \dlmuthesis@tokens@faculty \\
      \cline{2-2}
      答\hfill 辩\hfill 时\hfill 间： & \dlmuthesis@tokens@completiondate \\
      \cline{2-2}
    \end{tabular}
  \end{table}{}\vspace{24.0pt}

  \begin{figure}[H]
    \centering
    \includegraphics[width=0.30\textwidth]{logo/LogoMA.pdf}
  \end{figure}

  %%% ----- 由于之前将\extrarowheight的值设为9pt，为保证往后正文表格的间距正常，需重新设置回来 ----- %
  \setlength{\extrarowheight}{2pt}
  %%% ================================================== %
  \newpage
}
%% ============================================================ %

%% -------------------- 封面页-博士论文 -------------------- %
%\newcommand{\makecoverpagePhD}{}
%% ============================================================ %

% ================================================================================ %


% --------------- 封面页的导入 --------------- %
\newcommand{\makepages}{
\if@dlmuthesis@BAstem
\makecoverpageBA
\else\if@dlmuthesis@BAhumanities
\makecoverpageBA
\else\if@dlmuthesis@MA
\makecoverpageMA
\fi\fi\fi
}
% ======================================== %


% ---------- 硕士论文 - 原创性声明 & 授权使用声明 ---------- %
\newcommand{\dlmuthesis@tokens@signofstudent}{XXX} %【预定义：作者签名】
\newcommand{\dlmuthesis@tokens@signofmentor}{YYY} %【预定义：导师签名】
\newcommand{\dlmuthesis@tokens@dateforstudent}{~} %【预定义：作者签名日期】
\newcommand{\yearSTU}{XXXX}
\newcommand{\monthSTU}{XX}
\newcommand{\daySTU}{XX}
\newcommand{\dlmuthesis@tokens@dateformentor}{~} %【预定义：导师签名日期】
\newcommand{\yearMNT}{YYYY}
\newcommand{\monthMNT}{YY}
\newcommand{\dayMNT}{YY}

\newcommand{\signofstudent}[1]{
  \renewcommand{\dlmuthesis@tokens@signofstudent}{#1}
} %【正式定义：作者签名】
\newcommand{\signofmentor}[1]{
  \renewcommand{\dlmuthesis@tokens@signofmentor}{#1}
} %【正式定义：导师签名】
\newcommand{\dateforstudent}[3]{
  \renewcommand{\yearSTU}{#1}
  \renewcommand{\monthSTU}{#2}
  \renewcommand{\daySTU}{#3}
} %【正式定义：作者签名日期】
\newcommand{\dateformentor}[3]{
  \renewcommand{\yearMNT}{#1}
  \renewcommand{\monthMNT}{#2}
  \renewcommand{\dayMNT}{#3}
} %【正式定义：作者签名日期】

%% -------------------- 原创性声明 -------------------- %
\newcommand{\OriginalityStatement}{
\thispagestyle{empty} %【无页眉页脚】

~\vspace{24pt}
\begin{center}\begin{spacing}{1.5}\zihao{-2}
大连海事大学\\
研究生学位论文原创性声明
\end{spacing}\end{center}
\begin{spacing}{1.5}

本人郑重声明：所呈交的学位论文，是本人在导师的指导下进行研究工作所取得的成果。尽我所知，除文中已经注明引用内容和致谢的地方外，本论文不包含任何其他个人或集体已经发表或撰写过的研究成果。对论文所涉及的研究工作做出贡献的其他个人和集体，均已在论文中以明确的方式标明或致谢。\vspace{12.0pt}

若有不实之处，本人愿意承担相关法律责任。
\end{spacing}

\begin{table}[H]
  \centering
  \begin{tabularx}{\textwidth}{cXccccccc}
作 者 签 名 : & \hfil\dlmuthesis@tokens@signofstudent\hfil & 日期: & \yearSTU & 年 & \monthSTU & 月 & \daySTU & 日 \\
\cline{2-2}\cline{4-4}\cline{6-6}\cline{8-8}
  \end{tabularx}%
\end{table}%
}
%% ================================================== %

%% -------------------- 授权使用声明 -------------------- %
\newcommand{\AuthorizationStatement}{
\thispagestyle{empty} %【无页眉页脚】
\begin{spacing}{1.5}
\begin{center}{\zihao{3}\heiti
大连海事大学学位论文授权使用声明}
\end{center}{}\vspace{12pt}

本人完全了解并同意遵守学校有关学位论文知识产权的规定，在校攻读学位期间论文工作的知识产权属于大连海事大学，学校有权保留送交学位论文的副本，向国家有关部门或机构送交论文的复印件和电子版，允许该论文被查阅，可以将本学位论文的全部或部分内容编入有关数据库进行检索，可以采用影印、缩印、或扫描等复制手段保存和汇编本学位论文。

涉密的学位论文在解密后使用本声明。
\end{spacing}

\begin{table}[H]
  \centering
  \begin{tabularx}{\textwidth}{cXccccccc}
作~者~签~名 : & \hfil\dlmuthesis@tokens@signofstudent\hfil & 日期: & \yearSTU & 年 & \monthSTU & 月 & \daySTU & 日 \\
\cline{2-2}\cline{4-4}\cline{6-6}\cline{8-8}\\[6pt]
导~师~签~名 : & \hfil\dlmuthesis@tokens@signofmentor\hfil & 日期: & \yearMNT & 年 & \monthMNT & 月 & \dayMNT & 日 \\
\cline{2-2}\cline{4-4}\cline{6-6}\cline{8-8}
  \end{tabularx}%
\end{table}%
}
%% ================================================== %

% ============================================================ %

% ---------- 伪钩子 ---------- %
\newcommand{\pesudohookOFabstractCN}{{}} %中文摘要
\newcommand{\pesudohookOFabstractEN}{{}} %英文摘要
\newcommand{\pesudohookOFtocfigtab}{{}} %图表目录总标题
\newcommand{\pesudohookOFpremainbody}{{}} %实现正文开始前添加标题、设置样式
% ================================================== %


% --------------- 对sty,cls的命令的定制 --------------- %
\RequirePackage{etoolbox}

%% ----- 硕士论文中，原创性声明之后需换页、授权使用声明之前需要换页 ----- %
\if@dlmuthesis@MA
\apptocmd{\OriginalityStatement}{\newpage}{}{}
\pretocmd{\AuthorizationStatement}{\newpage}{}{}
\fi
%% ============================================================ %

%% ----- 硕士论文中，中英文摘要的标题需加到目录中 ----- %
\if@dlmuthesis@MA
\pretocmd{\pesudohookOFabstractCN}{
\phantomsection
\addcontentsline{toc}{section}{摘\hspace{2em}要}
}{}{\ClassError{dlmuthesis}{pesudohookOFabstractCN命令异常}{}}
\fi
\pretocmd{\pesudohookOFabstractEN}{
\if@dlmuthesis@BAstem %本科-理工科
\renewcommand\abstractname{\large ABSTRACT} %临时修改摘要名
\else\if@dlmuthesis@BAhumanities %本科-人文社科
\renewcommand\abstractname{\large ABSTRACT} %临时修改摘要名
\else\if@dlmuthesis@MA
\renewcommand\abstractname{\large Abstract} %临时修改摘要名
\phantomsection
\addcontentsline{toc}{section}{Abstract}
\fi\fi\fi
}{}{\ClassError{dlmuthesis}{pesudohookOFabstractEN命令异常}{}}
%% ============================================================ %

%% -------------------- 不同学位模式下，设置摘要到目录的样式的时机不同 -------------------- %
\if@dlmuthesis@BAstem %本科-理工科
\apptocmd{\makepages}{
\pagestyle{plain} %从摘要到目录，设置为无页眉、有页脚的模式
\pagenumbering{Roman} %《手册》要求：从摘要到目录，设置罗马数字页码
\renewcommand{\baselinestretch}{1.25}
}{\typeout{succeeds: edit the style of page using package etoolbox}}{\ClassError{dlmuthesis}{fails: edit the style of page using package etoolbox}{}}
\else\if@dlmuthesis@BAhumanities %本科-人文社科
\apptocmd{\makepages}{
\pagestyle{plain} %从摘要到目录，设置为无页眉、有页脚的模式
\pagenumbering{Roman} %《手册》要求：从摘要到目录，设置罗马数字页码
\renewcommand{\baselinestretch}{1.25}
}{\typeout{succeeds: edit the style of page using package etoolbox}}{\ClassError{dlmuthesis}{fails: edit the style of page using package etoolbox}{}}
\else\if@dlmuthesis@MA % 硕士
\apptocmd{\OriginalityStatement}{
\pagestyle{plain} %从摘要到目录，设置为无页眉、有页脚的模式
\pagenumbering{Roman} %《规范》要求：从摘要到目录，设置罗马数字页码
\renewcommand{\baselinestretch}{1.25}
}{\typeout{succeeds: edit the style of page using package etoolbox}}{\ClassError{dlmuthesis}{fails: edit the style of page using package etoolbox}{}}
\fi\fi\fi
%% ================================================================================ %

%% --------------- 不同学位模式下，设置正文样式的时机不同 --------------- %
\if@dlmuthesis@BAstem %本科-理工科
\pretocmd{\pesudohookOFpremainbody}{
\cntitleinMAINBODY
\pagestyle{fancy} %从第一章到致谢，设置为有页眉、有页脚的模式
\pagenumbering{arabic} %《手册》要求：从正文开始设为阿拉伯数字页码，并且重新从1开始计数
}{}{\ClassError{dlmuthesis}{tableofcontent命令执行异常}{}}
\else\if@dlmuthesis@BAhumanities %本科-人文社科
\pretocmd{\pesudohookOFpremainbody}{
\cntitleinMAINBODY
\pagestyle{fancy} %从第一章到致谢，设置为有页眉、有页脚的模式
\pagenumbering{arabic} %《手册》要求：从正文开始设为阿拉伯数字页码，并且重新从1开始计数
}{}{\ClassError{dlmuthesis}{tableofcontent命令执行异常}{}}
\else\if@dlmuthesis@MA % 硕士
\apptocmd{\OriginalityStatement}{
\pagestyle{fancy} %从第一章到致谢，设置为有页眉、有页脚的模式
}{}{\ClassError{dlmuthesis}{OriginalityStatement命令执行异常}{}}
\pretocmd{\pesudohookOFpremainbody}{
\pagenumbering{arabic} %《规范》要求：从正文开始设为阿拉伯数字页码，并且重新从1开始计数
}{}{\ClassError{dlmuthesis}{pesudohook命令执行异常}{}}
\fi\fi\fi
%% ======================================================= %

%% --------------- 参考文献列表前后的样式设置 --------------- %
\BeforeBeginEnvironment{thebibliography}{
\phantomsection
\addcontentsline{toc}{section}{参~ 考~ 文~ 献} %不能放在导言区
\vspace*{0pt}
}{\typeout{succeeds: pre-style of env thebibliography}}{\typeout{fails: pre-style of env thebibliography}}

\AfterEndEnvironment{thebibliography}{
\clearpage\vspace*{0pt}
}{\typeout{succeeds: aft-style of env thebibliography}}{\typeout{fails: aft-style of env thebibliography}}
%% ======================================================= %

%% --------------- 每个附录章节之前的样式设置 --------------- %
\pretocmd{\appendixsec}{
\newpage
}{\typeout{成功：附录环境下在下一个章节前前换页}}{\PackageError{失败：附录环境下在下一个章节前前换页}}
%% ======================================================= %

% ======================================== %


% --------------- 超链接与交叉引用 --------------- %
\RequirePackage[hidelinks, bookmarksnumbered=true, breaklinks=true, bookmarksopen=true]{hyperref}
% ======================================== %
