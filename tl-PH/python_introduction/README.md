# Introduksyon sa Python

> Parte ng kabanatang ito ay nakabase sa tutorial ng Geek Girls Carrots (https://github.com/ggcarrots/django-carrots).

Magsulat tayong code!

## Prompt ng python

> Para sa mga nagbabasa sa bahay: ang parteng ito ay nalakip sa [Python Basics: Integers, Strings, Lists, Variables and Errors](https://www.youtube.com/watch?v=MO63L4s-20U) na video.

Para magsimulang maglaro ng Python, kailangan nating buksan ang *command line* ng iyong kompyuter. Dapat alam mo na kung paano gawin ito - natutunan na natin ito sa [Intro sa Command Line](../intro_to_command_line/README.md) na kabanata.

Kapag handa ka na, sundin ang mga direksyon sa ibaba.

Gusto nating buksan ang Python na console, kaya magtype ng `python` sa Windows o `python3` sa Mac OS/Linux at pindutin ang `enter`.

{% filename %}command-line{% endfilename %}

    $ python3
    Python 3.6.1 (...)
    Type "help", "copyright", "credits" or "license" for more information.
    >>>
    

## Ang una mong Python na pag-uutos!

Pagkatapos patakbuhin ang Python na command, ang prompt ay mabago sa `>>>`. Para sa atin, ibig nitong sabihin na sa ngayon maari lang tayong gumamit ng mga command sa Python na wika. Hindi mo na kailangang mag-type sa `>>>` - gagawin na iyan ng Python para sa iyo.

Kung gusto mong umalis sa Python na console sa kahit anung punto, magtype lang ng `exit()` para sa Windows at `Ctrl + D` para sa Mac/Linux. Kung gayon ay hindi mo na makikita pa ang `>>>`.

For now, we don't want to exit the Python console. We want to learn more about it. Let's start by typing some math, like `2 + 3` and hitting `enter`.

{% filename %}command-line{% endfilename %}

```python
>>> 2 + 3
5
```

Ayos! Nakita mo paano lumabas ang sagot? Alam ng Python ang matematika! Maaari mong subukan ang mga pag-uutos kagaya ng:

- `4 * 5`
- `5 -1`
- `40 / 2`

Para magpagana ng exponential na mga kalkulasyon, sabihin nating 2 to the power 3, magtype tayo ng: {% filename %}command-line{% endfilename %}

```python
>>> 2 ** 3
8
```

Magsaya muna dito ng mga ilang sandali at pagkatapos ay bumalik na dito. :)

Gaya na nakikita mo, ang Python ay isang magandang calculator. Maaring nagtataka ka kung ano pa ang kayang gawin nito…

## Mga String

Paano na ang iyong pangalan? I type ang iyong unang pangalan sa loob ng panipi gaya nito:

{% filename %}command-line{% endfilename %}

```python
>>> "Ola"
'Ola'
```

Ngayon ay nalikha mo na ang iyong kauna-unahang string! Ito ay isang pagkasunod-sunod ng mga karakter na maaring iprosesa sa pamamagitan ng kompyuter. Ang string ay dapat parang nagsimula at nagtapos sa parehong karakter. Ito ay maaring isang single (`'`') o double (`"`) na mga quote (walang kaibahan!) Ang mga quote ay magsasabi kay Python na ang laman nito ay isang string,.

Ang mga string ay maaring ikabit sa bawat isa. Subukan ito:

{% filename %}command-line{% endfilename %}

```python
>>> "Hi there " + "Ola"
'Hi there Ola'
```

Maari ka ring mag-multiply sa mga string gamit ang mga number:

{% filename %}command-line{% endfilename %}

```python
>>> "Ola" * 3
'OlaOlaOla'
```

Kung kailangan mong maglagay ng kudlit sa loob ng iyong string, mayroon kang dalawang paraan para gawin ito.

Gumamit ng double quotes:

{% filename %}command-line{% endfilename %}

```python
>>> "Runnin' down the hill"
"Runnin' down the hill"
```

o sa pag-escape sa kudlit gamit ang backslash (``):

{% filename %}command-line{% endfilename %}

```python
>>> 'Runnin\' down the hill'
"Runnin' down the hill"
```

Maganda, di ba? Para makita ang iyong pangalan sa malaki ang letra, itype ang:

{% filename %}command-line{% endfilename %}

```python
>>> "Ola".upper()
'OLA'
```

Kakagamit mo lang ng `upper` na **method</0> sa iyong string! Ang method (gaya ng `upper()`) ay isang sequence ng mga instruksyon na kailangang patakbuhin ni Python sa isang object (`"Ola"` pagkatapos mong tawagin ito.</p> 

Kung gusto mong malaman ang bilang ng mga letra na nilalaman ng iyong pangalan, may mga **function** para din dyan!

{% filename %}command-line{% endfilename %}

```python
>>> len("Ola")
3
```

Nagtataka ka ba kung bakit minsan tinatawag mo ang functions gamit ang `.` sa katapusan ng isang string (tulad ng `"Ola".upper()`) at minsan una mong tatawagin ang isang function at ilalagay ang string sa mga panaklong? Sa ibang mga kaso, ang mga function ay napapabilang sa mga bagay, tulad ng `upper()`, na magagawa lamang sa mga strings. Sa kasong ito, tinatawag natin ang function na isang **method**. Sa ibang oras, ang mga function ay hindi napapabilang sa kahit na ano at magagamit sa iba't ibang uri ng mga objects, tulad ng `len()`. Ito ang dahilan kung bakit kami ay nagbibigay ng `"Ola"` bilang parameter sa `len` na function.

### Buod

Ok, tama nang mga strings. Sa ngayon iyong natutunan ang tungkol sa:

- **the prompt** – ang pagta-type ng mga utos (code) patungo sa Python ay nagdudulot ng mga resulta ng mga kasagutan sa Python
- **numbers and strings** –sa Python, ang mga numero ay ginagamit sa math at ang mga strings para sa text objects
- **operators** – tulad ng `+` and `*`, pagsamahin ang mga value upang makagawa ng bago
- **mga function** – tulad ng `upper()` at `len()`, ay nagsasagawa ng mga aksyon sa mga objects.

Ito ang mga pangunahing kaalaman ng bawat wika ng programming na iyong matututunan. Handa ka na ba para sa mas mahirap? Sigurado kaming handa ka na!

## Mga problema

Sumubok tayo ng bago. Makukuha ba natin ang haba ng isang numero sa parehong paraan na makukuha natin ang haba ng ating pangalan? I-type ang `len(304023)` at pindutin ang `enter`:

{% filename %}command-line{% endfilename %}

```python
>>> len(304023)
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
TypeError: object of type 'int' has no len()
```

Nakatanggap tayo ng una nating problema! Sinasabi nito na ang mga object na may uri na "int" (mga integer, mga buong numero) ay walang haba. So, anong magagawa natin ngayon? Siguro ay maaari nating isulat ang ating numero bilang isang string? Ang mga string ay may haba, tama?

{% filename %}command-line{% endfilename %}

```python
>>> len(str(304023))
6
```

Gumana ito! Ginamit natin ang `str` na function sa loob ng `len` na function. Ang `str()` ang nagko-convert ng lahat sa mga string.

- Ang `str` na function ay nagko-convert ng mga bagay para maging **strings**
- Ang `int` na function ay nagko-convert ng mga bagay para maging **integers**

> Mahalaga: maari nating i-convert ang mga numero para maging teksto, ngunit hindi natin maaaring i-convert ang teksto para maging mga numero – magiging ano ang `int('hello')` kung gayon?

## Mga variable

Isang mahalagang konsepto sa programming ang mga variable. Ang variable ay walang iba kundi isang pangalan para sa isang bagay upang ito ay iyong magamit mamaya. Ginagamit ng mga programmer ang mga variable na ito upang mag-imbak ng data, gawing nababasa ang kanilang code at upang hindi na nila kailanganing alalahanin kung ano ang mga bagay.

Sabihin natin na gusto nating gumawa ng isang bagong variable na tinatawag na `name`:

{% filename %}command-line{% endfilename %}

```python
>>> name = "Ola"
```

We type name equals Ola.

Tulad ng napansin mo, ang iyong program ay hindi naging kagaya ng dati. Kaya paano natin malalaman na ang variable ay talagang mayroon? I-enter lamang ang `name` at pindutin ang `enter`:

{% filename %}command-line{% endfilename %}

```python
>>> name
'Ola'
```

Yehey! Ang iyong unang variable! :) Maaari mong baguhin kung anong tinutukoy nito:

{% filename %}commad-line{% endfilename %}

```python
>>> name = "Sonja"
>>> name
'Sonja'
```

Maaari mo rin itong gamitin sa mga function:

{% filename %}command-line{% endfilename %}

```python
>>> len(name)
5
```

Ang galing, hindi ba? Syempre, ang mga variable ay maaaring maging kahit ano - mga numero rin! Subukan ito:

{% filename %}command-line{% endfilename %}

```python
>>> a = 4
>>> b = 6
>>> a * b
24
```

Pero paano kung ginamit natin ang maling pangalan? Mahuhulaan mo ba kung ano ang mangyayari? Subukan natin!

{% filename %}command-line{% endfilename %}

```python
>>> city = "Tokyo"
>>> ctiy
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
NameError: name 'ctiy' is not defined
```

Isang pagkakamali! Kagaya ng nakikita mo, ang Python ay mayroong magkakaibang pagkakamali at itong isang ito ay tinatawag na isang **NameError**. Bibigyan ka ng Python ng pagkakamaling ito kung susubukan mong gumamit ng isang variable na hindi pa natutukoy. Kapag nakatagpo ka ng pagkakamaling ito sa susunod, suriin ang iyong code upang tingnan kung mayroon kang na mistype na kahit anong pangalan.

Paglaruan ito ng ilang sandali at alamin kung ano ang makakaya mong gawin!

## Ang print na function

Subukan ito:

{% filename %}command-line{% endfilename %}

```python
>>> name = 'Maria'
>>> name
'Maria'
>>> print(name)
Maria
```

Habang kaka-type mo lang ng `pangalan`, ang Python Interpreter ay sumasagot gamit ang string na *representasyon* ng variable na 'name', kung saan ang mga letra M-a-r-i-a, ay napalibutan ng single quotes, ". Kung sasabihin mong `print(name)`, si Python ay mag-print ng nilalaman ng mga variable sa screen, na walang mga quotes, na mas malinis.

Gaya ng makikita natin maya-maya, ang `print()` ay nakakatulong kung gusto nating iprint ang mga bagay-bagay mula sa loob ng mga function, o kung gusto nating i-print ang napakaraming mga linya.

## Mga Lista

Bukod sa mga string at mga integer, si Python ay mayroong iba't ibang tipo ng mga object. Ngayon, gusto naming ipakita sa iyo ang tinatawag nating **list**. Ang mga listahan ay eksaktong kung ano man ang sa tingin mo ang mga ito: ang mga bagay na mga listahan ng ibang mga bagay. :)

Sige at gumawa ng isang listahan:

{% filename %}command-line{% endfilename %}

```python
>>> []
[]
```

Oo, ang listahan na ito ay walang laman. Hindi kapaki-pakinabang, hindi ba? Gumawa tayo ng isang listahan ng mga numero sa lotto. Hindi natin gustong ulitin ang ating sarili sa lahat ng pagkakataon, kaya ilalagay din natin ito sa isang variable:

{% filename %}command-line{% endfilename %}

```python
>>> lottery = [3, 42, 12, 19, 30, 59]
```

Ang galing, mayroon na tayong isang listahan! Anong magagawa natin dito? Tingnan natin kung ilang mga numero sa lotto ang nasa listahan. Mayroon ka bang kahit anong ideya kung anong function ang gigimitin mo para diyan? Alam mo na ito!

{% filename %}command-line{% endfilename %}

```python
>>> len(lottery)
6
```

Oo! Ang `len()` ay makapagbibigay sa iyo ng bilang ng mga bagay sa isang listahan. Madaling gamitin, hindi ba? Maaari na nating ayusin ito ngayon:

{% filename %}command-line{% endfilename %}

```python
>>> lottery.sort()
```

Hindi nito ibinabalik ang kahit na ano, binago lamang nito ang pagkakasunod-sunod ng paglabas ng mga numero sa listahan. I-print natin ulit ito at tingnan kung ano ang nangyari:

{% filename %}command-line{% endfilename %}

```python
>>> print(lottery)
[3, 12, 19, 30, 42, 59]
```

Kagaya ng nakikita mo, ang mga numero sa iyong listahan ay naka-ayos na simula sa pinaka-mababa hanggang pinaka-mataas na halaga. Congrats!

Maaaring gusto nating baliktarin ang pagkakasunod-sunod? Gawin natin iyan!

{% filename %}command-line{% endfilename %}

```python
>>> lottery.reversed()
>>> print(lottery)
[59, 42, 30, 19, 12, 3]
```

If you want to add something to your list, you can do this by typing this command:

{% filename %}command-line{% endfilename %}

```python
>>> lottery.append(199)
>>> print(lottery)
[59, 42, 30, 19, 12, 3, 199]
```

Kung gusto mong ipakita ang unang numero lamang, magagawa mo ito sa pamamagitan ng paggamit ng **indexes**. Ang index ay ang numero na nagsasabi kung saan sa listahan makikita ang isang bagay. Mas pinipili ng mga programmer ang magsimulang magbilang sa 0, upang ang unang bagay sa iyong listahan ay nasa index 0, ang sunod ay nasa 1, at iba pa. Subukan ito:

{% filename %}command-line{% endfilename %}

```python
>>> print(lottery[0])
59
>>> print(lottery[1])
42
```

Gaya ng makikita mo, maaari kang mag-access ng iba-ibang objects sa iyong listahan sa pamamagitan ng paggamit sa pangalan ng listahan at nang index ng object na nasa loob ng square bracket.

Para magbura mula sa iyong listahan, kailangan mong gumamit ng mga **indexes** gaya ng natutonan natin sa taas at ang `pop()` na method. Subukan natin ang isang halimbawa para madagdagan pa ang ating natutunan kanina: ibubura natin ang unang numero sa ating listahan.

{% filename %}command-line{% endfilename %}

```python
>>> print(lottery)
[59, 42, 30, 19, 12, 3, 199]
>>> print(lottery[0])
59
>>> lottery.pop(0)
59
>>> print(lottery)
[42, 30, 19, 12, 3, 199]
```

Gumamo ito ng ganoon kadali lang!

Para mas masaya, subukan ang ibang mga indexes: 6, 7, 1000, -1, -6 o -1000. Tingnan kung mahulaan mo ang resulta bago patakbuhin ang command. May kabuluhan ba ang mga resulta?

Makakakita ka ng lista sa lahat ng list.na mga methods sa kabanatang ito ng dokumentasyon ng Python: https://docs.python.org/3/tutorial/datastructures.html

## Mga Diksyunaryo

> Para sa mga nagbabasa sa bahay: ang parteng ito ay nakalakip sa [Basics sa Python: Mga Diksyonaryo](https://www.youtube.com/watch?v=ZX1CVvZLE6c) na video.

Ang diksyonaryo ay pareha lang sa lista, pero maari mong makuha ang halaga sa pamamagitan ng paghanap gamit ang key sa halip na ang numeric na index. Ang syntax para mag-define ng diksyonaryong walang laman ay:

{% filename %}command-line{% endfilename %}

```python
>>> {}
{}
```

Nagpapakita ito na kakalikha mo lang ng diksyonaryong walang laman. Hurray!

Ngayon, subukang isulat ang sumunod na mga command (subukan ding magpalit na iyong sariling impormasyon):

{% filename %}command-line{% endfilename %}

```python
>>> participant = {'name': 'Ola', 'country': 'Poland', 'favorite_numbers': [7, 42, 92]}
```

Gamit ang command na ito, nakalikha ka ng variable na pinangalanang `participant` na may tatlong key-value na pares:

- Ang key na `name` ay nagtuturo sa value na `'Ola'` (na isang `string` na object),
- ang `country` ay nagtuturo sa `'Poland'` (isa na namang `string`),
- at ang `favorite_numbers` nagtuturo sa `[7, 42, 92]` (isang `lista` na may tatlong numero sa loob nito).

Maarii mong suriin ang mga nilalaman ng bawat indibidwal na mga keys gamit ang syntax na ito:

{% filename %}command-line{% endfilename %}

```python
>>> print(participant['name'])
Ola
```

Kita mo, pareho lang ito sa list. Ngunit hindi mo na kailangang alahanin ang index - ang pangalan lang.

Ano ang mangyari kapag tatanungin natin si Python kung ano ang halaga ng isang key na hindi umiiral? Mahulaan mo ba? Subukan natin ito at tingnan!

{% filename %}command-line{% endfilename %}

```python
>>> participant['age']
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
KeyError: 'age'
```

Tingnan mo, isa na namang error! Ito ay isang **KeyError**. Si Python ay nakakatulong at nagsasabi na ang key na `'age'` ay hindi umiiral sa diksyonaryo.

Kailan ka dapat gagamit ng diksyonaryo o lista? Isa itong magandang punto na dapat isipin. Gumawa ng solusyon sa isip mo bago tingnan ang sagot sa sunod na linya.

- Kailangan mo ba ng nakahanay na pagkakasunod ng mga aytems? Gumamit ng list.
- Kailangan mo bang i-ugnay ang mga value sa mga key, upang mahusay mong mahanap ang mga ito (sa pamamagitan ng key) sa ibang pagkakataon? Gumamit ng diksyunaryo.

Ang mga diksyunaryo, tulad ng mga listahan, ay *mutable*, ibig sabihin maari silang mabago pagkatapos silang likhain. Maaari kang magdagdag ng bagong pares ng key-value sa isang diskyunaryo pagkatapos itong malikha, katulad nito:

{% filename %}command-line{% endfilename %}

```python
>>> participant['favorite_language'] = 'Python'
```

Katulad ng mga listahan, ang paggamit ng `len()` na method sa mga diksyunaryo ay nagbibigay ng numero ng pares ng key-value na nasa diksyunaryo. Magpatuloy at i-type ang command na ito:

{% filename %}command-line{% endfilename %}

```python
>>> len(participant)
4
```

Umaasa ako na ito ay may katuturan pa hanggang sa ngayon. :) Handa ka na ba para sa mas maraming saya gamit ang mga diksyunaryo? Patuloy na magbasa para sa mga kahanga-hangang mga bagay.

Maaari mong gamitin ang `pop()` na method para burahin ang item sa diksyunaryo. Halimbawa, kung gusto mong burahin ang entry na tumutugma sa key `'favorite_numbers'`, i-type lamang ang sumusunod na command:

{% filename %}command-line{% endfilename %}

```python
>>> participant.pop('favorite_numbers')
[7, 42, 92]
>>> participant
{'country': 'Poland', 'favorite_language': 'Python', 'name': 'Ola'}
```

Gaya ng makikita mo sa output, ang key-value pair na nagtutukoy sa 'favorite_numbers' na key ay binura na.

At ito din, maari mong baguhin ang halaga na nakaugnay sa nalikha na na key sa diksyonaryo. I-type ito:

{% filename %}command-line{% endfilename %}

```python
>>> participant['country'] = 'Germany'
>>> participant
{'country': 'Germany', 'favorite_language': 'Python', 'name': 'Ola'}
```

Gaya ng makikita mo, ang halaga ng key na `'country'` ay pinalitan ng >0>'Germany'</code> mula sa `'Poland'`. :) Nakaka-excite ba? Hurray! Natuto ka ng kahanga-hangang bagay.

### Buod

Ang galing! Marami ka nang nalalaman tungkol sa programming ngayon. Sa huling parte na ito natutunan mo ang tungkol sa:

- **errors** - alam mo na paano magbasa at umintindi ng mga error na makikita kung si Python ay hindi nakaintindi sa command na binigay dito
- **variables** - mga pangalan para sa object na makakatulong na madaling makagawa ng code at gawing madaling basahin ang iyong code
- **lists** - mga lista ng mga object na nakahanay sa isang partikular na pagkakasunod
- **dictionaries** - mga object na nakaimbak gamit ang key-value na mga pares

Nasasabik ka na para sa sumunod na parte? :)

