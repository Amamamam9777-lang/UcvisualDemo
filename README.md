# UCVisualDemoKit — visual-only dynamic library source

This Swift Package exposes a dynamic library product named `UCVisualDemoKit` for an iOS app you own or are authorized to modify.

## Included
- `PurchaseBannerView.swift`: original supplied banner view, copied unchanged.
- `UCVisualDemoView.swift`: static UC demonstration list and banner preview action.
- `UCVisualDemoFactory.swift`: UIKit entry point returning a `UIHostingController`.

## Public entry point

The library exports Objective-C-visible class `UCVisualDemoFactory` with:

```swift
let controller = UCVisualDemoFactory.makeViewController()
```

Present `controller` from an app you own or control. The package is a visual demo only. It does not hook another app, intercept StoreKit, create purchases, modify transactions, alter receipts, or connect to PUBG Mobile internals.

## Build

Open this package in Xcode on macOS, select the `UCVisualDemoKit` scheme, and build for a generic iOS device. The product is a dynamic framework/library build product. A Linux environment cannot produce a signed iOS binary because the Apple iOS SDK and Xcode toolchain are required.

The displayed UC prices are illustrative text only.
