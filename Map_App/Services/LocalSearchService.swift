//
//  LocalSearchService.swift
//  Map_App
//
//  Created by Mario Mora Montero on 22/2/23.
//

import Foundation
import MapKit
import Combine

class LocalSearchService: ObservableObject {
    @Published var region: MKCoordinateRegion = MKCoordinateRegion.defaultRegion()
    let locationManager = LocationManager()
    var cancellables = Set<AnyCancellable>()
    @Published var landmarks: [Landmark] = []
    @Published var landmark: Landmark?
    
    init() {
        locationManager.$region.assign(to: \.region, on: self)
            .store(in: &cancellables)
    }
    
    func search(query: String) {
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = query
        request.region = locationManager.region
        
        let search = MKLocalSearch(request: request)
        search.start { response, error in
            if let response = response {
                let mapItem = response.mapItems
                self.landmarks = mapItem.map{
                    Landmark(placemark: $0.placemark)
                }
            }
            
        }
        
    }
}
