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

## Scaling views to complement text

- Construct a layout that adapts to font styles, Dynamic Type, and varying string lengths.
- It's important to define other elements relative to that text, so the view adapts to the text's size.
- The symbol and padding can adapt as the text content changes for localizations, Dynamic Type sizes, or to display a different phrase.
    - `@ScaledMetric`

### Associate content with the text

- Arranges the text and the symbol using `Label`
    ```swift
    Label(text, systemImage: image)
    ```
- Apply same font to both the text and image using `Font.TextStyle` value.
    ```swift
    Label(text, systemImage: image)
        .font(.title)   // .largeTitle, .caption, ...
    ```
- `Capsule()` shape
    ```swift
    Label(text, systemImage: image)
        .background(.purple, in: Capsule())
    ```

### Preview a custom view in Xcode

- Implements `PreviewProvider` protocol.
    - The Canvas can display several variants of your view.
    - You can see how it adapts to different environments.

### Adjust dimensions with ScaledMetric

- The default value for dimensions such as the padding on this view, the widht and height of a frame aren't always going to work for your layout.
- When you need to provide a numeric value that adapts to the environment's effective font size, use the [`ScaleMetric`](https://developer.apple.com/documentation/SwiftUI/ScaledMetric) property wrapper.
    ```swift
    @ScaledMetric(relativeTo: .title) var paddingWidth = 14.5
    var body: some View {
        label(keyword, systemImage: symbol)
            .font(.title)
            .padding(paddingWidth)
    }
    ```

    - `paddingWidth` variable provides a value of 14.5 for content in a `DynamicTypeSize.large` Dynamic Type environment
    - With the `ScaledMetric` property wrapper, the value is proportionally larger or smaller, according to the current value of [`dynamicTypeSize`](https://developer.apple.com/documentation/SwiftUI/EnvironmentValues/dynamicTypeSize)

## Layering content

- Define views in an **overlay** or **background** to adapt their layout to the primary content.
- You can define the relationships between views with **overlay** and **background** modifiers.
    - Some content stays within the bounds of other element
    - Some content maintains a specific margin around that content.

### Define an overlay

- A [`ZStack`](https://developer.apple.com/documentation/SwiftUI/ZStack) sizes each view based on the available space, **without consideration for the other views in the stack**.
- To specify that the size of some content depends on the size of other content, ***define this secondary content inside one of the overlay or background modifiers***.
    - [`overlay(alignment:content:)`](https://developer.apple.com/documentation/SwiftUI/View/overlay(alignment:content:))
    - [`background(_:in:fillStyle:)`](https://developer.apple.com/documentation/SwiftUI/View/background(_:in:fillStyle:)-20tq5)

### Define a background

- A view uses the [`background(_:in:fillStyle:)`](https://developer.apple.com/documentation/SwiftUI/View/background(_:in:fillStyle:)-20tq5) modifier to place a shape behid the text that partially obscures any content behind it to provider higher contrast for the text.
- A background modifier puts its content behind the view it modifies, rather than in front.
    - A background modifier is similar to an overlay modifier, int that its content bases its size on the size of the view it modifies.
    - A overlay modifier puts its content in front.

## Choose the right way to hide a view

- Control whether a view exists, and how that affets the overall layout.
    - You can lay out all the other content as if the view doesn't exist, then update the position of the other content when the view becomes visible.
    - You can reserve space for the view regardless of whether it's visible, so that it becomes visible, none of the other content needs to move to accomodate it.

### Conditionally removing a view

- Use a [`opacity(_:)`](https://developer.apple.com/documentation/SwiftUI/View/opacity(_:)) modifier with a value of `0`, so that the layout accounts for the error message whether or not it's visible.
- Use this strategy for removing a view that doesn't affect other view's placement, like a view inside an [`overlay(alignment:content:)`](https://developer.apple.com/documentation/SwiftUI/View/overlay(alignment:content:)) modifier.
- Use an **`if` statement** to only make room for the content when it's visible, and **shift other content** as it appears and disappears.
- If you need to reserve space in a layout based on the measurement of a view, but never want to show that view, you can use the [`hidden()`](https://developer.apple.com/documentation/SwiftUI/View/hidden()) modifier
- VoiceOver and gesture recognizers also ignore a view that you remove in any of these ways.

## Organizing and aligning content with stacks

- Create dynamic alignments that adapt to data and environment changes using stacks.
- Use stacks to align content in rows and columns.
- Use stacks to create graphic elements that help organize information.

### Define a view with nested stacks

- [`Text(_:format:)`](https://developer.apple.com/documentation/SwiftUI/Text/init(_:format:)) : Format a date. Automatically accounts for environment-specific conditions, like the current calendar and locale.
    ```swift
    Text(
        Date.now, 
        format: Date.FormatStyle()
            .day(.defaultDigits)
            .month(.wide)
    )
    ```
- Customie a symbol image with the techniquies in:
    - [Configuring and displaying symbol images in your UI.](https://developer.apple.com/documentation/uikit/uiimage/configuring_and_displaying_symbol_images_in_your_ui)
- [`.firstTextBaseline`](https://developer.apple.com/documentation/SwiftUI/VerticalAlignment/firstTextBaseline) alignment
        - Align contents with the title text.
        - If you're arranging text and a symbol that only need to align with each other, it's better to use a `Label`.

### Add a background with layered shapes

- A [`background(alignment:content:)`](https://developer.apple.com/documentation/SwiftUI/View/background(alignment:content:)) modifier contains a `ZStack` of [`Shape`](https://developer.apple.com/documentation/SwiftUI/Shape) views.
- This defines a background that adapts to the size of the information the main view displays.
- [`frame(width:height:alignment:)`](https://developer.apple.com/documentation/SwiftUI/View/frame(width:height:alignment:)) modifier
    - Specifying a frame on a decorative `Shape` is a common pattern.
    - Specifying frames on text and controls may interfere with the sizing behavior and usability of thoes views.
    - To learn best practices for adjusting the size of various views, see [Maintaining the adaptable sizes of built-in views](https://developer.apple.com/tutorials/swiftui-concepts/maintaining-the-adaptable-sizes-of-built-in-views)
