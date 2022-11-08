//
//  ViewController.swift
//  dzFive
//
//  Created by Vladimir Grishchenkov on 04.11.2022.
//

import UIKit

class ViewController: UIViewController {
    lazy var  contactButton: UIButton = {
        let button = UIButton()
        button.setTitle("INPUT", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(contactButtonTapped), for: .touchUpInside)
        button.setImage(UIImage(systemName: "rectangle.portrait.and.arrow.right"), for: .normal)
        return button
    }()

    lazy var loginTf : UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect // рамка
        textField.placeholder = "vlad@mail.ru"
        textField.isSecureTextEntry = false  //защищенный текст
        textField.keyboardType = .emailAddress  // style keyboard
        textField.keyboardAppearance = .dark // color background keyboard
        textField.clearButtonMode = .always // устанавливает крестик удалить
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    lazy var passwordTf : UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect // рамка
        textField.placeholder = "p@ssword"
        textField.isSecureTextEntry = false   //защищенный текст
        textField.keyboardType = .emailAddress  // style keyboard
        textField.keyboardAppearance = .dark // color background keyboard
        textField.becomeFirstResponder()     // обновляет пороль при повторной записи
        textField.clearButtonMode = .always // устанавливает крестик удалить
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor =  #colorLiteral(red: 0.3687644005, green: 0.9079279304, blue: 0.8438054919, alpha: 1)

        setSettings()
    }

    private func setSettings () {
        title = ""

        [loginTf, passwordTf, contactButton].forEach { view.addSubview($0) }

        loginTf.delegate = self
        passwordTf.delegate = self

        NSLayoutConstraint.activate([
            contactButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            contactButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            contactButton.heightAnchor.constraint(equalToConstant: 50),
            contactButton.widthAnchor.constraint(equalToConstant: 150),
            loginTf.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginTf.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
            loginTf.heightAnchor.constraint(equalToConstant: 30),
            loginTf.widthAnchor.constraint(equalToConstant: 200),
            passwordTf.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            passwordTf.bottomAnchor.constraint(equalTo: loginTf.bottomAnchor, constant: 40),
            passwordTf.heightAnchor.constraint(equalToConstant: 30),
            passwordTf.widthAnchor.constraint(equalToConstant: 200)
        ])

    }
    @objc private func contactButtonTapped () {
        let contactViewController = ContactViewController()
      //  navigationController?.pushViewController(contactViewController, animated: true)
        if let email = loginTf.text, let password = passwordTf.text {
//            if email == "" && password == "" {
//                UtilityFunction().simpleAllert(vc: self, title: "Alert!", messege: "Enter email and password")
//            } else {
//                if !email.isValidEmail(email: email) {
//                    UtilityFunction().simpleAllert(vc: self, title: "Alert!", messege: "Enter valid email")
//                } else if !password.isValidPassword(password: password) {
//                    UtilityFunction().simpleAllert(vc: self, title: "Alert!", messege: "Enter valid password")
//                }else{
                   navigationController?.pushViewController(contactViewController, animated: true)
                }

            }
        }
//    }
//
//}

extension ViewController: UITextFieldDelegate {


    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }


    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == loginTf {
            passwordTf.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        return true
    }
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        if textField.isEditing {
            return true
        }
        return false
    }

}

extension String {
    func isValidEmail(email: String) -> Bool {
        let emailRegEx = "^[A-Z0-9a-z._%+-]+@[A-Za-z09.-]+\\.[A-Za-z]{2,4}$"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        let result = emailTest.evaluate(with: email)
        return result
    }

    func isValidPassword(password: String) -> Bool {
        let passwordRegEx = "^(?=.*[a-z])(?=.*[$@$#!%*?&]).{6,}$"
        let passwordTest = NSPredicate(format: "SELF MATCHES %@ ", passwordRegEx)
        let result = passwordTest.evaluate(with: password)
        return result
    }
}


