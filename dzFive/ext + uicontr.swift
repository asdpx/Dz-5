//
//  ext + uicontr.swift
//  dzFive
//
//  Created by Vladimir Grishchenkov on 04.11.2022.
//

import UIKit

extension UIViewController {
    func creatCustomNavigationBar() {
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.5994015932, green: 1, blue: 0.5747756958, alpha: 1)
    }
    func createCustomTitleView(contactName: String, contactDiscriptoin: String,contactImage: String ) -> UIView {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: 280, height: 41)
        let imageContact = UIImageView()
        imageContact.image = UIImage(named: contactImage)
        imageContact.layer.cornerRadius = imageContact.frame.height / 2
        imageContact.frame = CGRect(x: 5, y: 0, width: 40, height: 40)
        view.addSubview(imageContact)

        let nameLabel = UILabel()
        nameLabel.text = contactName
        nameLabel.frame = CGRect(x: 55, y: 0, width: 220, height: 20)
        nameLabel.font = UIFont.systemFont(ofSize: 20)
        view.addSubview(nameLabel)

        let discriptionLabel = UILabel()
        discriptionLabel.text = contactDiscriptoin
        discriptionLabel.frame = CGRect(x: 55, y: 21, width: 220, height: 20)
        discriptionLabel.font = UIFont.systemFont(ofSize: 16)
        discriptionLabel.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        view.addSubview(discriptionLabel)
        return view
    }

    func createCustomButton(imageName: String, selector: Selector) -> UIBarButtonItem {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: imageName)?.withRenderingMode(.alwaysTemplate), for: .normal)
        button.tintColor = .systemBlue
        button.imageView?.contentMode = .scaleAspectFit
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        button.addTarget(self, action: selector, for: .touchUpInside)

        let menuBarItem = UIBarButtonItem(customView: button)
        return menuBarItem
    }
}


