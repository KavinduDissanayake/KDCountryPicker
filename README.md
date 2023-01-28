
# KDCountryPicker

 
 Very simple country picker for iOS with elegant design. It uses unicode for country flags. Its allows to automatically scroll  with previous selected one .
 
## Promo Image 

## Screenshots


  

## Requirements

* iOS 12+

* Xcode 12+

* Swift 5.3+

  

## Installation

  

Currently CountryPicker is only avaliable via SPM. You can also add manually to your project.

  

### SPM

If you have already Swift package set up, add CountryPicker as a dependency to your dependencies in your `Package.swift` file.

```swift

dependencies: [

.package(url: "https://github.com/KavinduDissanayake/KDCountryPicker")

]

```

  

  

  

### SwiftUI

```
@State  var  showingModalView = false
//inital model you can chanage 
@State  var selectedCountryModel: CountryModel = CountryModel(isoCode: "LK", digitCode: "94")


.sheet(isPresented: $showingModalView) {
	VStack{
	//Header
			CountriesView(selectedCountryModel: selectedCountryModel,getSelectedModel:{ selectedCountry in
					self.showingModalView.toggle()
					selectedCountryModel = selectedCountry
			})
	}
}


```
