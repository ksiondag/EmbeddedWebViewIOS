import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {

    var webView: WKWebView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Initialize and configure the WebView
        let webViewConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: self.view.frame, configuration: webViewConfiguration)
        
        // Set the delegate
        webView.navigationDelegate = self
        self.view.addSubview(webView)
        
        // Load the URL
        if let url = URL(string: "https://ca02-71-194-11-86.ngrok-free.app/signup") {
            let request = URLRequest(url: url)
            webView.load(request)
        }
    }

    // Bypass SSL for testing purposes (NOT FOR PRODUCTION USE)
    func webView(_ webView: WKWebView, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
        let serverTrust = challenge.protectionSpace.serverTrust
        let credential = URLCredential(trust: serverTrust!)
        completionHandler(.useCredential, credential)
    }
}
