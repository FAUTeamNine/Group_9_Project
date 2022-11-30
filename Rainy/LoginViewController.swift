//
//  LoginViewController.swift
//  Rainy
//
//  Created by Garry Florestal on 11/19/22.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var usernameField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        SAMPLE CODE ON HOW TO CALL THE LOCAL WEATHER API METHOD
        
        //Intizilaize the method
//        let weather = OpenWeather()
        
//        //GET LOACAL WEATHER
//        // parameters:
//        //   zipCode : Int
//        //   Success : CallBack func of return type void
        
//        OpenWeather.getLocalWeather(zipCode: 33071, success: { data in
//            print("\n\n\n", data)
//        })
//
//
//        //GET FORECAST
//        // parameters:
//        //   zipCode : Int
//        //   Success : CallBack func of return type void
        
//        weather.getForecast(zipCode: 33071, success: { data in
//            print("\n\n\n", data[4])
//        })
//
    }
    
    @IBAction func onSignUp(_ sender: Any) {
        self.performSegue(withIdentifier: "signUpSegue", sender: nil)
    }
    @IBAction func onLogin(_ sender: Any) {
        let username = usernameField.text!
        let password = passwordField.text!
        PFUser.logInWithUsername(inBackground: username, password: password) { (user, error) in
            if user != nil {
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            } else {
                print("Error:\(error!.localizedDescription)")
                
            }
        }
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
