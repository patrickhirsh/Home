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
        devices["192.168.1.3"] = HomeDevice( Name: "Test Strip", IP: "192.168.1.3")
    }
    
    func SetColor(IP ip: String, ColorIndex colorIndex: Int, Color color: Color) {
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
    
    // TODO: Support device discovery
    
    //var DNSService: UnsafeMutablePointer<DNSServiceRef?>!
    
    //func HandleServiceDiscovered(_ reply: DNSServiceBrowseReply?) {
        
    //}
    
    //func DiscoverDevices() {
        // DNSServiceBrowse(DNSService, DNSServiceFlags(), 0, "_ambience._tcp", nil, HandleServiceDiscovered, nil)
    //}
    
}
