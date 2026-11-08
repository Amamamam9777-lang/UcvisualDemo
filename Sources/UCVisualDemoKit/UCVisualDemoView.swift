import SwiftUI

@available(iOS 15, *)
struct UCVisualDemoView: View {
    @State private var showPurchasePreview = false

    private let packs: [(amount: String, price: String)] = [
        ("60 UC", "99 ₽"),
        ("325 UC", "449 ₽"),
        ("660 UC", "899 ₽"),
        ("1 800 UC", "2 299 ₽"),
        ("3 850 UC", "4 599 ₽"),
        ("8 100 UC", "8 999 ₽")
    ]

    var body: some View {
        ZStack {
            LinearGradient(
                colors: [Color(red: 0.08, green: 0.10, blue: 0.14), .black],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()

            ScrollView {
                VStack(alignment: .leading, spacing: 18) {
                    HStack {
                        VStack(alignment: .leading, spacing: 4) {
                            Text("UC STORE")
                                .font(.system(size: 27, weight: .bold, design: .rounded))
                            Text("Визуальный макет — без покупок")
                                .font(.system(size: 13))
                                .foregroundStyle(.white.opacity(0.58))
                        }
                        Spacer()
                        Image(systemName: "gamecontroller.fill")
                            .font(.system(size: 27))
                            .foregroundStyle(.white.opacity(0.85))
                    }
                    .padding(.bottom, 8)

                    ForEach(packs, id: \.amount) { pack in
                        HStack(spacing: 14) {
                            Image(systemName: "circle.hexagongrid.fill")
                                .font(.system(size: 30))
                                .foregroundStyle(Color.yellow)
                                .frame(width: 54, height: 54)
                                .background(.white.opacity(0.08), in: RoundedRectangle(cornerRadius: 14))

                            Text(pack.amount)
                                .font(.system(size: 17, weight: .semibold))
                            Spacer()
                            Text(pack.price)
                                .font(.system(size: 17, weight: .bold, design: .rounded))
                                .foregroundStyle(.white)
                        }
                        .padding(14)
                        .background(.white.opacity(0.075), in: RoundedRectangle(cornerRadius: 18))
                        .overlay(RoundedRectangle(cornerRadius: 18).stroke(.white.opacity(0.09), lineWidth: 1))
                    }

                    Button {
                        withAnimation(.easeInOut(duration: 0.25)) {
                            showPurchasePreview = true
                        }
                    } label: {
                        Text("Открыть превью баннера")
                            .font(.system(size: 16, weight: .semibold))
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 15)
                            .background(Color.blue, in: RoundedRectangle(cornerRadius: 15))
                    }
                    .buttonStyle(.plain)
                    .padding(.top, 6)

                    Text("Цены демонстрационные. Кнопки не запускают StoreKit, оплату или транзакции.")
                        .font(.system(size: 11))
                        .foregroundStyle(.white.opacity(0.48))
                        .multilineTextAlignment(.center)
                        .frame(maxWidth: .infinity)
                }
                .padding(20)
            }

            if showPurchasePreview {
                PurchaseBannerView(isShowing: $showPurchasePreview)
                    .transition(.opacity)
                    .zIndex(10)
            }
        }
    }
}
