# SwiftUI Essentials: Learning SwiftUI - State and Data Flow

## Driving changes in your UI with state and bindings

- Indicate data dependencies in a view using [**`State`**](https://developer.apple.com/documentation/SwiftUI/State).
- Share those dependencies with other views using [**`Binding`**](https://developer.apple.com/documentation/SwiftUI/Binding).
- Each view has a dependency on some data. As that data changes, either due to external events or because of actions taken by a person using the app, **SwiftUI automatically updates the view to reflect those changes**.

### Separate properties and imperative code from the view

- When a view needs to manage more than a single piece of state data, it can be helpful to manage that data in a separate view-specific structure.
- This approach helps make the declarative interface code of a view more readable by moving properties and imperative code outside of the view.

### Bind the view to its state data

- The [`Binding`](https://developer.apple.com/documentation/SwiftUI/Binding) property wrapper provides a two-way, read-write binding to data that the view needs.
- However, it doesn't own the data. Instead, another view creates and owns the data that the view binds to and uses.

### Create a state variable in another view

- The [`State`](https://developer.apple.com/documentation/SwiftUI/State) property wrapper tells SwiftUI to create and manage the instance.
    - Each time view state changes,
    - data changes,
    - SwiftUI reinitializes the view, 
    - reconnects the data to the view,
    - and rebuilds the view defined in the computed [`body`](https://developer.apple.com/documentation/SwiftUI/View/body-swift.property) property, which reflects the current state of the data.
    - ref : [Model Data](https://developer.apple.com/documentation/SwiftUI/Model-data)
- When the button's action changes the data, 
    - SwiftUI reinitializes the view instance,
    - and reconnects the data to the view it's managing.
    - Then, SwiftUI rebuilds the view from is computed `body` property,
    - so that, the view reflects the current state of the data.

## Creating a custom input control that binds to a value

- Provide interactions that are unique to your app with custom controls that bind to a value
    - [`Slider`](https://developer.apple.com/documentation/SwiftUI/Slider)
    - [`TextFleid`](https://developer.apple.com/documentation/SwiftUI/TextField)
- SwiftUI provides the building blocks you need to create a custom input control for your app.

### Design a custom control

- Consider following questions:
    - What data does the control need?
    - What does it do with that data?
    - How it does it represent that data visually within the app?
- In this sample, the rating control needs,
    - `Int` property that represents the rating of a recipe.
    - The control needs to be able to change the value of this property.
    - It needs to display a set of stars that reflects the rating value.
- By defining `rating` as a **binding variable**, `StarRating` can read and write the value event though another view is responsible for creating the value.

### Make the control interactive

- To make interactive, it uses the [`onTapGesture(count:perform:)`](https://developer.apple.com/documentation/SwiftUI/View/onTapGesture(count:perform:)) action.
    - The tap gesture performs the action defined in the closure when a person clicks or taps the view.

### Display the custom control in other views.

    