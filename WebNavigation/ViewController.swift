//
//  ViewController.swift
//  WebNavigation
//
//  Created by Rafael González on 26/04/24.
//

import UIKit

class ViewController: UIViewController {

    let AppDelegate = UIApplication.shared.delegate as! AppDelegate
    
    @IBAction func openURLButtonTapped(_ sender: UIButton) {
        
        if AppDelegate.internetStatus {
            
            if let url = URL(string: "https://developer.apple.com/documentation/uikit/uiapplication/1648685-open"){
                UIApplication.shared.open(url)
            }
        }
        else {
            print("No connected!")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

}

