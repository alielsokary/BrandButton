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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
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

    
    // MARK: Properties for default state
    private var defaultBackgroundColor: UIColor = DS.Colors.Button.defaultGreen {
        didSet {
            updateButtonStyle()
        }
    }
    
    private var defaultBorderColor: UIColor = .clear {
        didSet {
            updateButtonStyle()
        }
    }
    
    private var defaultTitleColor: UIColor = DS.Colors.Button.neutralsWhite {
        didSet {
            updateButtonStyle()
        }
    }
    
    // MARK: Properties for highlighted state
    private var highlightedBackgroundColor: UIColor = DS.Colors.Button.backgroundGreen {
        didSet {
            updateButtonStyle()
        }
    }
    
    private var highlightedBorderColor: UIColor = DS.Colors.Button.highlightedGreen {
        didSet {
            updateButtonStyle()
        }
    }
    
    private var highlightedTitleColor: UIColor = DS.Colors.Button.highlightedGreen {
        didSet {
            updateButtonStyle()
        }
    }
    
    // MARK: Properties for disabled state
    private var disabledBackgroundColor: UIColor = DS.Colors.Button.backgroundDisabled {
        didSet {
            updateButtonStyle()
        }
    }
    
    private var disabledBorderColor: UIColor = .clear {
        didSet {
            updateButtonStyle()
        }
    }
    
    private var disabledTitleColor: UIColor = DS.Colors.Button.neutralsWhite {
        didSet {
            updateButtonStyle()
        }
    }
    
    var leadingIcon: UIImage? {
        didSet {
            updateButtonStyle()
        }
    }

    var trailingIcon: UIImage? {
        didSet {
            updateButtonStyle()
        }
    }
    
    private func commonInit() {
        setTitleColor(.white, for: .normal)
        titleLabel?.font = DS.Fonts.subhead2
        contentEdgeInsets = UIEdgeInsets(top: 13, left: 16, bottom: 13, right: 16)
        layer.cornerRadius = 4
        layer.borderWidth = 1
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
        
        if let leadingIcon = leadingIcon {
            setImage(leadingIcon, for: .normal)
            setImage(leadingIcon, for: .highlighted)
            
            titleEdgeInsets = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 0)
            imageEdgeInsets = UIEdgeInsets(top: 0, left: -8, bottom: 0, right: 8)
            self.semanticContentAttribute = .forceLeftToRight
        }

        if let trailingIcon = trailingIcon {
            setImage(trailingIcon, for: .normal)
            setImage(trailingIcon, for: .highlighted)
            titleEdgeInsets.right = trailingIcon.size.width + 8
            imageEdgeInsets.right = -8
            self.semanticContentAttribute = .forceRightToLeft
        }
    }
    
    private func updateColorStyle() {
        switch colorStyle {
        case .mainGreen:
            switch style {
            case .primary:
                defaultBackgroundColor = DS.Colors.Button.defaultGreen
                defaultBorderColor = .clear
                defaultTitleColor = DS.Colors.Button.neutralsWhite
                
                highlightedBackgroundColor = DS.Colors.Button.highlightedGreen
                highlightedBorderColor = .clear
                highlightedTitleColor = DS.Colors.Button.neutralsWhite
                
                disabledBackgroundColor = DS.Colors.Button.backgroundDisabled
                disabledBorderColor = .clear
                disabledTitleColor = DS.Colors.Button.neutralsWhite

            case .secondary:
                defaultBackgroundColor = DS.Colors.Button.neutralsWhite
                defaultBorderColor = DS.Colors.Button.defaultGreen
                defaultTitleColor = DS.Colors.Button.defaultGreen
                
                highlightedBackgroundColor = DS.Colors.Button.backgroundGreen
                highlightedBorderColor = DS.Colors.Button.highlightedGreen
                highlightedTitleColor = DS.Colors.Button.highlightedGreen
                
                disabledBackgroundColor = DS.Colors.Button.neutralsWhite
                disabledBorderColor = DS.Colors.Button.backgroundDisabled
                disabledTitleColor = DS.Colors.Button.backgroundDisabled
            }
            
        case .mainBlue:
            switch style {
            case .primary:
                defaultBackgroundColor = DS.Colors.Button.defaultBlue
                defaultBorderColor = .clear
                defaultTitleColor = .white
                
                highlightedBackgroundColor = DS.Colors.Button.highlightedBlue
                highlightedBorderColor = .clear
                highlightedTitleColor = .white
                
                disabledBackgroundColor = DS.Colors.Button.backgroundDisabled
                disabledBorderColor = .clear
                disabledTitleColor = DS.Colors.Button.neutralsWhite

            case .secondary:
                defaultBackgroundColor = .white
                defaultBorderColor = DS.Colors.Button.defaultBlue
                defaultTitleColor = DS.Colors.Button.defaultBlue
                
                highlightedBackgroundColor = DS.Colors.Button.backgroundBlue
                highlightedBorderColor = DS.Colors.Button.highlightedBlue
                highlightedTitleColor = DS.Colors.Button.highlightedBlue
                
                disabledBackgroundColor = DS.Colors.Button.neutralsWhite
                disabledBorderColor = DS.Colors.Button.backgroundDisabled
                disabledTitleColor = DS.Colors.Button.backgroundDisabled
            }
        }

        updateButtonStyle()
    }
}
