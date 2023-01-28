//
//  CountriesView.swift
//  
//
//  Created by Kavindu Dissanayake on 2023-01-28.
//

import SwiftUI

public struct CountriesView: View {
    
    @ObservedObject var vm = CountriesVM()
    var getSelectedModel : (CountryModel) -> ()
    
    public init(selectedCountryModel: CountryModel? = nil,getSelectedModel: @escaping (CountryModel) -> Void) {
        vm  =  CountriesVM(selectedCountryModel: selectedCountryModel)
        self.getSelectedModel = getSelectedModel
    }
    
    public var body: some View {
        
        ZStack {
            
            VStack{
                PickerSerachBar(text: $vm.searchText)
                
                GeometryReader { geometry in
                    
                    ScrollViewReader { value in
                        
                        VStack(alignment: .center, spacing: 20) {
                            List{
                                ForEach(Array(vm.filteredCountryList.enumerated()), id: \.offset) { index, countryModel in
                                    // index and item are both safe to use here
                                    CountryRow(countryModel: countryModel, isSelected: self.$vm.filteredCountryList[index].isSelected)
                                        .id(countryModel.digitCode)
                                        .onTapGesture {
                                            self.toggleSelection(for: countryModel)
                                            self.getSelectedModel(countryModel)
                                        }
                                }
                            }
                            .listStyle(PlainListStyle())
                            .padding(.horizontal,20)
                            
                            Spacer()
                            
                        }//:VStack
                        
                        Text("")
                            .onAppear{
                                autoForuces(value: value)
                            }
                    }//:ScrollView
                    //.frame(width: geometry.size.width)
                }//:GeometryReader
            }//:VStack
            
            
        }//:ZStack
        .navigationBarHidden(true)
        .edgesIgnoringSafeArea(.all)
        
    }
    
    
}


//AutoFroucesView
extension CountriesView {
    
    func autoForuces(value: ScrollViewProxy){
        guard let model = vm.selectedCountryModel else  {  return }
        //chnage value selected model
        for (index, item) in vm.filteredCountryList.enumerated() {
            if model == item {
                vm.filteredCountryList[index].isSelected = true
            }
        }
        withAnimation {
            value.scrollTo(model.digitCode)
        }
    }
    
}

//Toggle View
extension CountriesView {
    private func toggleSelectionList(for country: CountryModel, in list: inout [CountryModel]) {
        // Unselect all countries
        for (index, _) in list.enumerated() {
            list[index].isSelected = false
        }
        // Toggle the selected country
        if let index = list.firstIndex(where: { $0.id == country.id }) {
            list[index].isSelected.toggle()
        }
    }
    
    private func toggleSelection(for country: CountryModel) {
        toggleSelectionList(for: country, in: &vm.filteredCountryList)
        toggleSelectionList(for: country, in: &vm.tempList)
    }
}

//struct SwiftUIView_Previews: PreviewProvider {
//    static var previews: some View {
//        SwiftUIView()
//    }
//}
