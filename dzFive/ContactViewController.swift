//
//  ContactViewController.swift
//  dzFive
//
//  Created by Vladimir Grishchenkov on 04.11.2022.
//

import UIKit

class ContactViewController: UIViewController {

    lazy var peopleLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = UIFont(name: "Marker Felt Thin", size: 25)
        label.numberOfLines = 3
        label.textColor = UIColor.red
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.8882388473, green: 1, blue: 0.916906774, alpha: 1)
        setupSetting()
    }

    private func setupSetting() {
        [peopleLabel].forEach { view.addSubview($0) }

        NSLayoutConstraint.activate([
            peopleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            peopleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            peopleLabel.heightAnchor.constraint(equalToConstant: 150),
            peopleLabel.widthAnchor.constraint(equalToConstant: 150),
        ])

        let plusPeopleButton = createCustomButton(imageName: "plus", selector: #selector(addPeopleButtonTapped))
        let customTitleView = createCustomTitleView(contactName: "SwiftBook", contactDiscriptoin: "add people", contactImage: "swift")
        navigationItem.rightBarButtonItems = [plusPeopleButton]
        navigationItem.titleView = customTitleView
    }


    @objc func addPeopleButtonTapped () {
        let anketaController = AnketaViewController()
        anketaController.delegate = self
        anketaController.modalPresentationStyle = .fullScreen
        present(anketaController, animated: true, completion: nil)
    }
}

extension ContactViewController: TransferDelegate {
    func update(name: String, birthday: String) {
        peopleLabel.text = "name is \(name) birthday \(birthday)"
    }
}
