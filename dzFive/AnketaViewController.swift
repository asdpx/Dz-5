//
//  AnketaViewController.swift
//  dzFive
//
//  Created by Vladimir Grishchenkov on 04.11.2022.
///

import UIKit

class AnketaViewController: UIViewController {

    lazy var nameTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        textField.placeholder = "Add email"
        textField.textAlignment = .center
        return textField
    }()

    lazy var dataTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        textField.placeholder = "add birthday date"
        textField.inputView = birthdayPicker
        return textField
    }()

    lazy var doneButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("ButtonBack", for: .normal)
        button.addTarget(self, action: #selector(doneButtonTuch), for: .touchUpInside)
        return button
    }()

    let  birthdayPicker = UIDatePicker()

    var delegate: TransferDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.5747797489, green: 0.4985941052, blue: 0.8858184814, alpha: 1)
        setupSetting()
        createDatePicker()
    }
    
    @objc func doneButtonTuch() {
        if let name = nameTextField.text, let birthday = dataTextField.text{
            delegate?.update(name: name, birthday: birthday)
        }
        dismiss(animated: true)
    }
    @objc func donePress() {
        let dateFormater = DateFormatter()
        dateFormater.dateStyle = .medium
        dateFormater.timeStyle = .none
        self.dataTextField.text = dateFormater.string(from: birthdayPicker.date)
        self.view.endEditing(true)
    }
    func setupSetting() {
        [nameTextField, dataTextField, doneButton].forEach { view.addSubview($0) }
        NSLayoutConstraint.activate([
            nameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            nameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            nameTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 52),
            doneButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            doneButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            dataTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            dataTextField.bottomAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 40),
            dataTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            dataTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
    func createToolBar() -> UIToolbar {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePress))
        toolbar.setItems([doneButton], animated: true)
        return toolbar
    }
    func createDatePicker() {
        dataTextField.inputView = birthdayPicker
        dataTextField.inputAccessoryView = createToolBar()
        dataTextField.textAlignment = .center
        birthdayPicker.preferredDatePickerStyle = .wheels
        birthdayPicker.datePickerMode = .date
    }

}
