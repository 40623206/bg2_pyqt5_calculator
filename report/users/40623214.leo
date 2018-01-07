<?xml version="1.0" encoding="utf-8"?>
<!-- Created by Leo: http://leoeditor.com/leo_toc.html -->
<leo_file xmlns:leo="http://leoeditor.com/namespaces/leo-python-editor/1.1" >
<leo_header file_format="2" tnodes="0" max_tnode_index="0" clone_windows="0"/>
<globals body_outline_ratio="0.5" body_secondary_ratio="0.5">
	<global_window_position top="50" left="50" height="500" width="700"/>
	<global_log_window_position top="0" left="0" height="0" width="0"/>
</globals>
<preferences/>
<find_panel_settings/>
<vnodes>
<v t="ahshoe.20161120121808.1"><vh>@settings</vh>
<v t="ahshoe.20170315212615.1"><vh>@data qt-gui-plugin-style-sheet</vh></v>
<v t="ahshoe.20170315212626.1"><vh>@string initial_split_orientation = horizontal</vh></v>
</v>
<v t="40323230.20170123213451.1"><vh>@button Report pdf</vh></v>
<v t="yen.20170429132400.1"><vh>協同著作規劃</vh></v>
<v t="leo.20171218141522.1"><vh>報告章節規劃</vh></v>
<v t="yen.20170429103742.1" a="E"><vh>@path ./../</vh>
<v t="yen.20170429103940.1" a="E"><vh>@path markdown</vh>
<v t="ahshoe.20170322182713.1"><vh>@edit reference.md</vh></v>
<v t="ahshoe.20170322181453.1"><vh>@edit refer.bib</vh></v>
<v t="leo.20171119234752.1" a="E"><vh>封面以及摘要</vh>
<v t="ahshoe.20161120122151.1" a="E"><vh>@clean cover_and_abstract.md</vh>
<v t="ahshoe.20170317115820.1"><vh>摘要</vh></v>
</v>
</v>
<v t="leo.20171119234822.1" a="E"><vh>各章節內容</vh>
<v t="yen.20170429214845.1" a="E"><vh>@path paragraph</vh>
<v t="yen.20170429214838.1" a="E"><vh>@clean introduction.md</vh>
<v t="yen.20170429214838.3"><vh>前言內容</vh></v>
</v>
<v t="yen.20170429215041.1" a="E"><vh>@clean portable_system.md</vh>
<v t="yen.20170429215130.1"><vh>可攜程式系統介紹</vh></v>
</v>
<v t="yen.20170429215252.1" a="E"><vh>@clean python_introduction.md</vh>
<v t="yen.20170429215308.1"><vh>Python 程式語法介紹</vh></v>
</v>
<v t="yen.20170429215416.1" a="E"><vh>@clean pyqt5_introduction.md</vh>
<v t="yen.20170429215446.2"><vh>PyQt5 語法介紹</vh></v>
</v>
<v t="yen.20170429215617.1" a="E"><vh>@clean calculator.md</vh>
<v t="yen.20170429215851.1"><vh>計算機程式內容</vh></v>
</v>
<v t="yen.20170429215922.1" a="E"><vh>@clean discussion.md</vh>
<v t="yen.20170429220001.1"><vh>程式開發心得</vh></v>
</v>
<v t="yen.20170429220128.1" a="E"><vh>@clean results.md</vh>
<v t="yen.20170429220137.1"><vh>期末報告結論</vh></v>
</v>
<v t="yen.20170429220335.1" a="E"><vh>@clean appendix.md</vh>
<v t="yen.20170429220335.2"><vh>附錄</vh></v>
</v>
</v>
</v>
</v>
</v>
<v t="leo.20180107114241.1" a="E"><vh>Recovered Nodes</vh>
<v t="leo.20180107114241.2"><vh>Recovered node "程式開發心得" from @clean discussion.md</vh>
<v t="leo.20180107114241.3"><vh>old:程式開發心得</vh></v>
<v t="leo.20180107114241.4"><vh>new:程式開發心得</vh></v>
</v>
</v>
<v t="leo.20180107150818.2" a="E"><vh>Recovered Nodes</vh>
<v t="leo.20180107150818.3"><vh>Recovered node "計算機程式內容" from @clean calculator.md</vh>
<v t="leo.20180107150818.4"><vh>old:計算機程式內容</vh></v>
<v t="leo.20180107150818.5"><vh>new:計算機程式內容</vh></v>
</v>
</v>
</vnodes>
<tnodes>
<t tx="40323230.20170123213451.1">@language python
filename = "report"
import os, platform
# 更換目錄到 markdown 
os.chdir("./../markdown")

