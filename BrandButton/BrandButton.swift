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
            updateButtonState()
        }
    }
    
    override var isHighlighted: Bool {
        didSet {
            updateButtonState()
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
    
    // MARK: - Properties
    
    var variant: Variant = .primary {
        didSet {
            updateButtonState()
        }
    }
    
    var style: Style = .mainGreen {
        didSet {
            updateButtonState()
        }
    }
    
    var size: ButtonSize = .regular
    
    var fullWidth: Bool = false
    
    var leadingIcon: UIImage? {
        didSet {
            updateButtonState()
        }
    }
    
    var trailingIcon: UIImage? {
        didSet {
            updateButtonState()
        }
    }
    
    // MARK: Properties for default state
    private var defaultBackgroundColor: UIColor {
        switch style {
        case .mainGreen:
            return variant == .primary ? DS.Colors.Button.defaultGreen : DS.Colors.Button.neutralsWhite
        case .mainBlue:
            return variant == .primary ? DS.Colors.Button.defaultBlue : DS.Colors.Button.neutralsWhite
        }
    }
    
    private var defaultBorderColor: UIColor {
        switch style {
        case .mainGreen:
            return variant == .primary ? .clear : DS.Colors.Button.defaultGreen
        case .mainBlue:
            return variant == .primary ? .clear : DS.Colors.Button.defaultBlue
        }
    }
    
    private var defaultTitleColor: UIColor {
        switch style {
        case .mainGreen:
            return variant == .primary ? DS.Colors.Button.neutralsWhite : DS.Colors.Button.defaultGreen
        case .mainBlue:
            return variant == .primary ? .white : DS.Colors.Button.defaultBlue
        }
    }
    
    // MARK: Properties for highlighted state
    private var highlightedBackgroundColor: UIColor {
        switch style {
        case .mainGreen:
            return variant == .primary ? DS.Colors.Button.highlightedGreen : DS.Colors.Button.backgroundGreen
        case .mainBlue:
            return variant == .primary ? DS.Colors.Button.highlightedBlue : DS.Colors.Button.backgroundBlue
        }
    }
    
    private var highlightedBorderColor: UIColor {
        switch style {
        case .mainGreen:
            return variant == .primary ? .clear : DS.Colors.Button.highlightedGreen
        case .mainBlue:
            return variant == .primary ? .clear : DS.Colors.Button.highlightedBlue
        }
    }
    
    private var highlightedTitleColor: UIColor {
        switch style {
        case .mainGreen:
            return variant == .primary ? DS.Colors.Button.neutralsWhite : DS.Colors.Button.highlightedGreen
        case .mainBlue:
            return variant == .primary ? .white : DS.Colors.Button.highlightedBlue
        }
    }
    
    // MARK: Properties for disabled state
    private var disabledBackgroundColor: UIColor {
        switch style {
        case .mainGreen, .mainBlue:
            return variant == .primary ? DS.Colors.Button.backgroundDisabled : DS.Colors.Button.neutralsWhite
        }
    }
    
    private var disabledBorderColor: UIColor {
        switch style {
        case .mainGreen, .mainBlue:
            return variant == .primary ? .clear : DS.Colors.Button.backgroundDisabled
        }
    }
    
    private var disabledTitleColor: UIColor {
        switch style {
        case .mainGreen, .mainBlue:
            return variant == .primary ? DS.Colors.Button.neutralsWhite : DS.Colors.Button.backgroundDisabled
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
        
        updateButtonState(withAnimation: false)
    }
    
    private func updateButtonState(withAnimation animation: Bool = true) {
        if animation {
            UIView.animate(withDuration: 0.2) { [weak self] in
                guard let self = self else { return }
                setButtonState()
            }
        }
    }
    
    private func setButtonState() {
        switch (self.variant, self.isEnabled, self.isHighlighted) {
        case (.primary, true, false):
            self.setButtonWith(backgroundColor: self.defaultBackgroundColor,
                            borderColor: self.defaultBorderColor,
                            titleColor: self.defaultTitleColor)
        case (.primary, true, true):
            self.setButtonWith(backgroundColor: self.highlightedBackgroundColor,
                            borderColor: self.highlightedBorderColor,
                            titleColor: self.highlightedTitleColor)
        case (.primary, false, _):
            self.setButtonWith(backgroundColor: self.disabledBackgroundColor,
                            borderColor: self.disabledBorderColor,
                            titleColor: self.disabledTitleColor)
            
        case (.secondary, true, false):
            self.setButtonWith(backgroundColor: self.defaultBackgroundColor,
                            borderColor: self.defaultBorderColor,
                            titleColor: self.defaultTitleColor)
        case (.secondary, true, true):
            self.setButtonWith(backgroundColor: self.highlightedBackgroundColor,
                            borderColor: self.highlightedBorderColor,
                            titleColor: self.highlightedTitleColor)
        case (.secondary, false, _):
            self.setButtonWith(backgroundColor: self.disabledBackgroundColor,
                            borderColor: self.disabledBorderColor,
                            titleColor: self.disabledTitleColor)
        }
    }
    
    private func setButtonWith(backgroundColor: UIColor, borderColor: UIColor, titleColor: UIColor) {
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
}
