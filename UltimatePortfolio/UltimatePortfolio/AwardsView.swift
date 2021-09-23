//
//  AwardsView.swift
//  UltimatePortfolio
//
//  Created by Santiago Pelaez Rua on 21/05/21.
//

import SwiftUI

struct AwardsView: View {
    static let tag: String? = "Awards"

    @EnvironmentObject var dataController: DataController
    @State private var selectedAward = Award.example
    @State private var showingAwardDetails = false
    @State private var alertTitle: LocalizedStringKey = "Locked"
    
    var columns: [GridItem] {
        [GridItem(.adaptive(minimum: 100, maximum: 100))]
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(Award.allAwards) { award in
                        Button {
                            selectedAward = award

                            alertTitle = dataController.hasEarned(award: award) ? "Unlocked: \(selectedAward.name)" : "Locked"
                            showingAwardDetails = true
                        } label: {
                            Image(systemName: award.image)
                                .resizable()
                                .scaledToFit()
                                .padding()
                                .frame(width: 100, height: 100)
                                .foregroundColor(dataController.hasEarned(award: award) ? Color(award.color) : .secondary.opacity(0.5))
                        }
                        .accessibilityLabel(Text(dataController.hasEarned(award: award) ? "Unlocked: \(award.name)": "Locked"))
                        .accessibilityHint(Text(award.description))
                    }
                }
            }
            .navigationTitle("Awards")
        }
        .alert(alertTitle, isPresented: $showingAwardDetails, actions: {}, message: {
            Text(selectedAward.description)
        })
    }
}

struct AwardsView_Previews: PreviewProvider {
    static var previews: some View {
        AwardsView()
            .environmentObject(DataController.preview)
    }
}