# 若在 Linux 環境則使用 ukai.ttc 系統字形
if platform.system().lower()=="linux": font = "ukai.ttc"
# 在 windows 環境使用 SimSun 字形
elif platform.system().lower()=="windows": font = "SimSun"
else: font = "Arial"
fontsize = "12"
margin = "1in"
# --pdf-engine 使用 xelatex
# lang 請參照 https://tools.ietf.org/html/bcp47, 這裡的 zh-cmn 為 Mandarin Chinese 國語
# -V lang=zh-cmn 為一組 key=value 對應的 Variable 設定
# -N 表示 Number section headings in LaTeX, ConTeXt, HTML, or EPUB output. By default, sections are not numbered.
settingFlag = "--pdf-engine=xelatex -V lang=zh-cmn -N --toc --highlight-style kate -V documentclass=report  --filter pandoc-fignos --filter pandoc-tablenos --template=template.tex -V \"CJKmainfont:{0}\" -V fontsize={1}pt -V geometry:margin={2} --bibliography=refer.bib --csl=ieee.csl".format(font, fontsize, margin)
g.es("---Pandoc---")

# 選擇所要納入的 Markdown 檔案, 不納入的檔案名稱前方加上  # 即可
chapter_list = " ".join("./paragraph/" + i for i in [
"introduction.md",
"portable_system.md", 
"python_introduction.md", 
"pyqt5_introduction.md", 
"calculator.md", 
"discussion.md", 
"results.md", 
])

# 若系統並未正確轉檔, 可以將 os.system 改為 g.es 表示要使用 Leo Editor 的 global 物件中的 echo string 將指令印在 log 區
# 然後複製指令, 然後在命令列視窗中的 markdown 目錄中執行, 就可以得到錯誤訊息
# 或許可以再從 https://stackoverflow.com/questions/26005583/return-value-of-x-os-system 中的建議改進此一指令
g.es(os.system("pandoc cover_and_abstract.md " + chapter_list + " reference.md -o ../pdf/report.pdf {}".format(settingFlag)))
g.es("pandoc cover_and_abstract.md " + chapter_list + " reference.md -o ../pdf/report.pdf {}".format(settingFlag))
g.es("PDF 轉換完畢")
g.es('-'*12)</t>
<t tx="ahshoe.20161120121808.1"></t>
<t tx="ahshoe.20161120122151.1">---
university_zh: '國立虎尾科技大學'
institute_zh: '機械設計工程系'
category_zh: '計算機程式 bg2 期末報告'
title_zh: 'PyQt5 事件導向計算器'
title_en: 'PyQt5 Event-Driven Calculator Project'
author:
- 設計一乙 40623204 張晏晴
- 設計一乙 40623206 邱妍蓁
- 設計一乙 40623214 吳家文
- 設計一乙 40623215 吳柏毅
- 設計一乙 40623249 李秉樺
- 設計一乙 40623251 鄧靖宣

advisor_zh: '嚴家銘'
date: '2017.12.18'
---

