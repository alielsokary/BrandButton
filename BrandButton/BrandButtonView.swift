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
    var size: BrandButton.ButtonSize = .regular
    var fullWidth: Bool = false
    var leadingIcon: UIImage? = nil
    let trailingIcon: UIImage? = nil
    
    func makeUIView(context: Context) -> BrandButton {
        let button = BrandButton()
        button.setTitle(title, for: .normal)
        button.variant = variant
        button.style = style
        button.size = size
        button.fullWidth = fullWidth
        button.leadingIcon = leadingIcon
        button.trailingIcon = trailingIcon
        button.setContentHuggingPriority(.required, for: .horizontal)
        button.setContentHuggingPriority(.required, for: .vertical)
        button.addTarget(context.coordinator, action: #selector(Coordinator.buttonTapped), for: .touchUpInside)
        return button
    }

    func updateUIView(_ uiView: BrandButton, context: Context) {
        uiView.titleLabel?.font = DS.Fonts.subhead2
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject {
        var parent: BrandButtonView
        
        init(_ parent: BrandButtonView) {
            self.parent = parent
        }
        
        @objc func buttonTapped() {
            
        }
    }
    
}
