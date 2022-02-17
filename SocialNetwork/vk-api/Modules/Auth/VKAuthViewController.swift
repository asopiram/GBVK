//
//  VKAuthViewController.swift
//  SocialNetwork
//
//  Created by Дмитрий Шароваров on 12/19/21.
//

import UIKit
import WebKit
import Alamofire

class VKAuthViewController: UIViewController, WKNavigationDelegate {
    
    @IBOutlet weak var webView: WKWebView! {
        didSet {
            webView.navigationDelegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        AuthVK()
    }
    
    func AuthVK() {
        
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "oauth.vk.com"
        urlComponents.path = "/authorize"
        urlComponents.queryItems = [
            URLQueryItem(name: "client_id", value: "8030865"),
            URLQueryItem(name: "display", value: "mobile"),
            URLQueryItem(name: "redirect_uri", value: "https://oauth.vk.com/blank.html"),
            URLQueryItem(name: "scope", value: "262150"),
            URLQueryItem(name: "response_type", value: "token"),
            URLQueryItem(name: "revoke", value: "1"),
            URLQueryItem(name: "v", value: "5.68")
        ]
        
        let request = URLRequest(url: urlComponents.url!)
        
        webView.load(request)
    }
    
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        
        guard let url = navigationResponse.response.url, url.path == "/blank.html", let fragment = url.fragment  else {
            
            //print(navigationResponse.response.url)
            decisionHandler(.allow)
            return
        }
        
        //https://oauth.vk.com/blank.html#access_token=e5c0e33b669ed761178aaf8a5cf75caa8ee066bd7c7cc0c5f2cdf181c5a63da086e90dd15110e89f82459&expires_in=86400&user_id=3690675
        // [access_token, e5c0e33b669ed761178aaf8a5cf75caa8ee066bd7c7cc0c5f2cdf181c5a63da086e90dd15110e89f82459, expires_in, 86400, user_id, 3690675
        
        let params = fragment
            .components(separatedBy: "&")
            .map { $0.components(separatedBy: "=") }
            .reduce([String: String]()) { result, param in// при помощи функции высшего порядка делаем словарь из url
                var dict = result //буферная переменная
                let key = param[0]
                let value = param[1]
                dict[key] = value
                return dict
            }
        
        guard let token = params["access_token"], let userId = params["user_id"] else { return }
        
        Session.shared.token = token
        Session.shared.userId = userId
        
        performSegue(withIdentifier: "showTabBarSegue", sender: nil)
        //print(url)
        
        decisionHandler(.cancel)
    }
    
}
