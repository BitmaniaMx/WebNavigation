//
//  ViewControllerExtension.swift
//  NetworkMonitor
//
//  Created by Rafael Gonzalez on 16/04/25.
//

import Foundation
import UIKit

extension UIViewController {
    
    //Create computed properties
    var isConnected: Bool {
        return NetworkMonitor.shared.isConnected
    }
    
    var connectionType: String {
        return NetworkMonitor.shared.currentConnectionType
    }
    
    var isExpensive : Bool {
        return NetworkMonitor.shared.isExpensive
    }
    
    //Suscribes to network change notification
    func observeConnectionChanges(selector : Selector) {
        NotificationCenter.default.addObserver(self, selector: selector, name: .networkStatusChanged , object: nil)
    }
    
    func removeNetworkObserver() {
        NotificationCenter.default.removeObserver(self, name: .networkStatusChanged, object: nil)
    }
}
