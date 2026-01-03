
<p align="center">
  <img src="./.github/dlmuthesis-logo.png" alt="<experimental content>" width="70%" />
</p>

<p align="center"><strong>DLMUTHESIS: 大连海事大学学位论文 LaTeX 模板</strong></p>

<p align="center"><strong>v3.0.0-beta.6 (2026/01/03)</strong></p>

<p align="center">
  Hank Lo, <a href="mailto:yhlaozero2@163.com">yhlaozero2@163.com</a>
</p>

<p align="center">QQ交流群：976053605</p>

> 点击 [此处](https://github.com/JohnsonLo00/dlmubachelorthesis/) 跳转至前驱版本dlmubachelorthesis.

## 许可说明

本模板遵守[The LaTeX Project Public License](https://www.latex-project.org/lppl/lppl-1-3c/)。未经允许，禁止任何人将本模板用于商业用途。


## 免责声明

在将本模板用于学位论文的写作之前，请务必与导师或相关负责人做好沟通（例如，师生间协作的接受程度，提交与存档时的格式许可），以免产生不必要的麻烦。


---

## 概述

DLMUTHESIS 是非官方版大连海事大学 (本硕博) 学位论文 LaTeX 模板。其严格按照大连海事大学学位论文相关规范进行开发与维护，适用于海大学子学位论文的编写，也供各位用户研究使用。


## 特点

- **格式与内容分离**
  - 格式已预设，让用户投入到论文内容本身
  - 让论文编写简化为文本的增删查改
- **各类编号自动化**
  - 省去手动编号繁琐/方法难、“删一个动全文”等麻烦
  - 解决各类交叉引用的“方法难”
- **完备的数学公式生态**
- **跨平台（操作系统、网络端）兼容**
- **具备较友好的高阶工具适配性**
  - 对科学软件、AI Agent 的导出内容的迁移友好


## 模板获取方式

目前可从以下平台获取本模板：
- [GitHub](https://github.com/JohnsonLo00/dlmuthesis) (当前版本：v3.0.0-beta.6[最新])
- [Gitee](https://gitee.com/jhonson-lo/dlmuthesis-backuped) (当前版本：v3.0.0-beta.6[最新])
- [Overleaf](https://cn.overleaf.com/latex/templates/dlmuthesis-latex-thesis-template-for-dalian-maritime-university/rmstrjjrthwf) (当前版本：v3.0.0-beta.6[最新])
- [TeXPage](https://www.texpage.com/zh/template/b32e0cb4-ef09-4ee2-b4ff-ca92b2ed3665) (当前版本：v3.0.0-beta.6[最新])

其中，可在[GitHub Releases](https://github.com/JohnsonLo00/dlmuthesis/releases)或[Gitee Releases](https://gitee.com/jhonson-lo/dlmuthesis-backuped/releases)板块下载模板；Overleaf 与 TeXPage 上可通过在模板库中搜索“`dlmuthesis`”(作者为 `HankLo`) 来获取模板。特别的，Overleaf 与 TeXPage 存在审核机制，新模板上线时间一般晚于所声明的时间。


## 文件组成

```
dlmuthesis/
├─codes/            存放[程序代码]文件. 需写入论文中的代码可以通过文件导入的命令来实现写入
├─figures/          存放[插图]文件. 需添加到论文中的图片可以通过文件导入的命令来实现写入
│  ├─<各项目的插图文件夹>/
│  ├─logo/          存放论文封面页的[logo]图片，切勿挪动
│  └─signatures/    存放硕博论文中作者与导师的[签名]图片
├─mainbody/         存放[正文各章节]对应的tex文件. 论文的每个章节均可分为不同的tex文件进行编写，然后在主tex文件(即 main_<x>.tex)中统一导入
├─misc/             存放闲置文件. 特别地，部分[学院单独备案规范]下的学位论文示例保存于此处
├─refs/             存放[参考文献数据库文件]. 参考文献列表可以通过bib/tex文件导入的命令来生成
│
│
├─guidebook_of_dlmuthesis.pdf   [使用手册]
├─dlmuthesis.cls                [文档类]文件
├─main_<type>.tex               各学位模式示例的[主文档]
├─latexmkrc                     [latexmk配置]文件
├─dlmuthesis-box.bat            模板使用辅助程序(Windows)
├─dlmuthesis-box.sh             模板使用辅助程序(macOS, Ubuntu)
├─LICENSE                       开源协议文件（The LaTeX Project Public License）
└─dlmuthesis-bachelor.bst       [参考文献样式]文件. 用于控制参考文献列表的格式
```


## 兼容性说明

目前 (可能) 不适用的学科专业如下：
- 面向来华留学生的所有学科专业
- 外语类专业
- 学院内部有单独备案的论文规范、但未被涵盖在本模板学位模式中的专业

> 有单独备案但未被本模板覆盖，或是因为 Hank 没能获取到对应的论文规范文件，又或是因为该论文规范的格式要求较为独特、无法与现有已覆盖到的学位模式进行统一管理。
> 
> **对单独备案的论文规范的开发将长期作为本模板的更新计划之一**。如有个别学科专业单独备案的论文规范希望被引进开发，欢迎联系 Hank。

软件配置要求如下：
- LaTeX 发行版：2022年版及以上


## 快速开始

可直接选择文件夹中的一个主文档 `main_<type>.tex`进行编译，可选择的编译方案为：
- XeLaTeX - XeLaTeX (仅针对学位模式 `BAhumanities`)
- XeLaTeX - BiBTeX - XeLaTeX - XeLaTeX
- Latexmk

特别的，可以使用 **dlmuthesis-box** 新建空白项目、进行编译。运行脚本即可进行交互。


## 如何处理错误

当用户在使用模板的过程中遇到 bug 或者发现与相关论文规范不符的地方，可按照如下
顺序逐步尝试：
1. 手动排查；
2. 查阅 [guidebook_of_dlmuthesis.pdf](https://github.com/JohnsonLo00/dlmuthesis/blob/main/guidebook_of_dlmuthesis.pdf)；
3. 将模板升级到最新版本；
4. 在 QQ 群中发起提问；
5. 将情况说明提交到[Github Issues](https://github.com/JohnsonLo00/dlmuthesis/issues)或[Gitee Issues](https://gitee.com/jhonson-lo/dlmuthesis-backuped/issues)。


## 更新日志

- **3.0.0-beta.6 (变更类型：问题修正), 2026-01-03**
  - **Changed**:
    - 将定理环境的前后间距设为弹性距离，使定理内容与前后正文分开、避免两者混淆
  - **Fixed**:
    - 更正图表标题的对齐方式 ([#5](https://github.com/JohnsonLo00/dlmuthesis/issues/5))
    - 解决打印模式下目录部分可能会出现多余空白页的问题
    - 解决了通用列表环境（即：`enumerate(*)`,`itemize(*)`,`description(*)`）中标签与条目文本间距不规律的问题
- **v3.0.0-beta.5 (变更类型：功能变更), 2025-11-01**
  - **Added**:
    - 引入了本科专用的文献翻译的配置
    - 新增了模板专用 logo 命令`\DlmuThesis`，供各位读者把玩
  - **Changed**:
    - 修改了论文信息中输入学号的命令
    - 调整了本科论文封面中“本科毕业论文”字样的字体
    - 取消了 changes 宏包的介绍与预使用
  - **Fixed**:
    - 解决了其他一些已知问题
- **v3.0.0-beta.4 (变更类型：功能变更), 2025-04-25**
  - **Changed**:
    - 去除了目录中部分标题的字间距 ([#4]( https://github.com/JohnsonLo00/dlmuthesis/issues/4))
- **v3.0.0-beta.3 (变更类型：问题修正), 2025-04-20**
  - **Added**:
    - 在手册中添加了关于脚注缩进方式设置的说明
  - **Fixed**:
    - 解决了证明环境中因修改环境名称而导致预设格式失效（首行缩进、正体、粗体）的问题 ([#3]( https://github.com/JohnsonLo00/dlmuthesis/issues/3))
    - 解决了其他一些已知问题
- **v3.0.0-beta.2 (变更类型：功能变更), 2025-03-30**
  - **Changed**:
    - 修改目录中章节标题的样式 ([#1](https://github.com/JohnsonLo00/dlmuthesis/issues/1))
    - 设置证明环境为首行缩进两字符
    - 将多个连续的文献引用编号处理为区间形式
    - 优化了 dlmuthesis-box 输入功能的规范性检测
  - **Fixed**:
    - 解决了其他一些已知问题
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
- **v2.0.1, 2024-09-27**
  - 修改了外置的宋体字体文件
- **v2.0, 2024-07-10**
  - 将部分底层代码封装到cls文件中，避免读者误触导致格式错误，且增加修改区代码的简洁性
  - 取消了装订页、标题页的使用
  - 增加了文科类专业的本科毕业论文模板
  - 删去了外置的宏包文件packages/fixdiff.sty（该宏包已引入了TeXLive2023及之后版本）
  - 优化了其他若干项功能
- **v1.0, 2024-06-01**
  - 创建本模板