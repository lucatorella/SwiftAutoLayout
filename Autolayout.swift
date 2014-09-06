//
//  Autolayout.swift
//  Swift+Autolayout
//
//  Created by Luca Torella on 04/09/2014.
//  Copyright (c) 2014 Luca Torella. All rights reserved.
//

import UIKit

extension UIView {

    // MARK: Factory Methods

    class func newAutoLayoutView() -> UIView {
        let view: UIView = UIView();
        view.setTranslatesAutoresizingMaskIntoConstraints(false);
        return view;
    }

    // MARK: Centering

    func centerInSuperview() -> [NSLayoutConstraint] {
        return [centerInSuperview(.CenterX), centerInSuperview(.CenterY)]
    }

    func centerInSuperview(axis: NSLayoutAttribute) -> NSLayoutConstraint {
        let superview: UIView? = self.superview
        assert(superview != nil, "View's superview must not be nil")
        assert(axis == .CenterX || axis == .CenterY, "You can center a view horizontally or vertically, no other attribute is accepted")
        return NSLayoutConstraint(item: self, attribute: axis, toItem: superview)
    }

    // MARK: Pin Edges to Superview

    func pinEdgesToSuperview() -> [NSLayoutConstraint] {
        return pinEdgesToSuperview(0)
    }

    func pinEdgesToSuperview(distance: CGFloat) -> [NSLayoutConstraint] {
        let superview: UIView? = self.superview
        assert(superview != nil, "View's superview must not be nil")
        let left = NSLayoutConstraint(item: self, attribute: .Left, toItem: superview, constant: distance)
        let right = NSLayoutConstraint(item: self, attribute: .Right, toItem: superview, constant: distance)
        let top = NSLayoutConstraint(item: self, attribute: .Top, toItem: superview, constant: distance)
        let bottom = NSLayoutConstraint(item: self, attribute: .Bottom, toItem: superview, constant: distance)
        return [left, right, top, bottom]
    }

    // MARK: Same dimension

    func matchDimension(dimension: NSLayoutAttribute, toItem view: UIView) -> NSLayoutConstraint {
        assert(dimension == .Width || dimension == .Height, "You can match the width or the height of a view, no other attribute is accepted")
        return NSLayoutConstraint(item: self, attribute: dimension, toItem: view)
    }

    func matchHeightAndWidth() -> NSLayoutConstraint {
        return NSLayoutConstraint(item: self, attribute: .Width, relatedBy: .Equal, toItem: self, attribute: .Height, multiplier: 1, constant: 0)
    }

    // MARK: Set size

    func constraintSize(size: CGSize) -> [NSLayoutConstraint] {
        let width = NSLayoutConstraint(item: self, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1, constant: size.width)
        let height = NSLayoutConstraint(item: self, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1, constant: size.height)
        return [width, height]
    }
}

extension NSLayoutConstraint {

    // same attribute, relation = .Equal, multiplier = 1, constant = 0
    convenience init(item view1: AnyObject, attribute attr: NSLayoutAttribute, relatedBy relation: NSLayoutRelation = .Equal, toItem view2: AnyObject?, multiplier: CGFloat = 1, constant c: CGFloat = 0) {
        self.init(item: view1, attribute: attr, relatedBy: relation, toItem: view2, attribute: attr, multiplier: multiplier, constant: c)
    }

    class func constraintsWithVisualFormat(format: String, metrics: [NSObject : AnyObject]?, views: [NSObject : AnyObject]) -> [AnyObject] {
        return NSLayoutConstraint.constraintsWithVisualFormat(format, options: NSLayoutFormatOptions(0), metrics: metrics, views: views)
    }

    class func constraintsWithVisualFormat(format: String, options opts: NSLayoutFormatOptions, views: [NSObject : AnyObject]) -> [AnyObject] {
        return NSLayoutConstraint.constraintsWithVisualFormat(format, options: opts, views: views)
    }

    class func constraintsWithVisualFormat(format: String, views: [NSObject : AnyObject]) -> [AnyObject] {
        return NSLayoutConstraint.constraintsWithVisualFormat(format, options: NSLayoutFormatOptions(0), metrics: nil, views: views)
    }
}
