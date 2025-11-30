//
//  MapsPage.swift
//  Brandons_Todo_List
//
//  Created by Brandon Potts on 11/11/25.
//

import MapKit
import SwiftUI

struct MapsPage: View {
    // MARK: Internal

    var body: some View {
        Map(position: $position) {
            UserAnnotation()
            Marker("San Francisco", coordinate: CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194))
            Marker("Los Angeles", coordinate: CLLocationCoordinate2D(latitude: 34.0522, longitude: -118.2437))
                .tint(.red)
        }
    }

    // MARK: Private

    @State private var position: MapCameraPosition = .automatic
}

#Preview {
    MapsPage()
}
