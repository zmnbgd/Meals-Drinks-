//
//  MealsDetailViewController.swift
//  MealsAndDrinksApp
//
//  Created by Marko Zivanovic on 13.1.23..
//

import UIKit
import WebKit

class MealsDetailViewController: UIViewController, WKNavigationDelegate {
    
    var webView: WKWebView!
    
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }
    
    var selectedMeals: Meals?

    override func viewDidLoad() {
        super.viewDidLoad()

    }

}
