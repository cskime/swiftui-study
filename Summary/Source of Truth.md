# Source of Truth와 Derived Value

- `@State` variable은 값을 읽거나 쓸 때 (read or written) SwiftUI가 이를 observe 하도록 한다.
- `body`에서 이 variable을 사용하면(읽으면), SwiftUI는 View가 이 property에 의존하고 있다는 것을 알게 된다.
- 즉, `@State` variable 값이 바뀌면 SwiftUI가 새로운 `@State` value를 사용해서 view를 다시 그리도록 요청한다.
- SwiftUI에서 UI가 가질 수 있는 상태들은 '**Source of Truth**'라고 불리는 신뢰할 수 있는 data 조각(an authoritative piece of data)으로부터 파생된다.
    - The offset of a scroll view
    - The highlightedness of a button
    - The contents of a navigation stack
- `@State` variable과 model은 전체 application의 'Source of Truth'를 구성한다.
- 'Source of Truth'에 의해 결정되는 값을 '**Derived Value**'라고 부른다.

## Data Flow Primitives

|           | Source of Truth | Derived Value |
| :-------: | :-------------: | :-----------: |
| Read-only | Constant | Variable |
| Read-write(Value Type) | @State | @Binding |
| Read-write(Reference Type) | @StateObject | @ObservedObject |

# Reference

- [WWDC19 - Introducing SwiftUI: Building Your First App]()