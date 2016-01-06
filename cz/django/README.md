# Co je Django?

Django (*jang-goh/ˈdʒæŋɡoʊ /*) je svobodný a open source webový aplikační framework, napsaný v Pythonu. Webový framework je sada komponent, která pomáhá vyvíjet webové stránky rychleji a snadněji.

Když vytváříš webové stránky, vždy potřebuješ podobnou sadu komponent: způsob, jak zpracovat ověření uživatele (registraci, přihlášení, odhlášení), administrační panel pro tvé webové stránky, formuláře, způsob jak nahrávat soubory, atd.

Naštěstí si ostatní lidé již dávno všimli, že vývojáři čelí stejným problémům, při vytváření nových stránek. Takže se spojili a vytvořili frameworky (Django je jedním z nich), které obsahují sadu hotových komponent pro snadné použití.

Frameworky existují, aby ti ušetřily čas a ty jsi nemusela znovu vynalézat, co už někdo zdlouhavě vymýšlel. Stejně tak by ti měli ušetřit čas při vytváření nových webových stránek.

## Proč potřebuješ framework?

Abychom pochopili, co ve skutečnosti Django je, musíme se blíže podívat na to co dělá server. První věcí je, že server musí vědět, že chceš, obsloužit tebou zvolenou webovou stránkou.

Představ si poštovní schránku (port), která na zvoleném portu sleduje příchozí zprávy (požadavky). Podobně se chová webový server. Webový server čte požadavky od uživatele a odešle odpověď v podobě webové stránky. Ale když chceš něco poslat, musíš mít nějaký obsah. A Django je něco, co ti pomůže vytvořit tento obsah.

## Co se stane, když někdo požaduje webové stránky ze serveru?

Pokud přijde žádost na webový server, je předána Django frameworku, který se snaží přijít na to, co vlastně uživatel požaduje. Nejprve vezme adresu webové stránky a snaží se přijít na to, co udělat. Tuto část provádí Django **urlresolver** (všimni si, že adresa webové stránky se nazývá URL - Uniform Resource Locator - proto jméno *urlresolver* dává smysl). Tato činnost není složitá - bere si seznam vzorů a v něm se pokouší vyhledat shodu s URL. Django kontroluje seznam vzorů od shora dolů a pokud některý odpovídá, pak Django předá žádost související funkci, (které se nazývá *view*).

Představ si pošťáka s dopisem. Kráčí po ulici a kontroluje každé číslo domu jestli odpovídá adrese na dopisu. Pokud adresa odpovídá, dopis vloží do schránky. Stejným způsobem funguje urlresolver!

V funkci*view* se provádí všechny zajímavé věci: můžeme se podívat do databáze a vyhledat nějaké informace. Možná, že uživatel chtěl změnit něco v datech? Dopis může říkat "prosím změňte popis mé práce." *View* může zkontrolovat, zda máš povolení tuto změnu provést, pak aktualizuje popis práce a odešle ti zprávu: "Hotovo!". V tuto chvíli *view* vygeneruje odpověď a Django ji může odeslat tvému webovému prohlížeci.

Samozřejmě výše uvedený popis je trochu zjednodušený, ale prozatím není nutné znát všechny technické detaily. Pro obecnou představu to postačí.

Takže místo studování přílišných podrobností, jednoduše začneme něco vytvářet pomocí Django a touto cestou se naučíme všechny důležité části!