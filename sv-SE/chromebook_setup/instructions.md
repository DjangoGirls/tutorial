Du kan [hoppa över denna sektion](http://tutorial.djangogirls.org/en/installation/#install-python) om du inte använder en Chromebook. Om det är så att du använder en Chromebook kommer din installation se lite annorlunda ut. Du kan ignorera resten av installations instruktionerna.

### Cloud IDE (PaizaCloud Cloud IDE, AWS Cloud9)

Cloud IDE är ett verktyg som ger användaren en kod-editor och tillgång till en dator på internet på vilken du kan installera, skriva och köra mjukvara. Under denna introduktion kommer Cloud IDE vara din *lokala maskin*. Du kommer fortfarande att köra din kommandon i terminalen, precis som dina klasskamrater som sitter på OS X, Ubuntu, eller Windows, men din terminal kommer vara kopplat till en dator som Cloud IDE har satt upp till dig. Här är instruktionerna för Cloud IDEs (PaizaCloud Cloud IDE, AWS Cloud9). Du kan välja en Cloud IDE och följ anvisningen för den Cloud IDE.

#### PaizaCloud Cloud IDE

1. Gå till [PaizaCloud Cloud IDE](https://paiza.cloud/)
2. Skapa ett konto
3. Klicka på *Ny Server* och välj Django-appen
4. Klicka på Terminal knappen (på vänster sida av fönstret)

Nu bör du se ett gränssnitt med en sidofält, och några knappar på vänster. Klicka ”Terminal” knappen för att öppna terminal-fönstret som ser ut såhär:

{% filename %}Terminal{% endfilename %}

    $
    

Terminalen på PaizaCloud Cloud IDE är förberedd för dina instruktioner. Du kan ändra storlek på eller maximera fönstret för att göra det lite större.

#### AWS Cloud9

För närvarande kräver Cloud 9 att du registrerar dig med AWS och ange kreditkort information.

1. Installera Cloud 9 från [Chrome webbutiken](https://chrome.google.com/webstore/detail/cloud9/nbdmccoknlfggadpfkmcpnamfnbkmkcp)
2. Gå till [c9.io](https://c9.io) och klicka på *Kom igång med AWS Cloud9*
3. Registrera dig för ett AWS-konto (kräver kreditkortsinformation, men du kan använda det gratis)
4. I AWS kontrollpanelen anger du *Cloud9* i sökfältet och klickar på den
5. I Cloud9 panelen klickar du på *Create environment*
6. Döp den till *django-girls*
7. Medan du anger inställningar, välj *Create a new instance for environment (EC2)* för "Environment Type" och *t2.micro* "Instance type" (det bör säga "Free-tier eligible."). Standardinställningen för kostnadsbesparingar är bra och du kan behålla de andra standardinställningarna.
8. Klicka på *Next step*
9. Klicka på *Create Environment*

Nu kan du se ett gränssnitt med en navigation vid sidan, ett stort huvud-fönster med någon text och ett litet fönster nertill som ser ut typ så här:

{% filename %}bash{% endfilename %}

    dittanvändarnamn:~/workspace $
    

Detta nedre område är din terminal. Du kan använda terminalen för att skicka instruktioner till fjärrdatorn Cloud9. Du kan ändra fönstrets storleken för att göra det lite större.

### Virtuell miljö

En virtuell miljö (även kallad virtualenv) är som en privat låda där vi kan lägga användbar datorkod för ett projekt vi arbetar på. Vi kommer använda dem för att spara olika bitar av kod som tillhör olika projekt. På detta sätt kommer koden till projekten hållas separat från varandra så att vi inte blandar ihop de olika projekt-koden.

Kör:

{% filename %}Cloud 9{% endfilename %}

    mkdir djangogirls
    cd djangogirls
    python3.6 -mvenv myvenv
    source myvenv/bin/activate
    pip install django~={{ book.django_version }}
    

(observera att på sista raden använder vi en tilde följt av ett lika tecken: `~=`).

### GitHub

Skapa ett [Github](https://github.com) konto.

### PythonAnywhere

The Django Girls tutorial includes a section on what is called Deployment, which is the process of taking the code that powers your new web application and moving it to a publicly accessible computer (called a server) so other people can see your work.

This part is a little odd when doing the tutorial on a Chromebook since we're already using a computer that is on the Internet (as opposed to, say, a laptop). However, it's still useful, as we can think of our Cloud 9 workspace as a place for our "in progress" work and Python Anywhere as a place to show off our stuff as it becomes more complete.

Så registrera dig för ett nytt Python Anywhere konto på [www.pythonanywhere.com](https://www.pythonanywhere.com).