## Ihambing ang mga bagay

> Para sa mga nababasaha sa bahay: ang parteng ito ay nakalakip sa [Basics ng Python: Comparisons](https://www.youtube.com/watch?v=7bzxqIKYgf4) na video.

Ang malaking parte ng programming ay may kinalaman sa paghambing ng mga bagay. Ano ang pinakamadaling bagay na mahambing? Numero, siyempre. Tingnan natin kung paano ito gumagana:

{% filename %}command-line{% endfilename %}

```python
>>> 5 > 2
True
>>> 3 < 1
False
>>> 5 > 2 * 2
True
>>> 1 == 1
True
>>> 5 != 2
True
```

Binigyan natin si Python ng ilang numero para ihambing. Gaya ng makikita mo, hindi lang numero ang maaaring ihambing ni Python, ngunit pati na rin ang mga resulta ng mga method. Maganda, di ba?

Nagtaka ka ba kung bakit naglagay tayo ng dalawang equal na sign `==` na magkasunod para maghambing kung magkumbas ba ang mga numero? Tayo ay gagamit ng `=` para mag-assign ng mga values sa mga variable. Dapat parati, **parating** kailangan mong maglagay ng dalawa - `==` - kung gusto mong suriin ko magkatumbas ba ang bawat isa. Maari din nating sabihin na ang dalawang bagay ay hindi magkatugma. Para dito, gagamit tayo ng symbol na `!=`, gaya ng pinapakita sa halimbawa.

Bigyan si Python na dalawa pang mga gawain:

{% filename %}command-line{% endfilename %}

```python
>>> 6 >= 12 / 2
True
>>> 3 <= 2
False
```

We've seen `>` and `<`, but what do `>=` and `<=` mean? Read them like this:

- ang ibig sabihin ng x `>` y ay: x ay mas malaki pa sa y
- ang ibig sabihin ng x `<` y ay: si x ay maliit pa sa y
- ang ibig sabihin ng x `<=` y ay: si x maliit pa o katumbas ni y
- ang ibig sabihin ng x `>=` y ay: si x ay mas malaki pa o katumbas ni y

Magaling! Gusto mong gumawa pa ng isa? Subukan ito:

{% filename %}command-line{% endfilename %}

```python
>>> 6 > 2 and 2 < 3
True
>>> 3 > 2 and 2 < 1
False
>>> 3 > 2 or 2 < 1
True
```

Maarin mong bigyan si Python ng maraming numero na gusto mong ihambing, at ito ay magbibigay sa iyo ng sagot! Matalino, di ba?

- **and** - kung gagamit ka ng `and` na operator, ang inihambing ay dapat kailangang True para maging True ang buong command
- **or** - kung gagamit ka ng `or` operator, isa lang sa inihambing ang dapat True para maging True ang buong command

Nakakarinig ka na ba ng ekspresyon na "comparing apples to oranges"? Subukan natin ang katumbas nito sa Python:

{% filename %}command-line{% endfilename %}

```python
>>> 1 > 'django'
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
TypeError: '>' not supported between instances of 'int' and 'str'
```

Dito makikita mo na gaya ng nasa ekspresyon, si Python ay hindi maaring maghambing ng numero (`int`) at isang string `str`). Sa halip, magpapakita ito ng **TypeError** at nagsasabi na ang magkaibang uri ay hindi maaaring ihambing.

