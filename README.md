
# BrandButton

[![iOS](https://github.com/alielsokary/BrandButton/actions/workflows/iOS.yml/badge.svg)](https://github.com/alielsokary/BrandButton/actions/workflows/iOS.yml)

  

I aimed for simplicity and the ease of use across ****UIKit**** and ****SwiftUI****, at the same time I wanted to make the button fully customizable. I also was targeting the button configurations to include and match the properties and tokens of the ****Design System**** in Figma.

  

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
## Feature List
 - [x] Easy to customize **Variant**, **Style**, and **Size** in a few lines of code.
 - [x] Available animation for state transition.
 - [x] Easy to customize and use in **UIKit** and **SwiftUI**.



## Configurations

**Variant**
```Swift
/// The variant of the button. 
/// It's default value is `primary`.
var variant: Variant = .primary
```

**Style**
```Swift
/// The style of the button. 
/// It's default value is `mainGreen`.
var  style: Style = .mainGreen
```
**Size**
```Swift
/// The size of the button.
/// It's default value is `regular` and could be `medium`
var  size: ButtonSize = .regular
```
**FullWidth**
```Swift
/// Bool value Indicates whether the button should have full width.
/// It's default value is `false`. When`ture` the button should fill the screen bounds.
var  fullWidth: Bool = false
```
**LeadingIcon**
```Swift
/// An optional UIImage.
/// When set the button should have a visible `imagePlacement` direction to `. leading`.
var  leadingIcon: UIImage?
```
**TrailingIcon**
```Swift
/// An optional UIImage.
/// When set the button should have a visible `imagePlacement` direction to `. trailing`.
var  trailingIcon: UIImage?
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
