
# BrandButton

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

---
#### Note
Using the new Button Configuration introduced in iOS 15 doesn't work properly in `UIViewRepresentable` so I used the deprecated `titleEdgeInsets` and `imageEdgeInsets` to properly add padding to the leading and trailing icons in the SwiftUI Button.
