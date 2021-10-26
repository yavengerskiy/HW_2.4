//
//  MainViewAfterLoginViewController.swift
//  HW_2.3
//
//  Created by Beelab_ on 26/10/21.
//

import UIKit

class MainViewAfterLoginViewController: UIViewController {

    @IBOutlet weak var welcomeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func loguotButtonPressed() {
        dismiss(animated: true)
    }
    

}
