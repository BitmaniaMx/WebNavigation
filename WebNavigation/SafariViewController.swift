//
//  SafariViewController.swift
//  WebNavigation
//
//  Created by Rafael González on 27/08/23.
//

import UIKit
import SafariServices

class SafariViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func lanchSafariPressed(_ sender: UIButton) {
        let url = URL(string: "https://developer.apple.com/documentation/safariservices/sfsafariviewcontroller")
        let config = SFSafariViewController.Configuration()
        config.entersReaderIfAvailable = true
        let safariController = SFSafariViewController(url: url!,configuration: config)
        self.present(safariController, animated: true)
    }
}