## Boolean

Incidentally, you just learned about a new type of object in Python. It's called **Boolean**.

May dalawang Boolean na mga objects lang:

- True
- False

Pero para maintindihan ito ni Python, kailangan mo itong isulat palagi isip 'True' (ang unang letra ay malaki ang titik, at ang iba pang mga letra ay nasa maliit na titik). **true, TRUE, and tRUE ay hindi gagana - ang True lang ang tama.** (Pareho din sa 'False', siyempre.)

Ang mga Boolean ay maari ding gawing variable din! Tingnan ito:

{% filename %}command-line{% endfilename %}

```python
>>> a = True
>>> a
True
```

Maari mo ding gawin ito sa ganitong paraan:

{% filename %}command-line{% endfilename %}

```python
>>> a = 2 > 5
>>> a
False
```

Magsanay at magkatuwaan sa mga Booleans sa pamamagitan ng pagpapatakbo sa mga sumunod na mga command:

- `True and True`
- `False and True`
- `True or 1 == 1`
- `1 != 2`

Maligayang bati! Ang boolean ay isa sa mga pinakamagandang katangian sa programming, at natutunan mo na kung paano gamitin ito!

# I-save ito!

> Para sa mga nagbabasa sa bahay: ang parteng ito ay nakalakip na sa [Python Basics: Saving Files at "If" na mga statement](https://www.youtube.com/watch?v=dOAg6QVAxyk) na video.

Hanggang sa panahong ito sinulat natin lahat ng ating python na code sa interpreter, na naglimita sa atin na maglagay ng isang linyang code sa isang beses. Ang mga normal na mga programs ay naka-save sa mga file at pinapatakbo ng ating programming language na **interpreter** o **compiler**. Hanggang sa panahong ito, pinapatakbo natin ang ating mga program na paisa-isang linya sa Python na **interpreter**. Kakailanganin natin ng higit pa sa isang linya ng code para sa ating susunod na mga gagawin, kaya dapat madali natin itong gawin:

- Lumabas sa Python na interpreter
- Buksan ang iyong code editor na napili
- Mag-save ng ilang code sa bagong python na file
- Patakbuhin ito!

Para lumabas mula sa interpreter ng Python na ginagamit natin, simpleng magtype lang ng `exit()` na function

{% filename %}command-line{% endfilename %}

```python
>>> exit()
$
```

Ito ay magbabalik sa iyo papunta sa command prompt.

Kanina, pumili tayo ng code editor mula sa seksyon ng mga [code editor](../code_editor/README.md). Kailangan nating buksan ang editor ngayon at magsulat ng ilang code sa ating bagong file:

{% filename %}editor{% endfilename %}

```python
print('Hello, Django girls!')
```

Maliwanag na ikaw ay isang magaling na Python developer na ngayon, kaya huwag mag-atubiling magsulat ng ilang code gamit ang mga natutunan mo ngayon.

Ngayon, kailangan nating i-save ang file at bigyan ito nang paglalarawan na pangalan. Tawagin natin ang file bilang **pythin_intro.py** at i-save ito sa iyong desktop. Maari natin itong pangalanan ng kahit na ano, ngunit ang importanteng parte lang dito ay dapat siguraduhin na ang file ay nagtatapos sa **.py**. Ang extension na **.py** ay nagsasabi sa ating operating system na ito ay isang **Python na executable file** at ang Python ay maaring magpatakbo nito.

> **Paalala** Dapat mapansin mo ang pinakamagandang bagay tungkol sa mga code editor: ang mga kulay! Sa Python na console, ang lahat ay may parehong kulay; ngayon dapat makita mo na ang `print` na function ay magkaiba ang kulay sa string. Ito ay tinatawag na "syntax highlighting", ay ito ay sobrang nakakatulong na feature habang gumagawa ng code. Ang mga kulay ng bagay-bagay ay magbibigay sa iyo ng mga mungkahi, gaya ng hindi nasara na mga strings o may typo sa pangalan ng keyword (tulad ng `def` sa isang function, na makikita natin sa baba). Ito ang isa sa mga rason kung bakit tayo gumagamit ng code editor. :)

