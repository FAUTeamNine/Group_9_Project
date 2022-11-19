//
//  ZipcodeViewController.swift
//  Rainy
//
//  Created by Garry Florestal on 11/19/22.
//

import UIKit
import Parse
class ZipcodeViewController: UIViewController {

   
    @IBOutlet weak var passwordBox: UITextField!
    @IBOutlet weak var usernameBox: UITextField!
    @IBOutlet weak var zipcodeField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onZipSignUp(_ sender: Any) {
        let user = PFUser()
        user.username = usernameBox.text
        user.password = passwordBox.text
        user["zipcode"] = zipcodeField.text
        user.signUpInBackground { (success, error) in
            if success {
                self.performSegue(withIdentifier: "zipcodeSegue", sender: nil)
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
