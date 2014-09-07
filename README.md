SwiftAutolayout
===============

SwiftAutolayout is a UIView extension to easily create autolayout.
Autolayout is a powerful tool, but it's often very verbose. This extension try to simplify some of the common uses of autolayout with some handy methods.

**Initialization**

There's a factory method to create a `UIView` with `setTranslatesAutoresizingMaskIntoConstraints` already set to `false`.

```
let myView = UIView.newAutoLayoutView()
```

**Centering**

With SwiftAutolayout it's easy to center a view in its superview.

```
myView.centerInSuperview()
```

**Pin edges**

With SwiftAutolayout it's easy to pin view edges to its superview.

```
myView.pinEdgesToSuperview()
myView.pinEdgesToSuperview(20)
```

**Sizes**

With SwiftAutolayout it's easy to create width and height constraints

```
let size = CGSize(10,10)
myView.constraintSize(size)
```

With SwiftAutolayout it's easy to match the width of a view to the width of another view?

```
myView.matchDimension(.Width, otherView: myOtherView)
```

The complete API
---

```
extension UIView {
  // MARK: Factory Methods
  class func newAutoLayoutView() -> UIView

  // MARK: Centering
  func centerInSuperview(autoAdd: Bool = true) -> [NSLayoutConstraint]
  func centerInSuperview(axis: NSLayoutAttribute, autoAdd: Bool = true) -> NSLayoutConstraint

  // MARK: Pin Edges to Superview
  func pinEdgesToSuperview(autoAdd: Bool = true) -> [NSLayoutConstraint]
  func pinEdgesToSuperview(distance: CGFloat, autoAdd: Bool = true) -> [NSLayoutConstraint]

  // MARK: Same dimension
  func matchDimension(dimension: NSLayoutAttribute, toItem view: UIView, autoAdd: Bool = true) -> NSLayoutConstraint
  func matchHeightAndWidth(autoAdd: Bool = true) -> NSLayoutConstraint

  // MARK: Set size
  func constraintSize(size: CGSize, autoAdd: Bool = true) -> [NSLayoutConstraint]
}

extension NSLayoutConstraint {
  convenience init(item view1: AnyObject, attribute attr: NSLayoutAttribute, relatedBy relation: NSLayoutRelation = .Equal, toItem view2: AnyObject?, multiplier: CGFloat = 1, constant c: CGFloat = 0)
  class func constraintsWithVisualFormat(format: String, metrics: [NSObject : AnyObject]?, views: [NSObject : AnyObject]) -> [AnyObject]
  class func constraintsWithVisualFormat(format: String, options opts: NSLayoutFormatOptions, views: [NSObject : AnyObject]) -> [AnyObject]
  class func constraintsWithVisualFormat(format: String, views: [NSObject : AnyObject]) -> [AnyObject]
}
```




