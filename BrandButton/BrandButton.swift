//
//  BrandButton.swift
//  BrandButton
//
//  Created by Ali Elsokary on 30/01/2024.
//

import UIKit

class BrandButton: UIButton {
    
    enum Variant {
        case primary
        case secondary
    }
    
    enum Style {
        case mainGreen
        case mainBlue
    }
    
    enum ButtonSize {
        case regular
        case medium
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
    
    override var intrinsicContentSize: CGSize {
        if fullWidth {
            frame.size.width = UIScreen.main.bounds.width
            return CGSize(width: max(super.intrinsicContentSize.width, UIScreen.main.bounds.width),
                          height: max(super.intrinsicContentSize.height, 44))
        }
        switch size {
        case .regular:
            return CGSize(width: max(super.intrinsicContentSize.width, 139),
                          height: max(super.intrinsicContentSize.height, 44))
        case .medium:
            return CGSize(width: max(super.intrinsicContentSize.width, 175),
                          height: max(super.intrinsicContentSize.height, 44))
        }
    }
    
    var variant: Variant = .primary {
        didSet {
            updateButtonStyle()
        }
    }
    
    var style: Style = .mainGreen {
        didSet {
            updateColorStyle()
        }
    }
    
    var size: ButtonSize = .regular
    
    var fullWidth: Bool = false
    
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
        configuration?.contentInsets = NSDirectionalEdgeInsets(
            top: 13,
            leading: 16,
            bottom: 13,
            trailing: 16
        )
        
        configuration?.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { container in
            var container = container
            container.font = DS.Fonts.subhead2
            return container
        }
        
        layer.cornerRadius = 4
        layer.borderWidth = 1
        clipsToBounds = true
        
        updateButtonStyle()
    }
    
    private func updateButtonStyle() {
        switch (variant, isEnabled, isHighlighted) {
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
        setTitleColor(titleColor, for: .highlighted)
        setTitleColor(titleColor, for: .disabled)
        
        if let leadingIcon = leadingIcon {
            configuration?.image = leadingIcon
            configuration?.imagePadding = 12
            self.semanticContentAttribute = .forceLeftToRight
        }
        
        if let trailingIcon = trailingIcon {
            configuration?.image = trailingIcon
            configuration?.imagePadding = 12
            self.semanticContentAttribute = .forceRightToLeft
        }
    }
    
    private func updateColorStyle() {
        switch style {
        case .mainGreen:
            switch variant {
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
            switch variant {
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
