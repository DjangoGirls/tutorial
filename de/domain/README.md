# Die Domain

Heroku hat dir eine Domain bereitgestellt, aber sie ist sehr lang, schwer zu merken und einfach nur hässlich. Es wäre doch toll, einen Domainnamen zu haben, der kürzer und einfacher zu merken ist, oder?

In diesem Kapitel werden wir dir beibringen, wie man eine Domain kauft und sie mit Heroku verknüpft!

## Wo registriert man eine Domain?

Eine typische Domain kostet in etwa 15 $ pro Jahr. Es gibt günstigere und teurere Varianten, je nach Provider. Es gibt viele Unternehmen, bei denen du Domains kaufen kannst: eine einfache [Google-Suche](https://www.google.com/search?q=register%20domain) wird dir hunderte Vorschläge liefern.

Unser Favorit ist [I want my name](https://iwantmyname.com/). Die werben mit "einfachem Domainmanagement" und es ist wirklich simpel.
 
## Wie registriert man eine Domain auf IWantMyName?

Gehe auf [iwantmyname](http://iwantmyname.com) und tippe eine Domain, die du haben möchtest, in das Suchfeld.

![](images/1.png)

Du solltest jetzt eine Liste mit all den verfügbaren Domains sehen, die zu deinem Wunschnamen passen. Wie du sehen kannst, zeigt dir ein Smiley an, wenn eine Domain verfügbar ist und ein trauriges Gesicht, wenn sie bereits vergeben ist.

![](images/2.png)

Wir haben beschlossen, `djangogirls.in` zu kaufen:

![](images/3.png)

Gehe zur Kasse. Du solltest dich jetzt bei IwantMyName anmelden, wenn du nicht bereits ein Konto dort hast. Danach gib deine Kreditkarteninformationen ein und kaufe deine Domain!

Im Anschluss klickst du auf `Domains` im Menu und wählst deine neu gekaufte Domain aus. Dann suche und klicke auf den `manage DNS records` Link:

![](images/4.png)

Jetzt musst du dieses Formular finden:

![](images/5.png)

Fülle es mit den folgenden Details aus: - Hostname: www - Type: CNAME - Value: deine Heroku-Domain (z.B. djangogirls.herokuapp.com) - TTL: 3600

![](images/6.png)

Klicke auf "Hinzufügen" und speichere die Änderungen am unteren Ende.

Es kann einige Stunden dauern, bevor deine Domain lauffähig ist, hab etwas Geduld!

## Konfigurieren der Domain in Heroku

Du musst Heroku angeben, dass du deine eigene Domain benutzen möchtest.

Gehe zum [Heroku Dashboard](https://dashboard.heroku.com/apps), logge dich auf dein Heroku-Konto ein und wähle deine App aus. Dann geh in das Einstellungsmenu und füge deine Domain in der `Domains` Sektion ein und speichere deine Änderungen.

Das wars!
