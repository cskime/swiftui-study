# SwiftUI Essentials: Learning SwiftUI

## Exploring the structure of a SwiftUI app

### App Struecture

```swift
import SwiftUI

@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
```

- `@main` : Entry point of the SwiftUI app
    - A SwiftUI app contains one and only one entry point.
- Conforms to the `App` protocol, and provides the content of the app and its behavior
    - Implements the computed property `body`, which is a requirement of the `App` protocol.
    - Returns the contents of your app described as a `Scene.
    - `Scene` contains the view hierarchy that defines the app's user interface.
        - `[WindowGroup](https://developer.apple.com/documentation/SwiftUI/WindowGroup)` : A Scene that presents a group of identically structured windows.
        - `[Window](https://developer.apple.com/documentation/SwiftUI/Window)` : A scene that presents its content in a single, unique window. (macOS only) 
        - `[DocumentGroup](https://developer.apple.com/documentation/SwiftUI/DocumentGroup)` : A scene that enables support for opening, creating, and saving documents.
        - `[Settings](https://developer.apple.com/documentation/SwiftUI/Settings)` : A scene that presents an interface for viewing and modifying an app's settings. (macOs only)
- `WindowGroup`
    - SwiftUI provides platform-specific behaviors for `WindowGroup`.
    - In macOS and iPadOS, a person can open more than one window from the group.
    - In macOS, a person can combine multiple instances of the window group into a set of tabs.

### Content View

In SwiftUI, a scene contains the view hierarchy that an app displays as its user interface. 
A view hierarchy defines the layout of views relative to other views.

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}
```

- `ContentView` conforms to the `View` protocol.
    - `View` protocol defines one or more visual elements.
    - A view is typically made up of other views, creating a view hierarchy
- `ContentView` implements the computed property `body`
- `VStack` : SwiftUI-provided view which arranges subviews vertically.
    - Replace with `HStack`, `ZStack`
    - or, `LazyHStack`, `LazyVStack` (when app needs to display many more subviews)
    - `LazyHStack`, `LazyVStack` only renders the views when the app needs to display them onscreen.
- `Image`
    - `imageScale(_:)` modifier : Scale the image within the view to the **relative size.**
        - `Image.Scale` : `.large`, `.medium`, `.small`
    - `foregroundColor(_:)` modifier : Adds color to the image view.
- `padding(_:_:)` modifier : Adding a platform-specific default amount of padding to the edges of the target view.
    - `padding([.bottom, .trailing], 20)` : Specify which edges and amount of padding to apply.