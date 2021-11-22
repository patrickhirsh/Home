//
//  HomeViewModel.swift
//  Home
//
//  Created by Patrick Hirsh on 6/13/21.
//

import SwiftUI
import Network

class HomeViewModel: ObservableObject {
    @Published var devices = [HomeDevice]()
    
    init() {
        devices.append(HomeDevice( Name: "Test Strip", IP: "192.168.1.3"))
    }
    
    
    
    // TODO: Support device discovery
    
    //var DNSService: UnsafeMutablePointer<DNSServiceRef?>!
    
    //func HandleServiceDiscovered(_ reply: DNSServiceBrowseReply?) {
        
    //}
    
    //func DiscoverDevices() {
        // DNSServiceBrowse(DNSService, DNSServiceFlags(), 0, "_ambience._tcp", nil, HandleServiceDiscovered, nil)
    //}
    
}
