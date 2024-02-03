//
//  SwiftUIView.swift
//  BrandButton
//
//  Created by Ali Elsokary on 03/02/2024.
//

import SwiftUI

struct SwiftUIView: View {
    var body: some View {
        VStack {
            BrandButtonView(title: "Primary Default", action: { }, variant: .primary, style: .mainGreen, size: .regular)
            BrandButtonView(title: "Secondary Default", action: {
            }, variant: .secondary, style: .mainBlue, size: .regular)
            BrandButtonView(title: "Secondary Default", action: {
            }, variant: .secondary, style: .mainGreen, size: .regular, fullWidth: true)
            BrandButtonView(title: "Primary Default", action: {
            }, variant: .primary, style: .mainBlue, size: .medium, leadingIcon: UIImage(named: "primary-btn-icon"))
        }
    }
}

#Preview {
    SwiftUIView()
}
