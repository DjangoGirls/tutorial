# Ano ang Django?

Django (/ˈdʒæŋɡoʊ/ *jang-goh*) ay isang libre at open source na framework ng web application, na sinulat sa Python. Isang web framework na bumubuo ng mga bahagi na makakatulong sa iyo na maggawa ng mga website nang mabilis at madali.

Kung gumagawa ka ng isang website, kinakailangan mo lagi ng parehang grupo nga mga sangkap: pamamaraan para mag-authenticate ng user (pagsign-up, pagsign-in, pagsign-out), isang panel para sa pangangasiwa ng iyong website, at mga form, at pamamaraan para sa pag-upload ng mga files, at iba pa.

Maswerte ka, maraming tao ang nakapansin na ang mga develepor ay kadalasang makadanas ng pare-parehang problema sa paggawa ng bagong site, kaya sila ay nagsamasama para gawin ang mga framework (isa na dito ang Django) na nagbigay sa iyo ng mga handang magagamit na mga sangkap.

Ang mga framework ay nilikha para maiwasan mong gawin ulit ang mga bagay-bagay at makakatulong para mabawasan ang gastusin sa paggawa ng bagong site.

## Bakit mo kinakailangan ng framework?

Para maintindihan mo kung para saan talaga ang Django, kailangan nating tingnan nang maigi ang ating mga server. Una, dapat malaman ng server na gusto mo itong magpakita ng mga web page.

Isipin mo ang isang buson (port) na nagsubaybay sa mga padating na mga sulat (requests). Ito ay ginagawa ng web server. Ang web server ay nagbabasa ng mga sulat at nagpadala ng sagot sa pamamagitan ng webpage. Pero sa oras na gustong mong magpadala, kinakailangan na meron kang nilalaman. Ang Django ay makakatulong sa paglikha ng iyong mga nilalaman.

## Ano ang mangyari kung may maghingi ng website galing sa iyong server?

Kapag dumating ang hiling sa web server, ipapasa ito sa Django na nagbibigay pagpapakahulugan sa hiling na natanggap. Kukuha ito muna ng address ng web page at subukang intindihin kung ano ang dapat gawin. Ang parte na ito ay ginagawa ng **urlresolver** ni Django (paalala na ang address ng website ay tinatawag na URL - Uniform Resource Locator - kaya ang pangalan na *urlresolver* ay may kabuluhan). Hindi ito masyadong matalino - kukuha lang ito ng lista ng mga parisan at susubukang ipares ang katugmang URL. Si Django ay magsusuri ng mga parisan mula sa taas hanggang sa baba at kung may makita itong pares, ipapasa ni Django ang request sa isang kasamahan na function (na tinatawag na *view*).

Isipan ang isang tagapagpadala ng mga sulat na may dalang liham. Naglalakad siya sa mga kalsada at isa-isa niyang tiningnan ang bawat bahay kung may tugma sa address na nakasulat sa liham. Kung may tugma, ilalagay niya ang liham doon. Ganito nagtatrabaho ang isang urlresolver!

Sa *view* na function, lahat ng mga kaayayang mga bagay ay nagawa, pede mong tingnan ang database para magkuha ng mga impormasyon. Maaring hiniling ng user na baguhin ang data? Gaya ng isang liham na nagsasabing, "Pakipalitan ang paglalarawan ng aking trabaho." Maaring tingnan ng *view* kung ikaw ay may pahintulot na gawin ito, saka i-update niya ang paglalarawan ng trabaho para sa iyo at magpapadala ng mensahe na: "Tapos na!". Pagkatapos ang *view* ay gagawa ng sagot at ipapadala ito ni Django sa web browser ng user.

The description above is a little bit simplified, but you don't need to know all the technical things yet. Having a general idea is enough.

So instead of diving too much into details, we will start creating something with Django and we will learn all the important parts along the way!