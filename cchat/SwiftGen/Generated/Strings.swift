// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// MARK: - Strings

internal enum Strings {

  internal enum App {
    /// cchat
    internal static let name = Strings.tr("loc", "App.Name")
  }

  internal enum Login {
    internal enum Button {
      /// Forgot password?
      internal static let forgot = Strings.tr("loc", "Login.Button.Forgot")
      /// Continue
      internal static let login = Strings.tr("loc", "Login.Button.Login")
    }
    internal enum TextField {
      /// E-mail
      internal static let email = Strings.tr("loc", "Login.TextField.Email")
    }
    internal enum Welcome {
      /// SIGN IN OR SIGN UP!
      internal static let message = Strings.tr("loc", "Login.Welcome.Message")
      /// Step in to chat with other people, meet some special person.
      internal static let subtitle = Strings.tr("loc", "Login.Welcome.Subtitle")
      /// Oh Hi, log in here
      internal static let title = Strings.tr("loc", "Login.Welcome.Title")
    }
  }

  internal enum Password {
    internal enum Button {
      /// Forgot password?
      internal static let forgot = Strings.tr("loc", "Password.Button.Forgot")
      /// Login
      internal static let login = Strings.tr("loc", "Password.Button.Login")
    }
    internal enum TextField {
      /// Password
      internal static let password = Strings.tr("loc", "Password.TextField.Password")
    }
    internal enum Welcome {
      /// WELCOME BACK!
      internal static let message = Strings.tr("loc", "Password.Welcome.Message")
      /// It looks like you have an account. Just log in.
      internal static let subtitle = Strings.tr("loc", "Password.Welcome.Subtitle")
      /// We have missed you!
      internal static let title = Strings.tr("loc", "Password.Welcome.Title")
    }
  }

  internal enum PasswordCreator {
    /// 
    internal static let message = Strings.tr("loc", "PasswordCreator.Message")
    /// 
    internal static let subtitle = Strings.tr("loc", "PasswordCreator.Subtitle")
    /// 
    internal static let title = Strings.tr("loc", "PasswordCreator.Title")
    internal enum Textfield {
      internal enum Placeholder {
        /// Password
        internal static let first = Strings.tr("loc", "PasswordCreator.Textfield.Placeholder.First")
        /// Repeat password
        internal static let second = Strings.tr("loc", "PasswordCreator.Textfield.Placeholder.Second")
      }
    }
  }

  internal enum Welcome {
    /// Sign Up
    internal static let loginButton = Strings.tr("loc", "Welcome.LoginButton")
    /// OR SIGN IN TO OUR SOCIETY
    internal static let registerButton = Strings.tr("loc", "Welcome.RegisterButton")
    /// Sign In, Register or Authorize here
    internal static let text = Strings.tr("loc", "Welcome.Text")
  }
}
// MARK: - Implementation Details

extension Strings {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    let format = Bundle.main.localizedString(forKey: key, value: nil, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