Kung na-save na ang file, oras na para patakbuhin ito! Gamit ang mga abilidad na natutunan natin sa command line na seksyon, gumamit ng terminal para **baguhin ang mga directory** sa desktop.

<!--sec data-title="Change directory: OS X" data-id="python_OSX"
data-collapse=true ces-->

Sa Mac, ang command ay kaparehas nito:

{% filename %}command-line{% endfilename %}

    $ cd ~/Desktop
    

<!--endsec-->

<!--sec data-title="Change directory: Linux" data-id="python_linux"
data-collapse=true ces-->

Sa Linux, maging kagaya ito nito (ang salitang "Desktop" ay maaring nakasalin sa iyong lokal na wika):

{% filename %}command-line{% endfilename %}

    $ cd ~/Desktop
    

<!--endsec-->

<!--sec data-title="Change directory: Windows Command Prompt" data-id="python_windows" data-collapse=true ces-->

Sa Windows na Command Prompt, dapat ito ganito:

{% filename %}command-line{% endfilename %}

    > cd %HomePath%\Desktop
    

<!--endsec-->

<!--sec data-title="Change directory: Windows Powershell" data-id="python_windowsPSH" data-collapse=true ces-->

At sa Windows na Powershell, dapat ito kagaya nito:

{% filename %}command-line{% endfilename %}

    > cd $Home\Desktop
    

