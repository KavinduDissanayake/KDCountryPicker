//
//  CountriesVM.swift
//
//
//  Created by Kavindu Dissanayake on 2023-01-28.
//


import Foundation

class CountriesVM : ObservableObject {
    @Published  var searchText: String = ""{
        didSet {
            searchWithText()
        }
    }
    
    @Published  var selectedCountryModel: CountryModel? = nil
        
    @Published var filteredCountryList: [CountryModel] = []
    @Published var tempList: [CountryModel] = []

    init(selectedCountryModel: CountryModel? = nil){
        self.selectedCountryModel = selectedCountryModel
        tempList = staticCountryList
        filteredCountryList = staticCountryList
    }
}

extension CountriesVM {
    func searchWithText() {
        if searchText.isEmpty {
            filteredCountryList = tempList
        } else {
            filteredCountryList = filteredCountryList.filter { $0.country?.contains(searchText) ?? false }
        }
    }
}

