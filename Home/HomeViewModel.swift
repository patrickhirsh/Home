//
//  HomeViewModel.swift
//  Home
//
//  Created by Patrick Hirsh on 6/13/21.
//

import SwiftUI
import Network

class HomeViewModel: ObservableObject {
    @Published var devices = [String : HomeDevice]()
    
    init() {
        devices["192.168.1.117"] = HomeDevice( Name: "Test Strip", IP: "192.168.1.117")
    }
    
    
    /* UI Models */
    
    struct State {
        let Color1: Color
        let Color2: Color
        let Color3: Color
        let Mode: String
        let Modes: [String]
        let Brightness: UInt8
        let Active: Bool
        
        init(HomeDeviceState state: HomeDevice.State) {
            Color1 = Color(hue: Double(state.Color1.H), saturation: Double(state.Color1.S), brightness: Double(state.Color1.V), opacity: Double(state.Color1.W))
            Color2 = Color(hue: Double(state.Color2.H), saturation: Double(state.Color2.S), brightness: Double(state.Color2.V), opacity: Double(state.Color2.W))
            Color3 = Color(hue: Double(state.Color3.H), saturation: Double(state.Color3.S), brightness: Double(state.Color3.V), opacity: Double(state.Color3.W))
            Mode = state.Mode
            Modes = state.Modes
            Brightness = state.Brightness
            Active = state.Active
        }
    }
    
    
    /* Getters */
    
    
    /* Setters */
    
    func SetDeviceColor(IP ip: String, ColorIndex colorIndex: Int, Color color: Color) {
        var h: CGFloat = 0
        var s: CGFloat = 0
        var v: CGFloat = 0
        var w: CGFloat = 0
        
        // TODO: Fix this hideousness
        if (UIColor(color).getHue(&h, saturation: &s, brightness: &v, alpha: &w)) {
            devices[ip]?.SetColor(
                ColorIndex: colorIndex,
                Hue: (u_short(Float(h) * 65535)),
                Saturation: u_char((Float(s) * 255)),
                Value: u_char((Float(v) * 255)),
                White: u_char((Float(w) * 255)))
        } else {
            print("Error: Couldn't convert color")
        }
    }
    
    func SetDeviceMode(IP ip: String, Mode mode: String) {
        devices[ip]?.SetMode(Mode: mode)
    }
    
    func SetDeviceBrightness(IP ip: String, Brightness brightness: Double) {
        // expect a value between 1 and 100
        var scalar = Float(brightness) / 100.0
        if (scalar > 1.0) { scalar = 1.0 }
        if (scalar < 0.0) { scalar = 0.0 }
        devices[ip]?.SetBrightness(Brightness: UInt8(Float(UInt8.max) * scalar))
    }
    
    func SetDeviceActive(IP ip: String, Active active: Bool) {
        devices[ip]?.SetActive(Active: active)
    }
}
