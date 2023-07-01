# ObservableObject

- Object가 변경되었을 때 event를 emit하는 publisher를 갖는 object의 type
- `@Published` variable의 값이 변경될 때, `objectWillChange` publisher가 event를 emit한다.
    ```swift
    class Contact: ObservableObject {
        @Published var name: String
        @Published var age: Int

        init(name: String, age: Int) {
            self.name = name
            self.age = age
        }

        func haveBirthday() -> Int {
            age += 1
            return age
        }
    }

    let john = Contact(name: "John Appleseed", age: 24)
    cancellable = john.objectWillChange
        .sink { _ in
            print("\(john.age) will change")
        }
        
    print(john.haveBirthday())
    // @Published property인 'age'의 값이 변경될 때, publisher로 event emit
    // Prints "24 will change"
    // Prints "25"
    ```

## ObservableObject를 SwiftUI View에서 사용하기

- `ObservableObject`는 class에서만 채택할 수 있음. 즉, reference type
    ```swift
    protocol ObservableObject : AnyObject
    ```
- 'Source of Truth'로 선언하려면 `@StateObject` 사용
- 'Derived Value'로 선언하려면 `@ObservedObject` 사용
- MVVM 패턴을 사용할 때 예시
    ```swift
    class ViewModel: ObservableObject {
        @Published var value = 0
        func plusOne() {
            value += 1
        }
    }

    struct SomeView: View {

        @ObservedObject let viewModel = ViewModel()

        var body: some View {
            VStack {
                Text("Current Value")
                Text(viewModel.value)
                Button("Plus One") {
                    viewModel.plusOne()
                }
            }
        }
    }
    ```

## @StateObject와 @ObservedObject의 차이

> @StateObject 와 @ObservableObject 의 한 가지 중요한 차이점은, ownership. 즉, [소유]에 있다; @StateObject 가 ObservableObject 인스턴스를 처음으로 생성하고, @ObservedObject 는 그 인스턴스를 지켜보기만 한다는 것이다.

### @StateObject

- `@StateObject`는 **`ObservableObject` 인스턴스를 최초 한 번 생성한다**.
- `ObservableObject`에서 변화가 생기면, 변경된 값에 관련된 View만 독립적으로 업데이트한다.

### @ObservedObject

- `ObservableObject` protocol을 구현하고 있는 object를 subscribe하기 위한 property wrapper
- `ObservableObject`의 `@Published` property의 값이 변경될 때 마다 view를 새로 그린다.
- SwiftUI View와 생명 주기를 같이하여, View가 사라지면 `@ObservedObject` 인스턴스도 사라지고, View가 다시 생성되면 `@ObservedObject`의 인스턴스도 사라졌다 다시 생성된다.
- 특정 `@Published` value를 변경했을 때, 다른 `@Published` value가 초기화되는 문제가 발생할 수 있다.
- 값이 변경될 때 마다 View를 새로 그리기 때문에 최적화가 되지 않은 상태에서는 View가 깜빡거리는 것 처럼 보일 수도 있다.

# Reference

- [ObservableObject](https://developer.apple.com/documentation/combine/observableobject)
- [@ObservedObject](https://developer.apple.com/documentation/swiftui/observedobject)
- [@StateObject](https://developer.apple.com/documentation/swiftui/stateobject)
- https://wondev.tistory.com/5