<!--endsec-->

Kung ikaw ay hindi nakausad, humingi lang ng tulong.

Ngayon, gumamit ng Python para magpatakbo ng code sa file gaya nito:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Hello, Django girls!
    

Paalala: sa Windows ang 'Python3' ay hindi kinilala na isang command. Sa halip, gumamit ng 'python' para patakbuhin ang file:

{% filename %}command-line{% endfilename %}

```python
> python python_intro.py
```

Sige! Napatakbo mo ang una mong Python na program naka-save sa file? Maganda sa pakiramdam?

Maari ka nang pumunta sa mga mahalagang kagamitan sa programming:

## If … elif … else

Maraming mga bagay sa code ang dapat mapatakbo kung ang mga kondisyon ay naabot. Ito ang dahilan kung bakit ang Python ay may tinatawag na **if statements**.

Palitan ang code sa iyong **python_intro.py** na file nito:

{% filename %}python_intro.py{% endfilename %}

```python
if 3 > 2:
```

Kung atin itong i-save at patakbuhin, makakakita tayo ng error gaya nito:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    File "python_intro.py", line 2
             ^
    SyntaxError: unexpected EOF while parsing
    

Umaasa si Python na magbibigay pa tayo ng karagdagan instruksyon sa kanya na papatakbuhin kung ang condition na `3 > 2` (o `True` para dito). Subukan natin na magprint si Python ng "It works!". Palitan ang code sa iyong **python_intro.py** na file nito:

