//
//  UIViewControllerExtensions.swift
//  UIComponents
//
//  Created by Maviye COKELEZ on 14.01.2022.
//

import UIKit

extension UIViewController {
    
    func presentSettingsAlert(with title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let settingButton = UIAlertAction(title: "Settings", style: .default) { [self] (openSettings) in
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "mapSettings") as! MapSettingsController
            vc.isOn = true                      /* control for the neverSwitch state */
            self.present(vc, animated: true, completion: nil)
        }
        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(settingButton)
        alertController.addAction(cancelButton)
        present(alertController, animated: true, completion: nil)
        
    }
}
