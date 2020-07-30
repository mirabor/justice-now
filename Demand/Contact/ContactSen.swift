//
//  ContactSen.swift
//  Demand
//
//  Created by Mira Yu on 6/10/20.
//  Copyright © 2020 Mira Yu. All rights reserved.
//

import SwiftUI
import StoreKit

struct ContactSen: View {

    
@EnvironmentObject var settings: UserSettings
    @State private var checkSenator = false
    @State private var index = 0
    @State private var customSenators = ["", ""]
    @State private var index2 = 0
    @State private var senatorChoiceIndex = 0
    
        @Environment(\.colorScheme) var colorScheme
    
    
    let senatorstates = ["AK", "AL", "AR", "AZ", "CA", "CO", "CT", "DE", "FL", "GA", "HI", "IA", "ID", "IL", "IN", "KS", "KY", "LA", "MA", "MD", "ME", "MI", "MN", "MO", "MS", "MT", "NC", "ND", "NE", "NH", "NJ", "NM", "NV", "NY", "OH", "OK", "OR", "PA", "RI", "SC", "SD", "TN", "TX", "UT", "VA", "VT", "WA", "WI", "WV", "WY"]
    let senatorstatesnames = ["Alaska", "Alabama", "Arkansas", "Arizona", "California", "Colorado", "Connecticut", "Delaware", "Florida", "Georgia", "Hawaii", "Iowa", "Idaho", "Illinois", "Indiana", "Kansas", "Kentucky", "Louisiana", "Massachusetts", "Maryland", "Maine", "Michigan", "Minnesota", "Missouri", "Mississippi", "Montana", "North Carolina", "North Dakota", "Nebraska", "New Hampshire", "New Jersey", "New Mexico", "Nevada", "New York", "Ohio", "Oklahoma", "Oregon", "Pennsylvania", "Rhode Island", "South Carolina", "South Dakota", "Tennessee", "Texas", "Utah", "Virginia", "Vermont", "Washington", "Wisconsin", "West Virginia", "Wyoming"]
    let senator1 = ["Lisa Murkowski", "Richard C. Shelby", "John Boozman","Kyrsten Sinema", "Dianne Feinstein", "Michael F. Bennet", "Richard Blumenthal", "Tom Carper", "Marco Rubio", "Johnny Isakson", "Mazie Hirono", "Chuck Grassley", "Mike Crapo", "Dick Durbin", "Todd Young", "Pat Roberts", "Mitch McConnell", "Bill Cassidy", "Elizabeth Warren", "Benjamin L. Cardin", "Susan Collins", "Debbie Stabenow", "Amy Klobuchar", "Roy Blunt", "Roger Wicker", "Jon Tester", "Richard Burr", "John Hoeven", "Deb Fischer", "Jeanne Shaheen", "Robert Menendez", "Tom Udall", "Catherine CortezMasto", "Charles E. Schumer", "Sherrod Brown", "James M. Inhofe", "Ron Wyden", "Robert P. Casey", "Jack Reed", "Lindsey Graham", "John Thune", "Lamar Alexander", "John Cornyn", "Mike Lee", "Mark R. Warner", "Patrick Leahy", "Patty Murray", "Ron Johnson", "Joseph Manchin", "John Barrasso"]
    let senator2 = ["Dan Sullivan", "Doug Jones", "Tom Cotton", "Martha McSally", "Kamala Harris", "Cory Gardner", "Chris Murphy", "Chris Coons", "Rick Scott", "David Perdue", "Brian Schatz", "Joni Ernst", "James E. Risch", "Tammy Duckworth", "Mike Braun", "Jerry Moran", "Rand Paul", "John Kennedy", "Ed Markey", "Chris VanHollen", "Angus King", "Gary Peters", "Tina Smith", "Josh Hawley", "Cindy HydeSmith", "Steve Daines", "Thom Tillis", "Kevin Cramer", "Ben Sasse", "Maggie Hassan", "Cory Booker", "Martin Heinrich", "Jacky Rosen", "Kirsten Gillibrand", "Rob Portman", "James Lankford", "Jeff Merkley", "Pat Toomey", "Sheldon Whitehouse", "Tim Scott", "Mike Rounds", "Marsha Blackburn", "Ted Cruz", "Mitt Romney", "Tim Kaine", "Bernie Sanders", "Maria Cantwell", "Tammy Baldwin", "Shelley Moore Capito", "Mike Enzi"]
    let topicNames = ["Repeal Mandatory Minimums", "End Cash Bail", "Abolish Qualified Immunity", "End Solitary Confinement", "Require Racial Impact Statements", "Abolish Private Prisons"]
    let topicDescriptions = ["I’m writing to ask that you support repealing mandatory minimum sentences for non-violent drug crimes. Specifically, I ask that you support S. 2850: The Smarter Sentencing Act,  S. 399: The Justice Safety Valve Act, and S. 2146: The Second Look Act.\n       To mitigate the damage of mandatory minimums nationally, I ask you to support the following:\n       S. 2850: The Smarter Sentencing Act, which would allow judges to conduct personalized reviews and determine individualized sentences, rather than group all offenders under one, harsh sentence.\n       S. 399: The Justice Safety Valve Act, a bipartisan proposal which would allow judges to give sentences other than mandatory minimum terms if a court determines, after considering certain factors, the mandatory minimum sentence is greater than necessary.\n       S. 2146: The Second Look Act, which would allow modifications to mandatory minimum sentences if convicts have served at least 10 years of their sentence and present no credible risk to their community.\n       Mandatory minimum laws have a racist history and continue to disproportionately affect people of color. The Yale Law Journal finds that prosecutors file mandatory minimums twice as often against black men as against comparable white men. The ACLU reports that in Massachusetts, people of color make up only one-third of convicted drug offenders; however, 75% of those sentenced to a mandatory minimum term are black.\n       Fortunately, there are better solutions to drug crime than mandatory minimums. Before prison costs skyrocketed, a 1997 RAND study found that treatment for heavy drug users was eight-to-nine times more cost-effective than mandatory sentences in reducing drug use and crime.\n       Repealing mandatory minimums has proven to work. California, Michigan, New York, and Rhode Island all saw lower prison populations and crime rates after reducing or removing their mandatory minimums.\n       To prevent racist laws passed in the 1980s from continuing mass incarceration, I ask that you push for the repeal of mandatory minimums for non-violent drug crimes.", "I am writing to ask that you support ending cash bail.\n       Cash bail holds low-income people in jail regardless of their innocence or the severity of their alleged crime. Cash bail destroys the founding principle of the judicial system, “innocent until proven guilty.”\n       When people are kept in jail because they can’t pay bail, they can lose their job, have their children taken away, or fall behind on their rent, increasing the chance that they actually commit crimes in the future. Further, forcing people to stay in jail because they can’t afford bail raises the likelihood that innocent people plead guilty to get out of jail faster or develop mental illnesses.\n       The cash bail system disproportionately affects people of color. Beyond how people of color are more likely to be arrested, KQED News reports that black men pay an average 35% higher bail amounts than white men, and Hispanic men pay 19% more than white men.\n       Ending cash bail is an important step in making our criminal justice system more equal and decriminalizing poverty, and I hope to hear of your support for this movement.", "I am writing to ask that you support abolishing qualified immunity to remove the legal protection given to officers who violate rights. Senator Markey and Representative Amash have developed bills to end qualified immunity, and I’m asking for your support.\n       Qualified immunity protects police officers from facing consequences for their brutality, allowing and emboldening them to use excessive force, especially against people of color, who are three times as likely to be killed by police. Indeed, Mapping Police Violence finds that 99% of killings by police from 2013-2019 have not resulted in officers being charged with a crime.\n       Working to abolish qualified immunity is a necessary step to bring justice, reduce police brutality. and save lives.", "I’m writing to ask that you work to reform solitary confinement on the federal level to be more humane by supporting S. 719: The Solitary Confinement Reform Act, and S.2870: The Restricting Solitary Confinement in Immigration Detention Act. Action is still needed at the federal level. I ask that you support:\n       S. 719: The Solitary Confinement Reform Act, which would restrict solitary confinement usage to situations that meet certain criteria, limit solitary confinement for certain categories of inmates, including pregnant women and prisoners with serious mental illnesses, provide comprehensive mental health evaluations for inmates in solitary confinement, and create a solitary confinement resource center within the Department of Justice's Bureau of Justice Assistance.\n       S.2870: The Restricting Solitary Confinement in Immigration Detention Act, which would reduce the use of solitary confinement in immigration detention centers\n       Right now, over 61,000 people are in solitary confinement in US prisons every day. Though solitary confinement was originally designed to protect prisoners, the system now does more harm than good by forcing convicts to endure inhumane conditions for minor infractions, causing serious mental health issues.\n       The harms of solitary confinement disproportionately affect people of color. The Sentencing Project finds that black prisoners are 65% more likely to be sentenced to solitary confinement than their white counterparts.\n       Proponents of solitary confinement argue that separating convicts limits prison violence. However, when states like Maine, Colorado, Kansas, Mississippi, and Ohio passed regulations to solitary confinement, they saw no increase in prison violence. In fact, Mississippi saw a 70% decrease in prison violence after reducing its solitary confinement population by 85%. Further, solitary confinement is unnecessarily expensive and uses up resources that would be better spent providing rehabilitation services that have been proven to reduce recidivism.\n       Because solitary confinement is outdated, inhumane, and counterproductive, I ask that you support solitary confinement reform on the federal level.", "I’m writing to ask that you support requiring racial impact statements for proposed legislation, especially criminal justice laws.\n       The Bureau of Justice finds that a black male born today has a one in four chance of spending time in state or federal prison. For white males, on the other hand, that statistic is one in 23. Requiring racial impact statements could have prevented this inequality and could stop future policies from exacerbating the crisis.\n       Racial impact statements examine the likely impacts of a policy proposal in order to minimize disparities and foster racial equity and inclusion. This is not a new idea; environmental, fiscal, and health impact statements are already commonplace, and states like Iowa, Connecticut, Florida, Oregon, and New Jersey have already passed laws requiring racial impact statements for criminal justice legislation.\n       Racial impact statements help prevent the passage of policies that would spur inequality by highlighting their racial implications. For example, the Juvenile Justice Information Exchange finds that having racial impact statements would have helped foresee the disproportionate impact that mandatory minimums would have on people of color — 75% of those sentenced to mandatory minimum terms in Massachusetts are black. Racial impact statements would block the implementation of racist policies.\n       In addition to criminal justice, PEW Charitable Trusts finds that racial impact statements would draw attention to the impacts of voting legislation on suppressing minority voters.\n       To prevent racist laws from exacerbating inequality, I ask that you support requiring racial impact statements for proposed legislation.", "I’m writing to ask that you support working towards ending private prison usage at the Federal level in the United States. According to the Sentencing Project, “the Federal Bureau of Prisons maintains the nation’s highest number of people managed by private prison contractors.“\n       This is harrowing given that a 2016 Justice Department report found that private prisons have a 28% higher rate of inmate-on-inmate assault, more than twice as many inmate-on-staff assaults, and twice as many illicit weapons as comparable public prisons. Furthermore, studies of prisons in Minnesota, Mississippi, Oklahoma, and Florida all found that private prisons have higher recidivism rates than their public counterparts.\n       To mitigate the damage of private prisons nationally, I ask you to support the following:\n       S.2773: Private Prison Information Act of 2019, which would hold all prisons holding federal prisoners, regardless of public or private status, subject to Freedom of Information Act requests.\n       S.1827: Ending Tax Breaks for Private Prisons Act. Two of America’s most prominent private prison companies, GEO Group and CoreCivic, hold Real Estate Investment Trusts (REIT) status, allowing them to use tax breaks to increase profits. S.1827 would close this tax loophole.\n       To provide cost savings for taxpayers and lower recidivism and violence rates, private prisons must be phased out. These bills take the first step in doing so, and I hope to see your support for them."]
    
