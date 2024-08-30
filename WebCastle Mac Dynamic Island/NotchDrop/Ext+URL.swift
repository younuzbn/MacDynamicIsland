//
//  ContentView.swift
//  Webcastle
//
//  Created by Younuz Bin Noushad on 30/08/24.
//
//  Licensed under the MIT License. See the LICENSE file in the project root for full license information.
//

import Cocoa
import Foundation
import QuickLook

extension URL {
    func snapshotPreview() -> NSImage {
        if let preview = QLThumbnailImageCreate(
            kCFAllocatorDefault,
            self as CFURL,
            CGSize(width: 128, height: 128),
            nil
        )?.takeRetainedValue() {
            return NSImage(cgImage: preview, size: .zero)
        }
        return NSWorkspace.shared.icon(forFile: path)
    }
}
