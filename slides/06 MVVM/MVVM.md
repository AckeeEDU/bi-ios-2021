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

marp: true

---

<!-- _class: lead -->

# MVVM


---

<!-- _class: lead -->

## Minulé cviko - Otázky ❓

---

## MVVM

jednoduchá a flexibilní architektura

rozdělení kódu tak, aby `View` _nedělalo všechno_

zlepšuje/umožňuje znovupoužitelnost

odstiňuje `View` od toho, jak se získávají data

zvyšuje testovatelnost

---

## MVVM

![center](MVVM.png)

`Model` - logika + perzistence apod.

`ViewModel` - příprava dat pro `View` + propagace akcí do modelu

`View` - zobrazení dat z VM + předávání UI interakcí do VM

---

## ViewModel

obecně může mít vlastní modelové objekty, na které bude konvertovat objekty z modelu

v našem případě bude zastupovat i roli modelu

přijímá z view akce typu "přidej komentář" a překládá je na akce typu "pošli tenhle request na tenhle endpoint a s odpovědí udělej tohle"

---

<!-- _class: lead -->

## Live coding! :tada:

---

## Shrnutí

MVVM

Enums + Generics

Debugger 🐛

Pokud jste neviděli, tak i tak mrkněte na MVVM přednášky ze Stanfordu

---

<!-- _class: lead -->

## Otázky :question:

---

<!-- _class: lead -->

## Děkuji za pozornost! 🙌
