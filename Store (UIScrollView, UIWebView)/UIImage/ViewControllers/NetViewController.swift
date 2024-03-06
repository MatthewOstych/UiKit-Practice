//
//  NetViewController.swift
//  UIImage
//
//  Created by Mathew Lantsov on 01.03.2024.
//

import UIKit
import WebKit

final class NetViewController: UIViewController, WKUIDelegate {
    
    //MARK: - vars
   private var webView = WKWebView()
    private var toolBar = UIToolbar()

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addwebViewLoad()
        addTooldBar()
        

    }
    
    //MARK: - View Add Funcs
    private func addwebViewLoad() {
        //URL Settings
        
         var myURL = URL(string: "https://apple.com")
        switch addGoods.tag {
        case 0:
            myURL = URL(string: addGoods.myURLs[0])
        case 1:
            myURL = URL(string: addGoods.myURLs[1])
        default:
            ()
        }
        
        //WebView
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
        webView.frame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height - 140)
        self.view.addSubview(webView)
        
        
    }
    
    private func addTooldBar() {
        toolBar.frame = CGRect(x: 0, y: self.view.bounds.maxY - 140, width: self.view.bounds.width, height: 50)
        self.view.addSubview(toolBar)
        
        //adding buttons
    
        let goBackButton = UIBarButtonItem(barButtonSystemItem: .rewind, target: self, action: #selector(goLastPage))
        let goNextButton = UIBarButtonItem(barButtonSystemItem: .fastForward, target: self, action: #selector(goNextPageFunc))
        let refreshButton = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(goRefreshFunc))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        let doneButton = UIBarButtonItem(title: "Done", image: nil, target: self, action: #selector(closeWidno))
        
        toolBar.setItems([goBackButton, goNextButton, refreshButton, spaceButton, doneButton], animated: false)
    }
    
    @objc func closeWidno() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func goLastPage() {
        if webView.canGoBack {
            webView.goBack()
        }
    }
    
    @objc func goNextPageFunc() {
            if webView.canGoForward {
                webView.goForward()
            }
        }
    
    
    @objc func goRefreshFunc() {
        webView.reload()
        }
    
    }

