//
//  UINavigationBar+MixedBarStyle.swift
//  Pods
//
//  Created by Draveness on 7/11/16.
//
//

import Foundation

public extension UINavigationBar {
    private struct AssociatedKeys {
        static var mixedBarStyleKey = "mixedBarStyleKey"
    }

    public var mixedBarStyle: MixedBarStyle? {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.mixedBarStyleKey) as? MixedBarStyle
        }
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.mixedBarStyleKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(_updateBarStyle), name: NightNightThemeChangeNotification, object: nil)
        }
    }

    func _updateBarStyle() {
        if let mixedBarStyle = mixedBarStyle {
            barStyle = mixedBarStyle.unfold()
        }
    }

}