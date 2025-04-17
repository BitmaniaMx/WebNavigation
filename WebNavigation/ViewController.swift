//
//  ViewController.swift
//  NetworkMonitor
//
//  Created by Rafael Gonzalez on 15/04/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var connectionStatusValue: UILabel!
    
    @IBOutlet weak var connectionTypeValue: UILabel!
    
    @IBOutlet weak var connectionIsExpensiveValue: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        observeConnectionChanges()
    }
    
    @IBAction func openURLButtonTapped(_ sender: UIButton) {
        
    }
    
    
    
    @objc func connectionChanged() {
        print("isConnected: \(isConnected)")
        print("isExpensive: \(isExpensive)")
        print("connectionType: \(connectionType)")
    }
}

