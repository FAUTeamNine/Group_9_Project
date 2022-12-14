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
        
        //TO DO: get the zip of the user and add it to the weather.getCoordinates function (replace 90001 with user coordinates
        
        let weather = OpenWeather();
        let coordinates = weather.getCoordinates(zipCode: 33071) //<- change the input of this
        
        //you can get coordinates if they were saved to parse (faster) or by calling the function
        
        //The Function has the following output
        //coordintaes[0] is latitude
        //coordinates[1] is longitude
        
        //WARNINGS ABOUT THE MAP
        //the map has a search functionality and a functionality for time. I could not manage to hide them using the injection, please do not click on it because it will break the map.
        //the + and - on the map work as intended
        //the layers of the map work as intended
        //the map make take some time to start up
        //it will ask you for your current location, this does not matter you can click accept or deny
        
        let url = URL(string: "https://openweathermap.org/weathermap?basemap=map&cities=true&layer=clouds&lat=\(coordinates[0])&lon=\(coordinates[1])&zoom=9")!
        
        webView.load(URLRequest(url: url))
        
        let jsScript = WKUserScript(source: "document.getElementById(\"nav-website\").style.display = \"none\";  document.getElementById(\"map\").style.top=0; document.getElementByClassName(\"leaflet-top leaflet-left\")[0].style.display=\"none\";", injectionTime: .atDocumentEnd, forMainFrameOnly: false)
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
