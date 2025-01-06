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
\ProvidesClass{dlmuthesis}[2025-01-15 v3.0.0 Unofficial Thesis LaTeX Template for DLMU]
% ======================================== %


% --------------- 编译器约束 --------------- %
\RequirePackage{ifthen}
\RequirePackage{iftex}
\ifxetex\else
\ClassError{dlmuthesis}{You must use the `xelatex' driver\MessageBreak Please choose `xelatex'}{%
Just choose `xelatex', no `pdflatex' or `latex' and so on.}
\fi
% ======================================== %


% ---------- 文档类声明命令的可选参数初始化 ---------- %
\newif\if@dlmuthesis@BAstem %【[本科-理工科]模式，初始值为真，下同】
\newif\if@dlmuthesis@BAhumanities %【[本科-人文社科]模式】
\newif\if@dlmuthesis@MA %【[硕士]模式】
\newif\if@dlmuthesis@MAlaw %【[硕士-法学/法律]模式】
\newif\if@dlmuthesis@MAmarxism %【[硕士-马克思主义理论]模式】
\newif\if@dlmuthesis@DOC %【[博士]模式】
\newif\if@dlmuthesis@DOClaw %【博士-法学/法律】
\newif\if@dlmuthesis@DOCmarxism %【[博士-马克思主义理论]模式】

\newif\if@dlmuthesis@printed %【打印模式】

\newif\if@dlmuthesis@windows %【平台为[Windows]】
\newif\if@dlmuthesis@macos %【平台为[macOS]】
\newif\if@dlmuthesis@ubuntu %【平台为[Ubuntu]】
\newif\if@dlmuthesis@web %【平台为[在线编辑器]】
\newif\if@dlmuthesis@customization %【自定义平台】

\newcounter{OptionOfDegree} %【用于计算关于学位类别的可选参数用了多少个】
\setcounter{OptionOfDegree}{0}
\DeclareOption{BAstem}{
\@dlmuthesis@BAstemtrue
\addtocounter{OptionOfDegree}{1}
}
\DeclareOption{BAhumanities}{
\@dlmuthesis@BAhumanitiestrue
\addtocounter{OptionOfDegree}{1}
}
\DeclareOption{MA}{
\@dlmuthesis@MAtrue
\addtocounter{OptionOfDegree}{1}
}
\DeclareOption{MAlaw}{
\@dlmuthesis@MAlawtrue
\addtocounter{OptionOfDegree}{1}
}
\DeclareOption{MAmarxism}{
\@dlmuthesis@MAmarxismtrue
\addtocounter{OptionOfDegree}{1}
}
\DeclareOption{DOC}{
\@dlmuthesis@DOCtrue
\addtocounter{OptionOfDegree}{1}
}
\DeclareOption{DOClaw}{
\@dlmuthesis@DOClawtrue
\addtocounter{OptionOfDegree}{1}
}
\DeclareOption{DOCmarxism}{
\@dlmuthesis@DOCmarxismtrue
\addtocounter{OptionOfDegree}{1}
}

\DeclareOption{printed}{\@dlmuthesis@printedtrue}

\newcounter{OptionOfPlatform} %【用于计算关于平台类型的可选参数用了多少个】
\setcounter{OptionOfPlatform}{0}
\DeclareOption{windows}{
  \@dlmuthesis@windowstrue
  \addtocounter{OptionOfPlatform}{1}
}
\DeclareOption{macos}{
  \@dlmuthesis@macostrue
  \addtocounter{OptionOfPlatform}{1}
}
\DeclareOption{ubuntu}{
  \@dlmuthesis@ubuntutrue
  \addtocounter{OptionOfPlatform}{1}
}
\DeclareOption{web}{
  \@dlmuthesis@webtrue
  \addtocounter{OptionOfPlatform}{1}
}
\DeclareOption{customization}{
  \@dlmuthesis@customizationtrue
  \addtocounter{OptionOfPlatform}{1}
}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass[a4paper]{article}
% ======================================== %


% ---------- 添加且仅一个学位类别参数 ---------- %
\ifthenelse{\value{OptionOfDegree}=0}{
  \ClassError{dlmuthesis}{No degree-types in command '\protect\documentclass\space'.}{
    Choose and complete one degree-type in command '\protect\documentclass\space'.
  }
}{}
\ifthenelse{\value{OptionOfDegree}>1}{
  \ClassError{dlmuthesis}{Too many degree-types in command '\protect\documentclass\space'.}{
    Remain only one degree-type in command '\protect\documentclass\space'.
  }
}{}
% ============================================= %


% ---------- 添加且仅一个平台类别参数 ---------- %
\ifthenelse{\value{OptionOfPlatform}=0}{
  \ClassError{dlmuthesis}{No platform-types in command '\protect\documentclass\space'.}{
    Choose and complete one platform-type in command '\protect\documentclass\space'.
  }
}{}
\ifthenelse{\value{OptionOfPlatform}>1}{
  \ClassError{dlmuthesis}{Too many platform-types in command '\protect\documentclass\space'.}{
    Remain only one platform-type in command '\protect\documentclass\space'.
  }
}{}
% ============================================= %


% --------------- ctex宏集设置 --------------- %
\if@dlmuthesis@DOClaw %【博士-法学/法律】
  \PassOptionsToPackage{sub4section}{ctex}
\else
  \PassOptionsToPackage{sub3section}{ctex}
\fi
\RequirePackage[UTF8, heading=true, zihao = -4]{ctex}
\RequirePackage{totcount}

\if@dlmuthesis@BAstem %【本科-理工科】
\newcommand{\ValOfBibname}{参~ 考~ 文~ 献}
\ctexset{
  contentsname = \hfill{\zihao{3}目\hspace{2em}录}\hfill,
  bibname = \hfill{\zihao{3}\ValOfBibname}\hfill,
  section = {
    format = {\zihao{3}\bfseries},
    name = {第,章},
    aftername={~},
    beforeskip=20.0bp,
    afterskip=10.0bp,
  },
  subsection = {
    format={\zihao{4}\bfseries},
    aftername={~},
    beforeskip=0.5ex,
    afterskip=0.5ex,
  },
  subsubsection = {
    format={\zihao{-4}\bfseries},
    aftername={~},
	  beforeskip=0.5ex,
    afterskip=0.5ex,
  },
  paragraph = {
    format = {\zihao{-4}\bfseries},
    aftername={~},
    beforeskip={0.5ex plus 1ex minus 0.2ex},
    afterskip={0.5ex plus 1ex minus 0.2ex},
  }
}
\else\if@dlmuthesis@BAhumanities %【本科-人文社科】
\newcommand{\ValOfBibname}{参~ 考~ 文~ 献}
\renewcommand\thesubsection{\arabic{subsection}} %重设二级标题计数器格式
\renewcommand\thesubsubsection{\arabic{subsubsection}} %重设三级标题计数器格式
\renewcommand\theparagraph{\arabic{paragraph}} %重设四级标题计数器格式
\ctexset{
  contentsname = \hfill{\zihao{3}\hspace{-2em}目\hspace{2em}录}\hfill,
  bibname = \hfill{\zihao{3}\ValOfBibname}\hfill,
  section = {
    format = {\zihao{3}\bfseries},
    name = {,、},
    number = {\chinese{section}},
    aftername = {},
    indent = 2em,
    beforeskip=20.0bp,
    afterskip=10.0bp,
  },
  subsection = {
    format = {\zihao{4}\bfseries},
    name = {（,）},
    number = {\chinese{subsection}},
    aftername = {},
    indent = 2em,
    beforeskip=0.5ex,
    afterskip=0.5ex,
  },
  subsubsection = {
    format = {\zihao{-4}\bfseries},
    name = {,.~},
    aftername = {},
    indent = 2em,
    beforeskip=0.5ex,
    afterskip=0.5ex,
  },
  paragraph={
    format = {\zihao{-4}\bfseries},
    name = {（,）},
    aftername = {},
    indent = 2em,
    beforeskip={0.5ex plus 1ex minus 0.2ex},
    afterskip={0.5ex plus 1ex minus 0.2ex},
  }
}
\else\if@dlmuthesis@MA %【硕士】
\newcommand{\ValOfBibname}{参~ 考~ 文~ 献}
\ctexset{
  contentsname = \hfill{\heiti\zihao{-3}目\hspace{2em}录}\hfill,
  listfigurename = \hfill{\songti\zihao{-3}图目录}\hfill,
  listtablename = \hfill{\songti\zihao{-3}表目录}\hfill,
  bibname = \hfill{\zihao{-3}\ValOfBibname}\hfill,
  section = {
    format = {\zihao{-3}\heiti},
    name = {,},
    aftername={\hspace{1em}},
    beforeskip=0pt,
    afterskip=1ex,
  },
  subsection = {
    format = {\zihao{4}\heiti},
    aftername={\hspace{1em}},
    beforeskip=0.5ex,
    afterskip=0.5ex,
  },
  subsubsection = {
    format = {\zihao{-4}\heiti},
    aftername={\hspace{1em}},
    beforeskip=0.5ex,
    afterskip=0.5ex,
  },
  paragraph = {
    format = {\zihao{-4}\heiti},
    aftername={\hspace{1em}},
    beforeskip={0.5ex plus 1ex minus 0.2ex},
    afterskip={0.5ex plus 0.2ex},
  },
  appendix={
    name = {附录,},
  }
}
\else\if@dlmuthesis@MAlaw %【硕士-法学/法律】
\newcommand{\ValOfBibname}{参考文献}
\renewcommand\thesubsection{\arabic{subsection}} %重设二级标题计数器格式
\renewcommand\thesubsubsection{\arabic{subsubsection}} %重设三级标题计数器格式
\renewcommand\theparagraph{\arabic{paragraph}} %重设四级标题计数器格式
\ctexset{
  contentsname = \hfill{\heiti\zihao{-3}\hspace{-2em}目\hspace{2em}录}\hfill,
  listfigurename = \hfill{\songti\zihao{-3}\hspace{-2em}图目录}\hfill,
  listtablename = \hfill{\songti\zihao{-3}\hspace{-2em}表目录}\hfill,
  bibname = \hfill{\zihao{-3}\ValOfBibname}\hfill,
  section = {
    format = {\zihao{-4}\heiti},
    name = {,、},
    number = \chinese{section},
    aftername = {},
    indent = 2em,
    aftername = {},
    beforeskip=0.5ex,
    afterskip=0.5ex,
  },
  subsection = {
    format = {\zihao{-4}\heiti},
    name = {（,）},
    number = \chinese{subsection},
    aftername = {},
    indent = 2em,
    beforeskip=0.5ex,
    afterskip=0.5ex,
  },
  subsubsection = {
    format = {\zihao{-4}\heiti},
    name = {,.~},
    aftername = {},
    indent = 2em,
    beforeskip=0.5ex,
    afterskip=0.5ex,
  },
  paragraph = {
    format = {\zihao{-4}\heiti},
    name = {（,）},
    aftername = {},
    indent = 2em,
    beforeskip={0.5ex plus 1ex minus 0.2ex},
    afterskip={0.5ex plus 0.2ex},
  },
  appendix={
    name = {附录,},
  }
}
\else\if@dlmuthesis@MAmarxism %【硕士-马克思主义理论】
\newcommand{\ValOfBibname}{参~ 考~ 文~ 献}
\renewcommand\theparagraph{\arabic{paragraph}} %重设四级标题计数器格式
\ctexset{
  contentsname = \hfill{\heiti\zihao{-3}目\hspace{2em}录}\hfill,
  listfigurename = \hfill{\songti\zihao{-3}图目录}\hfill,
  listtablename = \hfill{\songti\zihao{-3}表目录}\hfill,
  bibname = \hfill{\zihao{-3}\ValOfBibname}\hfill,
  section = {
    format = {\zihao{-3}\heiti},
    name = {第,章},
    beforeskip=1ex,
    afterskip=1ex,
  },
  subsection = {
    format = {\zihao{4}\heiti},
    beforeskip=0.5ex,
    afterskip=0.5ex,
  },
  subsubsection = {
    format = {\zihao{-4}\heiti},
    beforeskip=0.5em,
    afterskip=0.5em,
  },
  paragraph = {
    format = {\zihao{-4}\heiti},
    name = {（,）},
    aftername = {},
    indent = 2em,
    beforeskip={0.5ex plus 1ex minus 0.2ex},
    afterskip={0.5ex plus 1ex minus 0.2ex},
  },
  appendix={
    name = {附录,},
  }
}
\else\if@dlmuthesis@DOC %【博士】
\newcommand{\ValOfBibname}{参~ 考~ 文~ 献}
\ctexset{
  contentsname = \hfill{\heiti\zihao{-3}目\hspace{2em}录}\hfill,
  listfigurename = \hfill{\heiti\zihao{-3}图目录}\hfill,
  listtablename = \hfill{\heiti\zihao{-3}表目录}\hfill,
  bibname = \hfill{\zihao{-3}\ValOfBibname}\hfill,
  section = {
    format = {\zihao{-3}\heiti},
    name = {,},
    aftername = {\hspace{1em}},
    beforeskip=1ex,
    afterskip=1ex,
  },
  subsection = {
    format = {\zihao{4}\heiti},
    aftername = {\hspace{1em}},
    beforeskip=0.5ex,
    afterskip=0.5ex,
  },
  subsubsection = {
    format = {\zihao{-4}\heiti},
    beforeskip=0.5ex,
    afterskip=0.5ex,
  },
  paragraph = {
    format = {\zihao{-4}\heiti},
    aftername = {\hspace{1em}},
    beforeskip={0.5ex plus 1ex minus 0.2ex},
    afterskip={0.5ex plus 1ex minus 0.2ex},
  },
  appendix={
    name = {附录,},
  }
}
\else\if@dlmuthesis@DOClaw %【博士-法学/法律】
\newcommand{\ValOfBibname}{参考文献}
\renewcommand\thesubsection{\arabic{subsection}} %重设二级标题计数器格式
\renewcommand\thesubsubsection{\arabic{subsubsection}} %重设三级标题计数器格式
\renewcommand\theparagraph{\arabic{paragraph}} %重设四级标题计数器格式
\renewcommand\thesubparagraph{\arabic{subparagraph}} %重设五级标题计数器格式
\ctexset{
  contentsname = \hfill{\heiti\zihao{-3}目\hspace{2em}录}\hfill,
  listfigurename = \hfill{\songti\zihao{-3}图目录}\hfill,
  listtablename = \hfill{\songti\zihao{-3}表目录}\hfill,
  bibname = \hfill{\heiti\zihao{-3}\ValOfBibname}\hfill,
  section = {
    format = {\zihao{-3}\heiti\centering},
    name = {第,章},
    number = {\chinese{section}},
    aftername = {\hspace{1em}},
    beforeskip=11bp,
    afterskip=11bp,
  },
  subsection = {
    format = {\zihao{4}\heiti\centering},
    name = {第,节},
    number = {\chinese{subsection}},
    aftername = {\hspace{1em}},
    beforeskip=0.5ex,
    afterskip=0.5ex,
  },
  subsubsection = {
    format = {\zihao{-4}\heiti},
    name = {,、},
    number = \chinese{subsection},
    aftername = {},
    indent = 2em,
    beforeskip=0.5ex,
    afterskip=0.5ex,
  },
  paragraph = {
    format = {\zihao{-4}\heiti},
    name = {（,）},
    number = {\chinese{paragraph}},
    aftername = {},
    indent = 2em,
    beforeskip=0.5ex,
    afterskip=0.5ex,
  },
  subparagraph = {
    format = {\zihao{-4}\heiti},
    name = {,.~},
    aftername = {},
    indent = 2em,
    beforeskip=0.5em,
    afterskip=0.5em,
  },
  appendix={
    name = {附录,},
  }
}
\else\if@dlmuthesis@DOCmarxism %【博士-马克思主义理论】
\newcommand{\ValOfBibname}{参~ 考~ 文~ 献}
\renewcommand\theparagraph{\arabic{paragraph}} %重设四级标题计数器格式
\ctexset{
  abstractname = {\zihao{-3}\heiti 摘\hspace{2em}要},
  contentsname = \hfill{\heiti\zihao{-3}目\hspace{2em}录}\hfill,
  listfigurename = \hfill{\songti\zihao{-3}图目录}\hfill,
  listtablename = \hfill{\songti\zihao{-3}表目录}\hfill,
  bibname = \hfill{\zihao{-3}\ValOfBibname}\hfill,
  section = {
    format = {\zihao{-3}\heiti},
    name = {第,章},
    beforeskip=1ex,
    afterskip=1ex,
  },
  subsection = {
    format = {\zihao{4}\heiti},
    beforeskip=0.5ex,
    afterskip=0.5ex,
  },
  subsubsection = {
    format = {\zihao{-4}\heiti},
    beforeskip=0.5em,
    afterskip=0.5em,
  },
  paragraph = {
    format = {\zihao{-4}\heiti},
    name = {（,）},
    aftername = {},
    indent = 2em,
    beforeskip={0.5ex plus 1ex minus 0.2ex},
    afterskip={0.5ex plus 1ex minus 0.2ex},
  },
  appendix={
    name = {附录,},
  }
}
\fi\fi\fi\fi\fi\fi\fi\fi
% ======================================== %


