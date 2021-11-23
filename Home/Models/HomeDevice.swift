//
//  HomeDevice.swift
//  Home
//
//  Created by Patrick Hirsh on 6/13/21.
//

import Foundation

struct HomeDevice: Identifiable {
    public private(set) var id: String
    public private(set) var Name: String
    public private(set) var IP: String
    
    init(Name name: String, IP ip: String) {
        Name = name
        IP = ip
        id = IP
    }
    
    func SetMode(_ mode: String) {
        // URLSession: https://stackoverflow.com/questions/24016142/how-do-i-make-an-http-request-in-swift
        let url = URL(string: "http://" + IP + "/SetMode?Mode=" + mode)
        let task = URLSession.shared.dataTask(with: url!) {(data, response, error) in
            guard let data = data else { return }
            print(String(data: data, encoding: .utf8)!)
        }
        task.resume()
    }
    
    func SetColor(ColorIndex c: Int, Hue h: u_short, Saturation s: u_char, Value v: u_char, White w: u_char) {
        // URLSession: https://stackoverflow.com/questions/24016142/how-do-i-make-an-http-request-in-swift
        let url = URL(string: "http://" + IP + "/SetColor?" + "Color=" + String(c) + "&H=" + String(h) + "&S=" + String(s) + "&V=" + String(v) + "&W=" + String(w))
        let task = URLSession.shared.dataTask(with: url!) {(data, response, error) in
            guard let data = data else { return }
            print(String(data: data, encoding: .utf8)!)
        }
        task.resume()
    }
}
