
<font size="12">D</font>LMU<font size="12">T</font>HESIS
===
===
**大连海事大学本硕博学位论文$\LaTeX$模板**

**JL**, [yhlaozero2@163.com](yhlaozero2@163.com)
**v3.0.0 (2025/01/15)**

***

#### 摘要

现发布非官方版2024大连海事大学本科毕业论文模板. 本模板严格按照《大连海事大学毕业设计（论文）工作手册》（往后简称《手册》）进行设计，适用于DLMU学子本科毕业论文的编写，也供各位读者研究使用. 


## 模板介绍

dlmubachelorthesis(**D**a**l**ian **M**aritime **U**niversity **Bachelor Thesis** Template)，即2024大连海事大学本科毕业设计论文模板，诞生于2024年春天前际、初步成熟于当年夏天. 本模板创始人JL已使用本模板顺利完成毕业论文的编写、通过了毕业设计. 现将本模板发布，让DLMU学子**省去繁琐的格式调试、专注于论文内容的编写**.

本模板尚未完全成熟，仍有诸多需要改进之处. 当读者在使用模板的过程中遇到bug或者发现与《手册》要求不符的地方，建议按照如下顺序寻求解决方案：

1.  查阅`gbk_of_dlmubachelorthesis.pdf`；
2.  查阅相关手册（e.g. texdoc）
3.  Retrieving on the Internet；
4.  GitHub：将具体情况说明提交到[Issues](https://github.com/JohnsonLo00/dlmubachelorthesis/issues)；
5.  联系JL，提供具体情况说明. 

本模板处于受维护状态，下一步大致的更新方向如下：

- 完善**原有设计**（结合各位读者提交的具体情况说明，或DLMU学子、老师所提供的新一年《手册》）

- 开发DLMU**硕士、博士**的学位论文（但由于JL已毕业、无法再获取学校方面的硕博学位论文工作手册或者格式规范的相关文件，因此如果方便，欢迎DLMU的硕博士、老师们提供）

在此欢迎各位读者以及开发者献计、参与到本模板的后续开发中！

## 模板许可说明

本模板的发布遵守[The LaTeX Project Public License（LPPL）](https://www.latex-project.org/lppl/lppl-1-3c/). 禁止任何人将本模板用于任何商业用途. 

## 模板获取方式

目前可从以下平台获取本模板：

-   [GitHub](https://github.com/JohnsonLo00/dlmubachelorthesis)

-   [Gitee](https://gitee.com/jhonson-lo/dlmubachelorthesis)

-   [Overleaf](https://www.overleaf.com/latex/templates/dlmubachelorthesis-dalian-maritime-university-bachelor-thesis-latex-template/jmhcvgfckdyy)

- [TeXPage](https://www.texpage.com/template/7227497e-4aa0-4a57-b11a-abec001c8533)

## 模板运行前的配置

为成功编译出想要的PDF文件，读者的设备需具备如下组件：

- **LaTeX发行版**(相当于源数据包、引擎)：[TeXLive](https://mirrors.tuna.tsinghua.edu.cn/CTAN/systems/texlive/Images/)(for Windows), [MacTeX](https://mirrors.tuna.tsinghua.edu.cn/CTAN/systems/mac/mactex/)(for MacOS), etc
- **编辑器**(tex文件的查看、编辑、编译)：[WinEdit](https://www.winedt.com/download.html)(for Windows), [TeXShop](https://pages.uoregon.edu/koch/texshop/)(for MacOS), TeXworks(下载安装TeXLive后自动安装), TeXstudio, VSCode, etc
- **PDF查看器**(查看编辑器编译成功后所得到的PDF文件)：[SumatraPDF](https://www.sumatrapdfreader.org/download-free-pdf-viewer)(for
    Windows), etc.

JL已通过电脑本地、OverLeaf、TeXPage成功实现了本模板的使用：

- 电脑本地：Windows10, TeXLive2024, WinEdit/TeXstudio, SumatraPDF

- OverLeaf：普通项目，编译器选择XeLaTeX，主文档选择 main_STEM.tex 或 main_humanities.tex

- TeXPage：普通项目，编译器选择XeLaTeX，主文件选择 main_STEM.tex 或 main_humanities.tex

其他的方案组合尚未实践，如遇问题，必要时可提交具体情况说明. 

## 文件组成

模板压缩包内部的文件组成如下：

```
|- codes/ 用于放置源代码文件. 需写入论文中的代码可以通过文件导入的命令来
|         实现写入
|- figures/ 用于放置图片文件. 需插入论文中的图片可以通过文件导入的命令来
|           实现插入
|-- logo/ 用于放置论文封面页的logo文件，切勿挪动
|--- LogoAndName_dlmu.png：论文封面页的logo文件
|- STEM/ 用于放置理工科专业模式下的图片文件
|-- fig_chx/ 用于放置第x章内的图片文件
|- humanities/ 用于放置文科类专业模式下的图片文件
|-- fig_chx/ 用于放置第x章内的图片文件
|- mainbody/ 用于放置正文各章节的子tex文件. 论文的每个章节均可分为不同的tex
|            文件进行编写，最后再汇总导入一个tex文件中(即文件main_x.tex)
|-- abstract_zh.tex：摘要中文版
|-- abstract_en.tex：摘要英文版
|-- chx.tex：第x章
|-- conclusions.tex：结论
|-- acknowledgements.tex：致谢
|-- appendiceS.tex：附录
|- packages/ 用于放置第三方宏包文件. 一部分宏包不跟随LaTeX 发行版下载到
|            本地，因此需要另外导入
|- refs/ 用于防止参考文献数据库文件. 参考文献列表可以通过bib文件导入的命令
|        来生成
|-- refs_humanities.bib：文科类专业模式下的参考文献数据库文件
|-- refs_STEM.bib：理工科专业模式下的参考文献数据库文件
gbk_of_dlmubachelorthesis.pdf：本模板的使用指北
dlmubachelorthesis.cls：本模板的文档类文件
LICENSE：The LaTeX Project Public License（LPPL）
main_humanities.tex：文科类专业模式下的中枢tex文件. 聚集各章节的tex文件为
                     一体
main_humanities.pdf：由main_humanities.tex编译生成的PDF文档
main_STEM.tex：理工科专业模式下的中枢tex文件. 聚集各章节的tex文件为一体
main_STEM.pdf：由main_STEM.tex编译生成的PDF文档
simsun.ttc：宋体字体文件. 非Windows平台不一定支持宋体，
            因此需另外调用专门的字体文件
thuthesis-bachelor.bst：参考文献样式文件. 用于控制参考文献列表的格式
```

## 部分学科高相关度宏包引入

下面针对**部分学科所涉及内容在LaTeX中的实现方式**进行列举参考。以下宏包、命令皆已引入本模板。

-   数学
    -   组合数（命令）：`\binom{m}{n}`
-   物理学
    -   量子力学算符（宏包）：[braket](https://mirror.bjtu.edu.cn/CTAN/macros/latex/contrib/braket/braket.pdf)
    -   普朗克常量（命令）：`\hbar`
    -   量子电路绘制（宏包）：[qcircuit](https://mirrors.sustech.edu.cn/CTAN/graphics/qcircuit/qcircuit.pdf)
-   化学（[辅助资料](https://github.com/latexstudio/LaTeX_in_Chemistry)）
    -   化学式、反应方程的书写（宏包）：[mhchem](https://mirrors.nju.edu.cn/CTAN/macros/latex/contrib/mhchem/mhchem.pdf)
    -   结构式绘制（宏包）：[chemfig](https://mirror.nyist.edu.cn/CTAN/macros/generic/chemfig/chemfig-en.pdf)
-   计算机科学
    -   算法伪代码（宏包）：[algorithm2e](https://mirrors.cqu.edu.cn/CTAN/macros/latex/contrib/algorithm2e/doc/algorithm2e.pdf)
    -   神经网络图示绘制（宏包）：[TikZ](https://mirrors.ustc.edu.cn/CTAN/graphics/pgf/base/doc/pgfmanual.pdf), [tikz-network](https://mirror.bjtu.edu.cn/CTAN/graphics/pgf/contrib/tikz-network/tikz-network.pdf)
-   工程
    -   数字电路绘制（宏包）：[CircuiTikZ](https://mirrors.ustc.edu.cn/CTAN/graphics/pgf/contrib/circuitikz/doc/circuitikzmanual.pdf)

## 修改日志

#### v2.0, 2024-07-10

-   将部分底层代码封装到cls文件中，避免读者误触导致格式错误，且增加修改区代码的简洁性

-   取消了装订页、标题页的使用

-   增加了文科类专业的本科毕业论文模板

-   删去了外置的宏包文件packages/fixdiff.sty（该宏包已引入了TeXLive2023及之后版本）

-   优化了其他若干项功能

#### v1.0, 2024-06-01

-   创建本模板