    let topics = Bundle.main.decode([Topics].self, from: "Senators.json")
    
    func find(value searchValue: String, in array: [String]) -> Int?
    {
        for (index, value) in array.enumerated()
        {
            if value == searchValue {
                return index
            }
        }

        return nil
    }
    
    var body: some View {
        VStack{
            TextField("Enter your state abbreviation (Ex: MA)", text: $settings.state)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            Button(action: {
                self.checkSenator = true
                self.index = (self.find(value: "\(self.settings.state)", in: self.senatorstates) ?? 0)
                self.customSenators = ["\(self.senator1[self.index])", "\(self.senator2[self.index])"]
                self.settings.clicks += 1
                if self.settings.clicks % 7 == 0 {
                    SKStoreReviewController.requestReview()
                }
                          }) {
            HStack {
                   Image(systemName: "magnifyingglass.circle.fill")
                       .font(.system(size: 30))
                      .padding(EdgeInsets(top: 10, leading: 15, bottom: 10, trailing: 0))
                  Text("Find My Senators")
                      .fontWeight(.semibold)
                      .font(.headline)
                      .padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 15))
                  }
                  .foregroundColor(.white)
                  .background(Color.blue)
                  .cornerRadius(40)
            }
            if checkSenator == true {
                    Form {
                        VStack{
                            
                        Picker(selection: self.$senatorChoiceIndex, label: Text("Choose a senator")) {
                            ForEach(self.customSenators.indices, id: \.self){
                                Text(self.customSenators[$0])
                           }
                        }.pickerStyle(SegmentedPickerStyle())
                        .labelsHidden()
                            .padding()
                            ZStack {
                                if colorScheme == .light {
                            Text("Topic")
                                .font(.system(size: 38)).bold()
                                .foregroundColor(.black)
                                .offset(x: -130, y: -70)
                                } else {
                            Text("Topic")
                                .font(.system(size: 38)).bold()
                                .foregroundColor(.white)
                                .offset(x: -130, y: -70)
                                }
                        Picker(selection: $index2, label: Text("Pick a topic")) {
                            ForEach(topicNames.indices, id: \.self) {
                                Text(self.topicNames[$0])
                            }
                        }.pickerStyle(WheelPickerStyle())
                        .labelsHidden()
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
                          .offset(y: -8)
                            }
                        ZStack {
                        Button(action: {
                            self.settings.topicDescription = "\(self.topicDescriptions[self.index2])"
                            self.settings.senatorChoice = "\(self.customSenators[self.senatorChoiceIndex])"
                            self.settings.clicks += 1
                            if self.settings.clicks % 7 == 0 {
                                SKStoreReviewController.requestReview()
                            }
                                          }) {
                                  Text("Generate")
                                      .padding()
                                    .font(.headline)
                                    .foregroundColor(.white)
                            }
                                .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
                                .background(RoundedRectangle(cornerRadius: 15, style: .continuous)
                                    .fill(Color.blue))
                            NavigationLink(destination: SenGenerated()) {
                                    EmptyView()
                            }
                            }
                    }.navigationBarTitle("\(senatorstatesnames[index])")
                        .padding()
                        
                    }

            }
            Spacer()
    }
}
}

struct ContactSen_Previews: PreviewProvider {
    static var previews: some View {
        ContactSen()
    }
}


