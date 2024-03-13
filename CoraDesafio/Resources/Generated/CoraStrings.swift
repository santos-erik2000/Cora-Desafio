// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum CoraStrings {
  internal enum Fonts {
    /// Lato-Bold
    internal static let bold = CoraStrings.tr("Localizable", "Fonts.bold", fallback: "Lato-Bold")
    /// Lato-Regular
    internal static let regular = CoraStrings.tr("Localizable", "Fonts.regular", fallback: "Lato-Regular")
  }
  internal enum Icons {
    /// arrow.left
    internal static let arrowLeft = CoraStrings.tr("Localizable", "Icons.arrowLeft", fallback: "arrow.left")
    /// arrow.right
    internal static let arrowRight = CoraStrings.tr("Localizable", "Icons.arrowRight", fallback: "arrow.right")
    /// chevron.left
    internal static let chevronLeft = CoraStrings.tr("Localizable", "Icons.chevronLeft", fallback: "chevron.left")
  }
  internal enum Ola {
    /// Ola Mundo
    internal static let teste = CoraStrings.tr("Localizable", "Ola.teste", fallback: "Ola Mundo")
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension CoraStrings {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg..., fallback value: String) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: value, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
