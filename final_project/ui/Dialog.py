# -*- coding: utf-8 -*-

"""
Module implementing Dialog.
"""

import math

from PyQt5.QtCore import pyqtSlot
from PyQt5.QtWidgets import QDialog

from .Ui_Dialog import Ui_Dialog


class Dialog(QDialog, Ui_Dialog):
    """
    Class documentation goes here.
    """
    def __init__(self, parent=None):
        """
        Constructor
        
        @param parent reference to the parent widget
        @type QWidget
        """
        super(Dialog, self).__init__(parent)
        self.setupUi(self)
        '''以下為使用者自行編寫程式碼區'''
        
        self.waitingForOperand = True
        self.display.setText('0')
        
        number = [self.one,  self.two,  self.three,  self.four , self.five, \
        self.six,  self.seven,  self.eight,  self.nine,  self.zero]
        
        plus_minus = [self.plusButton, self.minusButton]
        for i in number :
            i.clicked.connect (self.digitClicked)
        
        for i in plus_minus:
            i.clicked.connect (self.additiveOperatorClicked)
        
        self.clearAllButton.clicked.connect(self.clearAll)
        self.plusButton.clicked.connect(self.additiveOperatorClicked)
        self.minusButton.clicked.connect(self.additiveOperatorClicked)
        self.backspaceButton.clicked.connect(self.backspaceClicked)
        self.clearButton.clicked.connect(self.clear)
        self.squareRootButton.clicked.connect(self.unaryOperatorClicked)
        self.reciprocalButton.clicked.connect(self.unaryOperatorClicked)
        self.readMemoryButton.clicked.connect(self.readMemory)

    def digitClicked(self):
        '''
        使用者按下數字鍵, 必須能夠累積顯示該數字
        當顯示幕已經為 0, 再按零不會顯示 00, 而仍顯示 0 或 0.0
        
        '''
        #pass
        clickedButton = self.sender()
        digitValue = int (clickedButton.text())
        
        if self.display.text() =='0' and digitValue == 0.0:
            return
        
        if self.waitingForOperand:
            self.display.clear()
            self.waitingForOperand = False
        
        self.display.setText(self.display.text() + str(digitValue))
        
    def unaryOperatorClicked(self):
        '''單一運算元按下後處理方法'''
        #pass
        clickedButton = self.sender()
        clickedOperator = clickedButton.text()
        operand = float(self.display.text())

        if clickedOperator == "Sqrt":
            if operand < 0.0:
                self.abortOperation()
                return

            result = math.sqrt(operand)

        if clickedOperator == "1/x":
            if operand == 0.0:
                self.abortOperation()
                return

            result = 1.0 / operand

        self.display.setText(str(result))
        self.waitingForOperand = True        
        
    def additiveOperatorClicked(self):
        '''加或減按下後進行的處理方法'''
        #pass
        
        self.waitingForOperand = True
        
        
    def multiplicativeOperatorClicked(self):
        '''乘或除按下後進行的處理方法'''
        pass
        
    def equalClicked(self):
        '''等號按下後的處理方法'''
        pass
        
    def pointClicked(self):
        '''小數點按下後的處理方法'''
        pass
        
    def changeSignClicked(self):
        '''變號鍵按下後的處理方法'''
        pass
        
    def backspaceClicked(self):
        '''回復鍵按下的處理方法'''
        #passs
        if self.waitingForOperand:
            return
        text = self.display.text()[:-1]
        if not text:
            text = '0'
            self.waitingForOperand = True

        self.display.setText(text)
        
    def clear(self):
        '''清除鍵按下後的處理方法'''
        #pass
        self.display.setText('0')
        self.waitingForOperand = True
        
    def clearAll(self):
        '''全部清除鍵按下後的處理方法'''
        #pass
        self.display.setText('0')
        self.waitingForOperand = True
        
    def clearMemory(self):
        '''清除記憶體鍵按下後的處理方法'''
        pass
        
    def readMemory(self):
        '''讀取記憶體鍵按下後的處理方法'''
        #pass
        self.display.setText(str(self.sumInMemory))
        self.waitingForOperand = True
        
    def setMemory(self):
        '''設定記憶體鍵按下後的處理方法'''
        pass
        
    def addToMemory(self):
        '''放到記憶體鍵按下後的處理方法'''
        pass
        
    def createButton(self):
        ''' 建立按鍵處理方法, 以 Qt Designer 建立對話框時, 不需要此方法'''
        pass
        
    def abortOperation(self):
        '''中斷運算'''
        #pass
        self.display.setText("####")
        
    def calculate(self):
        '''計算'''
        pass
