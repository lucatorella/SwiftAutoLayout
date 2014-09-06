SwiftAutolayout
===============

SwiftAutolayout is a UIView extension to easily create autolayout.


**Initialization**

Bored of writing code like this?

```
let myView = UIView()
myView.setTranslatesAutoresizingMaskIntoConstraints(false)
```

just use this factory method

```
let myView = UIView.newAutoLayoutView()
```

**Centering**

Bored of long code just to center a view in its superview? Just use this convenience method:

```
superview.addConstraints(myView.centerInSuperview())
```

**Pin edges**

Do you want to pin the edges of a view to the edges of the superview?

```
superview.addConstraints(myView.pinEdgesToSuperview())
```

**Sizes**

Do you want to set constraints for width and height?

```
superview.addConstraints(myView.constraintSize(size))
```

Do you want to match the width of a view to the width of another view?

```
superview.addConstraints(myView.matchDimension(.Width, otherView: myOtherView))
```

The complete API
---

```
// MARK: Factory Methods
class func newAutoLayoutView() -> UIView

// MARK: Centering
func centerInSuperview() -> [NSLayoutConstraint]
func centerInSuperview(axis: NSLayoutAttribute) -> NSLayoutConstraint

// MARK: Pin Edges to Superview
func pinEdgesToSuperview() -> [NSLayoutConstraint]
func pinEdgesToSuperview(distance: CGFloat) -> [NSLayoutConstraint]

// MARK: Same dimension
func matchDimension(dimension: NSLayoutAttribute, otherView: UIView) -> NSLayoutConstraint
func matchHeightAndWidth() -> NSLayoutConstraint

// MARK: Set size
func constraintSize(size: CGSize) -> [NSLayoutConstraint]
```




