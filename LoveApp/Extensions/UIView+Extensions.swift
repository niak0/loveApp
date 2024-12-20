import UIKit

struct AnchorConstraints {
    var top : NSLayoutConstraint?
    var bottom : NSLayoutConstraint?
    var trailing : NSLayoutConstraint?
    var leading : NSLayoutConstraint?
    var width : NSLayoutConstraint?
    var height : NSLayoutConstraint?
}
extension UIView {
    func anchor(top : NSLayoutYAxisAnchor?,
                bottom : NSLayoutYAxisAnchor?,
                leading : NSLayoutXAxisAnchor?,
                trailing : NSLayoutXAxisAnchor?,
                padding : UIEdgeInsets = .zero,
                boyut : CGSize = .zero) -> AnchorConstraints {
        
            translatesAutoresizingMaskIntoConstraints = false
        var aConstraint = AnchorConstraints()
        
        if let top = top {
            aConstraint.top = topAnchor.constraint(equalTo: top, constant: padding.top)
        }
        if let bottom = bottom {
            aConstraint.bottom = bottomAnchor.constraint(equalTo: bottom, constant: -padding.bottom)
        }
        if let leading = leading {
            aConstraint.leading = leadingAnchor.constraint(equalTo: leading, constant: padding.left)
        }
        if let trailing = trailing {
            aConstraint.trailing = trailingAnchor.constraint(equalTo: trailing, constant: -padding.right)
        }
        if boyut.width != 0 {
            aConstraint.width = widthAnchor.constraint(equalToConstant: boyut.width)
        }
        if boyut.height != 0 {
            aConstraint.height = heightAnchor.constraint(equalToConstant: boyut.height)
        }
        [aConstraint.top,aConstraint.bottom,aConstraint.leading,aConstraint.trailing,aConstraint.width,aConstraint.height].forEach {$0?.isActive = true}
        
        return aConstraint
    }
    
    func fullSuperView(padding: UIEdgeInsets = .zero) {
        translatesAutoresizingMaskIntoConstraints = false
        
        if let sTop = superview?.topAnchor {
            topAnchor.constraint(equalTo: sTop, constant: padding.top).isActive = true
        }
        if let sBottom = superview?.bottomAnchor {
            bottomAnchor.constraint(equalTo: sBottom, constant: -padding.bottom).isActive = true
        }
        if let sLeading = superview?.leadingAnchor {
            leadingAnchor.constraint(equalTo: sLeading, constant: padding.left).isActive = true
        }
        if let sTrailing = superview?.trailingAnchor {
            trailingAnchor.constraint(equalTo: sTrailing, constant: -padding.right).isActive = true
        }
    }
}

