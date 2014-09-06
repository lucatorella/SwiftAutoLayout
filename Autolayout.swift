//
//  Autolayout.swift
//  Swift+Autolayout
//
//  Created by Luca Torella on 04/09/2014.
//  Copyright (c) 2014 Luca Torella. All rights reserved.
//

import UIKit

extension UIView {

    // MARK: Factory & Initializer Methods

    class func newAutoLayoutView() -> UIView {
        let view: UIView = UIView();
        view.setTranslatesAutoresizingMaskIntoConstraints(false);
        return view;
    }

    convenience init(forAutoLayout: Bool) {
        self.init()
        self.setTranslatesAutoresizingMaskIntoConstraints(forAutoLayout)
    }

    // MARK: Centering

    func centerInSuperview() -> [NSLayoutConstraint] {
        return [centerInSuperview(.CenterX), centerInSuperview(.CenterY)]
    }

    func centerInSuperview(axis: NSLayoutAttribute) -> NSLayoutConstraint {
        let superview: UIView? = self.superview
        assert(superview != nil, "View's superview must not be nil")
        assert(axis == .CenterX || axis == .CenterY, "You can center a view horizontally or vertically, no other attribute is accepted")
        return NSLayoutConstraint(item: self, attribute: axis, relatedBy: .Equal, toItem: superview, attribute: axis, multiplier: 1, constant: 0)
    }

    // MARK: Pin Edges to Superview

    func pinEdgesToSuperview() -> [NSLayoutConstraint] {
        return pinEdgesToSuperview(0)
    }

    func pinEdgesToSuperview(distance: CGFloat) -> [NSLayoutConstraint] {
        let superview: UIView? = self.superview
        assert(superview != nil, "View's superview must not be nil")
        let left = NSLayoutConstraint(item: self, attribute: .Left, relatedBy: .Equal, toItem: superview, attribute: .Left, multiplier: 1, constant: distance)
        let right = NSLayoutConstraint(item: self, attribute: .Right, relatedBy: .Equal, toItem: superview, attribute: .Right, multiplier: 1, constant: distance)
        let top = NSLayoutConstraint(item: self, attribute: .Top, relatedBy: .Equal, toItem: superview, attribute: .Top, multiplier: 1, constant: distance)
        let bottom = NSLayoutConstraint(item: self, attribute: .Bottom, relatedBy: .Equal, toItem: superview, attribute: .Bottom, multiplier: 1, constant: distance)
        return [left, right, top, bottom]
    }

    // MARK: Same dimension

    func matchDimension(dimension: NSLayoutAttribute, otherView: UIView) -> NSLayoutConstraint {
        assert(dimension == .Width || dimension == .Height, "You can match the width or the height of a view, no other attribute is accepted")
        return NSLayoutConstraint(item: self, attribute: dimension, relatedBy: .Equal, toItem: otherView, attribute: dimension, multiplier: 1, constant: 0)
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
