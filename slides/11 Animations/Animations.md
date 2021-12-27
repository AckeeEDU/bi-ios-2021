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

# Animations

---

## Minulé cviko

:question: Otázky?

:construction_worker: Semestrálky 

---

## Animation

Portayal of UI over a period of time

Configurable, usually very brief

The point of animation is to make user experience less abrupt

Draws the attention to things that are changing

---

## What can be animated?

Changes to the `View`s in cotainers that are already on screen

Appearance/disapperance of `Views`

Changes to the arguments to `Animatable` view modifiers of `Views`

Changes to the arguments to the creation of `Shapes`

---

## Types of animations

Implicit - using view modifier `.animation(Animation)`

Explicit - by wrapping `withAnimation(Animation) { }` around code

---

## Implicit animations

Using view modifier `.animation(Animation)`

"Automatic animation" - marks a `View` so that all modifiers arguments will always be animated

Changes are animated with specified `duration` and `curve`

```swift
Text("❤️")
    .opacity(isVisible ? 1 : 0)
    .animation(.easeInOut(duration: 1))
```

---

## Animation curve

`.linear` - consistent rate throughout

`.easeIn` - animation starts quickly, then slows at the end

`.easeOut` - opposite of `.easeIn`

`.easeInOut` - starts out slowly, picks up speed, then slows at the end

`.spring` - provides a bounce to the animation 

---

## Explicit animations

By wrapping `withAnimation(Animation) { }` around code

Changes made as a result of executing block of code are animated together

Changes are animated with specified `duration` and `curve`

---

## Transitions

Specifies how to animate arrival/departure of `View`s using `.transition()` 

Transition is a pair of `ViewModifier`s - "before" and "after" modifications

Defines what transition to use, not causing transition to occur

Transitions only work on explicit animations, not the implicit ones!

---

## .onAppear

Transitions only work on `View`s already on screen

`.onAppear { }` can be used on `View` to cause a change that results in a transition

There's also `.onDisappear { }` 😉

---

## AnimatableModifier

Used to create custom modifier with animation

Specified using `var animatableData: Type`

`Type` has to implement `VectorArithmetic` - usually a floating point number

`Type` can also be a pair - `AnimatablePair`

---

<!-- _class: lead -->

## Let's animate something! 💫

---

## Lottie

JSON-based animation file format

Enables designers to ship animations on any platform easily as assets

Easy to integrate into your app

---

## Summary

Types of animations (implicit, explicit)

Transitions

`.onAppear { }`, `.onDisappear { }`

`AnimatableModifier`

Lottie

---

<!-- _class: lead -->

## Questions :question:

---

<!-- _class: lead -->

## Thank you very much!
