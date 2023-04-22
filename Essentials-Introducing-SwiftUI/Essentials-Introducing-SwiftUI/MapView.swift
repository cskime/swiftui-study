//
//  MapView.swift
//  Essentials-Introducing-SwiftUI
//
//  Created by chamsol kim on 2023/04/23.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    @State
    private var region = MKCoordinateRegion(
        center: .init(latitude: 34.011_286, longitude: -116.116_868),
        span: .init(latitudeDelta: 0.2, longitudeDelta: 0.2)
    )
    
    var body: some View {
        Map(coordinateRegion: $region)
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
