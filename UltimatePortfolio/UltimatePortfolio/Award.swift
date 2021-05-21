//
//  Award.swift
//  UltimatePortfolio
//
//  Created by Santiago Pelaez Rua on 21/05/21.
//

import Foundation

struct Award: Decodable, Identifiable {
    var id: String { name }
    let name: String
    let description: String
    let color: String
    let criterion: String
    let value: Int
    let image: String
    
    static let allAwards: [Award] = Bundle.main.decode(from: "Awards.json")
    static let example = allAwards[0]
}