{% filename %}python_intro.py{% endfilename %}

```python
if 3 > 2:
    print('It works!')
```

Napansin mo kung paano natin iniindent ang sunod na linya ng code sa pamamagitan ng 4 na puwang? Kailangan nating gawin ito para malaman ni Python kung anong code ang papatakbuhin kung ang resulta ay true. Maari kang maglagay ng isang agwat, pero halos lahat ng mga programmer sa Python ay gumamit ng 4 para malinis itong tingnan. Ang single na `tab` ay bibilang din sa 4 na agwat.

I-save ito at patakbuhin ito ulit:

{% filename %}command-line{% endfilename %}

```python
$ python3 python_intro.py
It works!
```

Paalala: Tandaan na sa Windows, ang 'python3' ay hindi kilalang command. Mula sa ngayon, palitan natin ang 'python3' ng 'python' para ma-execute ang file.

### Paano kung ang kondisyon ay hindi True?

Sa huling mga halimbawa, ang code ay gumana lang kung ang kondisyon ay True. Ngunit si Python ay mayroon ding `elif` at `else` na mga statement:

{% filename %}python_intro.py{% endfilename %}

```python
if 5 > 2:
    print('5 is indeed greater than 2')
else:
    print('5 is not greater than 2')
```

Kung ito ay papatakbuhin, mag-print out ito ng:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    5 is indeed greater than 2
    

If 2 were a greater number than 5, then the second command would be executed. Let's see how `elif` works:

{% filename %}python_intro.py{% endfilename %}

```python
name = 'Sonja'
if name == 'Ola':
    print('Hey Ola!')
elif name == 'Sonja':
    print('Hey Sonja!')
else:
    print('Hey anonymous!')
```

at pinapatakbo:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Hey Sonja!
    

Kita mo kung ano ang nangyari dito? Ang `elif` ay binigyan ka ng karagdagang mga kondisyon na mapatakbo kung ang huling condition ay nakaligtaan.

