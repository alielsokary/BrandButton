
# BrandButton

[![iOS](https://github.com/alielsokary/BrandButton/actions/workflows/iOS.yml/badge.svg)](https://github.com/alielsokary/BrandButton/actions/workflows/iOS.yml)

I aimed for simplicity and ease of use across **UIKit** and **SwiftUI**. I also was targeting the button configurations to include and match the properties and tokens of the **Design System** in Figma.

### Design System
Included is a compact design system that lists Color Tokens and the default button font. 
The primary benefit of the design system lies in its ability to customize colors and fonts in a centralized place.
```Swift
    struct DS {
        enum Colors {
            enum Button {
                static let defaultGreen = UIColor(named: "trvGreen700")!
                static let highlightedGreen = UIColor(named: "trvGreen900")!
                static let backgroundGreen = UIColor(named: "trvGreen100")!
                ...
    }
```

## Usage

#### UIKit

```Swift
    let customButton = BrandButton()
    customButton.variant = .primary
    customButton.style = .mainGreen
    customButton.size = .regular
    customButton.setTitle("Primary Default", for: .normal)
    view.addSubview(customButton)
```

#### SwiftUI

```Swift
    BrandButtonView(title: "Primary Default",
                    action: { },
                    variant: .primary,
                    style: .mainGreen,
                    size: .regular)
```
