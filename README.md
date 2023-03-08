# KDCountryPicker


[![Build Status](https://travis-ci.org/joemccann/dillinger.svg?branch=master)](https://travis-ci.org/joemccann/dillinger)

Very simple country picker for iOS with elegant design. It uses unicode for country flags. Its allows to automatically scroll with previous selected one .

#### Requirements
* iOS 13+

* Xcode 12+

* Swift 5.3+

## Installation
Currently CountryPicker is only avaliable via SPM. You can also add manually to your project.





```swift
dependencies: [

.package(url: "https://github.com/KavinduDissanayake/KDCountryPicker")

]
```

Example
## SwiftUI
```sh
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


#### Demo image
<img align="center" src="https://github.com/KavinduDissanayake/KDCountryPicker/blob/main/Ss/swiftui%20banner.png"> 

## License

Kavindu Dissanayake
