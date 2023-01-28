//
//  CountryRow.swift
//  
//
//  Created by Kavindu Dissanayake on 2023-01-28.
//

import SwiftUI

struct CountryRow: View {
   var countryModel:CountryModel
    var isSelected: Binding<Bool>

    var body: some View {
        HStack {
            if  countryModel.isSelected {
                Image(systemName: "checkmark")
                    .foregroundColor(.primary)
            }
            Text(countryModel.flag ?? "")
            Text(countryModel.dialingCode ?? "")
            Spacer()
            Text(Locale.current.localizedString(forRegionCode: countryModel.dialingCode ?? "") ?? "")
            Text(countryModel.country ?? "")
        }
    }
}


//struct SwiftUIView_Previews: PreviewProvider {
//    static var previews: some View {
//        SwiftUIView()
//    }
//}
