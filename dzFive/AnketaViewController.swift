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
        return textField
    }()

    lazy var doneButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("ButtonBack", for: .normal)
        button.addTarget(self, action: #selector(doneButtonTuch), for: .touchUpInside)
        return button
    }()
    var delegate: TransferDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.5747797489, green: 0.4985941052, blue: 0.8858184814, alpha: 1)
        setupSetting()
    }
    
    @objc func doneButtonTuch() {
        if let name = nameTextField.text {
            delegate?.update(name: name)
        }
        dismiss(animated: true)
    }
    func setupSetting() {
        [nameTextField, doneButton].forEach { view.addSubview($0) }
        NSLayoutConstraint.activate([
            nameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            nameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            nameTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 52),
            doneButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            doneButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }

}
