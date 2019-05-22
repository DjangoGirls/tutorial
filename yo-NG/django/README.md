# Kíni Django?

Django (/ˈdʒæŋɡoʊ/ *jang-goh*) jẹ́ àgbékalẹ̀ ètò ayélujára ọ̀fẹ́ kan tó ní orísun gbangba, tí a kọ ní Python. Àgbékalẹ̀ ayélujára kan jẹ́ àwọn èròjà tí yóò ràn ọ́ lọ́wọ́ láti gbé àwọn ààyè ayélujára jáde ní kíákíá àti nírọ̀rùn.

Nígbà tí o bá n kọ́ ààyè ayélujára kan, o gbọ́dọ̀ máa nílò àwọn èròjà tó jọra kan: ọnà kan láti yanjú ìfàṣẹsí aṣàmúlò (ìforúkọsílẹ̀, wíwọlé, jíjáde), pánẹ́ẹ̀lì ìṣàkóso kan fún ààyè ayélujára rẹ, àwọn fọ́ọ̀mù, ọnà kan láti gbé àwọn fáìlì sórí ayélujára, àti bẹ́ẹ̀ bẹ́ẹ̀ lọ.

Èyí tó jẹ́ oríre fún ẹ, àwọn èèyàn kan ti ṣàkíyèsí tipẹ́tipẹ́ wípé àwọn olùgbéjáde ayélujára má n kojú àwọn ìṣòro tó jọra nígbà kíkọ́ ààyè ayélujára tuntun kan, nítorí náà wọ́n pèrò pọ̀ láti ṣẹ̀dá àwọn àgbékalẹ̀ (Django jẹ́ ọ̀kan lára wọn) tó ma fún ẹ ní àwọn èròjà tó wà nílẹ̀ láti lò.

Àwọn àgbékalẹ̀ wà láti gbà ọ́ sílẹ̀ lọ́wọ́ ṣíṣe nnkan tí ẹnìkan ti ṣe kalẹ̀ tẹ́lẹ̀ àti láti lè dín ìṣòro tí o lè kojú kù nígbà tí o bá n kọ́ ààyè ayélujára tuntun kan.

## Kí nìdí tó o fi nílò àgbékalẹ̀ (framework) kan?

Láti lóye nípa nnkan tí Django wà fún gan-an, a nílò láti ṣàgbéyẹ̀wò àwọn server náà. Nnkan àkọ́kọ́ ní pé server náà yíò nílò láti mọ̀ wípé o fẹ́ kí ó pèsè ojú-ìwé ayélujára kan fún ẹ.

Wòye sí àpótì méèlì kan (port) èyí tí a n ṣàmójútó fún àwọn lẹ́tà tí ń bọ̀ (requests). Èyí jẹ́ ṣíṣe nípasẹ̀ server ayélujára kan. Server ayélujára náà yíò ka lẹ́tà náà àti lẹ́yìn náà yíò fi ìdáhùn kan ránṣẹ́ pẹ̀lú ojú-ìwé ayélujára kan. Ṣùgbọ́n nígbà tí o bá fẹ́ fi nnkan ránṣẹ́, o nílò láti ní àwọn àkóónú kan. Django jẹ́ nnkan kan tí yóò ràn ọ́ lọ́wọ́ láti ṣẹ̀dá àkóónú náà.

## Kíni yíò ṣẹlẹ̀ nígbà tí ẹnìkan bá béèrè ààyè ayélujára kan láti server rẹ?

Nígbà tí ìbéèrè kan bá wá sí server ayélujára kan, yóò kọjá sí Django tí yíò gbìyànjú láti mọ ohun tí a béèrè fún gan-an. Yíò kọ́kọ́ mú àdírẹ́ẹ̀sì ojú-ìwé ayélujára kan tí yíò sì gbìyànjú láti mọ ohun tó yẹ kó ṣe. Apá yìí jẹ́ ṣíṣe nípasẹ̀ **urlresolver** ti Django (ṣàkíyèsí pé àdírẹ́ẹ̀sì ààyè ayélujára kan ni a n pè ní URL – Uniform Resource Locator – nítorí náà orúkọ *urlresolver* náà bọ́gbọ́n mu). It is not very smart – it takes a list of patterns and tries to match the URL. Django checks patterns from top to bottom and if something is matched, then Django passes the request to the associated function (which is called *view*).

Wòye sí òṣìṣẹ́ méèlì kan pẹ̀lú lẹ́tà kan. Ó n rìn lọ ní òpópónà náà tó sì n ṣàyẹ̀wò nọ́mbà ilé kọ̀ọ̀kan sí èyí tó wà lórí lẹ́tà náà. Tó bá báramu, yíò fi lẹ́tà náà síbẹ̀. Báyìí ni urlresolver náà ṣe n ṣiṣẹ́!

Nínú iṣẹ́ *view* náà, gbogbo àwọn nnkan tó dára ma jẹ́ ṣíṣe: a lè wo àkójọpọ̀ dátà kan láti wá àwọn àlàyé díẹ̀. Bóyá aṣàmúlò náà béèrè láti ṣàyípadà nnkan kan nínú dátà náà? Like a letter saying, "Please change the description of my job." The *view* can check if you are allowed to do that, then update the job description for you and send back a message: "Done!" Then the *view* generates a response and Django can send it to the user's web browser.

The description above is a little bit simplified, but you don't need to know all the technical things yet. Having a general idea is enough.

Nítorí náà dípò kí a ṣàlàyé lẹ́kùn-únrẹ́rẹ́, a ó bẹ̀rẹ̀ ṣíṣẹ̀dá nnkan pẹ̀lú Django tí a ó sì kẹ́kọ̀ọ́ nípa gbogbo àwọn apá tó ṣe pàtàkì náà bí a ṣe ń tẹ̀síwájú!