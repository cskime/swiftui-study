# SwiftUI Essentials: Learning SwiftUI - View Layout

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