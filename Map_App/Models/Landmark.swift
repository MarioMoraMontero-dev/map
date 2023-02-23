//
//  Landmark.swift
//  Map_App
//
//  Created by Mario Mora Montero on 22/2/23.
//

import Foundation
import MapKit

struct Landmark: Identifiable, Hashable {
    let placemark: MKPlacemark
    let id = UUID()
    var name: String {
        self.placemark.name ?? ""
    }
    var tittle: String {
        self.placemark.title ?? ""
    }
    
    var  coordinate: CLLocationCoordinate2D {
        self.placemark.coordinate
    }
}
