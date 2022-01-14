//
//  MapSettingsController.swift
//  UIComponents
//
//  Created by Maviye COKELEZ on 13.01.2022.
//

import UIKit
import CoreLocation

class MapSettingsController: UITableViewController {

    @IBOutlet weak var alwaysSwitch: UISwitch!
    @IBOutlet weak var whenUseSwitch: UISwitch!
    @IBOutlet weak var neverSwitch: UISwitch!
    
    var isOn: Bool = false
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        alwaysSwitch.isOn = false
        alwaysSwitch.addTarget(self, action: #selector(changeAllowState(_:)), for: .valueChanged)
        whenUseSwitch.isOn = false
        whenUseSwitch.addTarget(self, action: #selector(changeAllowState(_:)), for: .valueChanged)
        isOn == true ? (neverSwitch.isOn = true) : (neverSwitch.isOn = false)
        neverSwitch.addTarget(self, action: #selector(changeAllowState(_:)), for: .valueChanged)
    }

    @objc func changeAllowState(_ switchState: UISwitch) {
        if switchState.isOn {
            let vc = storyboard?.instantiateViewController(withIdentifier: "mapView") as! MapViewController
            switch switchState.tag {
                case 1: vc.status = .authorizedAlways
                whenUseSwitch.isOn = false
                neverSwitch.isOn = false
                case 2: vc.status = .authorizedWhenInUse
                alwaysSwitch.isOn = false
                neverSwitch.isOn = false
                case 3: vc.status = .denied
                alwaysSwitch.isOn = false
                whenUseSwitch.isOn = false
                default:
                    break
            }
            present(vc, animated: true, completion: nil) /* present according to which switch is on*/
            
        }
        
    }
    
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }

 

}

