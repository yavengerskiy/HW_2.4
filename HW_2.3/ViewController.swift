//
//  ViewController.swift
//  HW_2.3
//
//  Created by Beelab_ on 26/10/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func forgotUserNameButtonPressed() {
        // create the alert
        let forgotUserNameAlert = UIAlertController(title: "Ooops!", message: "Your name is User 😉 ", preferredStyle: UIAlertController.Style.alert)

        // add an action (button)
        forgotUserNameAlert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))

        // show the alert
        self.present(forgotUserNameAlert, animated: true, completion: nil)
    }
    
    @IBAction func forgotPasswordButtonPressed() {
        let forgotPasswordAlert = UIAlertController(title: "Ooops!", message: "Your password is Password 🥴 ", preferredStyle: UIAlertController.Style.alert)

        // add an action (button)
        forgotPasswordAlert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))

        // show the alert
        self.present(forgotPasswordAlert, animated: true, completion: nil)
    }
}