Maari kang magdagdag nang maraming `elif` na mga statement kahit na ano ang gusto mo pagkatapos ng iyong pangunang `if` na statement. Halimbawa:

{% filename %}python_intro.py{% endfilename %}

```python
volume = 57
if volume < 20:
    print("It's kinda quiet.")
elif 20 <= volume < 40:
    print("It's nice for background music")
elif 40 <= volume < 60:
    print("Perfect, I can hear all the details")
elif 60 <= volume < 80:
    print("Nice for parties")
elif 80 <= volume < 100:
    print("A bit loud!")
else:
    print("My ears are hurting! :(")
```

Si Python ay titingnan ang bawat test ayon sa pagkakasunod at magprint ng:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Mahusay, naririnig ko ang lahat ng mga detalye
    

## Mga Komento

Ang mga komento ay mga linyang nagsisimula sa `#`. Maaring kang magsulat ng kahit na anong gusto mo pagkatapos ng `#` at ibalewala ito ni Python. Ang mga komento ay kailangan para madaling maintindihan ng ibang tao ang iyong code.

Tingnan natin kung paano ito:

{% filename %}python_intro.py{% endfilename %}

```python
# Palitan ang volume kung ito ay masyadong maingay o masyadong mahina
if volume < 20 or volume > 80:
    volume = 50
    print("That's better!")
```

Hindi mo kailangang magsulat ng komento sa bawat linya ng iyong code, ngunit nakakatulong sila para magpaliwanag kung ano ang ginagawa ng iyong code, o magbigay ng buod kung ito ay gumawa ng komplikadong mga bagay.

### Buod

Sa huling mga exercise natutunan mo ang tungkol sa:

- **Paghambing ng mga bagay-bagay** - sa Python maari mong ihambing ang mga bagay-bagay gamit ang `>`, `>=`, `==`, `<=`, `<` at ang `and`, `or` na mga operators
- **Boolean** - isang tipo ng object na maari lang magkaroon ng dalawang value: `True` o `False`
- **Pag-save ng files** - ang pag-store ng code sa mga file para mapatakbo ang malaking mga program.
- **if … elif … else** - mga statement na magbibigay sa atin ng kakayahan na magpatakbo ng code kung naabot ang iilang mga konsiyon lamang.
- **mga comments** linya na hindi papatakbuhin ni Python na nagbibigay sa atin ng paraan na madokumento natin ang ating code

Oras na para sa huling parte ng kabanatang ito!

## Ang iyong sariling mga function!

> Para sa mga nagbabasa sa bahay: ang parteng ito ay nakalakip sa [Basics sa Python: Mga Functions](https://www.youtube.com/watch?v=5owr-6suOl0) na video.

Natandaan mo ba ang mga functions gaya ng `len()` na maari mong patakbuhin sa Python? Magandang balita - matutunan mo ngayon kung paano magsulat ng sariling mong mga function!

Ang function ay isang sunod-sunod na mga instruksyon na dapat patakbuhin ni Python. Bawat function sa Python ay nagsisimula sa keyword na `def`, ay binagay na pangalan at maaring magkaroon ng ilang mga parameters. Let's give it a go. Palitan ang code sa **python_intro.py** ng sumusunod:

{% filename %}python_intro.py{% endfilename %}

```python
def hi():
    print('Hi there!')
    print('How are you?')

hi()
```

Sige, ang ating kauna-unahang function ay handa na!

Maaring nagtaka ka kung bagit natin isinulat ang pangalan ng function sa baba ng file. Ito ay dahil ang Python ay nagbabasa lang ng mga file at nag-execute ito mula sa taas papuntang pababa. Kaya para magamit ang function, dapat mo itong isulat ulit sa baba.

Patakbuhin natin ito ngayon at tingnan kung ano ang mangyari:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Hi there!
    How are you?
    

Paala: Kung ito ay hindi gumagana - huwag mag-alala! Ang output ay makakatulong sa iyo para malaman mo kung bakit:

- Kung nakakuha ka ng `NameError`, siguro ang ibig sabihin nito ay may na-type kang mali, kaya dapat suriin mo kung gumagamit ka ba ng parehong pangaan habang naglikha ng function gamit ang `def hi();` at habang tinatawag ito gamit ang `hi()`.
- Kung nakakuha ka ng `IndentationError`, tingnan kung ang dalawang `print` na mga linya ay mayroong whitespace sa simula ng linya: gusto ni python na maganda ang pagkalinya ng mga code sa loob ng function.
- Kung wala talagang output, tingnan kung ang huling `hi()` *ay hindi* naka-indent - kung naka-indent, ang linyang iyan ay magiging parte din ng function, at hindi ito mapatakbo kahit kailan.

Gawin natin ang ating unang function na may mga parameter. Gagamitin natin ang ating huling halimbawa - isang function na nagsasabi ng 'hi' sa taong nagpapatakbo nito - na may pangalan:

{% filename %}python_intro.py{% endfilename %}

```python
def hi(name):
```

Gaya ng makikita mo, binigyan natin ang ating function ng isang parameter na tinatawag na `name`:

{% filename %}python_intro.py{% endfilename %}

```python
def hi(name):
    if name == 'Ola':
        print('Hi Ola!')
    elif name == 'Sonja':
        print('Hi Sonja!')
    else:
        print('Hi anonymous!')

hi()
```

Tandaan: Ang `print` na function ay naka-indent ng apat na agwat sa loob ng `if` na statement. Ito ay dahil ang function ay tatakbo kung ang kondisyon ay tumugma. Tingnan natin kung paano ito gumana:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Traceback (most recent call last):
    File "python_intro.py", line 10, in <module>
      hi()
    TypeError: hi() missing 1 required positional argument: 'name'
    

Oops, may problema. Buti nalang nagbibigay si Python ng sobrang nakakatulong na error na mensahe. Nagsasabi ito sa atin na ang function na `hi()` (ang nilikha natin) ay may kinakailangan na argumento (tinatawag na `name`) at nalimutan natin itong ipasa habang tinatawag natin ang function. Aayusin natin ito sa baba ng file:

{% filename %}python_intro.py{% endfilename %}

```python
hi("Ola")
```

At patakbuhin ito ulit:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Hi Ola!
    

At paano kung babaguhin natin ang pangalan?

{% filename %}python_intro.py{% endfilename %}

```python
hi("Sonja")
```

At patakbuhin ito:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Hi Sonja!
    

Ngayon, ano ang naisip mong mangyari kung magsulat tayo ng ibang pangalan dyan? (Hindi Ola o Sonja.) Subukan mo ito at tingnan kong tama ka. Dapat magprint ito ng ganito:

{% filename %}command-line{% endfilename %}

    Hi anonymous!
    

Ang galing nito, di ba? Sa ganitong paraan hindi mo kailangang ulit-ulitin ang iyong sarili sa bawat oras na gusto mong baguhin ang pangalan ng tao na dapat batiin ng function. At ito talaga ang dahilan kung bakit kailangan natin ng mga function - hindi natin gusto na ulitin ang iyong code!

Gagawa pa tayo ng mas matalino pa - mayroong mas higit pa sa dalawang pangalan, at ang pagsulat ng kondisyon sa bawat isa ay mahirap, di ba?

{% filename %}python_intro.py{% endfilename %}

```python
def hi(name):
    print('Hi ' + name + '!')

hi("Rachel")
```

Tawagin natin ang code ngayon:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Hi Rachel!
    

Maligayang bati! Natutunan mo na kung paano magsulat ng mga functions! :)

