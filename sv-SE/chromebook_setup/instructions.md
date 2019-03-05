Du kan [hoppa över denna sektion](http://tutorial.djangogirls.org/en/installation/#install-python) om du inte använder en Chromebook. Om det är så att du använder en Chromebook kommer din installation se lite annorlunda ut. Du kan ignorera resten av installations instruktionerna.

### Cloud IDE (PaizaCloud Cloud IDE, AWS Cloud9)

Cloud IDE är ett verktyg som ger användaren en kodredigeringsprogram och tillgång till en dator på internet på vilken du kan installera, skriva och köra mjukvara. Under denna introduktion kommer Cloud IDE vara din *lokala maskin*. Du kommer fortfarande att köra din kommandon i terminalen, precis som dina klasskamrater som sitter på OS X, Ubuntu, eller Windows, men din terminal kommer vara kopplat till en dator som Cloud IDE har satt upp till dig. Här är instruktionerna för Cloud IDEs (PaizaCloud Cloud IDE, AWS Cloud9). Du kan välja en Cloud IDE och följ anvisningen för den Cloud IDE.

#### PaizaCloud Cloud IDE

1. Gå till [PaizaCloud Cloud IDE](https://paiza.cloud/)
2. Skapa ett konto
3. Klicka på *New Server*
4. Klicka på Terminal knappen (på vänster sida av fönstret)

Nu bör du se ett gränssnitt med en sidofält, och några knappar på vänster. Klicka ”Terminal” knappen för att öppna terminal-fönstret som ser ut såhär:

{% filename %}Terminal{% endfilename %}

    $
    

Terminalen på PaizaCloud Cloud IDE är förberedd för dina instruktioner. Du kan ändra storlek på eller maximera fönstret för att göra det lite större.

#### AWS Cloud9

1. Gå till [AWS Cloud9](https://aws.amazon.com/cloud9/)
2. Skapa ett konto
3. Klicka på *Create Environment*

Nu bör du se ett gränssnitt med en sidofält, ett stort huvudfönster med text, och ett litet fönster längst ner som ser ut så här:

{% filename %}bash{% endfilename %}

    dittanvändarnamn:~/workspace $
    

Detta bottenyta är din terminal. Du kan använda terminalen för att sända instruktioner till Cloud 9 på fjärrdatorn. Du kan ändra storlek på fönstret för att göra det lite större.

### Virtuell miljö

En virtuell miljö (också kallad virtualenv) är som en typ av privat dator som man kan använda för att spara data och program som man använder i sitt projekt. Vi kommer använda den för att spara olika bitar av kod som tillhör olika projekt. På detta sätt kommer koden till projekten hållas separat från varandra så att vi inte blandar ihop de olika projekt-koden.

I din terminal, placerad längst ned i Cloud 9 rutan, kör följande kommando:

{% filename %}Cloud 9{% endfilename %}

    sudo apt update
    sudo apt install python3.6-venv
    

Om detta kommando inte fungerar, fråga din lärare om hjälp.

Nästa steg, kör:

{% filename %}Cloud 9{% endfilename %}

    mkdir djangogirls
    cd djangogirls
    python3.6 -mvenv myvenv
    source myvenv/bin/activate
    pip install django~={{ book.django_version }}
    

(Notera att i den sista raden var det en tilde följt efter ett vanligt likhets-tecken: `~=`).

### GitHub

Skapa ett [Github](https://github.com) konto.

### PythonAnywhere

Django Girls introduktionen innehåller en sektion på vad som kallas Deployment, vilket menas med processen av att ta koden för din nya applikation och flyttar den till en publik dator (en server) så att andra personer kan se applikationen.

Denna biten av introduktionen är lite annorlunda för dig som sitter på en Chromebook, eftersom din dator redan utgår ifrån internet (i motsats till en vanlig laptop som är en dator i sig). However, it's still useful, as we can think of our Cloud 9 workspace as a place for our "in progress" work and Python Anywhere as a place to show off our stuff as it becomes more complete.

Thus, sign up for a new Python Anywhere account at [www.pythonanywhere.com](https://www.pythonanywhere.com).