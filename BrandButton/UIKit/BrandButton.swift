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
    
    enum Size {
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
    
    override func updateConfiguration() {        
        configuration?.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { container in
            var container = container
            container.font = DS.Fonts.subhead2
            return container
        }
        
        if let leadingIcon = leadingIcon {
            configuration?.image = leadingIcon
            configuration?.imagePadding = 12
            configuration?.imagePlacement = .leading
        }
        
        if let trailingIcon = trailingIcon {
            configuration?.image = trailingIcon
            configuration?.imagePadding = 12
            configuration?.imagePlacement = .trailing
        }
        
    }
    
    // MARK: - Properties
    
    /// The variant of the button.
    /// It determines the visual style and appearance of the button.
    /// Default value is `primary`.
    var variant: Variant = .primary {
        didSet {
            updateButtonState()
        }
    }
    
    /// The style of the button.
    /// It determines the color style of the button
    /// Default value is `mainGreen`.
    var style: Style = .mainGreen {
        didSet {
            updateButtonState()
        }
    }
    
    /// The size of the button.
    /// Default value is `regular` and could be `medium`
    var size: Size = .regular
    
    /// Bool value Indicates whether the button should have full width.
    /// Default value is `false`. When `ture` the button should fill the screen bounds.
    var fullWidth: Bool = false
    
    /// An optional UIImage.
    /// When set the button should have a visible image with `imagePlacement` direction to `leading`.
    var leadingIcon: UIImage? {
        didSet {
            updateButtonState()
        }
    }
    
    /// An optional UIImage.
    /// When set the button should have a visible image with `imagePlacement` direction to `trailing`.
    var trailingIcon: UIImage? {
        didSet {
            updateButtonState()
        }
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
            return variant == .primary ? DS.Colors.Button.neutralsWhite : DS.Colors.Button.defaultBlue
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
            return variant == .primary ? DS.Colors.Button.neutralsWhite : DS.Colors.Button.highlightedBlue
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
        setTitleColor(DS.Colors.Button.neutralsWhite, for: .normal)
        configuration?.contentInsets = NSDirectionalEdgeInsets(
            top: 13,
            leading: 16,
            bottom: 13,
            trailing: 16
        )
        
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
    }
}
