import SwiftUI
import UIKit

/// Public entry point for presenting the visual-only UC demo in an app you own.
/// This factory does not access StoreKit, transactions, receipts, or game internals.
@objc(UCVisualDemoFactory)
public final class UCVisualDemoFactory: NSObject {
    @objc public static func makeViewController() -> UIViewController {
        UIHostingController(
            rootView: UCVisualDemoView()
                .preferredColorScheme(.dark)
        )
    }
}
