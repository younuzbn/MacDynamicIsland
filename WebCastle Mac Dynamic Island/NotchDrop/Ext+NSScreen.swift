//
//  ContentView.swift
//  Webcastle
//
//  Created by Younuz Bin Noushad on 30/08/24.
//
//  Licensed under the MIT License. See the LICENSE file in the project root for full license information.
//

import Cocoa

extension NSScreen {
    var notchSize: CGSize {
        guard safeAreaInsets.top > 0 else { return .zero }
        let notchHeight = safeAreaInsets.top
        let fullWidth = frame.width
        let leftPadding = auxiliaryTopLeftArea?.width ?? 0
        let rightPadding = auxiliaryTopRightArea?.width ?? 0
        guard leftPadding > 0, rightPadding > 0 else { return .zero }
        let notchWidth = fullWidth - leftPadding - rightPadding
        return CGSize(width: notchWidth, height: notchHeight)
    }

    var isBuildinDisplay: Bool {
        let screenNumberKey = NSDeviceDescriptionKey(rawValue: "NSScreenNumber")
        guard let id = deviceDescription[screenNumberKey],
              let rid = (id as? NSNumber)?.uint32Value,
              CGDisplayIsBuiltin(rid) == 1
        else { return false }
        return true
    }

    static var buildin: NSScreen? {
        screens.first { $0.isBuildinDisplay }
    }
}
