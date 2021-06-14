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
            Picker(selection: .constant(1), label: /*@START_MENU_TOKEN@*/Text("Picker")/*@END_MENU_TOKEN@*/) {
                /*@START_MENU_TOKEN@*/Text("1").tag(1)/*@END_MENU_TOKEN@*/
                /*@START_MENU_TOKEN@*/Text("2").tag(2)/*@END_MENU_TOKEN@*/
            }
            ColorPicker("Color 1", selection: .constant(.red), supportsOpacity: false)
            ColorPicker("Color 1", selection: .constant(.red), supportsOpacity: false)
            ColorPicker("Color 1", selection: .constant(.red), supportsOpacity: false)
        }
    }
}