% ------------------------- 关于论文信息的全局变量导入 ------------------------- %
\RequirePackage{etoolbox}
\RequirePackage{xpatch}
\RequirePackage{xparse}
\RequirePackage[absolute,overlay]{textpos} %【提供基于坐标的文本框环境，其中overlay为绝对坐标】
\RequirePackage{array} %【与表格相关】

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

%%% ---------- 硕博论文专用 ---------- %
\newcommand{\dlmuthesis@tokens@headermajoir}{学\hfill 科\hfill 专\hfill 业} %【封面页中“学科专业”向“工程领域”的转换】
\newcommand{\dlmuthesis@tokens@degree}{~} %【学位类别】
%%% ======================================== %

%%% ---------- 硕士论文专用 ---------- %
%%% ======================================== %

%%% ---------- 博士论文专用 ---------- %
%%% ======================================== %
%% ================================================== %

%% -------------------- 正式变量定义 -------------------- %
\newcounter{InputLineCn} %定义计数器：记录中文题目的预期行数
\newcounter{InputLineEn} %定义计数器：记录英文题目的预期行数

\NewDocumentCommand{\cntitle}{O{1} m}{
  \setcounter{InputLineCn}{#1} %替换成中文题目的预期行数（默认值为1）
  \renewcommand{\dlmuthesis@tokens@cntitle}{#2}
  \newcommand{\cntitleinMAINBODY}{\vspace*{1ex}{}\begin{center}{\zihao{3}\bfseries #2}\end{center}{}\vspace*{1ex}{}} %【正文第1页顶部的中文标题】
} %【中文题目】
\NewDocumentCommand{\entitle}{O{1} m}{
  \setcounter{InputLineEn}{#1} %英文题目的预期行数（默认值为1）
  \renewcommand{\dlmuthesis@tokens@entitle}{#2}
} %【英文题目】
\newcommand{\aauthor}[1]{\renewcommand{\dlmuthesis@tokens@aauthor}{#1}} %【作者姓名】
\newcommand{\sdtID}[1]{\renewcommand{\dlmuthesis@tokens@sdtID}{#1}} %【学号】
\NewDocumentCommand{\majorinCOVERPAGE}{o m}{
  \IfNoValueTF{#1}{}{
    \ifthenelse{\equal{#1}{engineering}}{
      \renewcommand{\dlmuthesis@tokens@headermajoir}{工\hfill 程\hfill 领\hfill 域}
      }{
        \ClassError{Invalid option in command '\protect\majorinCOVERPAGE\space'}{
          Only 'engineering' is valid}
      }
    }
  \renewcommand{\dlmuthesis@tokens@majorinCOVERPAGE}{#2}
} %【专业】
\newcommand{\mentorONE}[1]{\renewcommand{\dlmuthesis@tokens@mentorONE}{#1}} %【指导教师（职称）】
\newcommand{\faculty}[1]{\renewcommand{\dlmuthesis@tokens@faculty}{#1}} %【学院】
\newcommand{\completiondate}[2]{
  \renewcommand{\dlmuthesis@tokens@completiondate}{{#1}~年~{#2}~月} %【完成日期（年、月），coverpage专用】
}

%%% ---------- 本科论文专用 ---------- %
\newcommand{\mentorTWO}[1]{\renewcommand{\dlmuthesis@tokens@mentorTWO}{#1}} %【第二指导教师（职称）】
\newcounter{CounterOfAddClineCn} %定义计数器：记录中文题目的循环轮次
\newcounter{CounterOfAddClineEn} %定义计数器：记录英文题目的循环轮次
\setcounter{CounterOfAddClineCn}{0} %设置[记录循环轮次的计数器(中)]的初始值
\setcounter{CounterOfAddClineEn}{0} %设置[记录循环轮次的计数器(英)]的初始值
%%% ======================================== %

%%% ---------- 硕博论文专用 ---------- %
%%%% 论文封面页的开头
\if@dlmuthesis@MA %【硕士】
  \newcommand{\headerinCOVERPAGE}{硕~士~}
\else\if@dlmuthesis@MAlaw %【硕士-法学/法律】
  \newcommand{\headerinCOVERPAGE}{硕~士~}
\else\if@dlmuthesis@MAmarxism %【硕士-马克思主义理论】
  \newcommand{\headerinCOVERPAGE}{硕~士~}
\else\if@dlmuthesis@DOC %【博士】
  \newcommand{\headerinCOVERPAGE}{博~士~}
\else\if@dlmuthesis@DOClaw %【博士-法学/法律】
  \newcommand{\headerinCOVERPAGE}{博~士~}
\else\if@dlmuthesis@DOCmarxism %【博士-马克思主义理论】
  \newcommand{\headerinCOVERPAGE}{博~士~}
\fi\fi\fi\fi\fi\fi
%%%% 论文页眉的开头
\if@dlmuthesis@MA %【硕士】
  \newcommand{\headerinHEADER}{硕士}
\else\if@dlmuthesis@MAlaw %【硕士-法学/法律】
  \newcommand{\headerinHEADER}{硕士}
\else\if@dlmuthesis@MAmarxism %【硕士-马克思主义理论】
  \newcommand{\headerinHEADER}{硕士}
\else\if@dlmuthesis@DOC %【博士】
  \newcommand{\headerinHEADER}{博士}
\else\if@dlmuthesis@DOClaw %【博士-法学/法律】
  \newcommand{\headerinHEADER}{博士}
\else\if@dlmuthesis@DOCmarxism %【博士-马克思主义理论】
  \newcommand{\headerinHEADER}{博士}
\fi\fi\fi\fi\fi\fi
%%%% 学位类别命令\degree
\newcommand{\degree}[2]{
  \renewcommand{\dlmuthesis@tokens@degree}{#1}
  \if@dlmuthesis@MA %【硕士】
    \ifthenelse{\equal{#2}{academic}}{}{
      \ifthenelse{\equal{#2}{professional}}{
        \renewcommand{\headerinCOVERPAGE}{专~业~学~位~硕~士~}
        \renewcommand{\headerinHEADER}{专业学位硕士}
      }{}
    }
  \else\if@dlmuthesis@MAlaw %【硕士-法学/法律】
    \ifthenelse{\equal{#2}{academic}}{}{
      \ifthenelse{\equal{#2}{professional}}{
        \renewcommand{\headerinCOVERPAGE}{专~业~学~位~硕~士~}
        \renewcommand{\headerinHEADER}{专业学位硕士}
      }{}
    }
  \else\if@dlmuthesis@MAmarxism %【硕士-马克思主义理论】
    \ifthenelse{\equal{#2}{academic}}{}{
      \ifthenelse{\equal{#2}{professional}}{
        \renewcommand{\headerinCOVERPAGE}{专~业~学~位~硕~士~}
        \renewcommand{\headerinHEADER}{专业学位硕士}
      }{}
    }
  \else\if@dlmuthesis@DOC %【博士】
    \ifthenelse{\equal{#2}{academic}}{}{
      \ifthenelse{\equal{#2}{engineering}}{
        \renewcommand{\headerinCOVERPAGE}{工~程~博~士~}
        \renewcommand{\headerinHEADER}{工程博士}
      }{}
    }
  %【博士-法学/法律】：no actions
  %【博士-马克思主义理论】：no actions
  \fi\fi\fi\fi
} % \degree
%%% ======================================== %

%%% ---------- 硕士论文专用 ---------- %
%%% ======================================== %

%%% ---------- 博士论文专用 ---------- %
%%% ======================================== %
%% ============================================================ %
% ================================================================================ %


% --------------- 限定标题页三要素为空 --------------- %
\title{}
\author{}
\date{}
% ======================================== %


% --------------- 页面样式 --------------- %
\RequirePackage[twoside]{fancyhdr} %定制页眉页脚
\renewcommand{\sectionmark}[1]{\markboth{#1}{}} %打印模式相关
\RequirePackage{geometry} %定制页面

\if@dlmuthesis@BAstem %【本科-理工科】
  \geometry{bindingoffset=5mm, top=2.5cm, bottom=2.5cm, left=3.0cm, right=2.5cm, headsep=0.5cm}
\else\if@dlmuthesis@BAhumanities %【本科-人文社科】
  \geometry{bindingoffset=5mm, top=2.5cm, bottom=2.5cm, left=3.0cm, right=2.5cm, headsep=0.5cm}
\else\if@dlmuthesis@MA %【硕士】
  \geometry{top=3.5cm, bottom=2.5cm, left=2.5cm, right=2.5cm, headsep=24.0pt, headheight=2.5cm}
\else\if@dlmuthesis@MAlaw %【硕士-法学/法律】
  \geometry{top=3.0cm, bottom=3.0cm, left=3.0cm, right=3.0cm, headsep=24.0pt, headheight=2.5cm}
\else\if@dlmuthesis@MAmarxism %【硕士-马克思主义理论】
  \geometry{top=3.5cm, bottom=2.5cm, left=2.5cm, right=2.5cm, headsep=24.0pt, headheight=2.5cm}
  \else\if@dlmuthesis@DOC %【博士】
  \geometry{top=3.5cm, bottom=2.5cm, left=2.5cm, right=2.5cm, headsep=24.0pt, headheight=2.5cm}
\else\if@dlmuthesis@DOClaw %【博士-法学/法律】
  \geometry{top=3.0cm, bottom=3.0cm, left=3.0cm, right=3.0cm, headsep=24.0pt, headheight=2.5cm}
\else\if@dlmuthesis@DOCmarxism %【博士-马克思主义理论】
  \geometry{top=3.5cm, bottom=2.5cm, left=2.5cm, right=2.5cm, headsep=24.0pt, headheight=2.5cm}
\fi\fi\fi\fi\fi\fi\fi\fi

\lhead{} %在'heading=true'下，默认左页眉为当前二级标题名称，因此要赋值为空
\rhead{} %'heading=true'下，默认右页眉为当前一级标题名称，因此要赋值为空
\renewcommand{\headrulewidth}{0.4bp}
\renewcommand{\footrulewidth}{0pt}
% ======================================== %


% --------------- 字体 --------------- %
\RequirePackage{fontspec}
%% ----- 中英字体设置 ----- %
% 搜索顺序：先在本地字库找，再去模板文件夹中找；否则指定字体不存在
\if@dlmuthesis@windows
  \IfFontExistsTF{SimSun}{
    \setCJKmainfont{SimSun}[AutoFakeBold=3.0, AutoFakeSlant=0.3]
  }{
    \IfFontExistsTF{./misc/SimSun.ttc}{
      \setCJKmainfont{SimSun}[Path={./misc/}, AutoFakeBold=3.0, AutoFakeSlant=0.3]
    }{
      \ClassError{dlmuthesis}{The ZHONGYI fontset does not exists}{}
    }
  }
  \IfFontExistsTF{Times New Roman}{
    \setmainfont{Times New Roman}
  }{
    \IfFontExistsTF{./misc/times.ttf}{
      \setmainfont{times}[
        Path={./misc/},
        Extension = .ttf,
        UprightFont = times,
        BoldFont = timesbd,
        ItalicFont = timesi,
        BoldItalicFont = timesbi,
      ]
    }{
      \ClassError{dlmuthesis}{The Times New Roman font does not exists}{}
    }
  }
\else\if@dlmuthesis@macos
  \IfFontExistsTF{STSong}{
    \setCJKmainfont{STSong}[AutoFakeBold=3.0, AutoFakeSlant=0.3]
  }{
    \IfFontExistsTF{./misc/STSong.ttf}{
      \setCJKmainfont{STSong}[Path={./misc/}, AutoFakeBold=3.0, AutoFakeSlant=0.3]
    }{
      \ClassError{dlmuthesis}{The HUAWEN fontset does not exists}{}
    }
    %
  }
  \IfFontExistsTF{Times New Roman}{
    \setmainfont{Times New Roman}
  }{
    \IfFontExistsTF{./misc/times.ttf}{
      \setmainfont{times}[
        Path={./misc/},
        Extension = .ttf,
        UprightFont = times,
        BoldFont = timesbd,
        ItalicFont = timesi,
        BoldItalicFont = timesbi,
      ]
    }{
      \ClassError{dlmuthesis}{The Times New Roman font does not exists}{}
    }
  }
\else\if@dlmuthesis@ubuntu
  \IfFontExistsTF{FandolSong}{
    \setCJKmainfont{FandolSong}[AutoFakeBold=3.0, AutoFakeSlant=0.3]
  }{
    \ClassError{dlmuthesis}{The Fandol fontset does not exists}{}
  }
  \IfFontExistsTF{Times New Roman}{
    \setmainfont{Times New Roman}
  }{
    \IfFontExistsTF{./misc/times.ttf}{
      \setmainfont{times}[
        Path={./misc/},
        Extension = .ttf,
        UprightFont = times,
        BoldFont = timesbd,
        ItalicFont = timesi,
        BoldItalicFont = timesbi,
      ]
    }{
      \setmainfont{TeX Gyre Termes} %发行版内置字体，不必搜索
    }
  }
\else\if@dlmuthesis@web
  \IfFontExistsTF{FandolSong}{
    \setCJKmainfont{FandolSong}[AutoFakeBold=3.0, AutoFakeSlant=0.3]
  }{
    \ClassError{dlmuthesis}{The Fandol fontset does not exists}{}
  }
  \IfFontExistsTF{Times New Roman}{
    \setmainfont{Times New Roman}
  }{
    \IfFontExistsTF{./misc/times.ttf}{
      \setmainfont{times}[
        Path={./misc/},
        Extension = .ttf,
        UprightFont = times,
        BoldFont = timesbd,
        ItalicFont = timesi,
        BoldItalicFont = timesbi,
      ]
    }{
      \setmainfont{TeX Gyre Termes} %发行版内置字体，不必搜索
    }
  }
\else\if@dlmuthesis@customization
  \typeout{This is customization mode. All fonts used are customized.}
\fi\fi\fi\fi\fi
%% ============================== %
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
{\addvspace{2bp}\filright}
{\contentspush{\thecontentslabel}~~}
{}
{\titlerule*[8bp]{.}\contentspage}
%% =================================== %
%% ---------- 三级标题样式 ---------- %
\if@dlmuthesis@BAhumanities %【本科-人文社科】
  \titlecontents{subsubsection}
    [5em]
    {}
    {\contentslabel{1em}}
    {\hspace*{5bp}}
    {\titlerule*[8bp]{.}\contentspage}
\else\if@dlmuthesis@MAlaw %【硕士-法学/法律】
  \titlecontents{subsubsection}
    [5em]
    {}
    {\contentslabel{1em}}
    {\hspace*{5bp}}
    {\titlerule*[8bp]{.}\contentspage}
\fi\fi
%% =================================== %
%% ----- 硕博论文中，目录到图(/表)目录之间需翻页+添加大标题 ----- %
\newcounter{bigtitle}
\setcounter{bigtitle}{0}

\AddToHook{cmd/listoffigures/before}[AddBigTitle]{
  \ifnum\value{bigtitle}=0
    \if@dlmuthesis@BAstem %【本科-理工科】
      \typeout{BAstem: no list of figures or tables after toc}
    \else\if@dlmuthesis@BAhumanities %【本科-人文社科】
      \typeout{BAhumanities: no list of figures or tables after toc}
    \else\if@dlmuthesis@DOC %【博士】%额外需要修改页眉样式
      \clearpage
      \begin{center}\heiti\zihao{-3}图表目录\end{center}
      % 同时，奇数页为“图表目录”，偶数页为论文中文题目：
      \fancyhead[COH]{\zihao{5}图表目录}
      \fancyhead[CEH]{\zihao{5}\dlmuthesis@tokens@cntitle}
    \else
      \clearpage
      \begin{center}\heiti\zihao{-3}图表目录\end{center}
    \fi\fi\fi
    \stepcounter{bigtitle}
  \fi % bigtitle 数值判断
}
\AddToHook{cmd/listoftables/before}[AddBigTitle]{
  \ifnum\value{bigtitle}=0
    \if@dlmuthesis@BAstem %【本科-理工科】
      \typeout{BAstem: no list of figures or tables after toc}
    \else\if@dlmuthesis@BAhumanities %【本科-人文社科】
      \typeout{BAhumanities: no list of figures or tables after toc}
    \else\if@dlmuthesis@DOC %【博士】%额外需要修改页眉样式
      \clearpage
      \begin{center}\heiti\zihao{-3}图表目录\end{center}
      % 同时，奇数页为“图表目录”，偶数页为论文中文题目：
      \fancyhead[COH]{\zihao{5}图表目录}
      \fancyhead[CEH]{\zihao{5}\dlmuthesis@tokens@cntitle}
    \else
      \clearpage
      \begin{center}\heiti\zihao{-3}图表目录\end{center}
    \fi\fi\fi
    \stepcounter{bigtitle}
  \else
    \if@dlmuthesis@BAstem %【本科-理工科】
      \typeout{BAstem: no list of figures or tables after toc}
    \else\if@dlmuthesis@BAhumanities %【本科-人文社科】
      \typeout{BAhumanities: no list of figures or tables after toc}
    \else
      ~\vspace{36pt} %图目录与表目录之间需要间隔些距离
    \fi\fi
  \fi % bigtitle 数值判断
}
%% ============================================================= %
%% ---------- 图目录样式 ---------- %
\titlecontents{figure}
  [0pt] %左边缩进为0
  {\addvspace{0pt}} %每一行之间的垂直间距
  {\figurename{~~}\thecontentslabel\quad} %条目样式
  {\hfill} %填充对齐
  {\titlerule*[6bp]{.}\contentspage} % 用点线间隔，并显示页面号
%% =================================== %
%% ---------- 表目录样式 ---------- %
\titlecontents{table}
  [0pt] %左边缩进为0
  {\addvspace{0pt}} %每一行之间的垂直间距
  {\tablename{~~}\thecontentslabel\quad} %条目样式
  {\hfill} %填充对齐
  {\titlerule*[6bp]{.}\contentspage} % 用点线间隔，并显示页面号
%% =================================== %
% ======================================== %


% -------------------- 摘要环境 -------------------- %
\RequirePackage{abstract}
\setlength{\absleftindent}{0pt} %取消左自动缩进
\setlength{\absrightindent}{0pt} %取消右自动缩进
\renewcommand{\abstracttextfont}{\normalsize} %修改摘要内容的字号
%% ---------- 中文版摘要插入关键词 ---------- %
\newcommand{\keywordsCN}[1]{
  \if@dlmuthesis@BAstem %【本科-理工科】
    \vspace{\baselineskip}{}\noindent\bfseries 关键词: #1
  \else\if@dlmuthesis@BAhumanities %【本科-人文社科】
    \vspace{\baselineskip}{}\noindent\bfseries 关键词: #1
  \else\if@dlmuthesis@MA %【硕士】
    \vspace{\baselineskip}{}{\heiti 关键词}: #1
  \else\if@dlmuthesis@MAlaw %【硕士-法学/法律】
    \vspace{\baselineskip}{}\heiti 关键词: #1
  \else\if@dlmuthesis@MAmarxism %【硕士-马克思主义理论】
    \vspace{\baselineskip}{}{\heiti 关键词}: #1
  \else\if@dlmuthesis@DOC %【博士】
    \vspace{\baselineskip}{}{\heiti 关键词}: #1
  \else\if@dlmuthesis@DOClaw %【博士-法学/法律】
    \vspace{\baselineskip}{}\heiti 关键词: #1
  \else\if@dlmuthesis@DOCmarxism %【博士-马克思主义理论】
    \vspace{\baselineskip}{}{\heiti 关键词}: #1
  \fi\fi\fi\fi\fi\fi\fi\fi
}
%% ======================================== %
%% ---------- 英文版摘要插入关键词 ---------- %
\newcommand{\keywordsEN}[1]{
  \if@dlmuthesis@BAstem %【本科-理工科】
    \vspace{\baselineskip}{}\noindent\bfseries Keywords: #1
  \else\if@dlmuthesis@BAhumanities %【本科-人文社科】
    \vspace{\baselineskip}{}\noindent\bfseries Keywords: #1
  \else\if@dlmuthesis@MA %【硕士】
    \vspace{\baselineskip}{}{\bfseries Key Words}: #1
  \else\if@dlmuthesis@MAlaw %【硕士-法学/法律】
    \vspace{\baselineskip}{}\bfseries Key Words: #1
  \else\if@dlmuthesis@MAmarxism %【硕士-马克思主义理论】
    \vspace{\baselineskip}{\bfseries Key Words}: #1
  \else\if@dlmuthesis@DOC %【博士】
    \vspace{\baselineskip}{}{\bfseries Key Words}: #1
  \else\if@dlmuthesis@DOClaw %【博士-法学/法律】
    \vspace{\baselineskip}{}\bfseries Key Words: #1
  \else\if@dlmuthesis@DOCmarxism %【博士-马克思主义理论】
    \vspace{\baselineskip}{\bfseries Key Words}: #1
  \fi\fi\fi\fi\fi\fi\fi\fi
}
%% ======================================== %
% ================================================== %


% --------------- 列表环境 --------------- %
\RequirePackage[inline]{enumitem}
\if@dlmuthesis@BAstem %【本科-理工科】
  \setlist{leftmargin=0pt, itemindent=2\parindent, itemsep=0pt, parsep=0pt}
\else\if@dlmuthesis@BAhumanities %【本科-人文社科】
  \setlist{leftmargin=0pt, itemindent=2\parindent, itemsep=0pt, nosep}
\else\if@dlmuthesis@MA %【硕士】
  \setlist{leftmargin=0pt, itemindent=2\parindent, itemsep=0pt, parsep=0pt}
\else\if@dlmuthesis@MAlaw %【硕士-法学/法律】
  \setlist{leftmargin=0pt, itemindent=2\parindent, itemsep=0pt, nosep}
\else\if@dlmuthesis@MAmarxism %【硕士-马克思主义理论】
  \setlist{leftmargin=0pt, itemindent=2\parindent, itemsep=0pt, nosep}
\else\if@dlmuthesis@DOC %【博士】
  \setlist{leftmargin=0pt, itemindent=2\parindent, itemsep=0pt, parsep=0pt}
\else\if@dlmuthesis@DOClaw %【博士-法学/法律】
  \setlist{leftmargin=0pt, itemindent=2\parindent, itemsep=0pt, nosep}
\else\if@dlmuthesis@DOCmarxism %【博士-马克思主义理论】
  \setlist{leftmargin=0pt, itemindent=2\parindent, itemsep=0pt, nosep}
\fi\fi\fi\fi\fi\fi\fi\fi
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
  {3bp} %Space above
  {3bp} %Space below
  {\rm} %Body font
  {\parindent} %Indent amount
  {\bfseries} %Theorem head font
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

\newtheoremstyle{newthmstyle-cited} %带文献引用的定理环境样式
  {3bp} %Space above
  {3bp} %Space below
  {\rm} %Body font
  {\parindent} %Indent amount
  {\bfseries} %Theorem head font
  {} %Punctuation after theorem head
  {1.0em} %Space after theorem head
  {\thmname{#1}\thmnumber{#2}\thmnote{\rm{}#3}} %Theorem head spec (can be left empty, meaning ‘normal’)
\theoremstyle{newthmstyle-cited}
\newtheorem{Definition-cited}[Definition]{定义}
\newtheorem{Proposition-cited}[Proposition]{命题}
\newtheorem{Lemma-cited}[Lemma]{引理}
\newtheorem{Theorem-cited}[Theorem]{定理}
\newtheorem{Example-cited}[Example]{例}
\newtheorem{Problem-cited}[Problem]{问题}
\newtheorem{Corollary-cited}[Corollary]{推论}
\newtheorem{Remark-cited}[Remark]{注}
% ======================================== %


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
  framexleftmargin=5bp, %内部左边距
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
\if@dlmuthesis@DOClaw %【博士-法学/法律】
  \setcounter{secnumdepth}{5}
\else
  \setcounter{secnumdepth}{4}
\fi
% ============================================================ %


% --------------- 图、表标题样式 --------------- %
\RequirePackage{caption}
\RequirePackage[labelformat=brace]{subcaption} % 使子图环境中的标题变成副标题样式
\RequirePackage[list=off]{bicaption} %同时含中英文的标题（同时取消英文标题在图标目录中的导入）
\DeclareCaptionLabelSeparator{doublespace}{~~}
\DeclareCaptionFont{NORMALSIZEandHEITI}{\normalsize\heiti} %小四、黑体
\if@dlmuthesis@BAstem %【本科-理工科】
  \captionsetup{font=small, labelsep=doublespace, labelfont=bf, textfont=bf}
\else\if@dlmuthesis@BAhumanities %【本科-人文社科】
  \captionsetup{font=small, labelsep=doublespace, labelfont=bf, textfont=bf}
\else\if@dlmuthesis@MA %【硕士】
  \captionsetup{font=small, labelsep=doublespace} %单标题模式
  \captionsetup[figure][bi-first]{font=small, labelsep=doublespace}
  \captionsetup[figure][bi-second]{font=small, labelsep=doublespace, name={Fig}}
  \captionsetup[table][bi-first]{font=small, labelsep=doublespace}
  \captionsetup[table][bi-second]{font=small, labelsep=doublespace, name={Tab~}}
\else\if@dlmuthesis@MAlaw %【硕士-法学/法律】
  \captionsetup{font=small, labelsep=doublespace} %单标题模式
  \captionsetup[figure][bi-first]{font=small, labelsep=doublespace}
  \captionsetup[figure][bi-second]{font=small, labelsep=doublespace, name={Fig}}
  \captionsetup[table][bi-first]{font=small, labelsep=doublespace}
  \captionsetup[table][bi-second]{font=small, labelsep=doublespace, name={Tab~}}
\else\if@dlmuthesis@MAmarxism %【硕士-马克思主义理论】
  \captionsetup{font=normalsize, labelsep=doublespace} %单标题模式
  \captionsetup[figure][bi-first]{font=NORMALSIZEandHEITI, labelsep=doublespace}
  \captionsetup[figure][bi-second]{font=normalsize, labelsep=doublespace, name={Fig.}}
  \captionsetup[table][bi-first]{font=normalsize, labelsep=doublespace}
  \captionsetup[table][bi-second]{font=normalsize, labelsep=doublespace, name={Tab.}}
\else\if@dlmuthesis@DOC %【博士】
  \captionsetup{font=normalsize, labelsep=doublespace} %单标题模式
  \captionsetup[figure][bi-first]{font=NORMALSIZEandHEITI, labelsep=doublespace}
  \captionsetup[figure][bi-second]{font=normalsize, labelsep=doublespace, name={Fig.}}
  \captionsetup[table][bi-first]{font=normalsize, labelsep=doublespace}
  \captionsetup[table][bi-second]{font=normalsize, labelsep=doublespace, name={Tab.}}
\else\if@dlmuthesis@DOClaw %【博士-法学/法律】
  \captionsetup{font=small, labelsep=doublespace} %单标题模式
  \captionsetup[figure][bi-first]{font=small, labelsep=doublespace}
  \captionsetup[figure][bi-second]{font=small, labelsep=doublespace, name={Fig.}}
  \captionsetup[table][bi-first]{font=small, labelsep=doublespace}
  \captionsetup[table][bi-second]{font=small, labelsep=doublespace, name={Tab.}}
\else\if@dlmuthesis@DOCmarxism %【博士-马克思主义理论】
  \captionsetup{font=normalsize, labelsep=doublespace} %单标题模式
  \captionsetup[figure][bi-first]{font=NORMALSIZEandHEITI, labelsep=doublespace}
  \captionsetup[figure][bi-second]{font=normalsize, labelsep=doublespace, name={Fig.}}
  \captionsetup[table][bi-first]{font=normalsize, labelsep=doublespace}
  \captionsetup[table][bi-second]{font=normalsize, labelsep=doublespace, name={Tab.}}
\fi\fi\fi\fi\fi\fi\fi\fi

\numberwithin{figure}{section} %numberwithin命令必须放在amsmath宏包之后
\numberwithin{table}{section}
% ======================================== %


% --------------- 插图环境 --------------- %
\RequirePackage{graphicx}
\RequirePackage{float} %引入参数H
\graphicspath{{figures/}} %可添加多个路径
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
\RequirePackage{circledtext}

\RequirePackage[perpage]{footmisc} %设置简单的脚注样式
%% 填“1”：1, 2, ...
%% 填“2”：[1], [2], ...
%% 填“3”：(1), (2), ...
%% 填“4”：带圈的阿拉伯数字
%% 填“5”：【1】, 【2】, ...
\newcommand\footnotemode[1]{
\ifthenelse{#1=1}{}{ %模式1
  \ifthenelse{#1=2}{
    \renewcommand{\thefootnote}{[\arabic{footnote}]} %模式2
  }{
    \ifthenelse{#1=3}{
      \renewcommand{\thefootnote}{(\arabic{footnote})} %模式3
    }{
      \ifthenelse{#1=4}{
        \renewcommand{\thefootnote}{\circledtext[resize=real,charf=\scriptsize]{\arabic{footnote}}~} %模式4
      }{
        \ifthenelse{#1=5}{
          \renewcommand{\thefootnote}{【\arabic{footnote}】} %模式5
        } %第5个\ifthenelse
      } %第4个\ifthenelse
    } %第3个\ifthenelse
  } %第2个\ifthenelse
} %第1个\ifthenelse
} % \footnotemode
% ============================================================ %


% --------------- 符号说明环境 --------------- %
\newcommand{\notationname}{符号说明表}
\newenvironment{notation}{
  \begin{center}\heiti\zihao{-3}\notationname\end{center}%
  \par
}{\par}
% ======================================== %


% --------------- 引言环境 --------------- %
\newcommand{\introductionname}{引\hspace{2em}言}
\newenvironment{introduction}{
  \phantomsection
  \addcontentsline{toc}{section}{\introductionname}
  \begin{center}\heiti\zihao{-3}\introductionname\end{center}%
  \par
}{\par}
% ======================================== %


% --------------- 结论环境 --------------- %
\newcommand{\conclusionname}{结论}
\newenvironment{conclusion}{
  \if@dlmuthesis@BAstem %【本科-理工科】
    \renewcommand{\conclusionname}{结论}
    \vspace*{0pt}
    \begin{flushleft}\bfseries\zihao{3}\conclusionname\end{flushleft}%
  \else\if@dlmuthesis@BAhumanities %【本科-人文社科】
    \renewcommand{\conclusionname}{总结}
    \vspace*{0pt}
    \begin{flushleft}\bfseries\zihao{3}\conclusionname\end{flushleft}%
  \else\if@dlmuthesis@MA %【硕士】
    \renewcommand{\conclusionname}{结\hspace{2em}论}
    \begin{center}\heiti\zihao{-3}\conclusionname\end{center}%
  \else\if@dlmuthesis@MAlaw %【硕士-法学/法律】
    \renewcommand{\conclusionname}{结\hspace{2em}论}
    \begin{center}\heiti\zihao{-3}\conclusionname\end{center}%
  \else\if@dlmuthesis@MAmarxism %【硕士-马克思主义理论】
    \renewcommand{\conclusionname}{结\hspace{2em}论}
    \begin{center}\heiti\zihao{-3}\conclusionname\end{center}%
  \else\if@dlmuthesis@DOC %【博士】%严格来说，[博士]不需要专门的结论环境
    \renewcommand{\conclusionname}{结\hspace{2em}论}
    \begin{center}\heiti\zihao{-3}\conclusionname\end{center}%
  \else\if@dlmuthesis@DOClaw %【博士-法学/法律】
    \renewcommand{\conclusionname}{结\hspace{2em}论}
    \begin{center}\heiti\zihao{-3}\conclusionname\end{center}%
  \else\if@dlmuthesis@DOCmarxism %【博士-马克思主义理论】
    \renewcommand{\conclusionname}{结\hspace{2em}论}
    \begin{center}\heiti\zihao{-3}\conclusionname\end{center}%
  \fi\fi\fi\fi\fi\fi\fi\fi
  \phantomsection
  \addcontentsline{toc}{section}{\conclusionname}%
  \par
}{\par}
% ======================================== %


% --------------- 致谢环境 --------------- %
\newcommand{\acknowledgmentname}{致\hspace{2em}谢}
\newenvironment{acknowledgment}{
  \phantomsection
  \addcontentsline{toc}{section}{\acknowledgmentname}%
  \if@dlmuthesis@BAstem %【本科-理工科】
    \vspace*{0pt}
    \begin{center}\bfseries\zihao{3}\acknowledgmentname\end{center}%
  \else\if@dlmuthesis@BAhumanities %【本科-人文社科】
    \vspace*{0pt}
    \begin{center}\bfseries\zihao{3}\acknowledgmentname\end{center}%
  \else\if@dlmuthesis@MA %【硕士】
    \begin{center}\heiti\zihao{-3}\acknowledgmentname\end{center}%
  \else\if@dlmuthesis@MAlaw %【硕士-法学/法律】
    \begin{center}\heiti\zihao{-3}\acknowledgmentname\end{center}%
  \else\if@dlmuthesis@MAmarxism %【硕士-马克思主义理论】
    \begin{center}\heiti\zihao{-3}\acknowledgmentname\end{center}%
  \else\if@dlmuthesis@DOC %【博士】
    \begin{center}\heiti\zihao{-3}\acknowledgmentname\end{center}%
  \else\if@dlmuthesis@DOClaw %【博士-法学/法律】
    \begin{center}\heiti\zihao{-3}\acknowledgmentname\end{center}%
  \else\if@dlmuthesis@DOCmarxism %【博士-马克思主义理论】
    \begin{center}\heiti\zihao{-3}\acknowledgmentname\end{center}%
  \fi\fi\fi\fi\fi\fi\fi\fi
  \par
}{\par}
\if@dlmuthesis@DOC %【博士】
  \AddToHook{env/acknowledgment/before}{
    % 奇数页为该部分名称，偶数页为论文中文题目
    \fancyhead[COH]{\zihao{5}致谢}
    \fancyhead[CEH]{\zihao{5}\dlmuthesis@tokens@cntitle}
  }
\fi
% ======================================== %


% --------------- 作者简历环境 --------------- %
\NewDocumentEnvironment{personalcv}{m o}{
  \global\newcommand{\personalcvname}{#1}
  \ifthenelse{\equal{#2}{addtotoc}}{
    \phantomsection
    \addcontentsline{toc}{section}{\personalcvname}
  }{}
  \begin{center}\heiti\zihao{-3}\personalcvname\end{center}%
  \par
}{\par}
\if@dlmuthesis@DOC %【博士】
  \AddToHook{env/personalcv/before}{
    %% 在[博士]中，奇数页页眉为该部分名称，偶数页为论文中文题目
    \fancyhead[COH]{\zihao{5}\personalcvname}
    \fancyhead[CEH]{\zihao{5}\dlmuthesis@tokens@cntitle}
  }
\fi
% ======================================== %


% --------------- 杂项 --------------- %
\RequirePackage{comment} % 提供注释环境
\RequirePackage{lipsum, zhlipsum} %随机文本
% ======================================== %


% ------------------------- 参考文献 ------------------------- %
\RequirePackage[numbers,square,comma]{natbib}
\setlength{\bibsep}{0bp}
\bibliographystyle{thuthesis-bachelor} %借鉴使用：清华大学(本科)学位论文模板bst样式文件
\renewcommand{\bibfont}{\zihao{5}} % 参考文献条目字号要求

%% 上标形式的引用（可选参数：页码）
\NewDocumentCommand{\upcite}{O{} m}{$^{\mbox{\footnotesize\cite{#2}}#1}${}}
%% 附录中的文献引用格式
\if@dlmuthesis@MAlaw %【硕士-法学/法律】
  \newcommand{\apdxcite}[1]{\citep[\chinese{section},~\hspace{-3bp}][]{#1}} %适用于“章节编号+文献序号”的格式
  \newcommand{\upapdxcite}[1]{$^{\mbox{\footnotesize\apdxcite{#1}}}${}} %动机与\upcite命令的类似
\else\if@dlmuthesis@DOClaw %【博士-法学/法律】
  \newcommand{\apdxcite}[1]{\citep[\chinese{section},~\hspace{-3bp}][]{#1}} %适用于“章节编号+文献序号”的格式
  \newcommand{\upapdxcite}[1]{$^{\mbox{\footnotesize\apdxcite{#1}}}${}} %动机与\upcite命令的类似
\else %【硕士、博士】
  \newcommand{\apdxcite}[1]{\citep[\thesection\hspace{-3bp}][]{#1}} %适用于“章节编号+文献序号”的格式
  \newcommand{\upapdxcite}[1]{$^{\mbox{\footnotesize\apdxcite{#1}}}${}} %动机与\upcite命令的类似
\fi\fi

%% ---------- 特殊参考文献规范 ---------- %
\if@dlmuthesis@MAlaw %【硕士-法学/法律】
  \renewcommand{\bibnumfmt}[1]{#1.}
  %\makeatletter
  \xapptocmd{\NAT@bibsetnum}{\setlength{\leftmargin}{0pt}\setlength{\itemindent}{\labelwidth}\addtolength{\itemindent}{\labelsep}}{}{}
  %\makeatother
\else\if@dlmuthesis@MAmarxism %【硕士-马克思主义理论】
  \renewcommand{\bibnumfmt}[1]{【#1】}
  %\makeatletter
  \xapptocmd{\NAT@bibsetnum}{\setlength{\leftmargin}{0pt}\setlength{\itemindent}{\labelwidth}\addtolength{\itemindent}{\labelsep}}{}{}
  %\makeatother
\else\if@dlmuthesis@DOClaw %【博士-法学/法律】
  \renewcommand{\bibnumfmt}[1]{#1.}
  %\makeatletter
  \xapptocmd{\NAT@bibsetnum}{\setlength{\leftmargin}{0pt}\setlength{\itemindent}{\labelwidth}\addtolength{\itemindent}{\labelsep}}{}{}
  %\makeatother
\else\if@dlmuthesis@DOCmarxism %【博士-马克思主义理论】
  \renewcommand{\bibnumfmt}[1]{【#1】}
  %\makeatletter
  \xapptocmd{\NAT@bibsetnum}{\setlength{\leftmargin}{0pt}\setlength{\itemindent}{\labelwidth}\addtolength{\itemindent}{\labelsep}}{}{}
  %\makeatother
\fi\fi\fi\fi
%% ============================================= %
% ======================================================= %


% ---------- 附录 ---------- %
\RequirePackage{appendix} %注：不能添加option
% ========================= %


% --------------- 打印模式相关变量的定义 --------------- %
\RequirePackage{refcount}
%% ----- 创新点摘要页 ----- %
\newcounter{abstractINNOVATIONbegin}
\newcounter{abstractINNOVATIONend}
\newcounter{abstractINNOVATIONdif}
%% ==================== %
%% ----- 中文摘要页 ----- %
\newcounter{abstractCNbegin}
\newcounter{abstractCNend}
\newcounter{abstractCNdif}
%% ==================== %
%% ----- 英文摘要页 ----- %
\newcounter{abstractENbegin}
\newcounter{abstractENend}
\newcounter{abstractENdif}
%% ==================== %
%% ----- 目录组（章节、图、表） ----- %
\newcounter{tocsbegin}
\newcounter{tocsend}
\newcounter{tocsdif}
%% =================================== %
%% ----- 作者简历页 ----- %
\newcounter{personalcvlastpage}
%% ==================== %
% ============================================= %


% --------------- 超链接与交叉引用 --------------- %
\RequirePackage[hidelinks, bookmarksnumbered=true, breaklinks=true, bookmarksopen=true]{hyperref}
% ======================================== %


% -------------------- 封装的预设置 -------------------- %
%% ----- 博士论文中，从创新点摘要页开始的页眉内容、目录书签设置 ----- %
\newcommand{\presetupOFabstractINNOVATION}{
  \if@dlmuthesis@DOC %【博士】
    \renewcommand\abstractname{\zihao{-3}\heiti 创~新~点~摘~要} %临时修改摘要名
    \pagestyle{fancy}
    \fancyhead[COH]{\zihao{5}创新点摘要}
    \fancyhead[CEH]{\zihao{5}\dlmuthesis@tokens@cntitle}
    \cfoot{~}
    \setcounter{abstractINNOVATIONbegin}{\value{page}} %涉及打印模式
    \AddToHook{env/abstract/begin}[lineskip_in_abstractINNOVATION]{
      \renewcommand{\baselinestretch}{1.5}
    }
  \else\if@dlmuthesis@DOClaw %【博士-法学/法律】
    \renewcommand\abstractname{\zihao{-3}\heiti 创\hspace{1em}新\hspace{1em}点\hspace{1em}摘\hspace{1em}要} %临时修改摘要名
    \pagestyle{fancy}
    \fancyhead[COH]{\zihao{5}大连海事大学{\headerinHEADER}学位论文}
    \fancyhead[CEH]{\zihao{5}\dlmuthesis@tokens@cntitle}
    \cfoot{~}
    \setcounter{abstractINNOVATIONbegin}{\value{page}} %涉及打印模式
  \else\if@dlmuthesis@DOCmarxism %【博士-马克思主义理论】
    \renewcommand\abstractname{\zihao{-3}\heiti 创\hspace{1em}新\hspace{1em}点} %临时修改摘要名
    \pagestyle{fancy}
    \fancyhead[COH]{\zihao{5}大连海事大学{\headerinHEADER}学位论文}
    \fancyhead[CEH]{\zihao{5}\dlmuthesis@tokens@cntitle}
    \cfoot{~}
    \setcounter{abstractINNOVATIONbegin}{\value{page}} %涉及打印模式
  \fi\fi\fi
}
%% ================================================== %

%% ----- 从摘要页开始的样式设置 ----- %
\newcommand{\presetupOFabstractCN}{
  \if@dlmuthesis@BAstem %【本科-理工科】
    \renewcommand\abstractname{\zihao{3}\bfseries 摘\hspace{2em}要}
    \pagestyle{plain}
    \cfoot{\zihao{-5} \thepage}
    \pagenumbering{Roman}
  \else\if@dlmuthesis@BAhumanities %【本科-人文社科】
    \renewcommand\abstractname{\zihao{3}\bfseries 摘\hspace{2em}要} %临时修改摘要名
    \pagestyle{plain}
    \cfoot{\zihao{-5} \thepage}
    \pagenumbering{Roman}
  \else\if@dlmuthesis@MA %【硕士】
    \renewcommand\abstractname{\zihao{-3}\heiti 摘\hspace{2em}要}
    %奇数页为“大连海事大学硕士学位论文”，偶数页为论文中文题目：
    \pagestyle{fancy}
    \fancyhead[COH]{\zihao{5}大连海事大学{\headerinHEADER}学位论文}
    \fancyhead[CEH]{\zihao{5}\dlmuthesis@tokens@cntitle}
    \cfoot{\zihao{-5}--~\thepage~--}
    \pagenumbering{Roman}
    \phantomsection
    \addcontentsline{toc}{section}{摘\hspace{2em}要}
    %%% 打印模式下，[硕士]的（中文）摘要部分需单面打印
    \if@dlmuthesis@printed % 打印模式下才操作
      %%% ----- 开始插入空白页 ----- %
      \AddToHook{shipout/after}[BlankPages]{\RawShipout\null}
      %%% ========================= %
    \fi
  \else\if@dlmuthesis@MAlaw %【硕士-法学/法律】
    \renewcommand\abstractname{\zihao{-3}\heiti 摘\hspace{2em}要}
    %奇数页为“大连海事大学硕士学位论文”，偶数页为论文中文题目：
    \pagestyle{fancy}
    \fancyhead[COH]{\zihao{5}大连海事大学{\headerinHEADER}学位论文}
    \fancyhead[CEH]{\zihao{5}\dlmuthesis@tokens@cntitle}
    \cfoot{\zihao{-5}--~\thepage~--}
    \pagenumbering{Roman}
    \if@dlmuthesis@printed % 打印模式下才操作
      %%% ----- 开始插入空白页 ----- %
      \AddToHook{shipout/after}[BlankPages]{\RawShipout\null}
      %%% ========================= %
    \fi
  \else\if@dlmuthesis@MAmarxism %【硕士-马克思主义理论】
    %奇数页为“大连海事大学硕士学位论文”，偶数页为论文中文题目：
    \renewcommand{\abstractname}{\zihao{-3}\heiti 摘\hspace{2em}要}
    \pagestyle{fancy}
    \fancyhead[COH]{\zihao{5}大连海事大学{\headerinHEADER}学位论文}
    \fancyhead[CEH]{\zihao{5}\dlmuthesis@tokens@cntitle}
    \cfoot{\zihao{-5}--~\thepage~--}
    \pagenumbering{Roman}
    \setcounter{abstractCNbegin}{\value{page}} %涉及打印模式
  \else\if@dlmuthesis@DOC %【博士】
    \renewcommand\abstractname{\zihao{-3}\heiti 摘\hspace{2em}要} %临时修改摘要名
    %%% 奇数页为每部分的名称，偶数页为论文中文题目：
    \fancyhead[COH]{\zihao{5}摘要}
    \fancyhead[CEH]{\zihao{5}\dlmuthesis@tokens@cntitle}
    \cfoot{\zihao{-5}--~\thepage~--}
    \pagenumbering{Roman}
    \phantomsection
    \addcontentsline{toc}{section}{摘\hspace{2em}要}
    %%% 打印模式下，[博士]的（中文）摘要部分需单面打印
    \if@dlmuthesis@printed % 打印模式下才操作
      %%% ----- 开始插入空白页 ----- %
      \AddToHook{shipout/after}[BlankPages]{\RawShipout\null}
      %%% ========================= %
    \fi
  \else\if@dlmuthesis@DOClaw %【博士-法学/法律】
    \renewcommand\abstractname{\zihao{-3}\heiti 摘\hspace{2em}要} %临时修改摘要名
    \cfoot{\zihao{-5}--~\thepage~--}
    \pagenumbering{Roman}
    \if@dlmuthesis@printed % 打印模式下才操作
      %%% ----- 开始插入空白页 ----- %
      \AddToHook{shipout/after}[BlankPages]{\RawShipout\null}
      %%% ========================= %
    \fi
  \else\if@dlmuthesis@DOCmarxism %【博士-马克思主义理论】
    \renewcommand\abstractname{\zihao{-3}\heiti 摘\hspace{2em}要} %临时修改摘要名
    %奇数页为“大连海事大学博士学位论文”，偶数页为论文中文题目：
    \pagestyle{fancy}
    \fancyhead[COH]{\zihao{5}大连海事大学{\headerinHEADER}学位论文}
    \fancyhead[CEH]{\zihao{5}\dlmuthesis@tokens@cntitle}
    \cfoot{\zihao{-5}--~\thepage~--}
    \pagenumbering{Roman}
    \if@dlmuthesis@printed % 打印模式下才操作
      %%% ----- 开始插入空白页 ----- %
      \AddToHook{shipout/after}[BlankPages]{\RawShipout\null}
      %%% ========================= %
    \fi
  \else
    \pagenumbering{Roman}
  \fi\fi\fi\fi\fi\fi\fi\fi
} %中文摘要

\newcommand{\presetupOFabstractEN}{
  \if@dlmuthesis@BAstem %【本科-理工科】
    \renewcommand\abstractname{\large ABSTRACT} %临时修改摘要名
  \else\if@dlmuthesis@BAhumanities %【本科-人文社科】
    \renewcommand\abstractname{\large ABSTRACT} %临时修改摘要名
  \else\if@dlmuthesis@MA %【硕士】
    \setcounter{abstractENbegin}{\value{page}} %涉及打印模式
    \renewcommand\abstractname{\large\rm Abstract} %临时修改摘要名
    \begin{center}
    \zihao{-3}\dlmuthesis@tokens@entitle %在英文摘要页开头打印英文版论文题目
    \end{center}
    \phantomsection
    \addcontentsline{toc}{section}{Abstract}
  \else\if@dlmuthesis@MAlaw %【硕士-法学/法律】
    \setcounter{abstractENbegin}{\value{page}} %涉及打印模式
    \renewcommand\abstractname{\large\rm Abstract} %临时修改摘要名
  \else\if@dlmuthesis@MAmarxism %【硕士-马克思主义理论】
    \setcounter{abstractENbegin}{\value{page}} %涉及打印模式
    \renewcommand\abstractname{\large ABSTRACT} %临时修改摘要名
    \phantomsection
    \addcontentsline{toc}{section}{ABSTRACT}
  \else\if@dlmuthesis@DOC %【博士】
    \setcounter{abstractENbegin}{\value{page}} %涉及打印模式
    \renewcommand\abstractname{\large\bfseries ABSTRACT} %临时修改摘要名
    % 奇数页为每部分的名称，偶数页为论文中文题目：
    \fancyhead[COH]{\zihao{5}ABSTRACT}
    \fancyhead[CEH]{\zihao{5}\dlmuthesis@tokens@cntitle}
    \phantomsection
    \addcontentsline{toc}{section}{ABSTRACT}
  \else\if@dlmuthesis@DOClaw %【博士-法学/法律】
    \renewcommand\abstractname{\large\bfseries ABSTRACT} %临时修改摘要名
  \else\if@dlmuthesis@DOCmarxism %【博士-马克思主义理论】
    \setcounter{abstractENbegin}{\value{page}} %涉及打印模式
    \renewcommand\abstractname{\large ABSTRACT} %临时修改摘要名
  \fi\fi\fi\fi\fi\fi\fi\fi
} %英文摘要
%% ================================================== %

%% ----- 硕博论文中，为设置目录的打印模式而埋下计数器 ----- %
\newcommand{\presetupOFtocs}{
  % [本科-*]：no actions
  % [*-法学/法律]：no actions
  \if@dlmuthesis@MA %【硕士】
    \setcounter{tocsbegin}{\value{page}}
  \else\if@dlmuthesis@MAmarxism %【硕士-马克思主义理论】
    \setcounter{tocsbegin}{\value{page}}
  \else\if@dlmuthesis@DOC %【博士】
    \setcounter{tocsbegin}{\value{page}}
    % 同时，奇数页页眉为每部分的名称，偶数页为论文中文题目：
    \fancyhead[COH]{\zihao{5}目录}
    \fancyhead[CEH]{\zihao{5}\dlmuthesis@tokens@cntitle}
  \else\if@dlmuthesis@DOCmarxism %【博士-马克思主义理论】
    \setcounter{tocsbegin}{\value{page}}
  \fi\fi\fi\fi
}
%% ======================================================= %

%% --------------- 正文部分的样式设置 --------------- %
\newcommand{\pesudohookOFpremainbody}{
  \if@dlmuthesis@BAstem %【本科-理工科】
    \cntitleinMAINBODY
    \pagestyle{fancy} %从第一章到致谢，设置为有页眉、有页脚的模式
    \fancyhead[C]{\zihao{-5}\dlmuthesis@tokens@cntitle}
    \pagenumbering{arabic} %《手册》要求：从正文开始设为阿拉伯数字页码，并且重新从1开始计数  
  \else\if@dlmuthesis@BAhumanities %【本科-人文社科】
    \cntitleinMAINBODY
    \pagestyle{fancy} %从第一章到致谢，设置为有页眉、有页脚的模式
    \fancyhead[C]{\zihao{-5}\dlmuthesis@tokens@cntitle}
    \pagenumbering{arabic} %《手册》要求：从正文开始设为阿拉伯数字页码，并且重新从1开始计数
  \else\if@dlmuthesis@MA %【硕士】
    \pagenumbering{arabic} %《规范》要求：从正文开始设为阿拉伯数字页码，并且重新从1开始计数
  \else\if@dlmuthesis@MAlaw %【硕士-法学/法律】
    \pagenumbering{arabic} %《规范》要求：从正文开始设为阿拉伯数字页码，并且重新从1开始计数
  \else\if@dlmuthesis@MAmarxism %【硕士-马克思主义理论】
    \pagenumbering{arabic} %《规范》要求：从正文开始设为阿拉伯数字页码，并且重新从1开始计数
  \else\if@dlmuthesis@DOC %【博士】
    \pagestyle{fancy}
    \fancyhead[COH]{\zihao{5}\leftmark}
    \fancyhead[CEH]{\zihao{5}\dlmuthesis@tokens@cntitle}
    \pagenumbering{arabic} %《规范》要求：从正文开始设为阿拉伯数字页码，并且重新从1开始计数
  \else\if@dlmuthesis@DOClaw %【博士-法学/法律】
    \pagenumbering{arabic} %《规范》要求：从正文开始设为阿拉伯数字页码，并且重新从1开始计数
  \else\if@dlmuthesis@DOCmarxism %【博士-马克思主义理论】
    \pagenumbering{arabic} %《规范》要求：从正文开始设为阿拉伯数字页码，并且重新从1开始计数
  \fi\fi\fi\fi\fi\fi\fi\fi
}
%% ======================================================= %

%% ----- 硕博论文中，要根据作者简历页最后一页奇偶来决定授权声明的[前后]是否要加空页 ----- %
\newcommand{\presetupOFpersonalcv}{
  \setcounter{personalcvlastpage}{\value{page}} %涉及打印模式
}
%% =========================================================================== %
% ================================================== %


% ---------- 打印模式 ---------- %
\newcommand{\nextpages}[1]{
  \if@dlmuthesis@printed
    \if@dlmuthesis@BAstem %【本科-理工科】
      \clearpage
    \else\if@dlmuthesis@BAhumanities %【本科-人文社科】
      \clearpage
    \else
      \ifthenelse{\equal{#1}{single}}{ %封面、原创性声明、授权声明
        \clearpage
        \addtocounter{page}{-1}
        \thispagestyle{empty}
        \mbox{}
        \clearpage
      }{}
      \ifthenelse{\equal{#1}{abstractINNOVATION}}{ %创新点摘要页
        \if@dlmuthesis@DOC %【博士】
          \RemoveFromHook{env/abstract/begin}[lineskip_in_abstractINNOVATION]
        \fi
        \setcounter{abstractINNOVATIONend}{\value{page}}
        \setcounter{abstractINNOVATIONdif}{\numexpr\value{abstractINNOVATIONend}-\value{abstractINNOVATIONbegin}+1\relax}
%      【\theabstractCNbegin】【\theabstractCNend】【\theabstractCNdif】
        \ifthenelse{\isodd{\value{abstractINNOVATIONdif}}}{
          \clearpage
          \addtocounter{page}{-1}
          \thispagestyle{empty}
          \mbox{}
          \clearpage
        }{\clearpage}
      }{}
      \ifthenelse{\equal{#1}{abstractCN}}{ %中文摘要页
        \if@dlmuthesis@MA %【硕士】
          \clearpage
          %%% ----- 停止插入空白页 ----- %
          \RemoveFromHook{shipout/after}[BlankPages]
          %%% ========================= %        
        \else\if@dlmuthesis@DOC %【博士】
          \clearpage
          %%% ----- 停止插入空白页 ----- %
          \RemoveFromHook{shipout/after}[BlankPages]
          %%% ========================= %
        \else\if@dlmuthesis@DOClaw %【博士-法学/法律】
          \clearpage
        \else\if@dlmuthesis@DOCmarxism %【博士-马克思主义理论】
          \clearpage
          %%% ----- 停止插入空白页 ----- %
          \RemoveFromHook{shipout/after}[BlankPages]
          %%% ========================= %
        \else
          \setcounter{abstractCNend}{\value{page}}
          \setcounter{abstractCNdif}{\numexpr\value{abstractCNend}-\value{abstractCNbegin}+1\relax}
%        【\theabstractCNbegin】【\theabstractCNend】【\theabstractCNdif】
          \ifthenelse{\isodd{\value{abstractCNdif}}}{
            \clearpage
            \addtocounter{page}{-1}
            \thispagestyle{empty}
            \mbox{}
            \clearpage
          }{\clearpage}
        \fi\fi\fi\fi
      }{}
      \ifthenelse{\equal{#1}{abstractEN}}{ %英文摘要页
      \if@dlmuthesis@MAlaw %【硕士-法学/法律】
        \clearpage
        %%% ----- 停止插入空白页 ----- %
        \RemoveFromHook{shipout/after}[BlankPages]
        %%% ========================= %
      \else\if@dlmuthesis@DOClaw %【博士-法学/法律】
        \clearpage
        %%% ----- 停止插入空白页 ----- %
        \RemoveFromHook{shipout/after}[BlankPages]
        %%% ========================= %
      \else
        \setcounter{abstractENend}{\value{page}}
        \setcounter{abstractENdif}{\numexpr\value{abstractENend}-\value{abstractENbegin}+1\relax}
%      【\theabstractENbegin】【\theabstractENend】【\theabstractENdif】
        \ifthenelse{\isodd{\value{abstractENdif}}}{
          \clearpage
          \addtocounter{page}{-1}
          \thispagestyle{empty}
          \mbox{}
          \clearpage
        }{\clearpage}
      \fi\fi
      }{}
      \ifthenelse{\equal{#1}{tocs}}{ %目录组
        \if@dlmuthesis@MAlaw %【硕士-法学/法律】
          \clearpage %[硕士-法学/法律]中，从目录到致谢都是双面打印
        \else\if@dlmuthesis@DOClaw %【博士-法学/法律】
          \clearpage %[博士-法学/法律]中，从目录到致谢都是双面打印
        \else
          \setcounter{tocsend}{\value{page}}
          \setcounter{tocsdif}{\numexpr\value{tocsend}-\value{tocsbegin}+1\relax}
%        【\thetocsbegin】【\thetocsend】【\thetocsdif】
          \ifthenelse{\isodd{\value{tocsdif}}}{
            \clearpage
            \addtocounter{page}{-1}
            \thispagestyle{empty}
            \mbox{}
            \clearpage
          }{\clearpage}
        \fi\fi
      }{}
      \ifthenelse{\equal{#1}{personalcv}}{ %作者简历页
        \if@dlmuthesis@DOC %【博士】
          \clearpage %打印模式下也只是换个页
        \else\if@dlmuthesis@DOClaw %【博士-法学/法律】
          \typeout{After personalcv is the end of thesis} %no actions
        \else
          \ifthenelse{\isodd{\value{personalcvlastpage}}}{
            \clearpage
            \addtocounter{page}{-1}
            \thispagestyle{empty}
            \mbox{}
            \clearpage
          }{\clearpage}
        \fi\fi
      }{}
    \fi\fi
  \else
    \clearpage
  \fi
}
% ============================== %


% ------------------------- 封面页的创建 ------------------------- %

%% -------------------- 封面页-本科论文 -------------------- %
\def\AddCline{\\ \cline{2-2}} %定义宏：被循环的内容
\newcommand{\makecoverpageBA}{
  \thispagestyle{empty} %【无页眉页脚】
  \setlength{\extrarowheight}{9bp} %【设置表格行间距】
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
    \fontsize{40bp}{26bp}\selectfont{\heiti 本科毕业论文}\\
  \end{textblock}
  %%% ======================================== %

  %%% ---------- 大字号标题下方的中、英论文题目 ---------- %
  \begin{textblock}{15}(3.3,13.0)
    \centering
    \renewcommand{\arraystretch}{0.75} %【调整表格行间距】
    \begin{tabular}
      {
      >{\vspace{-0.3\baselineskip}}m{1.4cm}
      >{\vspace{-0.3\baselineskip}}m{12.0cm}
      }
      \bfseries\fontsize{16bp}{16bp}\selectfont 题\hfil 目: &
      \multirow[t]{2}{12.0cm}{\centering\arraybackslash\bfseries\fontsize{16bp}{16bp}\selectfont\dlmuthesis@tokens@cntitle}
      \whiledo{\value{CounterOfAddClineCn}<\value{InputLineCn}}{
        \AddCline
        \stepcounter{CounterOfAddClineCn}
      }
      \bfseries\fontsize{15bp}{15bp}\selectfont Title: &
      \multirow[t]{2}{12.0cm}{\centering\arraybackslash\bfseries\fontsize{16bp}{16bp}\selectfont\dlmuthesis@tokens@entitle}
      \whiledo{\value{CounterOfAddClineEn}<\value{InputLineEn}}{
        \AddCline
        \stepcounter{CounterOfAddClineEn}
      }
    \end{tabular}
  \end{textblock}
  %%% ================================================== %

  %%% -------------------- 封面信息栏 -------------------- %
  \begin{textblock}{16}(3.3,16.9)
    \centering
    \renewcommand{\arraystretch}{1.2}
    \begin{tabular}
      {
      >{\fontsize{16bp}{16bp}\selectfont}m{3.8cm}
      >{\centering\arraybackslash\fontsize{16bp}{16bp}\selectfont}p{8.0cm}
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

  %% ---------- 由于之前将\extrarowheight的值设为9bp，为保证往后正文表格的间距正常，需重新设置回来 ---------- %
  \setlength{\extrarowheight}{2bp}
  %%% ================================================================================ %

  \newpage %【起到将封面页与正文隔离开的正式作用】
} %\makecoverpageBA
%% ============================================================ %

%% -------------------- 封面页-硕士论文 -------------------- %
\newcommand{\makecoverpageMA}{
  \thispagestyle{empty} %【无页眉页脚】
  \setlength{\extrarowheight}{18bp} %【设置表格行间距】

  ~\vspace{24bp}
  \begin{center}{\bfseries\zihao{-1}
  \headerinCOVERPAGE 学~位~论~文}
  \end{center}{}\vspace{24.0bp}

  \begin{center}
  {\zihao{2}\heiti\dlmuthesis@tokens@cntitle}\\[1ex]
  {\zihao{3}\bfseries\dlmuthesis@tokens@entitle}
  \end{center}{}\vspace{132.0bp minus 38.0bp}

  \begin{table}[H]
    \centering
    \begin{tabular}
      {
      >{\fontsize{16bp}{16bp}\selectfont}m{2.8cm}
      >{\centering\arraybackslash\fontsize{16bp}{16bp}\selectfont} p{8.0cm}
      }
      作\hfill 者\hfill 姓\hfill 名： & \dlmuthesis@tokens@aauthor \\
      \cline{2-2}
      \dlmuthesis@tokens@headermajoir： & \dlmuthesis@tokens@majorinCOVERPAGE \\
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
  \end{table}{}\vspace{2em}

  \begin{figure}[H]
    \centering
    \includegraphics[width=0.30\textwidth]{logo/LogoMA.pdf}
  \end{figure}

  %%% ----- 由于之前将\extrarowheight的值设为9bp，为保证往后正文表格的间距正常，需重新设置回来 ----- %
  \setlength{\extrarowheight}{2bp}
  %%% ================================================== %
  \nextpages{single}
} %\makecoverpageMA
%% ============================================================ %

%% -------------------- 封面页-博士论文 -------------------- %
\newcommand{\makecoverpageDOC}{
  \thispagestyle{empty} %【无页眉页脚】
  \setlength{\extrarowheight}{18bp} %【设置表格行间距】

  ~\vspace{24bp}
  \begin{center}{\bfseries\zihao{-1}
  \headerinCOVERPAGE 学~位~论~文}
  \end{center}{}\vspace{24.0bp}

  \begin{center}
  {\zihao{2}\heiti\dlmuthesis@tokens@cntitle}\\[1ex]
  {\zihao{3}\bfseries\dlmuthesis@tokens@entitle}
  \end{center}{}\vspace{132.0bp}

  \begin{table}[H]
    \centering
    \begin{tabular}
      {
      >{\fontsize{15bp}{15bp}\selectfont}m{2.8cm}
      >{\centering\arraybackslash\fontsize{16bp}{16bp}\selectfont} p{8.0cm}
      }
      作\hfill 者\hfill 姓\hfill 名： & \dlmuthesis@tokens@aauthor \\
      \cline{2-2}
      学\hfill 号： & \dlmuthesis@tokens@sdtID \\
      \cline{2-2}
      指\hfill 导\hfill 教\hfill 师： & \dlmuthesis@tokens@mentorONE \\
      \cline{2-2}
      \dlmuthesis@tokens@headermajoir： & \dlmuthesis@tokens@majorinCOVERPAGE \\
      \cline{2-2}
      学\hfill 位\hfill 类\hfill 别： & \dlmuthesis@tokens@degree \\
      \cline{2-2}
      培\hfill 养\hfill 单\hfill 位： & \dlmuthesis@tokens@faculty \\
      \cline{2-2}
      答\hfill 辩\hfill 时\hfill 间： & \dlmuthesis@tokens@completiondate \\
      \cline{2-2}
    \end{tabular}
  \end{table}{}\vspace{24.0bp}

  \begin{figure}[H]
    \centering
    \includegraphics[width=0.30\textwidth]{logo/LogoMA.pdf}
  \end{figure}

  %%% ----- 由于之前将\extrarowheight的值设为9bp，为保证往后正文表格的间距正常，需重新设置回来 ----- %
  \setlength{\extrarowheight}{2bp}
  %%% ================================================== %
  \nextpages{single}
} %\makecoverpageDOC
%% ============================================================ %

% ================================================================================ %


% --------------- 封面页的导入 --------------- %
\newcommand{\makepages}{
\if@dlmuthesis@BAstem %【本科-理工科】
  \makecoverpageBA
\else\if@dlmuthesis@BAhumanities %【本科-人文社科】
  \makecoverpageBA
\else\if@dlmuthesis@MA %【硕士】
  \makecoverpageMA
\else\if@dlmuthesis@MAlaw %【硕士-法学/法律】
  \makecoverpageMA
\else\if@dlmuthesis@MAmarxism %【硕士-马克思主义理论】
  \makecoverpageMA
\else\if@dlmuthesis@DOC %【博士】
  \makecoverpageDOC
\else\if@dlmuthesis@DOClaw %【博士-法学/法律】
  \makecoverpageDOC
\else\if@dlmuthesis@DOCmarxism %【博士-马克思主义理论】
  \makecoverpageDOC
\fi\fi\fi\fi\fi\fi\fi\fi
}
% ======================================== %


% ---------- 硕博论文 - 原创性声明 & 授权使用声明 ---------- %
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

%% ---------- 元内容 - 原创性声明 ---------- %
\newcommand{\titleOFOriginalityStatement}{
\if@dlmuthesis@MA %【硕士】
\zihao{-2} 大连海事大学\\
研究生学位论文原创性声明
\else\if@dlmuthesis@MAlaw %【硕士-法学/法律】
\zihao{-2} 大连海事大学\\
研究生学位论文原创性声明
\else %【博士、*-马克思主义理论、博士-法学/法律】
\zihao{-2}\heiti 大连海事大学\\
研究生学位论文原创性声明
\fi\fi
}
\newcommand{\metaOriginalityStatement}{
\begin{center}\begin{spacing}{1.5}
\titleOFOriginalityStatement
\end{spacing}\end{center}{}\vspace{-24bp}
\begin{spacing}{1.5}
本人郑重声明：所呈交的学位论文，是本人在导师的指导下进行研究工作所取得的成果。尽我所知，除文中已经注明引用内容和致谢的地方外，本论文不包含任何其他个人或集体已经发表或撰写过的研究成果。对论文所涉及的研究工作做出贡献的其他个人和集体，均已在论文中以明确的方式标明或致谢。\vspace{1em}

若有不实之处，本人愿意承担相关法律责任。
\end{spacing}%
\begin{table}[H]
  \centering
  \begin{tabularx}{\textwidth}{cXccccccc}
作 者 签 名 : & \hfil\dlmuthesis@tokens@signofstudent\hfil & 日期: & \yearSTU & 年 & \monthSTU & 月 & \daySTU & 日 \\
\cline{2-2}\cline{4-4}\cline{6-6}\cline{8-8}
  \end{tabularx}%
\end{table}%
}
%% ======================================== %

%% ---------- 元内容 - 授权使用声明 ---------- %
\newcommand{\titleOFAuthorizationStatement}{
\zihao{3}\heiti 大连海事大学学位论文授权使用声明
}
\newcommand{\metaAuthorizationStatement}{
\begin{center}\begin{spacing}{1.5}
\titleOFAuthorizationStatement
\end{spacing}\end{center}{}\vspace{-24bp}
\begin{spacing}{1.5}
本人完全了解并同意遵守学校有关学位论文知识产权的规定，在校攻读学位期间论文工作的知识产权属于大连海事大学，学校有权保留送交学位论文的副本，向国家有关部门或机构送交论文的复印件和电子版，允许该论文被查阅，可以将本学位论文的全部或部分内容编入有关数据库进行检索，可以采用影印、缩印、或扫描等复制手段保存和汇编本学位论文。

涉密的学位论文在解密后使用本声明。
\end{spacing}%
\begin{table}[H]
  \centering
  \begin{tabularx}{\textwidth}{cXccccccc}
作~者~签~名 : & \hfil\dlmuthesis@tokens@signofstudent\hfil & 日期: & \yearSTU & 年 & \monthSTU & 月 & \daySTU & 日 \\
\cline{2-2}\cline{4-4}\cline{6-6}\cline{8-8}\\[6bp]
导~师~签~名 : & \hfil\dlmuthesis@tokens@signofmentor\hfil & 日期: & \yearMNT & 年 & \monthMNT & 月 & \dayMNT & 日 \\
\cline{2-2}\cline{4-4}\cline{6-6}\cline{8-8}
  \end{tabularx}%
\end{table}%
}
%% ======================================== %

%% -------------------- 原创性声明 -------------------- %
\newcommand{\OriginalityStatement}{
\thispagestyle{empty} %【无页眉页脚】

~\vspace{24bp}
\metaOriginalityStatement
\nextpages{single}
}
%% ================================================== %

%% -------------------- 授权使用声明 -------------------- %
\newcommand{\AuthorizationStatement}{
\fancyhf{}
\thispagestyle{fancy}
\fancyhead[C]{大连海事大学{\headerinHEADER}学位论文}
\fancyfoot{}
~\vspace{1em}
\metaAuthorizationStatement
\if@dlmuthesis@MAlaw %【硕士-法学/法律】
  \phantomsection
  \addcontentsline{toc}{section}{大连海事大学学位论文授权使用声明}
\fi
\if@dlmuthesis@printed %打印模式下才要换页
  \nextpages{single}
\fi
}
%% ================================================== %

%% --------------- 原创性 + 授权使用 --------------- %
\newcommand{\OriginalityANDAuthorization}{
\if@dlmuthesis@MAmarxism %【硕士-马克思主义理论】
  \thispagestyle{fancy}
  \fancyhead[C]{~}
  \fancyfoot{}
\else\if@dlmuthesis@DOC %【博士】
  \thispagestyle{fancy}
  \fancyhead[C]{~}
  \fancyfoot{}
\else\if@dlmuthesis@DOClaw %【博士-法学/法律】
  \thispagestyle{fancy}
  \fancyhead[C]{~}
  \fancyfoot{}
\else\if@dlmuthesis@DOCmarxism %【博士-马克思主义理论】
  \thispagestyle{fancy}
  \fancyhead[C]{~}
  \fancyfoot{}
\fi\fi\fi\fi
~\vspace{-30bp}
\metaOriginalityStatement
~\vspace{-1em}
\metaAuthorizationStatement
\nextpages{single}
}
%% ================================================== %
% ============================================================ %


% --------------- 钩子 --------------- %
%% ----- 全文行间距 ----- %
\if@dlmuthesis@MAlaw %【硕士-法学/法律】
  \AtBeginDocument{\renewcommand{\baselinestretch}{1.5}}
\else\if@dlmuthesis@DOClaw %【博士-法学/法律】
  \AtBeginDocument{\renewcommand{\baselinestretch}{1.5}}
\else
  \AtBeginDocument{\renewcommand{\baselinestretch}{1.25}}
\fi\fi
%% ==================== %

%% --------------- 参考文献列表前后的样式设置 --------------- %
\AddToHook{env/thebibliography/before}[add_to_toc]{
  \phantomsection
  \addcontentsline{toc}{section}{\ValOfBibname}
  \vspace*{0pt}
}

\if@dlmuthesis@MAlaw %【硕士-法学/法律】
  \AddToHook{env/thebibliography/begin}{
    \AddToHook{cmd/subsection/before}[subsection_in_bib]{
      \addtocontents{toc}{\protect\setcounter{tocdepth}{0}}
      \ctexset{
        subsection={
          format = {\zihao{-4}\bfseries},
          name={,、},
          aftername={},
          number={\chinese{subsection}},
          indent = {1em}
        }
      }
      \makeatletter
      \global\setcounter{NAT@ctr}{0}
      \makeatother
      \addtocontents{toc}{\protect\setcounter{tocdepth}{1}}
    }
    \AddToHook{cmd/subsubsection/before}[subsubsection_in_bib]{
      \addtocontents{toc}{\protect\setcounter{tocdepth}{0}}
      \ctexset{
        subsubsection={
          format = {\zihao{-4}\bfseries},
          name={（,）},
          aftername={},
          number={\chinese{subsubsection}},
          indent = {1em}
        }
      }
      \makeatletter
      \global\setcounter{NAT@ctr}{0}
      \makeatother
      \addtocontents{toc}{\protect\setcounter{tocdepth}{1}}
    }
  }
\else\if@dlmuthesis@MAmarxism %【硕士-马克思主义理论】
  \AddToHook{env/thebibliography/begin}{
      \AddToHook{cmd/subsection/before}[subsection_in_bib]{
        \addtocontents{toc}{\protect\setcounter{tocdepth}{0}}
        \ctexset{
          subsection={
            format = {\zihao{-4}\bfseries},
            name={,、},
            aftername={},
            number={\chinese{subsection}},
            indent = {1em}
          }
        }
        \makeatletter
        \global\setcounter{NAT@ctr}{0}
        \makeatother
        \addtocontents{toc}{\protect\setcounter{tocdepth}{1}}
      }
      \AddToHook{cmd/subsubsection/before}[subsubsection_in_bib]{
        \addtocontents{toc}{\protect\setcounter{tocdepth}{0}}
        \ctexset{
          subsubsection={
            format = {\zihao{-4}\bfseries},
            name={（,）},
            aftername={},
            number={\chinese{subsubsection}},
            indent = {1em}
          }
        }
        \makeatletter
        \global\setcounter{NAT@ctr}{0}
        \makeatother
        \addtocontents{toc}{\protect\setcounter{tocdepth}{1}}
      }
  }
  \AddToHook{env/thebibliography/end}{
    \RemoveFromHook{cmd/subsection/before}[subsection_in_bib]
    \RemoveFromHook{cmd/subsubsection/before}[subsubsection_in_bib]
  }
\else\if@dlmuthesis@DOClaw %【博士-法学/法律】
  \AddToHook{env/thebibliography/begin}{
    \AddToHook{cmd/subsection/before}[subsection_in_bib]{
      \addtocontents{toc}{\protect\setcounter{tocdepth}{0}}
      \ctexset{
        subsection={
          format = {\zihao{-4}\bfseries},
          name={,、},
          aftername={},
          number={\chinese{subsection}},
          indent = {1em}
        }
      }
      \makeatletter
      \global\setcounter{NAT@ctr}{0}
      \makeatother
      \addtocontents{toc}{\protect\setcounter{tocdepth}{1}}
    }
    \AddToHook{cmd/subsubsection/before}[subsubsection_in_bib]{
      \addtocontents{toc}{\protect\setcounter{tocdepth}{0}}
      \ctexset{
        subsubsection={
          format = {\zihao{-4}\bfseries},
          name={（,）},
          aftername={},
          number={\chinese{subsubsection}},
          indent = {1em}
        }
      }
      \makeatletter
      \global\setcounter{NAT@ctr}{0}
      \makeatother
      \addtocontents{toc}{\protect\setcounter{tocdepth}{1}}
    }
  }
  \AddToHook{env/thebibliography/end}{
    \RemoveFromHook{cmd/subsection/before}[subsection_in_bib]
    \RemoveFromHook{cmd/subsubsection/before}[subsubsection_in_bib]
  }
\else\if@dlmuthesis@DOCmarxism %【博士-马克思主义理论】
  \AddToHook{env/thebibliography/begin}{
    \AddToHook{cmd/subsection/before}[subsection_in_bib]{
      \addtocontents{toc}{\protect\setcounter{tocdepth}{0}}
      \ctexset{
        subsection={
          format = {\zihao{-4}\bfseries},
          name={,、},
          aftername={},
          number={\chinese{subsection}},
          indent = {1em}
        }
      }
      \makeatletter
      \global\setcounter{NAT@ctr}{0}
      \makeatother
      \addtocontents{toc}{\protect\setcounter{tocdepth}{1}}
    }
    \AddToHook{cmd/subsubsection/before}[subsubsection_in_bib]{
      \addtocontents{toc}{\protect\setcounter{tocdepth}{0}}
      \ctexset{
        subsubsection={
          format = {\zihao{-4}\bfseries},
          name={（,）},
          aftername={},
          number={\chinese{subsubsection}},
          indent = {1em}
        }
      }
      \makeatletter
      \global\setcounter{NAT@ctr}{0}
      \makeatother
      \addtocontents{toc}{\protect\setcounter{tocdepth}{1}}
    }
  }
  \AddToHook{env/thebibliography/end}{
    \RemoveFromHook{cmd/subsection/before}[subsection_in_bib]
    \RemoveFromHook{cmd/subsubsection/before}[subsubsection_in_bib]
  }
\fi\fi\fi\fi
%% ======================================================= %

%% ---------- 硕博论文中，附录章节标题需居中对齐，但全文是居左 ---------- %
%% ----- 特别的，博士论文中，奇数页页眉为每部分名称，偶数页为论文中文题目 ----- %
\if@dlmuthesis@BAstem %【本科-理工科】
  \AddToHook{env/appendices/begin}[title_fontzise_in_appendix]{
    \pagestyle{plain} %《手册》要求：从附录页开始，去掉页眉
    \ctexset{
      section = {
        format = {\zihao{4}\bfseries},
        name = {附录~,},
        number = {\arabic{section}},
        beforeskip=0.5ex,
        afterskip=0.5ex,
      }
    }
    \pagenumbering{arabic} %《手册》要求：摘要部分页码单独计数  
    \zihao{5}
  }
  \AddToHook{env/appendices/end}{
    \RemoveFromHook{env/appendices/begin}[title_fontzise_in_appendix]
  }
\else\if@dlmuthesis@BAhumanities %【本科-人文社科】
  \AddToHook{env/appendices/begin}[title_fontzise_in_appendix]{
    \pagestyle{plain} %《手册》要求：从附录页开始，去掉页眉
    \ctexset{
      section = {
        format = {\zihao{4}\bfseries},
        name = {附录~,~~},
        number = {\arabic{section}},
        beforeskip=0.5ex,
        afterskip=0.5ex,
      }
    }
    \pagenumbering{arabic} %《手册》要求：摘要部分页码单独计数  
    \zihao{5}
  }
  \AddToHook{env/appendices/end}{
    \RemoveFromHook{env/appendices/begin}[title_fontzise_in_appendix]
  }
\else\if@dlmuthesis@MA %【硕士】
  \AddToHook{env/appendices/begin}[title_fontzise_in_appendix]{
    \ctexset{
      section = {
        format = \zihao{-3}\heiti\centering,
        name = {附录~,},
        number = {\thesection},
        beforeskip=1ex,
        afterskip=1ex,
      }
    }
    \zihao{-4}
  }
  \AddToHook{env/appendices/end}{
    \RemoveFromHook{env/appendices/begin}[title_fontzise_in_appendix]
  }
\else\if@dlmuthesis@MAlaw %【硕士-法学/法律】
  \AddToHook{env/appendices/begin}[title_fontzise_in_appendix]{
    \ctexset{
      section = {
        format = \zihao{-3}\heiti\centering,
        name = {附录~,~~},
        number = {\arabic{section}},
      }
    }
    \zihao{-4}
  }
  \AddToHook{env/appendices/end}{
    \RemoveFromHook{env/appendices/begin}[title_fontzise_in_appendix]
  }
\else\if@dlmuthesis@MAmarxism %【硕士-马克思主义理论】
  \AddToHook{env/appendices/begin}[title_fontzise_in_appendix]{
    \ctexset{
      section = {
        format = \zihao{-3}\heiti\centering,
        name = {附录,},
        aftername = {\hspace{1em}},
      }
    }
    \zihao{-4}
  }
  \AddToHook{env/appendices/end}{
    \RemoveFromHook{env/appendices/begin}[title_fontzise_in_appendix]
  }
\else\if@dlmuthesis@DOC %【博士】
  \AddToHook{env/appendices/before}[header_in_appendix]{
    \fancyhead[COH]{\zihao{5}附录}
    \fancyhead[CEH]{\zihao{5}\dlmuthesis@tokens@cntitle}
  }
  \AddToHook{env/appendices/begin}[title_fontzise_in_appendix]{
    \ctexset{
      section = {
        format = \zihao{-3}\heiti\centering,
        name = {附录~,},
        number = {\thesection},
      }
    }
    \zihao{-4}
  }
  \AddToHook{env/appendices/end}{
    \RemoveFromHook{env/appendices/begin}[title_fontzise_in_appendix]
  }
\else\if@dlmuthesis@DOClaw %【博士-法学/法律】
  \AddToHook{env/appendices/begin}[title_fontzise_in_appendix]{
    \ctexset{
      section = {
        format = \zihao{-3}\heiti\centering,
        name = {附录~,~~},
        number = {\arabic{section}},
      }
    }
    \zihao{-4}
  }
  \AddToHook{env/appendices/end}{
    \RemoveFromHook{env/appendices/begin}[title_fontzise_in_appendix]
  }
\else\if@dlmuthesis@DOCmarxism %【博士-马克思主义理论】
  \AddToHook{env/appendices/begin}[title_fontzise_in_appendix]{
    \ctexset{
      section = {
        format = \zihao{-3}\heiti\centering,
        name = {附录,},
        aftername = {\hspace{1em}},
      }
    }
    \zihao{-4}
  }
  \AddToHook{env/appendices/end}{
    \RemoveFromHook{env/appendices/begin}[title_fontzise_in_appendix]
  }
\fi\fi\fi\fi\fi\fi\fi\fi
%% ================================================================= %
% ================================================================================ %


% ---------- 宏包冲突检测 ---------- %
\makeatletter
\newcommand{\ConflictChecking}[2]{
  \@ifpackageloaded{#1}{
    \ClassError{dlmuthesis}{One CONFLICT between #2 and #1}{Do not upload package #1}}{}
}
\makeatother

\AtBeginDocument{
  \ConflictChecking{ntheorem}{amsthm}
  \ConflictChecking{biblatex}{natbib}
  \ConflictChecking{subfigure}{subcaption}
}
% =================================== %

