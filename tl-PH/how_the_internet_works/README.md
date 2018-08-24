# Paano gumagana ang Internet

> Para sa mga nagbabasa sa bahay: sa kabanatang ito nakalakip ang [Paano Gumagana ang Internet](https://www.youtube.com/watch?v=oM9yAA09wdc) na video.
> 
> Ang kabanatang ito ay binigyang inspirasyon sa talumpati ni Jessica McKellar na "How the Internet works" (http://web.mit.edu/jesstess/www/).

Sa tingin namin ay araw-araw kang gumagamit ng Internet. Pero alam mo ba kung ano talaga ang nangyari kapag nag-type ka na address gaya ng https://djangogirls.org sa iyong browser at pinindot ang `enter`?

The first thing you need to understand is that a website consists of a bunch of files saved on a hard disk. Gaya ng mga palabas, musika o mga larawan. Ngunit, may isang parte na pambihira sa mga website: naglalaman ito ng computer code na tinatawag na HTML.

Kung hindi mo kabisado ang pagpoprogram, maaring mahirap intindihin ang HTML sa una, pero ang mga browser mo (gaya ng Chrome, Safari, Firefox, at iba pa) ay nagkagusto dito. Ang mga web browser ay ginawa para magbasa ng code, sumunod sa mga instruksyon, at magpresenta sa mga file na ito na bumuo sa iyong website, eksakto kung paano mo ito gusto.

Sa bawat file, kailangan nating ilagay ang mga HTML files sa hard disk. Para sa Internet, gagamit tayo ng espesyal, malalakas na mga kompyuter na tinatawag na *servers*. Wala silang screen, mouse o keyboard, dahil ang pangunahin gamit lang nila ay magstore ng datos at magsilbi nito. Kaya sila tinawag na *servers* - dahil sila ay *tagasilbi* ng iyong mga datos.

Sige, ngunit gusto mong malaman kung paano gumana ang Internet, di ba?

Ginuhit namit ito para sa iyo! Mukha itong ganito:

![Tambilang 1.1](images/internet_1.png)

Ang gulo, di ba? Sa totoo lang, ito ay isang network ng mga nakakonektang mga makina (ang nabanggit na mga *servers*). Daan-dang libong mga makina! Marami, napakaraming kilometro na mga kable sa buong mundo! Maari mong bisitahin ang Submarine Cable Map na website (http://submarinecablemap.com) para makita mo kung gaano ito ka masalimuot ang net. Ito ang screenshot mula sa website:

![Tambilang 1.2](images/internet_3.png)

Kawili-wili ito, di ba? But it is not possible to have a wire between every machine connected to the Internet. Kaya, para maabot ang mga makina (halimbawa, ang makina kung saan naka-save ang https://djangogirls.org) kailangan nating magpasa ng request sa napakarami at iba-ibang mga makina.

Maging kagaya ito ito:

![Tambilang 1.3](images/internet_2.png)

Isipin na kung magtatype ka ng https://djangogirls.org, ikaw ay nagpapadala ng sulat na nagsasabing: "Minamahal kong Django Girls, gusto kong makita ang djangogirls.org na website. Ipadala ito sa akin, please!"

Ang iyong sulat ay napunta sa iyong pinakamalapit na post office. Pagkatapos ay napunta ito sa malapit ng kaunti sa pinapadalhan mo, tapos sa isa pa, at isa pa hanggang sa napadala na ito sa destinasyon. Ang tanging nag-iisang bagay lang, kung mag papadala ka ng maraming mga sulat (*data packets*) sa parehong lugar, maaring silang mapunta sa iba-ibang mga koreo (*routers*). Nakadepende ito kung paano sila naipamahagi sa bawat opisina.

![Tambilang 1.4](images/internet_4.png)

That's how it works - you send messages and you expect some response. Instead of paper and pen you use bytes of data, but the idea is the same!

Sa halip na mga address na may mga pangalan ng daan, zip code, at pangalan ng bansa, gagamit tayo ng IP na mga address. Ang iyong komputer ay magtatanong muna sa DNS (Domain Name System) na isalin ang djangogirls.org sa IP address. Gumana ito gaya ng mga lumang mga phonebook kung saan maghahanap ka na pangalan ng tao na gusto mong ikontak at hanapin ang kanilang numero ng telepono at address.

Kung magpapadala ka ng sulat, kailangan itong magkaroon nga mga tiyak na katangian para mapadala ito ng tama: ang address, ang selyo, at iba pa. Maari ka ring gumamit ng wika na maiintindihan ng tagatanggap, di ba? Pareho din sa *data packets* na pinadala mo para makita ang website. Gumamit tayo ng protocol na tinatawag ng HTTP (Hypertext Transfer Protocol).

Kaya, kung mayroon kang website, kailangan mong magkaroon ng *server* (makina) kung saan ito nakatira. Kung ang *server* ay nakatanggap ng paparating na *request* (sa sulat), ipapadala nito pabalik ang iyong website (sa ibang sulat).

Dahil ito ay isang Django na tutorial, maaring nakapagtanong ka kung ano ang ginagawa ni Django. Kung magpapadala ka ng sagot, hindi mo kinakailangan magpadala ng parehang mensahe sa lahat. Mas maganda kung ang mga sulat ay personalized, lalong lalo na sa tao na kakasulat lang sa iyo, di ba? Si Django ay tumutulong sa iyo para makalikha ng mga personalized at kawili-wili na mga sulat. :)

Tapos na ang usapan - oras na para lumikha!