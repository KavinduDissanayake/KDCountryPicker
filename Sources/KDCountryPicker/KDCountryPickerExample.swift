import SwiftUI


public struct KDCountryPickerExample: View {
    
    @State var showingModalView = false
    
    @State var selectedCountryModel: CountryModel =  CountryModel(isoCode: "LK", digitCode: "94")
    
    
    public  var body: some View {
        ZStack {
            VStack{
                
                GeometryReader { geometry in
                    
                    ScrollView(.vertical , showsIndicators: false) {
                        VStack(alignment: .center, spacing: 20) {
                            
                            Spacer()
                            
                            if selectedCountryModel.country != nil {
                                HStack{
                                    Text("\(selectedCountryModel.dialingCode ?? "N/A" )")
                                    Text("\(selectedCountryModel.flag ?? "N/A")")
                                    Text("\(selectedCountryModel.country ?? "N/A")")
                                    Text("\(selectedCountryModel.digitCode )")
                                }
                            }
                            
                            Button {
                                showingModalView.toggle()
                            } label: {
                                Text("Selecte country")
                            }
                            
                            
                            
                            Spacer()
                            
                        }//:VStack
                        .frame(minHeight: geometry.size.height)
                        // .background(Color.red)
                    }//:ScrollView
                    .frame(width: geometry.size.width)
                }//:GeometryReader
            }//:VStack
            
            //sheet View
            Text("")
                .sheet(isPresented: $showingModalView) {
                    VStack{
                        cancleHeader
                        CountriesView(selectedCountryModel: selectedCountryModel,getSelectedModel:{ selectedCountry in
                            self.showingModalView.toggle()
                            selectedCountryModel = selectedCountry
                        })
                    }
                }
        }//:ZStack
        .edgesIgnoringSafeArea(.all)
        .navigationTitle("Example View")
    }
    
    var cancleHeader: some View {
        HStack{
            Spacer()
            Button("Close") {
                self.showingModalView = false
            }
        }
        .padding(.horizontal,20)
        .padding(.vertical,10)
    }
}

struct KDCountryPickerExample_Previews: PreviewProvider {
    static var previews: some View {
        KDCountryPickerExample()
    }
}
