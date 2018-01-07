Calculator 程式
===

Calculator 程式細部說明

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
