# Základy Swiftu

---

## Základní typy

```swift
let string: String = "nějaký text"
var number = 0
let bool = false
```

---

## Řídící struktury

```swift
if condition {
    // ...
} else if anotherCondition {
    // ...
} else {
    // ...
}
```

```swift
guard condition else { return }
```

---

## Cykly

```swift
for i in 0..<10 {
    // ...
}
```

```swift
while condition {
    // ...
}

repeat {
    // ...
} while condition
```

---

## Funkce / metody

```swift
func foo(bar barInner: Int) -> Bool {
    if barInner > 0 {
        return false
    } else {
        return true
    }
}
foo(bar: 1) // returns false
```

```swift
func foo(_ bar: Int) -> Bool {
    return barInner > 0
}

func foo(_ bar: Int) -> Bool {
    barInner > 0
}
```

---

## Optionals

```swift
var optionalValue: String? = "x"
// ...
optionalValue = nil
```

Optional proměnná buď obsahuje hodnotu a je rovna `x` anebo vůbec nemá hodnotu přiřazenou.

Jediný datový typ, který má toto chování. Zbytek typů má garantovanou hodnotu.

---

### Implicit init

```swift
var value: String? // no need to specify the right side
```

---

### Použití v kódu

```swift
let optionalCount: Int? = optionalValue?.count
```

```swift
if let value = optionalValue {
    // here value: String
}
```

```swift
guard let value = optionalValue else { return }
// here value: String
```

---

### Unwrapping

```swift
let nonOptionalCount: Int = optionalValue!.count
```

### Nil-Coalescing operator 

```swift
let nonOptionalCount: Int = optionalValue?.count ?? 0
```

---

### Implicitly unwrapped optionals

```swift
var futureValue: Int!

print(futureValue) // will crash

futureValue = 24
print(futureValue) // no need to unwrap
```

---

## Tuples

Zapouzdření několika hodnot do jednoho složeného typu

```swift
let tuple = (1, "ahoj")
print(tuple.0) // prints 1
print(tuple.1) // prints ahoj
```
```swift
let cleverTuple = (id: 1, name: "ahoj")
print(cleverTuple.id) // prints 1
print(cleverTuple.name) // prints ahoj
```

---

## Pole

```swift
let array: [String] = []
let array = [String]()
let array = ["ahoj", "jak", "se", "mas"]
```
```swift
print(array[1]) // prints jak
```
```swift
for element in array {
    print(element)
}
// ahoj
// jak
// se
// mas
```

---

## Dictionary

```swift
let dict: [String: Int] = [:]
let dict = [String: Int]()
let dict = ["prvni": 1, "druhy": 2, "treti": 3]
```
```swift
print(dict["treti"]) // prints 3
```

---

## Enum

```swift
enum MyType {
    case first
    case second
    case third
}
```
```swift
let value = MyType.first
let value: MyType = .first
```
```swift
let value = MyType() // not possible
```

---

```swift
let value: MyType = .first

switch value {
case .first:
    fallthrough

case .second:
    break

case default:
    print("third")
}
```

---

## Struct

```swift
struct Person {
    let name: String
    let surname: String
    
    init(name: String, surname: String) {
        self.name = name
        self.surname = surname
    }
}

let person = Person(name: "Lukáš", surname: "Hromadník")
```

---

Mají implicitní kompilátorem generovaný `init`, pokud neexistuje `private` proměnná.

```swift
struct Person {
    let name: String
    let surname: String
    let age: Int
}

let person = Person(
    name: "Lukáš",
    surname: "Hromadník",
    age: 42
)
```

---

Jedná se o `value-type`, tedy při práci s nimi dochází ke kopírování a vytváření nových instancí.

```swift
var a: Int = 42
var b: Int = a

b = 0

print(a, b)
```

---

### Mutace

```swift
struct Person {
    let name: String
}

let p1 = Person(name: "Jan")
p1.name = "Honza" // Nope, not possible
```

---

### Mutace

```swift
struct Person {
    var name: String
}

let p1 = Person(name: "Jan")
p1.name = "Honza" // Nope, still not possible
```

---

### Mutace

```swift
struct Person {
    var name: String
}

var p1 = Person(name: "Jan")
p1.name = "Honza" // Good
```

---

## Class

Reference-type a nemá implicitní `init`

```swift
class Person {
    let name: String
    let surname: String
    
    init(name: String, surname: String) {
        self.name = name
        self.surname = surname
    }
}

let person = Person(name: "Lukáš", surname: "Hromadník")
```

---

### Mutace

```swift
class Person {
    let name: String
    let surname: String
    
    // Init přeskočen pro jednoduchost
}

let person = Person(name: "Lukáš", surname: "Hromadník")
person.name = "Jan" // Nope
```

---

### Mutace

```swift
class Person {
    var name: String
    let surname: String
    
    // Init přeskočen pro jednoduchost
}

let person = Person(name: "Lukáš", surname: "Hromadník")
person.name = "Jan" // Good

person = Person(name: "Jan", surname: "Fit") // Nope
```

---

### Dědičnost

```swift
class Car {
    var model: String
    
    init() {
        self.model = "Škoda"
    }
}

class BmwCar: Car {
    override init() {
        super.init()
        
        self.model = "BMW"
    }
}
```

---

## Protokoly

```swift
protocol Animal {
    var sound: String { get /* set */ }
    func makeSound()
}

struct Dog: Animal {
    let breed: String
    let sound: String
    
    func makeSound() {
        print(sound)
    }
}
```

---

### Protokoly

```swift
protocol Animal {
    var sound: String { get /* set */ }
    func makeSound()
}

let someAnimal: Animal = Dog(breed: "Husky", sound: "Woof")
print(someAnimal.sound)
someAnimal.makeSound()

print(someAnimal.breed) // Nope, not possible
```

---

## Extensions

```swift
protocol Animal {
    func makeSound()
}

struct Dog {
    let breed: String
}

extension Dog: Animal {
    func makeSound() { print("Woof")) }
}
```

---

## Extensions

```swift
protocol Animal {
    var sound: String { get /* set */ }
    func makeSound()
}

extension Animal {
    func makeSound() {
        print(sound)
    }
}
```
```swift
extension Dog: Animal {
    var sound: String {
        "Woof"
    }
}
```

---

## Access control

```swift
struct Person {
    // Cannot be use anywhere else but right here
    // in the `struct` scope
    private let id: Int
    
    // Can be use outside the `struct` scope
    // but only within current file
    fileprivate let id2: Int
```

---

```swift
    // Visible in the current module
    // Also this is default
    internal let name: String
    
    // Visible outside of the module, e.g. imported framework
    public let surname: String
    
    // Can be overriden outside the module
    open let age: Int
}
```

---

```swift
public struct Person {
    private let id: Int
    public let name: String
    
    // Not generated by default
    public init(id: Int, name: String) {
        self.id = id
        self.name = name
    }
}

// Outside the module
let person = Person(id: 1, name: "User")
print(person.id) // Not visible here
```

---

### Access control in Extensions

```swift
public extension Person {
    func makeSound() {
        print("I am " + name)
    }
}

// Outside the module
let person = Person(id: 1, name: "User")
person.makeSound() // print I am User
```