@others
</t>
<t tx="ahshoe.20170315212615.1">QTreeWidget {
    /* These apply to the selected item, but not to editing items.*/
    background-color: #ffffec; /* Leo's traditional tree color */
    selection-color: black; /* was white */
    selection-background-color: lightgrey;
    /* font-family: SansSerif; */
    /*font-family: DejaVu Sans Mono;*/
    font-family:YaHei Mono;
    /* 標題字型大小設定 */
    font-size: 20px;
    font-weight: normal; /* normal,bold,100,..,900 */
    font-style: normal; /* normal, italic,oblique */
 }

/* Headline edit widgets */
QTreeWidget QLineEdit {
    background-color: cornsilk;
    selection-color: white;
    selection-background-color: blue;
    /*font-family: DejaVu Sans Mono;*/    
    font-family:YaHei Mono;
    /* 沒有特別對應字型大小 */
    font-size: 20px;
    font-weight: normal; /* normal,bold,100,..,900 */
    font-style: normal; /* normal, italic,oblique */
}

/* The log panes */
QTextEdit {
    background-color: #f2fdff;
    selection-color: red;
    selection-background-color: blue;
    /* font-family: Courier New; */
    font-family:YaHei Mono;
    /* log font 大小 */
    font-size: 20px;
    font-weight: normal; /* normal,bold,100,..,900 */
    font-style: normal; /* normal, italic,oblique */
}

/* The body pane */
QTextEdit#richTextEdit {
    background-color: #fdf5f5; /* A kind of pink. */
    selection-color: white;
    selection-background-color: red;
    /*font-family: DejaVu Sans Mono;*/
    /* font-family: Courier New; */
    font-family:YaHei Mono;
    /* 內文字型大小 */
    font-size: 20px;
    font-weight: normal; /* normal,bold,100,..,900 */
    font-style: normal; /* normal,italic,oblique */
}

QLabel {
    font-family:YaHei Mono;'CherryPy', 'pytz', 'mako', 'beautifulsoup4', 'pymysql', 'peewee'
    /* 下方的 Minibuffer 標題字型大小 */
    font-size: 20px;
    font-weight: normal; /* normal,bold,100,..,900 */
    font-style: normal; /* normal,italic,oblique */
}

/* Editor labels */
QLineEdit#editorLabel {
    background-color: #ffffec;
    font-family:YaHei Mono;
    /* 沒有直接對應字型大小 */
    font-size: 20px;
    font-weight: normal; /* normal,bold,100,..,900 */
    font-style: normal; /* normal,italic,oblique */
    border: 2px;
    margin: 2px;
}</t>
<t tx="ahshoe.20170315212626.1">horizontal: body pane to the left
vertical: body pane on the botton</t>
<t tx="ahshoe.20170317115820.1">---
abstract: |
    這裡是摘要內容。A pipe character, followed by an indented block of text is treated as a literal block, in which newlines are preserved throughout the block, including the final newline.
    
    + 以 YAML 的方式插入。
    + The '+' indicator says to keep newlines at the end of text blocks.
    + 使用 Markdown 語法。
    + 前面使用加號
    
    本研究的重點在於 ...
---


</t>
<t tx="leo.20171119234752.1"></t>
<t tx="leo.20171119234822.1"></t>
<t tx="leo.20171218141522.1">標題頁 - 含報告標題、作者、日期與所屬單位
目錄 - 列出全文章節與所屬頁面連結
摘要 - 解釋報告編寫動機、報告重點、結論、建議與關鍵字

前言 - 簡要描述全文意旨與背景, 說明報告目標與報告內容組成架構

內文 - 依照章節標題, 詳細說明報告內容, 包括方法、操作步驟與所得結果的詳細說明

結論 - 條列所獲致的重要成果, 與摘要及導言中的目標互相呼應

討論與建議 - 說明後續值得進行的方向、方法與可能遭遇問題的討論

參考 - 詳列所引用的參考內容

附錄 - 附加值得參考的詳細內容</t>
<t tx="leo.20180107114241.1"></t>
<t tx="leo.20180107114241.2">(uncached) yen.20170429220001.1
Diff...
  Fossil SCM
  ---
  
  網誌心得
  ---
  
  Github 協同倉儲
