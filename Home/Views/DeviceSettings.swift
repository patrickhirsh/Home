//
//  DeviceSettings.swift
//  Home
//
//  Created by Patrick Hirsh on 6/13/21.
//

import SwiftUI

struct DeviceSettings: View {
    @ObservedObject var HomeVM: HomeViewModel
    @State private var Color1 = Color(red: 0.0, green: 0.0, blue: 0.0)
    @State private var Color2 = Color(red: 0.0, green: 0.0, blue: 0.0)
    @State private var Color3 = Color(red: 0.0, green: 0.0, blue: 0.0)
    let IP: String
    var body: some View {
        Form {
            ColorPicker("Color 1", selection: $Color1, supportsOpacity: true).onChange(of: Color1) { _ in
                HomeVM.SetColor(IP: IP, ColorIndex: 1, Color: Color1)
            }
            ColorPicker("Color 2", selection: $Color2, supportsOpacity: true).onChange(of: Color2) { _ in
                HomeVM.SetColor(IP: IP, ColorIndex: 2, Color: Color2)
            }
            ColorPicker("Color 3", selection: $Color3, supportsOpacity: true).onChange(of: Color3) { _ in
                HomeVM.SetColor(IP: IP, ColorIndex: 3, Color: Color3)
            }
        }
    }
}
