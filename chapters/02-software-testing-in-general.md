## Software testing in general

Abych se mohl zaměřit na testování RESTful API, považuji za vhodné nejprve zopakovat základy testování software. Jedná se o součást procesu vývoje software, která je velice důležitá, ale která bývá z různých důvodů opomíjena či je jí přikládána menší důležitost. Pokud je vyvíjený software testován, je vhodné mít přehled o možnostech testování a právě tyto možnosti v této kapitole stručně popíšu. Následující kapitoly budou předpokládat znalost zde uvedených pojmů a souvislostí.

Budu se věnovat celkem třem různým klasifikacím testů. Je vhodné si uvědomit, že konkrétní jeden test či skupina testů může být zařazena do více než jedné skupiny a že lze různé vlastnosti testů téměř libovolně kombinovat.

### Testing methods

Software nebo samotný kousek kódu je možné testovat různými úhly pohledu. Pokud píšeme jednoduchou funkci, může se nám zdát dostačující otestování metodou "kouknu a vidím". Jedná se o _statický_ způsob testování software, který je ale snadno náchylný k chybám. Sám jsem si v praxi několikrát ověřil, jak snadné je udělat chybou i v jediném řádku kódu, který byl navíc zkontrolován v rámci _code review_ dalším vývojářem. Osobně považuji tento způsob testování za nedostatečný. Metodu _code review_ považuji za kontrolu splnění _coding standards_ než ověření správně funkčnosti.

K ověření správné funkčnosti je potřeba _dynamický_ přístup, tedy spustit kód a zkontrolovat, zda se chová dle očekávání. Tento přístup považuji za velmi praktický, protože testuje to, **co kód opravdu dělá** a netestuje **co si vývojář myslí, že kód dělá**. V případě testování software v různých běhových prostředích tak vývojář nemusí přemýlet na různými možnostmi, ale jednoduše spustí testy v každém běhovém prostředí, které chce otestovat. Stále je ale potřeba se rozhodnout, jak budeme testovaný kód pouštět a jakou metodu testování zvolíme. Podívejme se na tři, dle mého názoru nejčastější, metody.

#### Black-Box testing

Tuto metodu osobně považuji za nejjednodušší, protože testy není potřeba měnit při změně vnitřní implementace kódu. Testovaný kód považujeme za _black box_, který na základě vstupních parametrů vrátí nějaký výstup. Je důležité, aby testovaný kód vrátil pro každé volání se stejnými parametry vždy stejný výsledek. Mohou samozřejmě existovat výjimky, jako například testování generátoru náhodných čísel, ale zde bychom testovali kód na základě více výstupů a ne na základě pouze jednoho.

Za velkou výhodu této metody považuji možnost zadat testování někomu, kdo nezná imlementaci. Dokonce je možné připravit testy ještě před samotnou implementací. Z toho usuzuji, že se jedná o vhodnou metodu pro tzv. Test Driven Development. Nevýhodou ale zůstává fakt, že bez znalosti konkrétní implementace může být problém se specifikací vstupních parametrů tak, aby bylo otestováno co největší množství základních i okrajových případů. Pokud v rámci testování provádíme i měření pokrytí kódu testy, je těžké dosáhnout kompletního pokrytí touto metodou u komplexnějšího software.

#### White-Box testing

Opačným přístupem je metoda využívající pojem _white box_. Můj osobní pohled by ji nazval spíše _transparent box_, ale jedná se jen o detail. Pří testování touto metodou je nám dobře známa implementace testovaného kódu. Měli bychom být schopni navrhnout kombinace vstupních parametrů tak, aby bylo pokrytí kódu testy maximální a také abychom otestoval velkou část známých případů. Narozdíl od předchozí metody nám pro stejné pokrytí kódu může postačit mnohem méně testovacích případů, protože pro některé kombinace může být chování kódu stejné.

Osobně tuto metodu používám častěji, abych ušetřil testování duplicitních kombinací vstupních parametrů a abych zvýšil jistotu kompletního otestování. Znalost vnitřní implementace totiž může být pro některé typy testů velmi užitečná. Dostaneme se k tomu znovu u konkrétních typů. Při této metodě je také velice pravděpodobné, že při změně vnitřní implementace bude potřeba změnit i samotný test.

#### Grey-Box testing

Ačkoli mlžeme chtít testovat nějaký software _White Box_ metodou, nemusí nám to některá omezení dovolit. Stále ale můžeme mít více informací, než je potřeba pro _Black Box_ testování. Taková metoda je označována jako _Grey Box_ a z mého pohledu se jedná o _Black Box_ s tím rozdílem, že máme nějakou dokumentaci implementace. Pokud víme, jak by měl testovaný kód interně fungovat, přináší nám to výhodu _White Box_ testování, takže můžeme navrhnout minimální množství testů pro poměrně komplexní otestování. Protože ale nemáme přístupný kód, spoléháme na zadané informace, které se od skutečnosti mohou lišit.

Je známo několik různých řadících algoritmů a každý má své specifické vlastnosti. Pokud máme otestovat metodu pro seřazení pole bez znalosti implementace, zkusíme seřadit několik různých polí a kontrolujeme, zda je výstup správný. Tato metoda je _Black Box_ a je ale velmi těžké otestovat okrajové případy, které záleží na konkrétní implementaci. Pokud bychom navíc dostali informaci o tom, že vnitřní implementací je například Quick Sort, jsme schopni testy navrhnout o hodně lépe a jedná se o metodu _Grey Box_. Pokud bychom dostali i zdrojové kódy vnitřní implementace, jsme schopni doplnit testy o situace, které bez znalosti konkrétní vnitřní implementace budeme těžko hledat. To je metoda _White Box_.

Každá z těchto tří metod má svoje výhody i nevýhody a každou je možné využít v libovlné části testovacího procesu. V některých krocích tohoto procesu využijeme více _White Box_ a jinde _Black Box_, ale jak jsem naznačil na příkladu výše, je možné začít na _Black Box_ testování veškerého kódu a postupně testy zlepšovat a upravovat. Zároveň je dobré si uvědomit, že v rámci jednoho testu nemohou být tyto metody kombinovány, protože svojí podstatou pokrývají disjunktní množiny případů. Je sice možné pro část parametrů k testu přistoupit metodou _Black Box_ a další část navrhnout v rámci _White Box_, tím ale nepoužíváme obě metody současně, jen jsme se přesunuli od jedné metody ke druhé.

### Testing levels

#### Unit testing

#### Integration testing

#### System testing

#### Acceptance testing

### Testing types

#### Compatibility testing

#### Smoke and sanity testing

#### Regression testing

#### Acceptance testing

#### Destructive testing

#### Performance testing

#### Accessibility testing

#### Security testing

### Testing process

#### Continuous integration
