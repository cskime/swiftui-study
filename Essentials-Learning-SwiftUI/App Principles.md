# SwiftUI Essentials: Learning SwiftUI - App Principles

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
        - [WindowGroup](https://developer.apple.com/documentation/SwiftUI/WindowGroup) : A Scene that presents a group of identically structured windows.
        - [Window](https://developer.apple.com/documentation/SwiftUI/Window) : A scene that presents its content in a single, unique window. (macOS only) 
        - [DocumentGroup](https://developer.apple.com/documentation/SwiftUI/DocumentGroup) : A scene that enables support for opening, creating, and saving documents.
        - [Settings](https://developer.apple.com/documentation/SwiftUI/Settings) : A scene that presents an interface for viewing and modifying an app's settings. (macOS only)
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

## Specifying the view hierarchy of an app using a scene

### Add a scene to the app

A scene contains the view hierarchy of your app.
You can specify your app's view hierarchy in a scene that SwiftUI provides, or you can create a custom scene.

```swift
import SwiftUI

@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                ContentView()
                    .tabItem {
                        Label("Journal", systemImage: "book")
                    }
                SettingsView()
                    .tabItem {
                        Label("Settings", systemImage: "gear")
                    }
            }
        }
    }
}
```

- `body` returns the primary scene `WindowGroup`, which describes the view hierarchy of the main window.
    - The `WindowGroup` scene provides platform-specific behaviors for app.
    - such as, supporting multiple windows in macOS and iPadOS.
- `TabView` : A container view that provides tabs that people can use to switch between defferent subviews.
    - Each of subviews apply the `tabItem(_:)` modifier.
    - It tells the `TabView` the image and text to display in each tab.

### Define another view hierarchy

Declares another view hierarchy that takes advantage of feature specific to the Mac.

```swift
import SwiftUI

@main
struct MyApp: App {
    var body: some View {
        #if os(iOS)
        WindowGroup {
            TabView {
                ContentView()
                    .tabItem {
                        Label("Journal", systemImage: "book")
                    }
                SettingsView()
                    .tabItem {
                        Label("Settings", systemImage: "gear")
                    }
            }
        }
        #elseif os(macOS)
        WindowGroup {
            AlternativeContentView()
        }

        Settings {
            SettingsView()
        }
        #endif
    }
}
```

- `Settings` : It's available in the app menu, which is a common feature of Mac apps.

### Create custom scenes

One improvement that can help make the code more readable and easier to maintain is to use custom scenes.
A custom scene is one that you compose from other scenes.

```swift
import SwiftUI

struct MyScene: Scene {
    var body: some Scene {
        WindowGroup {
            TabView {
                ContentView()
                    .tabItem {
                        Label("Journal", systemImage: "book")
                    }
                SettingsView()
                    .tabItem {
                        Label("Settings", systemImage: "gear")
                    }
            }
        }
    }
}

struct MyAlternativeScene: Scene {
    var body: some View {
        WindowGroup {
            AlternativeContentView()
        }

        #if os(macOS)
        Settings {
            SettingsView()
        }
        #endif
    }
}
```

- The custom scene `MyScene` is a structure that conforms to the `Scene` protocol.
- A structure that conforms to `Scene` must implement the computed property `body`.

### Refactor the code to use custom scenes

```swift
import SwiftUI

@main
struct MyApp: App {
    var body: some View {
        #if os(iOS)
        MyScene()
        #elseif os(macOS)
        MyAlternativeScene()
        #endif
    }
}
```

- Before refactoring the `MyApp` structure to use the custom scenes, the code is fairly long and complex.
- This approach can make the implementation of computed property `body` more difficult to maintain.
- After refactoring the code, the `MyApp` structure is easier to read and maintain.

## Maintaining the adaptable sizes of built-in views

Keep your app's view layouts fluid on any device for each type of content your app displays.

### Text and symbols

- Text and symbols play a contral role in conveying information to people
    - Navigation links
    - Button labels
    - Tables
    - etc
- Text and symbols that display information or label other elements need to have enough space to display their contents.

#### Text

- `Text` view displays read-only text.
    ```swift
    Text("Hello")
        .font(.largeTitle)
        .font(.caption)
        .italic()
    ```
- `Text` view can adjust to some space constraints with line-wrapping or truncation, but it doesn't change font size to accommodate situations where its ideal size is smaller or larger than available space.
- [Preparing views for localization](https://developer.apple.com/documentation/SwiftUI/Preparing-Views-for-Localization)
- [Applying custom fonts to text](https://developer.apple.com/documentation/SwiftUI/Applying-Custom-Fonts-to-Text)

#### Symbols

```swift
HStack {
    Image(systemName: "folder")
    Image(systemName: "heart")
    Image(systemName: "alarm")
}
.symbolRenderingMode(.multicolor)
.font(.largeTitle)
```

- Symbols can denote common app features.
- Effective symbols streamline your app's UI, and are easily recognizable by user.
- You can customize their colors and sizes using standard view modifiers provided in SwiftUI.
- Even though you specify a system or custom symbol in an `Image`, treat SF symbols more like text.
- To adjust the size and weight of a symbol, specify a semantic `Font`, just like you would for a `Text` view.

#### Labels

```swift
Label("Favorite Books", systemImage: "books.vertical")
    .labelStyle(.titleAndIcon)
    .font(.largeTitle)
```

- To use both text and symbol to represent a single element in your app, use a `Label`.
- `Label` takes care of mathing its title, icon size, alignment.
- The `titleAndIcon` style tells the view to display both its title and icon, overriding any built-in or custom `LabelStyle` that a containing view might specify.

### Controls

```swift
VStack {
    HStack {
        Picker("Choice", selection: $choice) {
            choiceList()
        }
        Button("OK") {
            applyChanges()
        }
    }
    .controlSize(.mini)
    HStack {
        Picker("Choice", selection: $choice) {
            choiceList()
        }
        Button("OK") {
            applyChanges()
        }
    }
    .controlSize(.large)
}
```

- You can use view modifiers to choose among these sizes.
- You can use `controlSize(_:)` modifier to make a control smaller or larger
- You can use the `progressViewStyle(_:)` modifier to chhose a linear or circular appearance for a progress bar
- There ar general-purpose controls like `Menu` and `Link`, and specialized views like `EditButton` and `ColorPicker`.
- [Controls and indicators](https://developer.apple.com/documentation/SwiftUI/Controls-and-indicators)

### Images and shapes

#### Images

```swift
Image("Yellow_Daisy")
    .resizable()
    .scaledToFit()
```

- Display photos and other rich graphics in an `Image`.
- By default, an `Image` displays at the asset's original size.
- You can add modifiers like `resizable(capInsets:resizingMode:)` and `scaledToFit()` or `scaledToFill()` to scale it to the available space.
- If you're accessing an image asset from a server, use an [`AsyncImage`](https://developer.apple.com/documentation/SwiftUI/AsyncImage) to handle the download while keeping your app responsive.
- [Fitting images into available space](https://developer.apple.com/documentation/SwiftUI/Fitting-Images-into-Available-Space)

#### Shapes

```swift
HStack {
    Rectangle()
        .foregroundColor(.blue)
    Circle()
        .foregroundColor(.orange)
    RoundedRectangle(cornerRadius: 15, style: .continuous)
        .foregroundColor(.green)
}
.aspectRatio(3.0, contentMode: .fit)
```

- SwiftUI provides several common shapes, and modifiers to change their size, color, or other aspects of their appearance.
- Use a single shape or a composition of multiple shapes to create a background, border, or other visual element.
- You can define a shape's size with a modifier like
    - [`frame(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)`](https://developer.apple.com/documentation/SwiftUI/View/frame(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)),
    - or allow it to fill all available space.
- `RoundedRectangle` includes values for the `cornerRadius` and `style` parameters to define the rounded corners.
- The `HStack` provides some default spacing between each shape and, to give each shape a square space to fill, the [`aspectRatio(_:contentMode:)`](https://developer.apple.com/documentation/SwiftUI/View/aspectRatio(_:contentMode:)-6j7xz) modifier makes the `HStack` three times as wide as it is tall.
- [Drawing Paths and Shapes](https://developer.apple.com/tutorials/SwiftUI/drawing-paths-and-shapes)