## Mga Loop

> Para sa mga nagbabasa sa bahay: ang parteng ito ay nakalakip sa [Basics sa Python: For Loop](https://www.youtube.com/watch?v=aEA6Rc86HF0) na video.

Ito na ang pinakahuling parte. Madaling lang, di ba? :)

Hindi gusto ng mga programmer na ulitin ang kanilang mga sarili. Ang programming ay para ma-automate ang mga bagay-bagay, para hindi na natin babatiin ang bawat tao gamit ang kanilang pangalan nang mano-mano, di ba? Lubhang nakakatulong dito ang mga loops.

Naalala mo pa ang mga lista? Gagawa tayo ng lista ng mga babae:

{% filename %}python_intro.py{% endfilename %}

```python
girls = ['Rachel', 'Monica', 'Phoebe', 'Ola', 'You']
```

Gusto nating batiin silang lahat gamit ang kanilang pangalan. Tayo ay mayroong `hi` na function para gawin yan, kaya gamitin natin ito sa isang loop:

{% filename %}python_intro.py{% endfilename %}

```python
para sa pangalan ng mga babae:
```

Ang ```para``` ang pahayag ay kumikilos nang pareho sa ```kung``` pahayag; ang code sa baba ay parehong kailangan na i-indent nang apat na espasyo.

Narito ang kabuuang code na nasa loob ng file:

{% filename %}python_intro.py{% endfilename %}

```python
def hi(name):
    print('Hi ' + name + '!')

girls = ['Rachel', 'Monica', 'Phoebe', 'Ola', 'You']
for name in girls:
    hi(name)
    print('Next girl')
```

At kapag pinatakbo natin ito:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Hi Rachel!
    Sunod na babae
    Hi Monica!
    Sunod na babae
    Hi Phoebe!
    Sunod na babae
    Hi Ola!
    Sunod na babae
    Hi You!
    Sunod na babae
    

Tulad ng nakikita mo, lahat ng inilagay mo sa loob ng isang `for` na pahayag na mayroong indent ay uulitin para sa bawat elemento ng listahan `girls`.

Maaari mo ring gamitin ang `for` sa mga numero gamit ang `range` na function:

{% filename %}python_intro.py{% endfilename %}

```python
para sa i sa range na (1, 6):
    print(i)
```

Na magpi-print:

{% filename %}command-line{% endfilename %}

    1
    2
    3
    4
    5
    

`range` ay isang function na gumagawa ng isang listahan ng mga numero na sumusunod sa isa pagkatapos ng isa (ang mga numerong ito ay binibigay mo bilang mga parameter).

Tandaan na ang pangalawa sa mga numerong ito ay hindi kasama sa listahan na ini-output ng Python (nangangahulugan na ang `range(1, 6)` ay nagbibilang mula 1 hanggang 5, pero hindi kasama ang numerong 6). Ito ay dahil ang "range" ay kalahating nakabukas, at ibig sabihin nito ay kasama dito ang unang halaga, pero hindi ang huli.

## Buod

Iyan na yun.**You totally rock!** Ito ay isang nakakalitong kabanata, kaya dapat mong ipagmalaki ang iyong sarili. Ipinagmamalaki ka namin sa iyong narating!

For official and full python tutorial visit https://docs.python.org/3/tutorial/. This will give you a more thorough and complete study of the language. Cheers :)

You might want to briefly do something else – stretch, walk around for a bit, rest your eyes – before going on to the next chapter. :)

![Cupcake](images/cupcake.png)