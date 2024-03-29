//
//  BrandButtonView.swift
//  BrandButton
//
//  Created by Ali Elsokary on 03/02/2024.
//

import SwiftUI

struct BrandButtonView: UIViewRepresentable {
    var title: String
    var variant: BrandButton.Variant = .primary
    var style: BrandButton.Style = .mainGreen
    var size: BrandButton.Size = .regular
    var fullWidth: Bool? = false
    var leadingIcon: UIImage? = nil
    var trailingIcon: UIImage? = nil
    var action: (() -> Void)?
    
    init(title: String, action: @escaping () -> Void, variant: BrandButton.Variant, style: BrandButton.Style, size: BrandButton.Size, fullWidth: Bool? = false, leadingIcon: UIImage? = nil, trailingIcon: UIImage? = nil) {
        self.title = title
        self.action = action
        self.variant = variant
        self.style = style
        self.size = size
        self.fullWidth = fullWidth
        self.leadingIcon = leadingIcon
        self.trailingIcon = trailingIcon
    }
    
    func makeUIView(context: Context) -> BrandButton {
        let button = BrandButton()
        
        button.setTitle(title, for: .normal)
        button.variant = variant
        button.style = style
        button.size = size
        button.fullWidth = fullWidth!
        button.leadingIcon = leadingIcon
        button.trailingIcon = trailingIcon
        button.setContentHuggingPriority(.required, for: .horizontal)
        button.setContentHuggingPriority(.required, for: .vertical)
        button.addTarget(context.coordinator, action: #selector(Coordinator.buttonAction), for: .touchUpInside)

        return button
    }

    func updateUIView(_ button: BrandButton, context: Context) {
        button.titleLabel?.font = DS.Fonts.subhead2
        let configuration = BrandButton.Configuration.plain()
        button.configuration = configuration
    }
    
    class Coordinator: NSObject {
        var parent: BrandButtonView
        
        init(parent: BrandButtonView) {
            self.parent = parent
        }
        
        @objc func buttonAction() {
            parent.action?()
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }
}
