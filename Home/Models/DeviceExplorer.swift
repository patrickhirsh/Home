//
//  DeviceExplorer.swift
//  Home
//
//  Created by Patrick Hirsh on 6/14/21.
//

import Foundation
import Network

class DeviceExplorer {
    var params: NWParameters
    var browser: NWBrowser
    
    init() {
        params = NWParameters()
        browser = NWBrowser(for: .bonjour(type: "_ambience._tcp", domain: nil), using: params)
        browser.browseResultsChangedHandler = { results, changes in
            for change in changes {
                switch change {
                case .added(let browseResult):
                    switch browseResult.endpoint {
                    case .hostPort(let host, let port):
                        print("added hostPort \(host) \(port)")
                    case .service(let name, let type, let domain, let interface):
                        print("added service \(name) \(type) \(domain) \(String(describing: interface))")
                    default:
                        print("fail")
                    }
                case .removed(let browseResult):
                    print("removed \(browseResult.endpoint)")
                case .changed(_, let browseResult, let flags):
                    if flags.contains(.interfaceAdded) {
                        print("\(browseResult.endpoint) added interfaces")
                    }
                    if flags.contains(.interfaceRemoved) {
                        print("\(browseResult.endpoint) removed interfaces")
                    }
                default:
                    print("no change")
                }
            }
        }
        browser.start(queue: DispatchQueue.global())
    }
}
