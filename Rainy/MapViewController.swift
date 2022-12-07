//
//  MapViewController.swift
//  Rainy
//
//  Created by Briana Jackson on 11/22/22.
//

import UIKit
import WebKit

class MapViewController: UIViewController, WKNavigationDelegate {
    
    
    @IBOutlet var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: "https://openweathermap.org/weathermap?basemap=map&cities=true&layer=clouds&lat=26.2435&lon=-80.2601&zoom=10")!
        
        webView.load(URLRequest(url: url))
        
        let jsScript = WKUserScript(source: "document.getElementById(\"nav-website\").style.display = \"none\"; document.getElementById(\"map\").style.top=0", injectionTime: .atDocumentEnd, forMainFrameOnly: false)
        webView.configuration.userContentController.addUserScript(jsScript)
        
        
        // Do any   additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
