//
//  WebViewController.swift
//  Week7-Lesson
//
//  Created by Berke Alabalik on 19.02.2022.
//

import UIKit
import WebKit

class WebViewController: UIViewController ,WKNavigationDelegate {

    var webView : WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let urlString = "https://gelecegiyazanlar.turkcell.com.tr"
        let url = URL(string: urlString)!
        
        webView.load(URLRequest(url: url))
        
        let refresh = UIBarButtonItem(barButtonSystemItem: .refresh, target: webView, action: #selector(webView.reload))
        toolbarItems = [refresh]
        navigationController?.isToolbarHidden = false
    }
    
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        title = webView.title
    }
    
    

}
