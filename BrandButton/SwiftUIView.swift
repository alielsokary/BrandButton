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
            BrandButtonView(title: "Primary Button", variant: .primary, style: .mainGreen)
            BrandButtonView(title: "Secondary Button", variant: .secondary, style: .mainBlue)
            BrandButtonView(title: "Primary Button", style: .mainBlue)
            BrandButtonView(title: "Primary Button", variant: .secondary, style: .mainGreen, fullWidth: true)
            BrandButtonView(title: "Primary Button", style: .mainBlue, leadingIcon: UIImage(named: "primary-btn-icon"))
        }
    }
}

#Preview {
    SwiftUIView()
}
