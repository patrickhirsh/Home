//
//  HomeViewModel.swift
//  Home
//
//  Created by Patrick Hirsh on 6/13/21.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    @Published var devices = [HomeDevice]()
}
