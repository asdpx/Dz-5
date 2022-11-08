//
//  UtilityFunction.swift
//  dzFive
//
//  Created by Vladimir Grishchenkov on 04.11.2022.
//

import UIKit

class UtilityFunction: NSObject {
    func simpleAllert(vc: UIViewController, title: String, messege: String){
        let allert = UIAlertController(title: title, message: messege, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        allert.addAction(okAction)
        vc.present(allert, animated: true, completion: nil)
    }
}


