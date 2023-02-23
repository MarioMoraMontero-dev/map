//
//  ContentView.swift
//  Map_App
//
//  Created by Mario Mora Montero on 22/2/23.
//

import SwiftUI
import MapKit

struct ContentView: View {
    @EnvironmentObject var localSearchService: LocalSearchService
    @State private var search: String = ""
    var body: some View {
        VStack {
            TextField("Search", text: $search)
                .textFieldStyle(.roundedBorder)
                .onSubmit {
                    localSearchService.search(query: search)
                }
                .padding()
            if localSearchService.landmarks.isEmpty {
                Text("Delicious places awaits you!")
            }else {
                LandmarkListView()
            }
            

            Map(coordinateRegion: $localSearchService.region,  showsUserLocation: true ,annotationItems: localSearchService.landmarks) { landmarks in
                MapAnnotation(coordinate: landmarks.coordinate, content: {
                    Image(systemName: "heart.fill")
                        .foregroundColor(localSearchService.landmark == landmarks ? .purple : .red)
                        .scaleEffect(localSearchService.landmark == landmarks ? 2 : 1)
                })
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(LocalSearchService())
    }
}
