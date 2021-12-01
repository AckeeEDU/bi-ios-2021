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

# Gesta

---

## Gesta

Základní interakce s objekty

Lze napojit na libovolné view

Fungují pouze na neprázdných plochách

---

## GestureState

```swift
@GestureState var value: CGFloat = 0
```

Obdoba `@State`

Pouze readable, nelze zapisovat

Při ukončení gesta automaticky nastavená počáteční hodnota

---

## Základní gesta

`TapGesture`

`LongPressGesture`

`DragGesture`

`MagnificationGesture`

`RotationGesture`

---

## Použití

```swift
@GestureState var offset: CGSize = .zero

DragGesture()
    .updating($offset) { state, value, _ in state = value }
```

---

## Integrace s `View`

```swift
MojeView()
    .gesture(DragGesture())
```

```swift
MojeView()
    .onTapGesture { }
```

---

<!-- _class: lead -->

## :tada: Live coding!
