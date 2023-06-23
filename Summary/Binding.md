# Binding

## 초기화

1. `Binding<Type>`으로 선언한 property로 초기화
    ```swift
    struct SomeView: View {
        
        var value: Binder<Int>
    
        init(value: Binding<Int>) {
            self.value = value
        }
    
        var body: some View { ... }
    }
    ```
2. `@Binding`으로 선언한 property로 초기화
    ```swift
    struct SomeView: View {
        
        @Binding var value: Int
    
        init(value: Binding<Int>) {
            // '_value'로 'Binding<Type>'에 접근할 수 있다.
            self._value = value
        }
    
        var body: some View { ... }
    }
    ```