//
//  HomeApp.swift
//  Home
//
//  Created by Patrick Hirsh on 6/13/21.
//

import SwiftUI

@main
struct HomeApp: App {
    private let HomeVM = HomeViewModel()
    var body: some Scene {
        WindowGroup {
            HomePage(HomeVM: HomeVM)
        }
    }
}
