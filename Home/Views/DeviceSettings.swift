//
//  DeviceSettings.swift
//  Home
//
//  Created by Patrick Hirsh on 6/13/21.
//

import SwiftUI

struct DeviceSettings: View {
    @ObservedObject var HomeVM: HomeViewModel
    var body: some View {
        Form {
            ColorPicker("Color 1", selection: .constant(.red), supportsOpacity: false)
            ColorPicker("Color 2", selection: .constant(.red), supportsOpacity: false)
            ColorPicker("Color 3", selection: .constant(.red), supportsOpacity: false)
        }
    }
}
