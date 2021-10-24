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
| 09 Shapes | TBD | [Protocols Shapes](https://www.youtube.com/watch?v=Og9gXZpbKWo) |
| 10 Gestures |TBD | [EmojiArt Drag/Drop](https://youtu.be/eNS5EzgK3lY)<br>[Gestures](https://youtu.be/iszjyoo3SYI) |
| 11 Animations | TBD | [ViewModifier Animation](https://youtu.be/PoeaUMGAx6c)<br>[Animation Demo](https://youtu.be/-N1UR7Y105g) |
| 12 TBD | TBD | TBD |


## Online přednášky

V průběhu kurzu doporučujeme shlédnout online přednášky ze Stanfordu, které slouží jako hlavní zdroj informací pro tento kurz [https://cs193p.sites.stanford.edu](https://cs193p.sites.stanford.edu).

## 1. domácí úkol

> :exclamation_mark: Deadline: **7. 11. 2021 23:59:59**

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

### 04 Navigace

### 05 Networking, multithreading
* `DispatchGroup`, `.main` + `.global()`, `sync` + `async`
* REST API
* `URLRequest`
* `Codable`

### 06 MVVM

### 07 MVVM + UIImagePicker

### 08 Map

### 09 Shapes

### 10 Gestures

### 11 Animations

### 12 TBD
