import UIKit
import WebKit

class BigRanchViewController: UIViewController, WKNavigationDelegate {
    
    var webView: WKWebView!
    
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
        
        let bigRanchURL = NSURL(string: "https://www.bignerdranch.com")!
        webView.loadRequest(NSURLRequest(URL: bigRanchURL))
        webView.allowsBackForwardNavigationGestures = true
    }
}