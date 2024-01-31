//
//  ViewController.swift
//  BrandButton
//
//  Created by Ali Elsokary on 30/01/2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var button1: BrandButton!
    @IBOutlet weak var button2: BrandButton!
    
    @IBOutlet weak var button3: BrandButton!
    @IBOutlet weak var button4: BrandButton!
    
    @IBOutlet weak var button5: BrandButton!
    @IBOutlet weak var button6: BrandButton!
    
    @IBOutlet weak var button7: BrandButton!
    @IBOutlet weak var button8: BrandButton!
    
    @IBOutlet weak var button9: BrandButton!
    @IBOutlet weak var button10: BrandButton!
    
    @IBOutlet weak var button11: BrandButton!
    @IBOutlet weak var button12: BrandButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        let customButton = BrandButton()
        customButton.style = .primary
        customButton.colorStyle = .mainGreen
        customButton.setTitle("Primary Default", for: .normal)
        customButton.frame = CGRect(x: 50, y: 50, width: 200, height: 44)
        customButton.leadingIcon = UIImage(named: "primary-btn-icon")
        customButton.isEnabled = false
        customButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)

        view.addSubview(customButton)
        
        button1.style = .primary
        button1.colorStyle = .mainGreen
        button1.setTitle("Primary Default", for: .normal)
        
        button2.style = .primary
        button2.colorStyle = .mainBlue
        button2.setTitle("Primary Default", for: .normal)
        
        button3.style = .primary
        button3.colorStyle = .mainGreen
        button3.setTitle("Primary Default", for: .normal)
        button3.leadingIcon = UIImage(named: "primary-btn-icon")
        
        button4.style = .primary
        button4.colorStyle = .mainBlue
        button4.setTitle("Primary Default", for: .normal)
        button4.trailingIcon = UIImage(named: "primary-btn-icon")
        
        button5.style = .primary
        button5.colorStyle = .mainBlue
        button5.setTitle("Primary Disabled", for: .normal)
        button5.isEnabled = false
        
        button6.style = .primary
        button6.colorStyle = .mainGreen
        button6.setTitle("Primary Disabled", for: .normal)
        button6.leadingIcon = UIImage(named: "primary-btn-icon")
        button6.isEnabled = false
        
        
        button7.style = .secondary
        button7.colorStyle = .mainGreen
        button7.setTitle("Secondary Default", for: .normal)
        
        button8.style = .secondary
        button8.colorStyle = .mainBlue
        button8.setTitle("Secondary Default", for: .normal)
        
        button9.style = .secondary
        button9.colorStyle = .mainGreen
        button9.setTitle("Secondary Default", for: .normal)
        button9.leadingIcon = UIImage(named: "secondary-btn-icon")
        
        button10.style = .secondary
        button10.colorStyle = .mainBlue
        button10.setTitle("Secondary Default", for: .normal)
        button10.trailingIcon = UIImage(named: "secondary-btn-icon")
        
        button11.style = .secondary
        button11.colorStyle = .mainBlue
        button11.setTitle("Secondary Disabled", for: .normal)
        button11.isEnabled = false
        
        button12.style = .secondary
        button12.colorStyle = .mainGreen
        button12.setTitle("Secondary Disabled", for: .normal)
        button12.leadingIcon = UIImage(named: "secondary-btn-icon")
        button12.isEnabled = false

    }
    
    @objc func buttonTapped() {
        print("tabbed")
    }


}

