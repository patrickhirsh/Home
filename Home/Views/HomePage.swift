//
//  HomePage.swift
//  Home
//
//  Created by Patrick Hirsh on 6/13/21.
//

import SwiftUI

struct HomePage: View {
    @ObservedObject var HomeVM: HomeViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                DeviceList(HomeVM: HomeVM)
                .navigationTitle(Text("Ambience Nodes"))
            }
        }
    }
}

struct DeviceList: View {
    @ObservedObject var HomeVM: HomeViewModel
    var body: some View {
        List {
            ForEach(HomeVM.devices) { device in
                NavigationLink(destination: DeviceSettings(HomeVM: HomeVM)) {
                    DeviceEntry(IP: device.IP, Name: device.Name)
                }
            }
        }
    }
}

struct DeviceEntry: View {
    var IP: String
    var Name: String
    var body: some View {
        VStack {
            HStack {
                Text(IP).bold()
                Spacer()
            }
            HStack {
                Text(Name)
                Spacer()
            }
        }
    }
}
