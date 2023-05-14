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

## Defining the source of truth using a custom binding

- Provide an alternative to a state variable by using a custom binding.
- The most common way to define a source of truth that binds to other views in your app is to declare a state variable using the [`State`](https://developer.apple.com/documentation/SwiftUI/State) property wrapper.
- If the source of truth is dynamic and can't be defined using `@State` attribute, you can create a computed property that returns a custom binding.

### Specifying the source of truth

- Use a custom binding as the source of truth of the recipe instead of declaring a state variable.
    - Using a custom binding is a useful feature of SwiftUI, but isn't always the base option.
    - **Limit its use to use cases where using a state variable or object isn't possible.**
    - In most case, define the source of truth as either a `State` variable or `StateObject` to let SwiftUI manage the value or object for you.
- Custom binding computed property returns a custom [`Binding`](https://developer.apple.com/documentation/SwiftUI/Binding).
    ```swift
    import SwiftUI

    struct DetailView: View {
        @Binding var recipeId: Recipe.ID?

        private var recipe: Binding<Recipe> {
            Binding {  
                // getter

                if let id = recipeId {
                    return recipeBox.recipe(with: id) ?? Recipe.emptyRecipe()
                } else {
                    return Recipe.emptyRecipe()
                }
            } set: { updatedRecipe in 
                // setter

                recipeBox.update(updatedRecipe)
            }
        }
    }
    ```
    - A `Binding` provides read and write access to a value using `init(get:set)` initializer method.
- The computed property returns a `Binding`, it isnt' necessary to include the dollar sign(`$`) prefix 
    - It is required when **passing a state variable as a binding.**
    - It tells SwiftUI to pass the [`projectedValue`](https://developer.apple.com/documentation/SwiftUI/State/projectedValue), which is `Binding`
- To use a value not a binding, use [`wrappedValue`](https://developer.apple.com/documentation/SwiftUI/Binding/wrappedValue)
    - `wrappedValue` is the underlying value referenced by the binding.
    - `Binding`'s wrapped value is the actual value.