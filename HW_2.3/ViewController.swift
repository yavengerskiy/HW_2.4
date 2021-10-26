//
//  ViewController.swift
//  HW_2.3
//
//  Created by YaYuVengerskiy on 26/10/21.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate{

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
    }
    
    @IBAction func loginButtonPressed() {
                    if usernameInput.text != correctUsername ||
                        passwordInput.text != correctPassword {
                        
                        passwordInput.text = ""
                        showAlert(title: "Incorrect User name or Password! 🤬 ",
                                  message: "Please, enter correct Username and password")
                    }
                }
                
    @IBAction func forgotUserNameButtonPressed() {
                    showAlert(title: "Ooops!", message: "Your name is \(correctUsername) 😉 ")
                }
                
    @IBAction func forgotPasswordButtonPressed() {
                    showAlert(title: "Ooops!", message: "Your password is \(correctPassword) 🥴")
                }
    @IBAction func unwind(for segue: UIStoryboardSegue) {
                    usernameInput.text = ""
                    passwordInput.text = ""
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
        self.present(alert, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            guard let mainViewafterLogInVC = segue.destination as? MainViewAfterLoginViewController else { return }
        mainViewafterLogInVC.welcomeLabelText = "Welcome, \(usernameInput.text ?? "")!"
        }
}