+ ---
  
+ 學員心得
+ ---
- bg2：https://github.com/40623206/bg2_pyqt5_calculator
- 
- 說明各學員任務與執行過程
- 
  40623204-
  
- 40623206
+ 40623206-
?         +
- 
- 數字、數字疊加、+、-、=、計算、中斷運算、clearAll
- 
- 因為waitingForOperand的waiting少了ing，所以一直無法順利執行
- 
- +跟-的部分用了For迴圈及各自跟下面做連結，導致+按下去*2，-按下去*0
  
  40623214-
  
  40623215-
  
  40623249-
  
  40623251-
  
- 學員心得
+ 說明各學員任務與執行過程
  
  40623204-
  
- 40623206
+ 40623206-
?         +
- 
- 從一開始的eric6建立Dialog拉按鈕及顯示幕到使用物件導向編寫程式，用運老師所教的，利用For迴圈連結同屬性的東西，才不會使程式複雜化。
  
  40623214-
  
  40623215-
  
  40623249-
  
- 40623251-
?          -
+ 40623251-- 
</t>
<t tx="leo.20180107114241.3">Fossil SCM
---

網誌心得
---

Github 協同倉儲
---

學員心得
---
40623204-

40623206-

40623214-

40623215-

40623249-

40623251-

說明各學員任務與執行過程

40623204-

40623206-

40623214-

40623215-

40623249-

40623251-</t>
<t tx="leo.20180107114241.4">Fossil SCM
---

網誌心得
---

Github 協同倉儲

bg2：https://github.com/40623206/bg2_pyqt5_calculator

說明各學員任務與執行過程

40623204-

40623206

數字、數字疊加、+、-、=、計算、中斷運算、clearAll

因為waitingForOperand的waiting少了ing，所以一直無法順利執行

+跟-的部分用了For迴圈及各自跟下面做連結，導致+按下去*2，-按下去*0

40623214-

40623215-

40623249-

40623251-

學員心得

40623204-

40623206

從一開始的eric6建立Dialog拉按鈕及顯示幕到使用物件導向編寫程式，用運老師所教的，利用For迴圈連結同屬性的東西，才不會使程式複雜化。

40623214-

40623215-

40623249-

40623251-

