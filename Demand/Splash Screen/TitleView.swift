import SwiftUI

struct TitleView: View {
    var body: some View {
        VStack {
            Image(systemName: "bubble.left.and.bubble.right.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, alignment: .center)
                .accessibility(hidden: true)
                .foregroundColor(.mainColor)

            Text("Welcome to")
                .customTitleText()

            Text("Justice Now")
                .customTitleText()
                .foregroundColor(.mainColor)
        }
    }
}
