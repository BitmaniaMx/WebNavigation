//
//  WebViewController.swift
//  WebNavigation
//
//  Created by Rafael González on 24/08/23.
//

import UIKit
import WebKit

class WebViewController: UIViewController {
    
    @IBOutlet var webView: WKWebView!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    let timeoutInterval: TimeInterval = 30 //seconds
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        Add delegate
        webView.navigationDelegate = self
        
        // Start a timer to check for timeout
//        DispatchQueue.main.asyncAfter(deadline: .now() + timeoutInterval) { [weak self] in
            self.timeoutHandler()
//        }
       
        DispatchQueue.global().async {
            let url = URL(string: "https://developer.apple.com/documentation/webkit/wkwebview")
            let requestURL = URLRequest(url: url!)
            DispatchQueue.main.async {
                self.webView.load(requestURL)
            }
            
        }
    }
}

extension WebViewController : WKNavigationDelegate{
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
         activityIndicator.isHidden = true
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        activityIndicator.isHidden = true
        print("Error: ", error)
    }
    
    
    func timeoutHandler() {
        if webView.isLoading {
            // Web view is still loading, show timeout message
            DispatchQueue.main.async {
                print("time out ocurred")
            }
            // Stop the loading process
            DispatchQueue.global().async {
                self.webView.stopLoading()
            }
        }
    }
}

