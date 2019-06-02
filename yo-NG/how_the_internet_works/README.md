# Bí Íńtánẹ́ẹ̀tì ṣé n ṣiṣẹ́

> Fún àwọn òǹkàwé ní ilé: a ti ṣàlàyé àkòrí yìí nínú fídíò [How the Internet Works](https://www.youtube.com/watch?v=oM9yAA09wdc).
> 
> Ọ̀rọ̀ àsọyé "How the Internet works" ti Jessica McKellar (http://web.mit.edu/jesstess/www/) ló gbà wá níyànjú láti kọ àkòrí yìí.

A lérò pé o n lo Íńtánẹ́ẹ̀tì náà lójoojúmọ́. Ṣùgbọ́n ṣé o mọ ohun tó ṣẹlẹ̀ nígbà tí o tẹ àdírẹ́ẹ̀sì kan bíi https://djangogirls.org sínú aṣàwákiri rẹ tí o sì tẹ `enter`?

Nnkan àkọ́kọ́ tí o nílò láti mọ̀ ni pé ààyè ayélujára kan jẹ́ àpapọ̀ àwọn fáìlì kan tí a tọ́jú sórí ibi ìpamọ́ kan. Gẹ́gẹ́ bí àwọn fídíò, orin, tàbí àwòrán rẹ. Àmọ́ o, apá kan wà tó jẹ́ àkànṣe fún àwọn ààyè ayélujára: wọ́n kó kóòdù kọ̀mpútà tí a n pè ní HTML sínú.

Tí ìwọ kò bá fi bẹ́ẹ̀ mọ̀ nípa kóòdù kíkọ ó lè ṣòro láti mọ HTML lákọ̀ọ́kọ́, ṣùgbọ́n àwọn aṣàwákiri ayélujára rẹ (bíi Chrome, Safari, Firefox, àti bẹ́ẹ̀ bẹ́ẹ̀ lọ) nífẹ̀ẹ́ sí i. A ṣètò àwọn aṣàwákiri ayélujára láti lóye kóòdù yìí, tẹ̀lé àwọn ìtọ́sọ́nà rẹ̀, àti ṣàgbékalẹ̀ àwọn fáìlì wọ̀nyí tí ààyè ayélujára rẹ kó sínú, bí o ṣe fẹ́ kó rí gan-an.

Gẹ́gẹ́ bí ó ti rí pẹ̀lú gbogbo fáìlì, a nílò láti tọ́jú àwọn fáìlì HTML sí ibìkan lórí ibi ìpamọ́ kan. Fún Íńtánẹ́ẹ̀tì náà, a má n lo àwọn àkànṣe kọ̀mpútà tó lágbára púpọ̀ tí a n pè ní àwọn *server*. Wọn kò ní ojú àwòrán kan, atọ́ka tàbí pẹpẹ bọ́tìnnì kan, nítorí pé ìdí pàtàkì wọn ní láti tọ́jú dátà àti pèsè rẹ̀. Ìdí nìyẹn tí a fí n pè wọ́n ní àwọn *server* – nítorí pé wọ́n *pèsè (serve)* dátà fún ẹ.

Ó dáa, ṣùgbọ́n o fẹ́ mọ bí Íńtánẹ́ẹ̀tì náà ṣe rí, àbí bẹ́ẹ̀ kọ?

A ya àwòrán kan fún ọ! Ó rí báyìí:

![Figure 1.1](images/internet_1.png)

Looks like a mess, right? In fact it is a network of connected machines (the above-mentioned *servers*). Hundreds of thousands of machines! Many, many kilometers of cables around the world! O lè ṣèbẹ̀wò ààyè ayélujára Submarine Cable Map kan (http://submarinecablemap.com) láti rí bí íńtánẹ́ẹ̀tì náà ṣe lọ́jú pọ̀ tó. Àwòrán kan láti ààyè ayélujára náà nìyí:

![Figure 1.2](images/internet_3.png)

Ó fani mọ́ra, àbí kò rí bẹ́ẹ̀? Ṣùgbọ́n kò ṣeéṣe láti ní wáyà kan láàrin gbogbo ẹ̀rọ tó sopọ̀ mọ́ Íńtánẹ́ẹ̀tì náà. Nítorí náà, láti dé ẹ̀rọ kan (fún àpẹẹrẹ, èyí tí a tọ́jú https://djangogirls.org sí), a nílò láti darí ìbéèrè kan káàkiri oríṣiríṣi ẹ̀rọ.

Ó rí báyìí:

![Figure 1.3](images/internet_2.png)

Wòye pé nígbà tí o bá tẹ https://djangogirls.org, o fi lẹ́tà kan ránṣẹ́ tó sọ wípé: "Django Girls Ọ̀wọ́n, Mo fẹ́ rí ààyè ayélujára djangogirls.org náà. Fi ránṣẹ́ sí mi, jọ̀wọ́!"

Lẹ́tà rẹ yíò lọ sí ilé iṣẹ́ ìfìwéránṣẹ́ tó súnmọ́ ẹ jù. Lẹ́yìn náà yíò lọ sí òmíràn tó tún súnmọ́ díẹ̀ sí olùgbà lẹ́tà rẹ, lẹ́yìn náà sí òmíràn, àti òmíràn títí dìgbà tí yíò fi dé ibi tó n lọ. Nnkan àkànṣe kan ṣoṣo náà ni pé tí o bá fi ọ̀pọ̀lọpọ̀ àwọn lẹ́tà (*àwọn àkópapọ̀ dátà (data packets)*) ránṣẹ́ sí ibi kannáà, wọ́n lè gba àwọn ilé iṣẹ́ ìfìwéránṣẹ́ (*àwọn alànà (routers)*) tó yàtọ̀ síra pátápátá kọjá. Èyí dá lórí bí wọ́n ṣe gba pínpín ní ilé iṣé kọ̀ọ̀kan.

![Figure 1.4](images/internet_4.png)

Bí ó ṣé n ṣiṣẹ́ nìyẹn - o fi àwọn ìròyìn ránṣẹ́ àti pé o retí ìdáhùn kan. Dípò ìwé àti gègé o lo àwọn byte ti dátà, ṣùgbọ́n èrò kannáà ló jẹ́!

Dípò àwọn àdírẹ́ẹ̀sì pẹ̀lú orúkọ òpópónà kan, ìlú, kóòdù ìpínlẹ́tà àti orúkọ orílẹ̀-èdè, a lo àwọn àdírẹ́ẹ̀sì IP. Kọ̀mpútà rẹ yíò kọ́kọ́ béèrè lọ́wọ́ DNS (Domain Name System, Ètò Orúkọ Agbègbè) náà láti túmọ̀ djangogirls.org sí àdírẹ́ẹ̀sì IP kan. Ó ń ṣiṣẹ́ bíi àwọn ìwé tẹlifóònù ti àtijọ́, níbi tí o ti lè wo orúkọ ẹni tí o fẹ́ pè náà tí o sì ma rí nọ́ḿbà fóònù àti àdírẹ́ẹ̀sì wọn.

Nígbà tí o bá fi lẹ́tà kan ránṣẹ́, ó nílò láti ní àwọn ohun pàtó kan láti fi jíṣẹ́ bó ṣe yẹ: àdírẹ́ẹ̀sì kan, òǹtẹ̀ kan, àti bẹ́ẹ̀ bẹ́ẹ̀ lọ. O tún ma lo èdè kan tí olùgbà náà mọ̀, àbí bẹ́ẹ̀ kọ? Bákannáà ló ṣe rí fún *àwọn àkópapọ̀ dátà* tí o fi ránṣẹ́ láti rí ààyè ayélujára kan. A lo ìlànà kan tí a n pè ní HTTP (Hypertext Transfer Protocol, Ìlànà Ìfiránṣẹ́ Ọ̀rọ̀-atọ̀ka).

Nítorí náà, pàtàkì jùlọ, nígbà tí o bá ní ààyè ayélujára kan, o nílò láti ní *server* (ẹ̀rọ) kan níbi tí yíò ma gbé. Nígbà tí *server* náà bá gba *ìbéèrè* tí ń bọ̀ kan (nínú lẹ́tà kan), yíò fi ààyè ayélujára rẹ ránṣẹ́ padà (nínú lẹ́tà mìíràn).

Torí pé èyí jẹ́ àlàyé Django kan, o lè béèrè ohun tí Django n ṣe. Nígbà tí o bá fi ìdáhùn kan ránṣẹ́, ìwọ kò ní fẹ́ fi ohun kannáà ránṣẹ́ sí gbogbo èèyàn ní gbogbo ìgbà. Yíò dára púpọ̀ tí àwọn lẹ́tà rẹ bá jẹ́ àkànṣe, pàápàá jù lọ fún ẹni tó ṣẹ̀ṣẹ̀ kọ̀wé sí ọ, àbí bẹ́ẹ̀ kọ? Django yíò ràn ọ lọ́wọ́ pẹ̀lú ṣíṣẹ̀dá àwọn lẹ́tà àkànṣe tó dára wọ̀nyí. :)

Ọ̀rọ̀ tí a sọ ti tó – àkọ́kọ́ láti ṣẹ̀dá!