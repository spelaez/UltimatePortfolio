//
//  ItemRowView.swift
//  UltimatePortfolio
//
//  Created by Santiago Pelaez Rua on 6/05/21.
//

import SwiftUI

struct ItemRowView: View {
    @ObservedObject var project: Project
    @ObservedObject var item: Item
    
    var icon: some View {
        let projectColor = Color(project.projectColor)
        
        if item.completed {
            return Image(systemName: "checkmark.circle")
                .foregroundColor(projectColor)
        } else if item.priority == 3 {
            return Image(systemName: "exclamationmark.triangle")
                .foregroundColor(projectColor)
        } else {
            return Image(systemName: "checkmark.circle")
                .foregroundColor(.clear)
        }
    }
    
    var body: some View {
        NavigationLink(destination: EditItemView(item: item)) {
            Label {
                Text(item.itemTitle)
            } icon: {
                icon
            }
        }
    }
}

struct ItemRowView_Previews: PreviewProvider {
    static var previews: some View {
        ItemRowView(project: .example, item: .example)
    }
}
