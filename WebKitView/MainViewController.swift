//
//  ViewController.swift
//  WebKitView
//
//  Created by Mehmet Tırpan on 14.05.2024.
//

import UIKit
import WebKit

class MainViewController: UIViewController, WKNavigationDelegate {

    var webView: WKWebView!

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .darkContent
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Create the user content controller
        let userContentController = WKUserContentController()

        // JavaScript to disable double-tap zoom
        let scriptSource = """
        var meta = document.createElement('meta');
        meta.name = 'viewport';
        meta.content = 'width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no';
        var head = document.getElementsByTagName('head')[0];
        head.appendChild(meta);
        """

        let script = WKUserScript(source: scriptSource, injectionTime: .atDocumentEnd, forMainFrameOnly: true)
        userContentController.addUserScript(script)

        // Create the web view configuration
        let webConfiguration = WKWebViewConfiguration()
        webConfiguration.userContentController = userContentController

        // Initialize the WebView with the configuration
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.navigationDelegate = self
        webView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(webView)
        
        // WebView için Auto Layout kısıtlamaları ekleyin
        NSLayoutConstraint.activate([
            webView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            webView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            webView.topAnchor.constraint(equalTo: self.view.topAnchor),
            webView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
        
        // Load the URL
        if let url = URL(string: "https://github.com") {
            let request = URLRequest(url: url)
            webView.load(request)
        }
    }

    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("Web page loaded successfully")
    }

    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        print("Failed to load web page: \(error.localizedDescription)")
    }

    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        print("Failed to load web page: \(error.localizedDescription)")
    }
}
