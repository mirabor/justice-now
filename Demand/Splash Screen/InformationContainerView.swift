import SwiftUI

struct InformationContainerView: View {
    var body: some View {
        VStack(alignment: .leading) {
            InformationDetailView(title: "Contact", subTitle: "Make your voice heard through your elected officials", imageName: "paperplane")

            InformationDetailView(title: "Sign", subTitle: "Join the movement for change by signing petitions", imageName: "checkmark.circle")

            InformationDetailView(title: "Donate", subTitle: "Give aid to those in need", imageName: "dollarsign.circle")
            
            InformationDetailView(title: "Support", subTitle: "Find black-owned businesses near you", imageName: "cart")
        }
        .padding(.horizontal)
    }
}
