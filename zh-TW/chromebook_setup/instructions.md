如果您不是使用 Chromebook 的話，您可以 [跳過這個章節](http://tutorial.djangogirls.org/en/installation/#install-python)。 如果是的話，您的安裝過程將會有些許的不同。 您可以忽略其餘的安裝導覽說明。

### Cloud 9

Cloud 9 這工具會提供你一個程式碼編輯器(code editor)，並讓你存取一台位於網路上的電腦，使你可以透過它安裝、撰寫、以及執行軟體。 在這個教程指南過程中，Cloud 9 將能當作您的*本機電腦*來執行。 您仍將在終端機介面中執行指令，跟同學使用在 OS X、Ubuntu、或是 Windows 一樣，但是您的終端機是連接到一個由 Cloud 9 為您設定在其他地方的主機。

1. 從 [Chrome 線上應用程式商店](https://chrome.google.com/webstore/detail/cloud9/nbdmccoknlfggadpfkmcpnamfnbkmkcp)安裝 Colud 9
2. 到 [c9.io](https://c9.io)
3. 註冊一個帳戶
4. 點選*建立一個新的工作區*
5. 幫它命名 *django-girls*
6. 選擇*空白*(右邊由上往下第二個橙橘色標籤)

現在您應該看到一個帶有邊欄的介面，一個有文字的大視窗，下面還有一個小視窗，看起來應該像是這樣：

{% filename %}Cloud 9{% endfilename %}

    yourusername:~/workspace $
    

This bottom area is your *terminal*, where you will give the computer Cloud 9 has prepared for your instructions. You can resize that window to make it a bit bigger.

### 虛擬環境 [Virtual Environment]

虛擬環境 (virtual environment，也被叫做 virtualenv) 就像一個私有的盒子 我們能夠提供有用的電腦代碼到我們正在運作的專案。 我們使用虛擬環境來保持在不同專案間不會混淆，即使在不同專案底下使用了不同的編輯代碼。

在您的 Cloud 9 介面底下的終端機畫面中，執行以下指令：

{% filename %}Cloud 9{% endfilename %}

    sudo apt update
    sudo apt install python3.6-venv
    

如果仍然不能運作，請向其他人 (教練，這邊是美式幽默) 尋求協助。

接下來，執行以下指令：

{% filename %}Cloud 9{% endfilename %}

    mkdir djangogirls
    cd djangogirls
    python3.6 -mvenv myvenv
    source myvenv/bin/activate
    pip install django~=1.11.0
    

(請注意，我們在最後一行確實使用了一個符號： ~= 喔)。

### GitHub

Make a [GitHub](https://github.com) account.

### PythonAnywhere

這份 Django Girls 教程指南有章節是稱為 "部屬" ，是一個強力的網頁應用程式，能夠執行這些代碼，還能夠移動到公開可被訪問的電腦(被稱作伺服器)，並讓其他人看到你的專案。

這個部分對於使用這份指南的 Chromebook 來說會有些奇怪，因為他們已經是使用了電腦是在網路上的 (相對來說就是筆記型電腦) However, it's still useful, as we can think of our Cloud 9 workspace as a place for our "in progress" work and Python Anywhere as a place to show off our stuff as it becomes more complete.

所以，到 [www.pythonanywhere.com](https://www.pythonanywhere.com) 註冊一個 Python Anywhere 新帳戶吧。