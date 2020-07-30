import SwiftUI

struct IntroductionView: View {
    
@EnvironmentObject var settings: UserSettings
    
             @Environment(\.presentationMode) private var presentationMode
    
    
    var body: some View {
            VStack(alignment: .center) {
                
               Spacer()
                
                
                TitleView()
                    .padding(.top)

                InformationContainerView()
        

                Spacer(minLength: 30)

                    Button(action: {
                        self.settings.welcomeNotDone = false
                        self.presentationMode.wrappedValue.dismiss()
                                })
                        {
                            Text("Let's go!")
                            .customButton()
                         }
                    
                Spacer()
                }
                .padding(.horizontal)
            .padding(.bottom)
    }
}
