//
//  SwiftUIView.swift
//  
//
//  Created by Kavindu Dissanayake on 2023-01-28.
//

import Foundation

public struct CountryModel: Identifiable,Hashable {
    
    public var id = UUID()
    let isoCode: String
    let digitCode: String
    var isSelected: Bool = false

    var dialingCode: String? {
        return "+" + digitCode
    }
    
    var flag: String? {
        let base : UInt32 = 127397
        var flag = ""
        isoCode.unicodeScalars.forEach  { v in
            flag.unicodeScalars.append(UnicodeScalar(base + v.value)!)
        }
        return flag
    }
    
    var country: String? {
        let locale = Locale(identifier: Locale.preferredLanguages.first!)
        guard let localisedCountryName = locale.localizedString(forRegionCode: isoCode) else {
            let message = "Failed to localised country name for Country Code:- \(isoCode)"
            print("🔴🔴\(message)🔴🔴")
            return "N/A"
        }
        return localisedCountryName
    }
    
  }

extension CountryModel: Equatable {
    public static func == (lhs: CountryModel, rhs: CountryModel) -> Bool {
        return lhs.isoCode == rhs.isoCode && lhs.digitCode == rhs.digitCode
    }
}
