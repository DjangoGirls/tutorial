# Mi a Django?

A Django egy webes alkalmazások készítésére használható, Pythonban írt, ingyenes, nyílt forráskódú keretrendszer (framework). A webes keretrendszerek különböző építőelemek gyűjteményei, segítségükkel könnyebben és gyorsabban tudunk weboldalakat fejleszteni.

Amikor weboldalt készítesz, mindig hasonló elemekre lesz szükséged: meg kell oldanod a felhasználók azonosítását (regisztráció, be- és kijelentkezés), kell egy felület a honlap kezeléséhez, formok (kérdőívek), kell valami megoldás a fájlok feltöltésére, stb.

Szerencsére mások már régen észrevették, hogy a webfejlesztők mindig hasonló problémákkal szembesülnek egy új oldal készítésekor, ezért közösen kifejlesztettek különböző keretrendszereket (ezek egyike a Django). Ezek a frameworkok használatra kész komponenseket tartalmaznak.

A keretrendszerek megakadályozzák, hogy újra és újra fel kelljen találnod a spanyolviaszt, és sok időt megspórolnak a weboldalkészítésben.

## Miért van szükséged keretrendszerre?

Hogy megértsd, pontosan mire jó a Django, fontos, hogy jobban megismerd a szervereket. Az első dolog, amit egy szervernek tudnia kell az az, hogyha szeretnéd, hogy kiszolgáljon neked egy weboldalt.

Képzelj el egy postaládát (port), amit folyamatosan figyelnek, hogy vannak-e beérkezett levelek (requestek). Ezt csinálja egy webszerver. A webszerver elolvassa a levelet, és választ (response) küld, amiben egy weboldal van. Azonban amikor küldeni szeretnél valamit, szükséged van tartalomra. A Django ennek a tartalomnak a megalkotásában segít.

## Mi történik, amikor valaki lekérdez egy honlapot a szerveredtől?

Amikor beérkezik egy kérés (request) a szerverre, a Django kapja meg, ami megpróbálja kitalálni, hogy pontosan mire irányul a kérés. Először a weboldal címét nézi meg, és megpróbál rájönni, hogy mit kell tenni. Ezt a részt a Django **urlresolver** része végzi (emlékezz vissza, hogy a weboldalak címét URL-nek - Uniform Resource Locatornak - hívják, vagyis az *urlresolver* névnek - kb. url-fordító - van értelme). Ez a dolog nem túl okos - csak fog egy csomó mintát (pattern), és megpróbálja hozzájuk illeszteni az URL-t. A Django felülről lefelé vizsgálja meg a mintákat, és ha az URL valamelyikkel megegyezik, továbbadja a requestet a megfelelő function-nek (függvénynek), amit *view*-nak hívunk).

Képzelj el egy postást egy levéllel. Ahogy halad az utcán, minden házszámot megnéz, és összehasonlítja a levélen lévővel. Ha megegyezik, bedobja a levelet a postaládába. Így működik az urlresolver!

A *view*, vagyis "nézet" rész az, ahol az érdekes dolgok történnek: itt nézhetünk bele adatbázisokba, hogy megkeressünk valamilyen információt. Talán a felhasználó meg szeretne változtatni valamilyen adatot? Mint egy levél, ami azt írja: "Kérlek, változtasd meg a munkám leírását." A *view* megnézi, hogy jogosult vagy-e erre a módosításra, aztán megváltoztatja a munka leírását, és visszaküld egy üzenetet: "Kész!". Aztán a *view* létrehoz egy választ, amit a Django elküld a felhasználó böngészőjének.

Természetesen ez a leírást egy kicsit leegyszerűsítettünk, de még nem kell, hogy minden technikai részletet tudj. Elég, ha van egy általános elképzelésed.

Most ahelyett, hogy túlságosan belemennénk a részletekbe, egyszerűen csak elkezdünk létrehozni valamit a Djangóval, és menet közben fogjuk megtanulni a fontos részeket!