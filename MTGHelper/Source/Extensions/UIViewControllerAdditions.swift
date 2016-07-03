//
//  UIViewControllerAdditions.swift
//  MTGHelper
//
//  Created by Alex Amelchenko on 03/07/16.
//  Copyright © 2016 Alex Amelchenko. All rights reserved.
//

import UIKit
import RKDropdownAlert
import MBProgressHUD

extension UIViewController {
    
    func showLoading(show: Bool) {
        if show {
            view.endEditing(true)
            view.userInteractionEnabled = false
            self.navigationController?.navigationBar.userInteractionEnabled = false
            MBProgressHUD.showHUDAddedTo(self.view, animated: true)
        } else {
            view.userInteractionEnabled = true
            self.navigationController?.navigationBar.userInteractionEnabled = true
            MBProgressHUD.hideAllHUDsForView(self.view, animated: true)
        }
    }
    
    func showDropdown(message: String?) {
        RKDropdownAlert.title(nil, message: message, backgroundColor: UIColor.redColor(), textColor: UIColor.whiteColor())
    }
    
}
