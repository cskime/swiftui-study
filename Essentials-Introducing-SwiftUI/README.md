# SwiftUI Essentials: Introducing SwiftUI

## Views

### Display

- `Text` : Text
    ```swift
    var body: some View {
        Text("Hello!")
    }
    ```
- `Label` : Text 및 icon
    ```swift
    var body: some View {
        // 1. Text and Image
        Label("Lightning", systemImage: "bolt.fill")

        // 2. Style 지정
        Label("Lightning", systemImage: "bolt.fill")
            .labelStyle(.titleOnly)     // Title만 표시
            .labelStyle(.iconOnly)      // Icon만 표시
            .labelStyle(.titleAndIcon)  // Title과 icon 둘 다 표시
    }
    ```
- `Image` : Image 표시
    ```swift
    var body: some View {
        Image(systemName: "star.fill")
    }
    ```
- `List` : 목록 표시
    ```swift
    var body: some View {
        // 1. Create List
        List {
            Text("A List Item")
            Text("A Second List Item")
            Text("A Third List Item")
        }

        // 2. Create List Dynamically
        List(oceans) {
            Text($0.name)
        }

        // 3. 다른 유형의 view들을 List에 추가할 때는 ForEach 사용
        List {
            Toggle(isOn: $showFavoritesOnly) {
                Text("Favorites only")
            }
            ForEach(filteredLandmarks) { landmark in
                NavigationLink {
                    LandmarkDetail(landmark: landmark)
                } label: {
                    LandmarkRow(landmark: landmark)
                }
            }
        }
    }
    ```

- `Spacer` : View들 사이에 빈 공간 채우는 용도
    ```swift
    var body: some View {
        VStack {
            Text("Hello")
            Text("World")
            Spacer()
        }
    }
    ```
- `Divider` : 구분선
    ```swift
    HStack {
        Text(landmark.park)
        Spacer()
        Text(landmark.state)
    }
    .font(.subheadline)
    .foregroundColor(.secondary)
    
    Divider()
    
    Text("About \(landmark.name)")
        .font(.title2)
    Text(landmark.description)
    ```
- `Map` : MapKit에 있는 지도 view
    ```swift
    var body: some View {
        Map(coordinateRegion: $region)
    }
    ```

### Modifier

- `padding` : Edges 또는 top, leading, trailing, bottom 각각의 inset 지정
    ```swift
    var body: some View {
        Text("Hello")
            .padding()
            .padding(.bottom, 16)   // bottom만
    }
    ```
- `foregroundColor` : Text, image 등 foreground 색상 지정
    ```swift
    var body: some View {
        Text("Hello")
            .foregroundColor(.blue)
    }
    ```
- `onAppear` : View가 나타나기 전에 호출됨
    ```swift
    var body: some View {
        Map(coordinateRegion: $region)
            .onAppear { setRegion(coordinate) }
    }
    ```
- `font` : Font 지정
    ```swift
    HStack {
        Text(landmark.park)
        Spacer()
        Text(landmark.state)
    }
    .font(.subheadline)
    ```
- `offset` : X, Y 좌표로 이동. Original dimension은 변하지 않음
    ```swift
    var body: some View {
        Title("Hello")
            .offset(y: -130)
    }
    ```
- `frame` : 지정된 invisible frame 안에서 view를 보여줌
    ```swift
    var body: some View {
        Title("Hello")
            .frame(height: 300)
    }
    ```
- `ignoreSafeArea` : Safe area를 무시하고 View를 늘린다
    ```swift
    var body: some View {
        SomeView()
            .ignoresSafeArea(edges: .top)
    }
    ```

### Control

- `Button` : Button
    ```swift
    @State private var isSet: Bool
    var body: some View {
        // 1. Action과 label 지정
        Button {
            isSet.toggle()
        } label: {
            Label("Toggle", systemImage: "star.fill")
        }

        // 2. Action을 method 및 closure로 사용
        Button(action: signIn) {
            Text("Sign In")
        }

        // 3. Label에 text만 표시할 때는 단순하게 사용
        Button("Sign In", action: signIn)
    }
    ```
- `Toggle` : On/Off switch와 custom label
    ```swift
    @State private var vibrateOnRing = false
    var body: some View {
        // 1. Switch와 title
        Toggle("Title", isOn: $vibrateOnRing)

        // 2. Switch와 custom view
        Toggle(isOn: $vibrateOnRing) {
            Text("Vibrate on Ring")
        }

        // 3. Switch만 사용하기
        Toggle("Title", isOn: $vibrateOnRing)
            .labelsHidden()
        Toggle("", isOn: $vibrateOnRing)
    }
    ```

## Navigation

- `NavigationView` : 여러 개의 view stack을 naviagtion 방식으로 이동하게 만들어 준다.
    ```swift
    NavigationView {
        List(model.notes) { note in
            NavigationLink(note.title, destination: NoteEditor(id: note.id))
        }
        Text("Select a Note")
    }
    ```
- `NavigationLink` : Navigation presentation을 위한 control. 동작할 action과 화면에 보여줄 label을 지정할 수 있다.
    ```swift
    NavigationLink {
        FolderDetail(id: workFolder.id)
    } label: {
        Label("Work Folder", systemImage: "folder")
    }

    // Text만 사용할 경우 
    NavigationLink("Work Folder") {
        FolderDetail(id: workFolder.id)
    }
    ```

### Modifier

- `navigationTitle` : Title 지정
    ```swift
    var body: some View {
        VStack {
            ...
        }
        .navigationTitle("Title")
    }
    ```
- `navigationBarTitleDisplayMode` : Navigation bar title 스타일 설정
    ```swift
    var body: some View {
        VStack {
            ...
        }
        .navigationBarTitleDisplayMode(.inline)     // 가운데 정렬된 작은 title
        .navigationBarTitleDisplayMode(.large)      // 큰 title
    }
    ```

## Structure

- `ForEach` : Identified data collection을 가지고 여러 개의 view를 구성할 수 있는 구조
    ```swift
    private struct NamedFont: Identifiable {
        let name: String
        let font: Font
        var id: String { name }
    }

    private let namedFonts: [NamedFont] = [
        NamedFont(name: "Large Title", font: .largeTitle),
        NamedFont(name: "Title", font: .title),
        NamedFont(name: "Headline", font: .headline),
        NamedFont(name: "Body", font: .body),
        NamedFont(name: "Caption", font: .caption)
    ]

    var body: some View {
        ForEach(namedFonts) { namedFont in
            Text(namedFont.name)
                .font(namedFont.font)
        }
    }
    ```

## Preview

- `PreviewProvider`를 채택한 struct에서 `previews` 반환
    ```swift
    struct LandmarkList_Previews: PreviewProvider {
        static var previews: some View {
            LandmarkList()
                .environmentObject(ModelData())
        }
    }
    ```