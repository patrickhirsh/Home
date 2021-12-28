//
//  HomeDevice.swift
//  Home
//
//  Created by Patrick Hirsh on 6/13/21.
//

// URLSession: https://stackoverflow.com/questions/24016142/how-do-i-make-an-http-request-in-swift

import Foundation
import dnssd

struct HomeDevice: Identifiable {
    public private(set) var id: String
    public private(set) var Name: String
    public private(set) var IP: String
    
    init(Name name: String, IP ip: String) {
        Name = name
        IP = ip
        id = IP
    }
    
    
    /* Response Models */
    
    struct Color: Codable {
        let H: UInt16
        let S: UInt8
        let V: UInt8
        let W: UInt8
    }
    
    struct State: Codable {
        let Color1: Color
        let Color2: Color
        let Color3: Color
        let Mode: String
        let Modes: [String]
        let Brightness: UInt8
        let Active: Bool
    }
    
    
    /* Getters */
    
    func GetState() {
        let url = URL(string: "http://" + IP + "/GetState")
        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            guard let data = data else { return }
            do {
                let result = try JSONDecoder().decode(State.self, from: data)
            } catch let error {
                print(error)
            }
        }
        task.resume()
    }
    
    
    /* Setters */
    
    func SetColor(ColorIndex c: Int, Hue h: u_short, Saturation s: u_char, Value v: u_char, White w: u_char) {
        let url = URL(string: "http://" + IP + "/SetColor?" + "Color=" + String(c) + "&H=" + String(h) + "&S=" + String(s) + "&V=" + String(v) + "&W=" + String(w))
        let task = URLSession.shared.dataTask(with: url!)
        task.resume()
    }
    
    func SetMode(Mode mode: String) {
        let url = URL(string: "http://" + IP + "/SetMode?" + "Mode=" + String(mode))
        let task = URLSession.shared.dataTask(with: url!)
        task.resume()
    }
    
    func SetBrightness(Brightness brightness: UInt8) {
        let url = URL(string: "http://" + IP + "/SetBrightness?" + "Brightness=" + String(brightness))
        let task = URLSession.shared.dataTask(with: url!)
        task.resume()
    }
    
    func SetActive(Active active: Bool) {
        var val = active ? "True" : "False"
        let url = URL(string: "http://" + IP + "/SetActive?" + "Active=" + val)
        let task = URLSession.shared.dataTask(with: url!)
        task.resume()
    }
    
    
    /*
    Modes
    */
    
    struct GetModeResponse: Codable {
        let Mode: String
    }
    
    struct GetModesResponse: Codable {
        let Modes: [String]
    }
    
    func GetMode() {
        let url = URL(string: "http://" + IP + "/GetMode")
        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            guard let data = data else { return }
            print(String(data: data, encoding: .utf8)!)
        }
        task.resume()
    }
    
    func GetModes() {
        let url = URL(string: "http://" + IP + "/GetModes")
        let task = URLSession.shared.dataTask(with: url!) { data, response, error in
            guard let data = data else { return }
            print(String(data: data, encoding: .utf8)!)
        }
        task.resume()
    }
    
    
    /*
    Brightness
    */
    
    
    
}
