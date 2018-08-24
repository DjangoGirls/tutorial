# Kako deluje internet

> For readers at home: this chapter is covered in the [How the Internet Works](https://www.youtube.com/watch?v=oM9yAA09wdc) video.
> 
> This chapter is inspired by the talk "How the Internet works" by Jessica McKellar (http://web.mit.edu/jesstess/www/).

We bet you use the Internet every day. But do you actually know what happens when you type an address like https://djangogirls.org into your browser and press `enter`?

The first thing you need to understand is that a website consists of a bunch of files saved on a hard disk. Povsem enako kot tvoje slike, glasba in filmi. Posebnost datotek, ki sestavljajo spletno stran, je le, da vsebujejo programsko kodo, ki ji rečemo HTML.

Če še nisi nikoli programirala, se to morda sliši malce nenavadno, vendar pa spletni brskalniki (kot so Chrome, Safari, Firefox ipd.), programsko kodo HTML obožujejo. Narejeni so namreč tako, da to kodo razumejo. Razbrati znajo napisane ukaze, ki jih koda vsebuje, in po njihovih navodilih prikazati spletno stran.

Kot vsako datoteko, moramo tudi HTML datoteke shraniti na trdi disk računalnika. Računalnikom, na katerih so shranjene spletne strani, rečemo *strežniki*. Strežniki nimajo ekrana, miške in tipkovnice, saj je njihov glavni namen shraniti podatki in omogočiti, da si z njimi lahko postrežemo. That's why they're called *servers* – because they *serve* you data.

OK, but you want to know how the Internet looks, right?

Narisali smo ti sliko! Internet deluje nekako tako:

![Figure 1.1](images/internet_1.png)

Nenavadno, kajne? In fact it is a network of connected machines (the above-mentioned *servers*). Na milijone računalnikov! Ogromna mreža kablov, razpredena po celem svetu! Obiščeš lahko spletno stran Cable Map (http://submarinecablemap.com). Tam boš videla, kako zapletena mreža je internet. Tule je slika iz njihove spletne strani:

![Figure 1.2](images/internet_3.png)

Fascinantno! But it is not possible to have a wire between every machine connected to the Internet. So, to reach a machine (for example, the one where https://djangogirls.org is saved) we need to pass a request through many, many different machines.

Nekako tako:

![Figure 1.3](images/internet_2.png)

Imagine that when you type https://djangogirls.org, you send a letter that says: "Dear Django Girls, I want to see the djangogirls.org website. Send it to me, please!"

To pismo gre na najbližjo pošto, od tod gre na pošto, ki je še nekoliko bližje želenemu naslovu in tako nadaljuje, dokler ne pride do želenega naslova. Edina razlika, če primerjamo to pošiljanje s pošiljanjem v internetu je, da v internetu dejansko pošljemo več pisem (*podatkovnih paketov*) na isto pošto (strežnik). Ta pisma pa gredo lahko do končnega naslova (strežnika) skozi povsem različne pošte (*omrežne usmerjevalnike*). 

![Figure 1.4](images/internet_4.png)

That's how it works - you send messages and you expect some response. Instead of paper and pen you use bytes of data, but the idea is the same!

Namesto običajnega naslova, ki vsebuje naslov ulice, poštno številko in ime države, v računalništvu uporabljamo IP naslov, ki predstavlja naslov računalnika. Tvoj računalnik bo, ko vidi naslov djangogirls.org, s pomočjo sistema DNS (Domain Name System), ta naslov pretvoril v IP. It works a little bit like old-fashioned phonebooks where you can look up the name of the person you want to contact and find their phone number and address.

When you send a letter, it needs to have certain features to be delivered correctly: an address, a stamp, etc. Napisati pa ga moraš jasno v jeziku, ki ga naslovnik razume. Enako velja za *podatkovne pakete*, ki jih računalnik pošlje, da lahko vidi spletno stran. Za to se uporablja protokol HTTP (Hypertext Transfer Protocol).

Povzemimo vso zgodbo. Če želiš imeti svojo spletno stran, moraš torej datoteke, iz katerih je sestavljena, naložiti na poseben računalnik, ki se mu reče *strežnik*. Ko *strežnik* dobi neko *prošnjo* (v pismu), kot odgovor pošlje spletno stran (v drugem pismu).

Since this is a Django tutorial, you might ask what Django does. Ko strežnik pošlje odgovor na prošnjo, ta odgovor ni nujno vedno enak za vsakega uporabnika. Veliko bolje je, če je ta prošnja (pismo) spreminja glede na to, komu je poslana. To bi znalo priti prav zlasti takrat, ko je odgovor namenjen nekomu, ki si mu odgovor poslal nedolgo nazaj. To zveni smiselno, kajne? Django nam bo pomagal delati tovrstna zanimiva pisma, ki se spreminjajo glede na naslovnika. :)

Enough talk – time to create!