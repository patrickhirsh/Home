//
//  DeviceSettings.swift
//  Home
//
//  Created by Patrick Hirsh on 6/13/21.
//

import SwiftUI

struct DevicePage: View {
    @ObservedObject var HomeVM: HomeViewModel
    let IP: String
    @State private var Color1 = Color(red: 0.0, green: 0.0, blue: 0.0)
    @State private var Color2 = Color(red: 0.0, green: 0.0, blue: 0.0)
    @State private var Color3 = Color(red: 0.0, green: 0.0, blue: 0.0)
    @State private var Mode = String()
    @State private var Modes = ["Rainbow", "Color", "Globes"]
    @State private var Brightness = 100.0
    @State private var Active = true
    
    var body: some View {
        Form {
            
            // Active
            Toggle("Active", isOn: $Active)
                .onChange(of: Active) { _ in HomeVM.SetDeviceActive(IP: IP, Active: Active) }
            
            // Mode
            Picker("Mode", selection: $Mode) { ForEach(Modes, id: \.self) { mode in Text(mode) } }
                .onChange(of: Mode) { _ in HomeVM.SetDeviceMode(IP: IP, Mode: Mode) }
            
            // Color 1
            ColorPicker("Color 1", selection: $Color1, supportsOpacity: true)
                .onChange(of: Color1) { _ in HomeVM.SetDeviceColor(IP: IP, ColorIndex: 1, Color: Color1) }
            
            // Color 2
            ColorPicker("Color 2", selection: $Color2, supportsOpacity: true)
                .onChange(of: Color2) { _ in HomeVM.SetDeviceColor(IP: IP, ColorIndex: 2, Color: Color2) }
            
            // Color 3
            ColorPicker("Color 3", selection: $Color3, supportsOpacity: true)
                .onChange(of: Color3) { _ in HomeVM.SetDeviceColor(IP: IP, ColorIndex: 3, Color: Color3) }
            
            // Brightness
            HStack {
                Text(String(format: "%1.0f", Brightness)).frame(width: 50)
                Slider(
                    value: $Brightness,
                    in: 0...100,
                    step: 1.0,
                    minimumValueLabel: Image(systemName: "sun.min"),
                    maximumValueLabel: Image(systemName: "sun.max"),
                    label: { Text("Brightness") }
                )
                    .onChange(of: Brightness) { _ in HomeVM.SetDeviceBrightness(IP: IP, Brightness: Brightness) }
            }
        }
    }
}
