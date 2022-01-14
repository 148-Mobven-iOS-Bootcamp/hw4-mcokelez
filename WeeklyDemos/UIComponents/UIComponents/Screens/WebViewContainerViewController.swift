//
//  WebViewContainerViewController.swift
//  UIComponents
//
//  Created by Semih Emre ÜNLÜ on 9.01.2022.
//

import UIKit
import WebKit
import SafariServices

class WebViewContainerViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        configureWebView()
        configureActivityIndicator()
    }

//    var urlString = "https://www.google.com"

    func configureWebView() {
//        guard let url = URL(string: urlString) else { return }
//        let urlRequest = URLRequest(url: url)

        let preferences = WKPreferences()
        preferences.javaScriptCanOpenWindowsAutomatically = false

        let configuration = WKWebViewConfiguration()
        configuration.preferences = preferences
//        webView.configuration = configuration
        webView.uiDelegate = self
        webView.navigationDelegate = self
        webView.allowsBackForwardNavigationGestures = true
        webView.addObserver(self,
                            forKeyPath: #keyPath(WKWebView.isLoading),
                            options: .new,
                            context: nil)
        
//        webView.load(urlRequest)
       
        
    // MARK:  HtmlString file existing under the Models directory. You can review there.
        webView.loadHTMLString(htmlString, baseURL: nil) /*This code loading page this file.*/
      
    }

    func configureActivityIndicator() {
        activityIndicator.style = .large
        activityIndicator.color = .red
        activityIndicator.hidesWhenStopped = true
    }

    override func observeValue(forKeyPath keyPath: String?,
                               of object: Any?,
                               change: [NSKeyValueChangeKey : Any]?,
                               context: UnsafeMutableRawPointer?) {

        if keyPath == "loading" {
            webView.isLoading ? activityIndicator.startAnimating() : activityIndicator.stopAnimating()
        }

    }

    
    
// MARK: Toolbars items actions are below.
    
    @IBAction func openSafariButtonTapped(_ sender: UIBarButtonItem) {
    
        guard let url = URL(string:"https://www.google.com") else {return}
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
        
        
        
        // Tried SafariServices how is it, how is working.....
//        let config = SFSafariViewController.Configuration()
//        config.entersReaderIfAvailable = true
//        let vc = SFSafariViewController(url: url, configuration: config)
//        present(vc, animated: true)
        
        
   
    }
    @IBAction func forwardButtonTapped(_ sender: UIBarButtonItem) {
        webView.goForward()
    }
    @IBAction func backButtonTapped(_ sender: UIBarButtonItem) {
        webView.goBack()
    }
    @IBAction func reloadButtonTapped(_ sender: UIBarButtonItem) {
        webView.reload()
    }
}

extension WebViewContainerViewController: WKNavigationDelegate {

}

extension WebViewContainerViewController: WKUIDelegate {

}
