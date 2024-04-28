//
//  WKWebViewController.swift
//  WebNavigation
//
//  Created by Rafael González on 27/04/24.
//

import UIKit
import WebKit

class WKWebViewController: UIViewController {

    @IBOutlet weak var wkWebView: WKWebView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    let timeOutInterval : TimeInterval = 10 //seconds
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        wkWebView.navigationDelegate = self
        activityIndicator.startAnimating()
        
        //if let url = URL(string: "https://developer.apple.com/documentation/webkit/wkwebview"){
        if let url = URL(string: "https://httpstat.us/200?sleep=5000"){
            
            let request = URLRequest(url: url)
            self.wkWebView.load(request)
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + timeOutInterval){
            [weak self] in
            guard let strongSelf = self else {
                return
            }
            strongSelf.timeOutHandler()
        }
    }
}

extension WKWebViewController : WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        activityIndicator.stopAnimating()
        activityIndicator.isHidden = true
        print("Finishes")
    }
    
    
    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        activityIndicator.stopAnimating()
        activityIndicator.isHidden = true
        print("finishes with error: ", error.localizedDescription)
    }
    
    func timeOutHandler()  {
        //Check if the web view still loading after timeout interval
        guard wkWebView.isLoading else {
            return
        }
        
        wkWebView.stopLoading()
        activityIndicator.stopAnimating()
        activityIndicator.isHidden = true
        print("Time out ocurred!")
    }
}
