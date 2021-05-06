//
//  Binding-OnChange.swift
//  UltimatePortfolio
//
//  Created by Santiago Pelaez Rua on 6/05/21.
//

import SwiftUI

extension Binding {
    func onChange(_ handler: @escaping () -> Void) -> Binding<Value> {
        Binding<Value> {
            return wrappedValue
        } set: {
            wrappedValue = $0
            handler()
        }
    }
}
