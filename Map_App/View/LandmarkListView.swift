//
//  LandmarkListView.swift
//  Map_App
//
//  Created by Mario Mora Montero on 22/2/23.
//

import SwiftUI
import MapKit

struct LandmarkListView: View {
    @EnvironmentObject var localSearchService: LocalSearchService
    var body: some View {
        VStack(alignment: .leading){
            List(localSearchService.landmarks) { landmark in
                VStack {
                    Text(landmark.name)
                        .foregroundColor(.black)
                    Text(landmark.tittle)
                        .opacity(0.5)
                        .foregroundColor(.black)
                }.listRowBackground(localSearchService.landmark == landmark ? Color(UIColor.lightGray) : Color.white)
                    .onTapGesture {
                        localSearchService.landmark = landmark
                        withAnimation {
                            localSearchService.region = MKCoordinateRegion.regionFromLandmark(landmark)
                        }
                        
                    }
                
            }
        }
    }
}

struct LandmarkListView_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkListView().environmentObject(LocalSearchService())
    }
}
