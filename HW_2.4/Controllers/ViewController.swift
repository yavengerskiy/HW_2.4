//
//  ViewController.swift
//  HW_2.3
//
//  Created by YaYuVengerskiy on 26/10/21.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate{

    private  let  user = User()
    
    @IBOutlet weak var usernameInput: UITextField!
    @IBOutlet weak var passwordInput: UITextField!
    
    private let correctUsername = "User"
    private let correctPassword = "Password"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        passwordInput.delegate = self
        usernameInput.delegate = self
        usernameInput.returnKeyType = .next
        passwordInput.returnKeyType = .done
        passwordInput.enablesReturnKeyAutomatically = true
        user.configureUser()
    }
    
    @IBAction func loginButtonPressed() {
        guard let userLogin = usernameInput.text else {return}
        guard let userPassword = passwordInput.text else {return}
        
        if userLogin == user.login && userPassword == user.password {
            performSegue(withIdentifier: "showWelcome", sender: UIButton.self)
        } else {
            showAlert(title: "Incorrect User name or Password! 🤬 ",
                      message: "Please, enter correct Username and password")
            passwordInput.text = nil
        }
        
    }
                
    @IBAction func forgotUserNameButtonPressed() {
                    showAlert(title: "Ooops!", message: "Your name is \(correctUsername) 😉 ")
                }
                
    @IBAction func forgotPasswordButtonPressed() {
                    showAlert(title: "Ooops!", message: "Your password is \(correctPassword) 🥴")
                }
    @IBAction func unwind(for segue: UIStoryboardSegue) {
                    usernameInput.text = nil
                    passwordInput.text = nil
                }
    
    
    internal func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //переносим курсор в поле пароля при нажатии на "Next"
        if textField == usernameInput {
            passwordInput.becomeFirstResponder()
        }
        // Скрываем клавиатуру нажатием на "Done"
        if textField == passwordInput {
            passwordInput.resignFirstResponder()
        }
        return true
    }
    
    // Скрытие клавиатуры по тапу за пределами Text View
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true) // Скрывает клавиатуру, вызванную для любого объекта
    }
    
    private func showAlert (title : String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)

        // добавляем кнопку "OK"
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))

        // отображаем алерт
        present(alert, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let tabBarController = segue.destination as? UITabBarController else {return}
        guard let tabBarControllers = tabBarController.viewControllers else {return}
        
        for viewController in tabBarControllers {
            
            switch viewController {
            case is MainViewAfterLoginViewController:
                let destController = viewController as! MainViewAfterLoginViewController
                destController.user = user
            case is SkillsController:
                let destController = viewController as! SkillsController
                destController.skills = user.skills
            default:
                break
            }
            
        }
    }
}

