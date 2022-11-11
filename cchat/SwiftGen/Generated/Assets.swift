// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import UIKit
import SwiftUI

// MARK: - Asset Catalogs
internal enum UIAsset {
  internal static let accentColor = ColorAsset(name: "AccentColor").uiColor
}
internal enum Asset {
  internal static let accentColor = ColorAsset(name: "AccentColor").color
}
// MARK: - Implementation Details
internal struct ColorAsset {
    internal private(set) var name: String

    internal var uiColor: UIColor {
        guard let result = UIColor(named: name) else {
            fatalError("Unable to load color asset named \(name).")
        }
        return result
    }

    internal var color: Color {
        return Color(name)
    }
}

internal struct ImageAsset {
    internal private(set) var name: String

    internal var uiImage: UIImage {
        guard let result = UIImage(named: name) else {
            fatalError("Unable to load image asset named \(name).")
        }
        return result
    }

    internal var image: Image {
        return Image(name)
    }
}
