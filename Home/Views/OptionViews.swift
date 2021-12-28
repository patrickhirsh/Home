//
//  OptionViews.swift
//  Home
//
//  Created by Patrick Hirsh on 12/27/21.
//

import SwiftUI


struct SingleSelectionListCell: View {
    let element: String
    @Binding var selectedElement: String?
    
    var body: some View {
        HStack {
            Text(element)
            Spacer()
            if element == selectedElement {
                Image(systemName: "checkmark")
                    .foregroundColor(.accentColor)
            }
        }.onTapGesture {
            self.selectedElement = self.element
        }
    }
}
