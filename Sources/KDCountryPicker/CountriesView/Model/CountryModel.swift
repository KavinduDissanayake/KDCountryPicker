//
//  SwiftUIView.swift
//  
//
//  Created by Kavindu Dissanayake on 2023-01-28.
//

import Foundation

public struct CountryModel: Identifiable,Hashable {
    
    public var id = UUID()
    public var isoCode: String
    public var digitCode: String
    public var isSelected: Bool = false

    public init(id: UUID = UUID(), isoCode: String, digitCode: String, isSelected: Bool) {
        self.id = id
        self.isoCode = isoCode
        self.digitCode = digitCode
        self.isSelected = isSelected
    }
    
    
    public var  dialingCode: String? {
        return "+" + digitCode
    }
    
    public var  flag: String? {
        let base : UInt32 = 127397
        var flag = ""
        isoCode.unicodeScalars.forEach  { v in
            flag.unicodeScalars.append(UnicodeScalar(base + v.value)!)
        }
        return flag
    }
    
    public var country: String? {
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
