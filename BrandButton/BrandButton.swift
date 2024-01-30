//
//  BrandButton.swift
//  BrandButton
//
//  Created by Ali Elsokary on 30/01/2024.
//

import UIKit

class BrandButton: UIButton {
    enum ButtonStyle {
        case primary
        case secondary
    }
    
    enum ColorStyle {
        case mainGreen
        case mainBlue
    }
    
    var style: ButtonStyle = .primary {
        didSet {
            updateButtonStyle()
        }
    }
    
    var colorStyle: ColorStyle = .mainGreen {
        didSet {
            updateColorStyle()
        }
    }
    
    override var isEnabled: Bool {
        didSet {
            updateButtonStyle()
        }
    }

    override var isHighlighted: Bool {
        didSet {
            updateButtonStyle()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    // MARK: Properties for default state
    private var defaultBackgroundColor: UIColor = .green {
        didSet {
            updateButtonStyle()
        }
    }
    
    private var defaultBorderColor: UIColor = .clear {
        didSet {
            updateButtonStyle()
        }
    }
    
    private var defaultTitleColor: UIColor = .white {
        didSet {
            updateButtonStyle()
        }
    }
    
    // MARK: Properties for highlighted state
    private var highlightedBackgroundColor: UIColor = .darkGray {
        didSet {
            updateButtonStyle()
        }
    }
    
    private var highlightedBorderColor: UIColor = .clear {
        didSet {
            updateButtonStyle()
        }
    }
    
    private var highlightedTitleColor: UIColor = .white {
        didSet {
            updateButtonStyle()
        }
    }
    
    // MARK: Properties for disabled state
    private var disabledBackgroundColor: UIColor = .lightGray {
        didSet {
            updateButtonStyle()
        }
    }
    
    private var disabledBorderColor: UIColor = .clear {
        didSet {
            updateButtonStyle()
        }
    }
    
    private var disabledTitleColor: UIColor = .gray {
        didSet {
            updateButtonStyle()
        }
    }
    
    private func commonInit() {
        setTitleColor(.white, for: .normal)
        titleLabel?.font = UIFont.systemFont(ofSize: 15) // Proxima Nova
        contentEdgeInsets = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        layer.cornerRadius = 4
        clipsToBounds = true
        
        updateButtonStyle()
    }
    
    private func updateButtonStyle() {
        switch (style, isEnabled, isHighlighted) {
        case (.primary, true, false):
            applyStyle(backgroundColor: defaultBackgroundColor,
                       borderColor: defaultBorderColor,
                       titleColor: defaultTitleColor)
        case (.primary, true, true):
            applyStyle(backgroundColor: highlightedBackgroundColor,
                       borderColor: highlightedBorderColor,
                       titleColor: highlightedTitleColor)
        case (.primary, false, _):
            applyStyle(backgroundColor: disabledBackgroundColor,
                       borderColor: disabledBorderColor,
                       titleColor: disabledTitleColor)
            
        case (.secondary, true, false):
            applyStyle(backgroundColor: defaultBackgroundColor,
                       borderColor: defaultBorderColor,
                       titleColor: defaultTitleColor)
        case (.secondary, true, true):
            applyStyle(backgroundColor: highlightedBackgroundColor,
                       borderColor: highlightedBorderColor,
                       titleColor: highlightedTitleColor)
        case (.secondary, false, _):
            applyStyle(backgroundColor: disabledBackgroundColor,
                       borderColor: disabledBorderColor,
                       titleColor: disabledTitleColor)
        }
    }
    
    private func applyStyle(backgroundColor: UIColor, borderColor: UIColor, titleColor: UIColor) {
        self.backgroundColor = backgroundColor
        layer.borderColor = borderColor.cgColor
        setTitleColor(titleColor, for: .normal)
    }
    
    private func updateColorStyle() {
        switch colorStyle {
        case .mainGreen:
            defaultBackgroundColor = .green
            defaultBorderColor = .clear
            defaultTitleColor = .white
            
            highlightedBackgroundColor = .darkGray
            highlightedBorderColor = .clear
            highlightedTitleColor = .white
            
            disabledBackgroundColor = .lightGray
            disabledBorderColor = .clear
            disabledTitleColor = .white
            
        case .mainBlue:
            defaultBackgroundColor = .blue
            defaultBorderColor = .clear
            defaultTitleColor = .white
            
            highlightedBackgroundColor = .darkGray
            highlightedBorderColor = .clear
            highlightedTitleColor = .white
            
            disabledBackgroundColor = .lightGray
            disabledBorderColor = .clear
            disabledTitleColor = .gray
        }

        updateButtonStyle()
    }
}
