
# DLMUTHESIS

**大连海事大学学位论文 LaTeX 模板**

**JL**, [yhlaozero2@163.com](yhlaozero2@163.com)
**v3.0.0-beta (2025/01/15)**

QQ交流群：976053605

> 点击 [此处](https://github.com/JohnsonLo00/dlmubachelorthesis/) 跳转至前驱版本dlmubachelorthesis.

***

## 摘要

非官方版大连海事大学(本硕博)学位论文LaTeX模板dlmuthesis是dlmubachelorthesis的后继版本，严格按照大连海事大学学位论文相关规范完成开发，适用于海大学子学位论文的编写，也供各位读者研究使用. 

## 模板许可说明

本模板的发布遵守[The LaTeX Project Public License(LPPL)](https://www.latex-project.org/lppl/lppl-1-3c/)。未经允许，禁止任何人将本模板用于商业用途。

## 免责声明

在将本模板用于学位论文的写作与提交之前，请务必与导师或相关负责人做好沟通，以免产生不必要的麻烦。

## 模板概述

dlmuthesis(LaTeX **Thesis** Template for **D**a**l**ian **M**aritime
**U**niversity)，即大连海事大学学位论文LaTeX模板，起源于2024年初首次发布的dlmubachelorthesis，现如今初步成为集本、硕、博一体的较为完整的（毕业或）学位论文写作解决方案。

模板创始人JL已使用本模板的初代版本顺利完成了毕业论文的编写、通过了毕业设计。历经不断的改进优化，dlmuthesis致力于让海大学子**省去繁琐的格式调试、专注于论文内容的编写**.

当读者在使用模板的过程中遇到bug或者发现与相关论文规范不符的地方，建议按照如下顺序逐步尝试、直到解决为止：

1.  自己动手排查；

2.  查阅 `guidebook_of_dlmuthesis.pdf`；

3.  将模板升级到最新版本；

4.  将具体情况说明提交到Github/Gitee的Issues。


## 模板兼容性说明

目前(可能)不适用的学科专业如下：
- 外语类专业
- 学院内部有单独备案的论文规范、但未被涵盖在本模板学位模式中的专业

> 有单独备案但未被本模板覆盖，或是因为JL没能获取到该论文规范文件，又或是因为该论文规范的格式要求较为独特、无法与现有已覆盖到的学位模式进行统一管理。
> 
> 对单独备案的论文规范的开发将长期作为本模板的更新计划之一。如有个别学科专业单独备案的论文规范希望被引进开发，欢迎联系JL。

软件配置要求如下：
- LaTeX 发行版：2022年版及以上

可能产生错误的宏包、环境或命令如下：
- `ntheorem` 宏包：与 `amsthm` 宏包冲突，切勿导入
- `biblatex` 宏包：与 `natbib` 宏包冲突，切勿导入
- `subfigure` 宏包：与 `subcaption` 宏包冲突，切勿导入
- `circledtext` 宏包：如使用了脚注模式设定命令 `\footnotemode` 中的模式4(即:带圈数字型脚注)，或者其他位置使用了 `\circledtext` 命令，则需要确保该宏包的版本为v1.1.1及以上，否则需要手动更新。上述两种情况均未涉及的可忽略
- `enumerate*,itemize*,description*` 环境：在条目字数较少的情况下，会在标签与文本之间产生多余空白
  > 要想使用行内列表环境，则在导言区中定义新的行内列表环境即可：
  > ```latex
  > \newlist{<新环境名称>}{enumerate*}{<序号层次的最大深度值>}
  > % 可自行按需添加itemize*,description*类型下的定义
  > ```
  > 然后在正文中的指定位置使用：
  > ```latex
  > \begin{<新环境名称>}
  > \item{}
  >   %...
  > \item{}
  > \end{<新环境名称>}
  > ```


## 模板获取方式

目前可从以下平台获取本模板：
-   [GitHub](https://github.com/JohnsonLo00/dlmuthesis)
-   [Gitee](https://gitee.com/jhonson-lo/dlmuthesis)
-   [Overleaf]()：可在模板库中搜索"dlmuthesis"(作者为JohnsonLo)
-   [TeXPage]()：可在模板库中搜索"dlmuthesis"(作者为JohnsonLo)

其中，GitHub与Gitee上可在**Release**板块获取各版本模板的下载路径。


## 文件组成

```
./codes/ 放置源[代码]文件. 需写入论文中的代码可以通过文件导入的命令来实现写入
./figures/ 放置[图片]文件. 需插入论文中的图片可以通过文件导入的命令来实现插入
|
└───/logo/ 放置论文封面页的[logo]图片，切勿挪动
    /signatures/ 放置硕博论文中作者与导师的[签名]图片
    /<type>/ 放置各学位模式下的图片
./mainbody/ 放置[正文各章节]的子tex文件. 论文的每个章节均可分为不同的
            tex文件进行编写，最后再汇总导入一个tex文件中(即文件
            main_<x>.tex)
./misc/ 放置闲置文件. 特别地，部分[学院单独备案规范]下的
        学位论文示例保存于此处
./ refs/ 放置[参考文献数据库文件]. 参考文献列表可以通过bib/tex文件导入的命令来生成
====================================================================
guidebook_of_dlmuthesis.pdf 本模板的[使用手册]
dlmuthesis.cls 本模板的[文档类]文件
main_<type>.tex 各学位模式下的论文示例[主文档]
latexmkrc latexmk 配置文件
dlmuthesis-box.bat 模板使用辅助程序(Windows)
dlmuthesis-box.sh 模板使用辅助程序(macOS, Ubuntu)
LICENSE 开源协议文件 The LaTeX Project Public License（LPPL）
dlmuthesis-bachelor.bst：参考文献样式文件. 用于控制参考文献列表的格式
```

## 更新日志

- **Unreleased**
- **v3.0.0-beta, 2025-01-15**
  - **Added**:
    - 引入了本科论文中论文题目横线数量设置的接口
    - 引入了硕士学位论文的模式（通用或单独备案）
    - 引入了博士学位论文的模式（通用或单独备案）
    - 引入了基于latexmk的自动化编译方法
  - **Changed**:
    - 修改了程序代码的高亮样式
    - 进一步封装了部分命令与样式设置
  - **Removed**:
    - 取消了部分命令的自定义、重定义，保留读者使用的自由性
    - 取消了学科高相关度宏包在文档类中的预导入，保留读者使用的灵活性
    - 取消了外置字体文件的预设
  - **Fixed**:
    - 解决了圆圈数字型脚注数值范围受限的问题
    - 解决了PDF书签定位不准确的问题
    - 解决了一些已知的杂碎问题
- **v2.0, 2024-07-10**
  - 将部分底层代码封装到cls文件中，避免读者误触导致格式错误，且增加修改区代码的简洁性
  - 取消了装订页、标题页的使用
  - 增加了文科类专业的本科毕业论文模板
  - 删去了外置的宏包文件packages/fixdiff.sty（该宏包已引入了TeXLive2023及之后版本）
  - 优化了其他若干项功能
- **v1.0, 2024-06-01**
  - 创建本模板