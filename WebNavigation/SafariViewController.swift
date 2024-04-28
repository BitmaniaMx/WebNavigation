//
//  SafariViewController.swift
//  WebNavigation
//
//  Created by Rafael González on 27/04/24.
//

import UIKit
import SafariServices

class SafariViewController: UIViewController {
 
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func launchSafariTapped(_ sender: UIButton) {
            let url = URL(string: "https://developer.apple.com/documentation/safariservices/sfsafariviewcontroller")
        let config = SFSafariViewController.Configuration()
        config.entersReaderIfAvailable = false
        let safariVC = SFSafariViewController(url: url!, configuration: config)
        self.present(safariVC, animated: true)
    }
}
