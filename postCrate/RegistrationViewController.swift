//
//  RegistrationViewController.swift
//  postCrate
//
//  Created by Kimberly Sejas on 11/6/23.
//

import UIKit

class RegistrationViewController: UIViewController {
    @IBOutlet weak var instructionLabel: UILabel!
    @IBOutlet weak var enterUsername: UITextField!

    @IBOutlet weak var enterPassword: UITextField!
    
    @IBAction func signUpButton(_ sender: Any) {
        
        if (enterPassword.text != "") && (enterUsername.text != ""){
            let status = User.registerUser(username: enterUsername.text!, password: enterPassword.text!)
            if status == false{
                instructionLabel.text = "Username already exists"
            }else{
                instructionLabel.text = "Success!"
                self.performSegue(withIdentifier: "goToHome", sender: self)
            }
            
        }else{
            instructionLabel.text = "Please enter all fields"
        }
                
        
        
                
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
