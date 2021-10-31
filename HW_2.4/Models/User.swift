//
//  User.swift
//  HW_2.4
//
//  Created by Beelab on 31/10/21.
//

import Foundation
import UIKit

class User {
    
    let login: String
    let password: String
    var avatar: UIImage?
    
    var firstName: String
    var lastName: String
    var fullName: String {
        firstName + " " + lastName
    }
    var email: String
    var phone: String
    
    var skills: [Skill]
    
    
    init() {
        self.login = "User"
        self.password = "Password"
        self.avatar = UIImage(named: "avatar1")
        self.firstName = ""
        self.lastName = ""
        self.email = ""
        self.phone = ""
self.skills = []
    }
    
    
    //MARK: - Methods
    func addSkill(_ skill: Skill) {
        skills.append(skill)
    }

    
    func configureUser() {
        self.firstName = "Root"
        self.lastName = "User"
        self.email = "user@mail.com"
        self.phone = "+777777777"
        self.avatar = UIImage(named: "avatar1")

        for skillCounter in 0...10 {
            let skill = Skill(title: "skill \(skillCounter)",
                              description: "Description of skill \(skillCounter)")
            addSkill(skill)
        }
    }

}
