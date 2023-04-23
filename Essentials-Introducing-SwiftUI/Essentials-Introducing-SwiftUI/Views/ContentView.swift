//
//  ContentView.swift
//  Essentials-Introducing-SwiftUI
//
//  Created by chamsol kim on 2023/04/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LandmarkList()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
