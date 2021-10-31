//
//  MainViewAfterLoginViewController.swift
//  HW_2.3
//
//  Created by Beelab_ on 26/10/21.
//

import UIKit

class MainViewAfterLoginViewController: UIViewController {
    
    var user = User()
    
    @IBOutlet weak var firstname: UILabel!
    @IBOutlet weak var lastname: UILabel!
    @IBOutlet weak var phone: UILabel!
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var skillscounter: UILabel!
    @IBOutlet weak var avatar: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeLabel.text = "Welcome, \(user.fullName)!"
        firstname.text = "First Name: \(user.firstName)"
        lastname.text = "Last Name: \(user.lastName)"
        phone.text = "Phone: \(user.phone)"
        email.text = "email: \(user.email)"
        skillscounter.text = "You have number of SKILLs: \(user.skills.count)"
        avatar.image = user.avatar
    }
}