</t>
<t tx="leo.20180107150818.2"></t>
<t tx="leo.20180107150818.3">(uncached) yen.20170429215851.1
Diff...
  建立對話框
  ---
  
  自動控制 的內容
  
  其中包含一個表格：
  
  Table: Python 網際框架比較 {#tbl:網際框架}
  
  | Framework | Started | Py2 | Py3 | ORM | Template Engine | Auth Moudule | Database Admin | Project Scale |
  |:---------:|:-------:|:---:|:---:|:---:|:---------------:|:------------:|:--------------:|:-------------:|
  | Pyramid | 2005 | V | V |  |  | V |  | large |
  | Django | 2006 | V | V | V | V | V | V | large |
  | Flask | 2010 | V |  |  |  |  |  | small |
  
  稱為表 {@tbl:網際框架}。
  
  Table: 價目表 {#tbl:價目表}
  
  | Tables   |      Are      |  Cool |
  |----------|:-------------:|------:|
  | col 1 is |  left-aligned | $1600 |
  | col 2 is |    centered   |   $12 |
  | col 3 is | right-aligned |    $1 |
  
  稱為表 {@tbl:價目表}。
  
  關於表格生成可以參考這裡：[http://www.tablesgenerator.com/markdown_tables]
  
  [http://www.tablesgenerator.com/markdown_tables]: http://www.tablesgenerator.com/markdown_tables
  
  建立按鈕
  ---
  
- 從左邊工具列拉按鈕"Push Button"
- ![P-Button][]
- 
- 稱為圖 {@fig:P-Button}。
- 
- 並更改每一項的命名"objectName"
- [P-Button]: ./images/P-Button.PNG {#fig:P-Button}
- 
- 以及拉顯示欄"Line Edit"
- ![P-Display][]
- 
- 稱為圖 {@fig:P-Display}。
- 
- 更改其名稱為"display"
- [P-Display]: ./images/P-Display.png {#fig:P-Display}
- 
- 
  建立程式碼
  ---
  
- 導入 sys 模組→import sys
- 
- 從PyQt5模組導入QtWidgets模組→from PyQt5 import QtWidgets
- 
- 從ui目錄導入Dialog.py, Python 程式檔案本身就是一個模組, 且文件名就是模組名→from ui import Dialog
- 
- 定義各數字名稱→number = [self.one,  self.two,  self.three,  self.four , self.five,　self.six,  self.seven,  self.eight,  self.nine,  self.zero]
- 
- 以及符號名稱→plus_minus = [self.plusButton, self.minusButton]
- 
- times_division = [self.timesButton, self.divisionButton]
- 
- unary = [self.reciprocalButton,  self.squareRootButton,  self.powerButton]
- 
- 建立迴圈使程式簡單化
- 
- ![for O][]
- 
- 稱為圖 {@fig:for O}。
- [for O]: ./images/for O.png {#fig:for O}
- 
- 其餘建立各個Button的函式
</t>
<t tx="leo.20180107150818.4">建立對話框
---

自動控制 的內容

其中包含一個表格：

Table: Python 網際框架比較 {#tbl:網際框架}

| Framework | Started | Py2 | Py3 | ORM | Template Engine | Auth Moudule | Database Admin | Project Scale |
|:---------:|:-------:|:---:|:---:|:---:|:---------------:|:------------:|:--------------:|:-------------:|
| Pyramid | 2005 | V | V |  |  | V |  | large |
| Django | 2006 | V | V | V | V | V | V | large |
| Flask | 2010 | V |  |  |  |  |  | small |

稱為表 {@tbl:網際框架}。

Table: 價目表 {#tbl:價目表}

| Tables   |      Are      |  Cool |
|----------|:-------------:|------:|
| col 1 is |  left-aligned | $1600 |
| col 2 is |    centered   |   $12 |
| col 3 is | right-aligned |    $1 |

稱為表 {@tbl:價目表}。

關於表格生成可以參考這裡：[http://www.tablesgenerator.com/markdown_tables]

[http://www.tablesgenerator.com/markdown_tables]: http://www.tablesgenerator.com/markdown_tables

建立按鈕
---

建立程式碼
---

</t>
<t tx="leo.20180107150818.5">建立對話框
---

自動控制 的內容

其中包含一個表格：

Table: Python 網際框架比較 {#tbl:網際框架}

| Framework | Started | Py2 | Py3 | ORM | Template Engine | Auth Moudule | Database Admin | Project Scale |
|:---------:|:-------:|:---:|:---:|:---:|:---------------:|:------------:|:--------------:|:-------------:|
| Pyramid | 2005 | V | V |  |  | V |  | large |
| Django | 2006 | V | V | V | V | V | V | large |
| Flask | 2010 | V |  |  |  |  |  | small |

稱為表 {@tbl:網際框架}。

Table: 價目表 {#tbl:價目表}

| Tables   |      Are      |  Cool |
|----------|:-------------:|------:|
| col 1 is |  left-aligned | $1600 |
| col 2 is |    centered   |   $12 |
| col 3 is | right-aligned |    $1 |

稱為表 {@tbl:價目表}。

關於表格生成可以參考這裡：[http://www.tablesgenerator.com/markdown_tables]

[http://www.tablesgenerator.com/markdown_tables]: http://www.tablesgenerator.com/markdown_tables

建立按鈕
---

從左邊工具列拉按鈕"Push Button"
![P-Button][]

稱為圖 {@fig:P-Button}。

並更改每一項的命名"objectName"
[P-Button]: ./images/P-Button.PNG {#fig:P-Button}

以及拉顯示欄"Line Edit"
![P-Display][]

稱為圖 {@fig:P-Display}。

更改其名稱為"display"
[P-Display]: ./images/P-Display.png {#fig:P-Display}


建立程式碼
---

導入 sys 模組→import sys

從PyQt5模組導入QtWidgets模組→from PyQt5 import QtWidgets

從ui目錄導入Dialog.py, Python 程式檔案本身就是一個模組, 且文件名就是模組名→from ui import Dialog

定義各數字名稱→number = [self.one,  self.two,  self.three,  self.four , self.five,　self.six,  self.seven,  self.eight,  self.nine,  self.zero]

以及符號名稱→plus_minus = [self.plusButton, self.minusButton]

times_division = [self.timesButton, self.divisionButton]

unary = [self.reciprocalButton,  self.squareRootButton,  self.powerButton]

建立迴圈使程式簡單化

![for O][]

稱為圖 {@fig:for O}。
[for O]: ./images/for O.png {#fig:for O}

其餘建立各個Button的函式
</t>
<t tx="yen.20170429103742.1"></t>
<t tx="yen.20170429103940.1"></t>
<t tx="yen.20170429132400.1">每一位協同人員各在 users 目錄中建立一個 .leo 檔案

各自選擇要編輯的 .md 檔案, 可以使用 @edit 或 @clean 節點編輯指令

除非必要否則不更動 markdown 目錄下的 template.tex 檔案</t>
<t tx="yen.20170429214838.1">前言
===

計算器程式期末報告前言

@others</t>
<t tx="yen.20170429214838.3">前言內容。

\ 

一個範例數學式：$$\beta=\cos^{-1}{\frac{L0^{2}+d_{AB}^{2}-R0^{2}}{2\times{L0\times{d_{AB}}}}}$$

\ 

關於數學式可以參考這裡：[http://www.hostmath.com/][]

[http://www.hostmath.com/]: http://www.hostmath.com/

提及了某篇刊物[@myart]在這裡。
</t>
<t tx="yen.20170429214845.1"></t>
<t tx="yen.20170429215041.1">可攜程式系統介紹
===

Python是種通用.動態.面向對向的編程語言,Python的設計目的強調程序員的生產效率和代碼可讀性,Python靈感來自ABC.Hakell.Java.Lisp.圖標及Perl編成語言.Python不使用大括弧和關鍵詞,它使用空格縮排劃分代碼塊,相比於C++或Java,Python使開發者用更少的代碼表達,Python擁有動態型別系統和垃圾回收系統功能,可自動管理記憶體,並支援多種編程,包括物件導向.命令式.函數式及程式編程

@others</t>
<t tx="yen.20170429215130.1">啟動與關閉
---


啟動與關閉2
---</t>
<t tx="yen.20170429215252.1">Python 程式語法
===

Python 程式語法

@others</t>
<t tx="yen.20170429215308.1">變數命名
---

IPv4 的內容

有一張圖片：

![Kmol][]

稱為圖 {@fig:駱駝}。

各 md 檔案可以在 images 目錄下自訂與 md 檔案名稱相同的子目錄存放影像檔案

[Kmol]: ./images/kmol.png {#fig:駱駝}

print 函式
---

重複迴圈
---

判斷式
---

數列
---</t>
<t tx="yen.20170429215416.1"> PyQt5 簡介
===




@others</t>
<t tx="yen.20170429215446.2">PyQt5 架構
---

Pyqt5是一套綁定Digia QT5應用的框架,可用於Python2和3,Pyqt5作為Python的一個模塊,它擁有620多類及6000個函數和方法.是一個跨平台的工具包,可運行在所有主要的操作系統,包刮UNIX和Mac OS.Pyqt5是雙重許可,開發者可在GPL和商業許可間選擇.
</t>
<t tx="yen.20170429215617.1">Calculator 程式
===

Calculator 程式細部說明

@others
</t>
<t tx="yen.20170429215851.1">建立對話框
---

自動控制 的內容

其中包含一個表格：

Table: Python 網際框架比較 {#tbl:網際框架}

| Framework | Started | Py2 | Py3 | ORM | Template Engine | Auth Moudule | Database Admin | Project Scale |
|:---------:|:-------:|:---:|:---:|:---:|:---------------:|:------------:|:--------------:|:-------------:|
| Pyramid | 2005 | V | V |  |  | V |  | large |
| Django | 2006 | V | V | V | V | V | V | large |
| Flask | 2010 | V |  |  |  |  |  | small |

稱為表 {@tbl:網際框架}。

Table: 價目表 {#tbl:價目表}

| Tables   |      Are      |  Cool |
|----------|:-------------:|------:|
| col 1 is |  left-aligned | $1600 |
| col 2 is |    centered   |   $12 |
| col 3 is | right-aligned |    $1 |

稱為表 {@tbl:價目表}。

關於表格生成可以參考這裡：[http://www.tablesgenerator.com/markdown_tables]

[http://www.tablesgenerator.com/markdown_tables]: http://www.tablesgenerator.com/markdown_tables

建立按鈕
---

從左邊工具列拉按鈕"Push Button"
![P-Button][]

稱為圖 {@fig:P-Button}。

並更改每一項的命名"objectName"
[P-Button]: ./images/P-Button.PNG {#fig:P-Button}

以及拉顯示欄"Line Edit"
![P-Display][]

稱為圖 {@fig:P-Display}。

更改其名稱為"display"
[P-Display]: ./images/P-Display.png {#fig:P-Display}


建立程式碼
---

導入 sys 模組→import sys

從PyQt5模組導入QtWidgets模組→from PyQt5 import QtWidgets

從ui目錄導入Dialog.py, Python 程式檔案本身就是一個模組, 且文件名就是模組名→from ui import Dialog

定義各數字名稱→number = [self.one,  self.two,  self.three,  self.four , self.five,　self.six,  self.seven,  self.eight,  self.nine,  self.zero]

以及符號名稱→plus_minus = [self.plusButton, self.minusButton]

times_division = [self.timesButton, self.divisionButton]

unary = [self.reciprocalButton,  self.squareRootButton,  self.powerButton]

建立迴圈使程式簡單化

![for O][]

稱為圖 {@fig:for O}。
[for O]: ./images/for O.png {#fig:for O}

其餘建立各個Button的函式
</t>
<t tx="yen.20170429215922.1">心得
===

期末報告心得

@others
</t>
<t tx="yen.20170429220001.1">Fossil SCM
---

網誌心得
---

Github 協同倉儲

bg2：https://github.com/40623206/bg2_pyqt5_calculator

說明各學員任務與執行過程

40623204-

40623206

數字、數字疊加、+、-、=、計算、中斷運算、clearAll

因為waitingForOperand的waiting少了ing，所以一直無法順利執行

+跟-的部分用了For迴圈及各自跟下面做連結，導致+按下去*2，-按下去*0

40623214-

40623215

雖然看老師的函式都能了解其意思，但自己要憑空打出來卻比想像中困難。

40623249-

40623251-

學員心得

40623204-

40623206

從一開始的eric6建立Dialog拉按鈕及顯示幕到使用物件導向編寫程式，用運老師所教的，利用For迴圈連結同屬性的東西，才不會使程式複雜化。

40623214-

40623215-

40623249-

40623251-

</t>
<t tx="yen.20170429220128.1">結論
===

期末報告結論

@others</t>
<t tx="yen.20170429220137.1">結論與建議
---

結論與建議內容</t>
<t tx="yen.20170429220335.1">附錄
===

附錄內容

@others</t>
<t tx="yen.20170429220335.2">專案執行會議紀錄
---

操作過程照片
---

操作過程照片</t>
</tnodes>
</leo_file>
