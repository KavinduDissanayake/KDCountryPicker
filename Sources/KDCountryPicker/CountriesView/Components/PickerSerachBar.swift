//
//  PickerSerachBar.swift
//  
//
//  Created by Kavindu Dissanayake on 2023-01-28.
//

import SwiftUI

 struct PickerSerachBar: View {
    @Binding var text: String

    @State private var isEditing = false

     var body: some View {
        HStack {
            TextField("Search...", text: $text)
                .font(.system(size: 17))
                .padding(7)
                .padding(.horizontal, 25)
                .background(Color(.systemGray5))
                .cornerRadius(8)
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 8)
                    }
                )
                .padding(.horizontal, 10)
                .onTapGesture {
                    self.isEditing = true
                }

            if isEditing {
                Button(action: {
                    self.text = ""
                    self.isEditing = false
                }) {
                    Image(systemName: "multiply.circle.fill")
                        .foregroundColor(.gray)
                        .padding(.trailing, 8)
                }
            }
        }
        .padding(.horizontal,30)
        .padding(.vertical,10)
    }
}

//struct PickerSerachBar_Previews: PreviewProvider {
//    static var previews: some View {
//        PickerSerachBar(text: .constant(""))
//            .previewLayout(.sizeThatFits)
//    }
//}
