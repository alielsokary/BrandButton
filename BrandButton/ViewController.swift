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
        customButton.variant = .primary
        customButton.style = .mainGreen
        customButton.setTitle("Primary Default", for: .normal)
        customButton.frame = CGRect(x: 50, y: 50, width: 200, height: 44)
        customButton.leadingIcon = UIImage(named: "primary-btn-icon")
        customButton.isEnabled = false
        customButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)

        view.addSubview(customButton)
        
        button1.variant = .primary
        button1.style = .mainGreen
        button1.setTitle("Primary Default", for: .normal)
        
        button2.variant = .primary
        button2.style = .mainBlue
        button2.setTitle("Primary Default", for: .normal)
        
        button3.variant = .primary
        button3.style = .mainGreen
        button3.setTitle("Primary Default", for: .normal)
        button3.leadingIcon = UIImage(named: "primary-btn-icon")
        
        button4.variant = .primary
        button4.style = .mainBlue
        button4.setTitle("Primary Default", for: .normal)
        button4.trailingIcon = UIImage(named: "primary-btn-icon")
        
        button5.variant = .primary
        button5.style = .mainBlue
        button5.setTitle("Primary Disabled", for: .normal)
        button5.isEnabled = false
        
        button6.variant = .primary
        button6.style = .mainGreen
        button6.setTitle("Primary Disabled", for: .normal)
        button6.leadingIcon = UIImage(named: "primary-btn-icon")
        button6.isEnabled = false
        
        
        button7.variant = .secondary
        button7.style = .mainGreen
        button7.setTitle("Secondary Default", for: .normal)
        
        button8.variant = .secondary
        button8.style = .mainBlue
        button8.setTitle("Secondary Default", for: .normal)
        
        button9.variant = .secondary
        button9.style = .mainGreen
        button9.setTitle("Secondary Default", for: .normal)
        button9.leadingIcon = UIImage(named: "secondary-btn-icon")
        
        button10.variant = .secondary
        button10.style = .mainBlue
        button10.setTitle("Secondary Default", for: .normal)
        button10.trailingIcon = UIImage(named: "secondary-btn-icon")
        
        button11.variant = .secondary
        button11.style = .mainBlue
        button11.setTitle("Secondary Disabled", for: .normal)
        button11.isEnabled = false
        
        button12.variant = .secondary
        button12.style = .mainGreen
        button12.setTitle("Secondary Disabled", for: .normal)
        button12.leadingIcon = UIImage(named: "secondary-btn-icon")
        button12.isEnabled = false

    }
    
    @objc func buttonTapped() {
        print("tabbed")
    }


}
