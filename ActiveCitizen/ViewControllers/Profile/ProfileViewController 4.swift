//
//  ProfileViewController.swift
//  ActiveCitizen
//
//  Created by Dmitry Byankin on 02.12.2019.
//  Copyright © 2019 Antares Software. All rights reserved.
//

import UIKit
import RESegmentedControl

class ProfileViewController: BaseProfileViewController {

    @IBOutlet weak var segmentedControl: RESegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setSegmentedControl()
    }
  
    func setSegmentedControl() {
        let segmentItems: [SegmentModel] = [SegmentModel(title: "УВЕДОМЛЕНИЯ"), SegmentModel(title: "ОБРАЩЕНИЯ")]
        var presetStyle = MaterialPreset(backgroundColor: .white, tintColor: UIColor(red: 0, green: 132/255, blue: 227/255, alpha: 1))
        presetStyle.configure()
        segmentedControl.configure(segmentItems: segmentItems, preset: presetStyle, selectedIndex: 0)
    }
    
    @IBAction func selectSegmentOnValueChanged(_ sender: RESegmentedControl) {
        switch sender.selectedSegmentIndex {
            case 0:
                print("УВЕДОМЛЕНИЯ")
            case 1:
                print("ОБРАЩЕНИЯ")
            default:
                break
        }
    }
    
    @IBAction func editNameOnTouchUpInside(_ sender: Any) {
        print("Editing name")
    }

}
