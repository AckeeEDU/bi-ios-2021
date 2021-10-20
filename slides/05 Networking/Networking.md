---
style: |
  section h1 {
  	font-size: 500%;
  	text-align: center;
  	color: #fff;
  }

  section h2 {
  	font-size: 250%;
  	text-align: center;
  }

  section {
  	justify-content: start;
  	color: #fff;
  	background-color: #000;
  }

  section.lead {
  	justify-content: center;
  }
  img[alt~="center"] {
    display: block;
    margin: 0 auto;
  }
  img {
    background-color: transparent!important;
  }
  section pre {
    background-color: #333
  }
  .hljs-keyword {
    color: rgb(247, 67, 157)
  }
  .hljs-attr {
    color: white
  }
  .hljs-string {
    color: rgb(255, 95, 99)
  }
  .hljs-title, .hljs-type {
    color: rgb(117, 225, 255)
  }
---

<!-- _class: lead -->

# Networking & Multithreading

---

## Minulé cviko

:question: Otázky?

:white_check_mark: Domácí úkoly opraveny (E-mail, Git)

:construction_worker: Semestrálky 

---

## Multithreading

Vlákýnka :star_struck:

Hlavní UI vlákno, slouží k aktualizaci UI

Všechna ostatní vlákna pro výpočet

Pokud nejsou problémy, není potřeba vlákna řešit

---

## Multithreading

Používá s blokovým syntaxem

Synchronizace je tedy udělaná za vás

Další možnosti vlákýnek `DispatchGroup` a `DispatchSemaphore`

---

## Vlakýnka

`DispatchQueue.main` vs `DispatchQueue.global()`

`queue.async` vs `queue.sync`

`queue.asyncAfter(deadline: .now() + 1)`

---

<!-- _class: lead -->

## Live coding! :tada:

---

## Networking

Komunikace appky pomocí síťové rozhraní s vnějším světem

Velice souvisí s multihreadingem (ukážeme si)

Spousta služeb má API = specifikace pro komunikaci

---

## REST API

Representational state transfer

Čistá implementace velmi vzácná :disappointed:

Data v JSONu (XML :vomiting_face:)

---

## JSON

```json
[
    {
        "color": "red",
        "value": "#f00"
    },
    {
        "color": "green",
        "value": "#0f0"
    },
    {
        "color": "blue",
        "value": "#00f"
    }
]
```

---

## JSON

```json
{
    "color": "blue",
    "value": "#00f",
    "components": [
        0,
        0,
        255
    ],
    "dark": {
        "value": "#f00",
        "components": [
            255,
            0,
            0
        ] 
    }   
}
```

---

## Request

URL `https://mujsuperweb.cz/api/endpoint?key=value`

Metoda `GET`, `POST`, `PUT`, `DELETE`

Hlavičky

- `Content-Type: application/json`
- `Authorization: Bearer AAAAAAAAAAAAAAAFnz2wAAAACOwLSPtVT5gxxxxxx`

Tělo – data posílaná na server

---

<!-- _class: lead -->

## Live coding! :tada:

---

## `Codable`

Protokol + code gen sloužící ke zakódování / dekódování objektů do / z dat

Pokud je API hezké, výsledek je snadný a zadarmo

Několik možností, jak nasadit na "ošklivé" API

`typealias Codable = Decodable & Encodable`

---

## `Decodable`

```json
{
    "color": "red",
    "value": "#f00"
}
```

```swift
struct Color: Decodable {
    let color: String
    let value: String
}
```

---

## `Decodable`

```json
{
    "color_name": "red",
    "value": "#f00"
}
```

```swift
struct Color: Decodable {
    enum CodingKeys: String, CodingKey {
        case name = "color_name"
        case value
    }
    
    let name: String
    let value: String
}
```

---

## `Decodable`

Pro velmi ošklivá API

```swift
struct Color: Decodable {
    enum CodingKeys: String, CodingKey {
        case name = "color_name"
    }

    let name: String

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
    }
}
```

---

## `JSONDecoder`

Zodpovědný za převedení JSONu do objektu

```swift
struct Model: Decodable { }

let decoder = try JSONDecoder().decode(Model.self, from: data)
```

---

## `Encodable`

Zakódování objektu do dat (opačný směr než `Decodable`)

Opět se používají `CodingKeys` pro parametry, které jsou různě pojmenované

---

## `Encodable`

```swift
struct Color: Encodable {
    enum CodingKeys: String, CodingKey {
        case name = "color_name"
    }

    let name: String

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(name, forKey: .name)
    }
}
```

---

```swift
struct Color: Codable {
    enum CodingKeys: String, CodingKey {
        case name = "color_name"
    }

    let name: String

    init(from decoder: Decoder) throws {
        let container = decoder.container(keyedBy: CodingKeys.self)

        name = try container.decode(String.self, forKey: .name)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(name, forKey: .name)
    }
}
```

---

## `Codable`

[https://www.raywenderlich.com/3418439-encoding-and-decoding-in-swift](https://www.raywenderlich.com/3418439-encoding-and-decoding-in-swift)

---

<!-- _class: lead -->

## Live coding! :tada:

---

## Semestrální úloha

To nejdůležitější – dejte si záležet! :pray:

Potřeba ukázat, co jste se naučili.

Téma na vás – potřeba schválit téma do posledního cvika :bangbang:

---

## 1. domácí úkol

Udělat detail postu
- může mít více fotek (:bulb: `PageView`)
- nějaké hezké UI (fotky jsou vidět celé)

Načtení a zobrazení komentářů včetně nějakého UI (třeba nějak přes fotku)

Zobrazení informací o uživateli / postu s nějakým pěkným UI

**Bonus**: Po tapnutí na nějaké tlačítko se skryje všechno kromě fotek

---

## Shrnutí

Multithreading + Networking

`Codable`

Domácí úkol č. 1, Semestrálky

:eyes: Na příště MVVM přednášky ze Stanfordu 

---

<!-- _class: lead -->

## Otázky :question:

---

<!-- _class: lead -->

## Děkuji za pozoronost!
