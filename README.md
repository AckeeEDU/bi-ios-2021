# BI-IOS 2021

| Přednáška | Přednášející | Stanford |
| --------- | -------- | -------- |
| 01 Xcode, Swift Basics | LH | [Swift](https://cs193p.sites.stanford.edu/sites/g/files/sbiybj16636/files/media/file/reading_1.pdf) |
| 02 SwiftUI Basics | LH | [Getting Started with SwiftUI](https://www.youtube.com/watch?v=bqu6BquVi2M) |
| 03 More SwiftUI | IR | [Getting Started with SwiftUI](https://www.youtube.com/watch?v=bqu6BquVi2M) |
| 04 Navigace | IR | [Learning More about SwiftUI](https://youtu.be/3lahkdHEhW8) |
| 05 Networking, multithreading | LH | Není |
| 06 MVVM | JO | [MVVM](https://youtu.be/--qKOhdgJAs)<br>[More MVVM enum Optionals](https://youtu.be/oWZOFSYS5GE) |
| 07 MVVM + UIImagePicker | JO | [MVVM](https://youtu.be/--qKOhdgJAs)<br>[More MVVM enum Optionals](https://youtu.be/oWZOFSYS5GE) |
| 08 Map | JO | Není |
| 09 Shapes | LH | [Protocols Shapes](https://www.youtube.com/watch?v=Og9gXZpbKWo) |
| 10 Gestures |LH | [EmojiArt Drag/Drop](https://youtu.be/eNS5EzgK3lY)<br>[Gestures](https://youtu.be/iszjyoo3SYI) |
| 11 Animations | IR | [ViewModifier Animation](https://youtu.be/PoeaUMGAx6c)<br>[Animation Demo](https://youtu.be/-N1UR7Y105g) |
| 12 TBD | LH | TBD |

V průběhu kurzu doporučujeme shlédnout online přednášky ze Stanfordu, které slouží jako hlavní zdroj informací pro tento kurz [https://cs193p.sites.stanford.edu](https://cs193p.sites.stanford.edu).

## Obsah

* [1. domácí úkol](#1-domácí-úkol)
* [2. domácí úkol](#2-domácí-úkol)
* [Semestrální práce](#semestrální-práce)
* [Summary přednášek](#přednášky)

## 1. domácí úkol

> :exclamation: Deadline: **7. 11. 2021 23:59:59**

Vaším úkolem je vytvořit detailu příspěvku.

Detail bude obsahovat všechny fotografie, které jsou u příspěvku nahrány = může jich být více než jenom jedna. Zobrazení je na vás, ale může se hodit pogooglit, jak se dělá `pageView` ve SwiftUI. :bulb: :smirk:

Na detailu budé také vidět autorovo uživatelské jméno a nějak hezky do toho zakomponujte komentáře u daného příspěvku – všechno bude zobrazeno na jedné obrazovce.

Pro načtení komentářů použijte následující url:
```
https://fitstagram.ackee.cz/api/feed/{postID}/comments
```
kde místo `{postID}` dáte ID postu, které přijde z Feedu. Na cviku jsme si říkali něco o tom, jak neblokovat hlavní vlákno, zkuste to dodržet. :pray:

Všechny tyto věci zkuste hezky spojit na jedné obrazovce.

Odevzdávání můžete udělat přes mail `lukas.hromadnik@ackee.cz` nebo mě pozvěte do svého repa, kde budete mít řešení, a na mail mi pošlete větev / commit, kde řešení najdu.

**Bonus** (max 2 body): Přijde na obrazovku tlačítko, které bude přepínat mezi zobrazením a skrýváním informací kromě fotek. Ve výsledku tedy pomocí tohoto tlačítka bude buď vidět vše nebo jenom fotografie.

## 2. domácí úkol

> :exclamation: Deadline: **12. 12. 2021 23:59:59**

Vaším druhým úkolem bude vytvořit obrazovku a kompletní logiku pro přidání nového příspěvku.

Každý nový příspěvek bude obsahovat vybranou fotografii a popisek. Oba parametry jsou povinné.

UI pro vytvoření příspěvku je ve vašich rukou. Napojte novou obrazovku na "+" tlačítko, které je na hlavní stránce.

Základní flow pro přídání příspěvku by mělo být následující:

1. Tapnu na "+" a zobrazí se mi obrazovka pro přidání nového příspěvku.
2. Na této obrazovce vyberu obrázek z galerie (nebo třeba i foťáku, nepovinné), který se potom zobrazí.
3. Pomocí textového pole přidám k obrázku popisek.
4. Tapnutím na nějaké další tlačítko se sestaví request na API a data se odešlou.
6. Vrátí-li se ze serveru chyba, zobrazte ji.
7. Po úspěšném vytvoření a odeslání příspěvku jsem přesměrován zpět na seznam.
8. Na seznamu mám možnost na nový příspěvek nascrollovat.

Pro vytvoření příspěvku použijte tento [endpoint](https://fitstagram.ackee.cz/docs/#/Feed/post_feed).

Fotografie je potřeba před odesláním na server upravit.

1. Větší rozměr fotografie nesmí přesáhnout 2048. Může tedy vzniknout potřeba obrázek zmenšit. 
2. Fotky posílejte na server jako JPEG zakódovaný do řetězce pomocí base64.

Obě výše zmíněné operace jsme na cvikách neukazovali, ale jednoduchým Googlením se dostanete k odpovědím. Pokud by se nedařilo, dáme vám k dispozici kód, pomocí kterého to uděláte. Záměrně vám to nechceme dávat hned na začátek, ať si to můžete zkusit. Opravdu to není nic složitého.

## Semestrální práce

V rámci semestrální práce je vaším úkolem ukázat, co jste se naučili. Téma je na vás, ale je potřeba si ho nechat mnou schválit. Schválení musí proběhnout do konce výuky, tedy do posledního cvika.

Na vypracování pak máte celý semestr – až do konce zkouškového.

Odevzdávání, pokud nám to situace dovolí, bude probíhat osobně u nás v kancelářích. Nenechávejte odevzdání na poslední chvíli, aby na vystačil nějaký termín. Může se stát, že pokud necháte odevzdání do posledního dne, nebude možné pro vás najít termín na odevzdání a tedy i dokončit předmět.

Pokud to situace nedovolí, bude odevzdávání online.

Rozsah práce by mělo být 3 - 5 obrazovek (může být míň, pokud to dává smysl v rámci zadání) s použitím architektury MVVM. Ideálně ukázat nějaké zajímavější věci než jenom statické obrazovky – networking, multithreading, gesta, mapa, výběr obrázků, malování, atd.

## Přednášky

### 01 Xcode, Swift Basics
* Xcode
* Swift
  * `String`, `Int`, `Bool`, `Double`
  * podmínky, cykly
  * `Optional`

### 02 SwiftUI Basics
* Swift
  * Pole, dictionaries, tuples
  * `struct`, `enum`, `class`
  * Protokoly, extensions
  * Access control
  * Generika
  * Trailing closure syntax
* SwiftUI
  * `View`, `some`, `@ViewBuilder`
  * `VStack`, `HStack`, `Text`, `Button`, `Image`
  * SFSymboly

### 03 More SwiftUI
* Sizing (top-down, bottom-up)
* View modifiers
* `LazyVGrid`/`LazyHGrid`
* `ForEach`
* `ScrollView`
* Protocols
  * `Equatable`
  * `Hashable`
  * `Identifiable`
  * `Comparable`
* `NavigationView`, `NavigationLink`

### 04 Navigace
* Xcode shortcuts
* `List`
* Property wrappers
* `@State`, `@Binding`, `@Environment`
* View presentation
  * Alert
  * Sheet
  * `fullScreenCover`
* `TabView`

### 05 Networking, multithreading
* `DispatchGroup`, `.main` + `.global()`, `sync` + `async`
* REST API
* `URLRequest`
* `Codable`

### 06 MVVM
* proč MVVM
* opáčko value types vs. ref types
* rozšíření `enum`ů o associated values
* základy error handlingu

#### API
* api, které používáme běží na [https://fitstagram.ackee.cz/api/](https://fitstagram.ackee.cz/api/)
* je to jen pro účely tohohle předmětu, tak na něj buďte hodní 😎
* má to i nějakou [dokumentaci](https://fitstagram.ackee.cz/docs/)
* ne nutně všechno z dokumentace je zatím naimplementovaný, dodělává se to podle toho, jak je to potřeba na cviko

### 07 MVVM + UIImagePicker

* dokončení MVVM
* jednoduchá integrace starších UIKit API do SwiftUI
* výběr fotky z galerie pomocí `UIImagePickerController`

### 08 Ukol + Environment

* ukázkové řešení prvního úkolu
* Environment & [`EnvironmentValues`](https://developer.apple.com/documentation/swiftui/environmentvalues)
* konzultace

### 09 Shapes

* Definice `Shapes` a `Path`, na co je vhodné to použít.
* Ukázky: `Rectangle`, `PieceOfCake`, `Polygon`
* `GeometryReader` a jeho použití
* Ukázka: `BarChart`

### 10 Gestures

### 11 Animations

### 12 TBD
