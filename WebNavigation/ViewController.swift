//
//  ViewController.swift
//  WebNavigation
//
//  Created by Rafael González on 24/08/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func openURLButtonPressed(_ sender: UIButton) {
        
        if let url = URL(string: "https://developer.apple.com/documentation/sirieventsuggestionsmarkup/url/") {
            UIApplication.shared.open(url)
        }
        
    }
    
}

