//
//  Map_AppApp.swift
//  Map_App
//
//  Created by Mario Mora Montero on 22/2/23.
//

import SwiftUI

@main
struct Map_AppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(LocalSearchService())
        }
    }
}
