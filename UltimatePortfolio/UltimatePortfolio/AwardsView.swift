//
//  AwardsView.swift
//  UltimatePortfolio
//
//  Created by Santiago Pelaez Rua on 21/05/21.
//

import SwiftUI

struct AwardsView: View {
    static let tag: String? = "Awards"
    
    var columns: [GridItem] {
        [GridItem(.adaptive(minimum: 100, maximum: 100))]
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(Award.allAwards) { award in
                        Button {
                            // no action yet
                        } label: {
                            Image(systemName: award.image)
                                .resizable()
                                .scaledToFit()
                                .padding()
                                .frame(width: 100, height: 100)
                                .foregroundColor(.secondary.opacity(0.5))
                        }
                    }
                }
            }
            .navigationTitle("Awards")
        }
    }
}

struct AwardsView_Previews: PreviewProvider {
    static var previews: some View {
        AwardsView()
    }
}
