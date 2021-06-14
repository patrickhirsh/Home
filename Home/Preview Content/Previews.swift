//
//  Previews.swift
//  Home
//
//  Created by Patrick Hirsh on 6/13/21.
//

import SwiftUI

struct ContentView_Previews: PreviewProvider {
    @ObservedObject static var HomeVM = HomeViewModel()
    static var previews: some View {
        HomePage(HomeVM: HomeVM)
            .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
        HomePage(HomeVM: HomeVM)
            .preferredColorScheme(.light)
    }
}
