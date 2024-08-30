//
//  ContentView.swift
//  Webcastle
//
//  Created by Younuz Bin Noushad on 30/08/24.
//
//  Licensed under the MIT License. See the LICENSE file in the project root for full license information.
//

import Cocoa

extension NSImage {
    var pngRepresentation: Data {
        guard let cgImage = cgImage(forProposedRect: nil, context: nil, hints: nil) else {
            return .init()
        }
        let imageRep = NSBitmapImageRep(cgImage: cgImage)
        imageRep.size = size
        return imageRep.representation(using: .png, properties: [:]) ?? .init()
    }
}
