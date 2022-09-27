# Countries

## :dart: About ##

The take home project called “Countries”. In this project you will see 10 countries as a list in the home screen. User can add to favourite any country with favourite button on cell or go to detail page and add to favourite from there. Core Data was used as the database. I thought this was the most effective solution for this project. I created network layer with Alamofire and this is first time to use this library. Excellent experience. On the detail page there are country’s flag, country’s code and the “more information” button for go to the Wikidata website. The flag image was SVG format but Kingfisher does not conform SVG. And I added some codes for this problem. This application is available for the dark mode.

## :rocket: Technologies ##

The following tools were used in this project:

- [Swift](https://www.swift.com/)
- [UIKit](https://developer.apple.com/documentation/uikit/)
- [Xcode](https://developer.apple.com/xcode/)
- [Core Data](https://developer.apple.com/documentation/coredata)
- [Rapid API](https://rapidapi.com/)
- [Kingfisher](https://github.com/onevcat/Kingfisher)
- [SVGKit](https://github.com/SVGKit/SVGKit)
- [Alamofire](https://github.com/Alamofire/Alamofire)

## Home Screen ##

<img width="334" src="https://user-images.githubusercontent.com/89488125/192516137-1d8e2d4e-100b-48b8-bf63-fabb8587f4ee.png">

* Users can add a country to the saved list.
* Users can remove a country from the saved list.
* User can go to the detail card by selecting a country.


## Details Screen ##

<img width="334" src="https://user-images.githubusercontent.com/89488125/192519306-c98cd415-632f-4088-a278-0fb2f4b7c1cf.png">

* User can be see country flag on top of the page.
* User can be able to see country code.
* User can be navigated to wikidata with For More Information button. 
* User can be able to add the country to favourite list and remove the country from favourite list on this page.
* Favourite button’s color change according to whether it’s in saved list or not.


## Favourite Screen ##

<img width="334" src="https://user-images.githubusercontent.com/89488125/192518399-77c75e83-6004-4255-94f0-b3517a2f5192.png">

* User can be see saved countries in this page.
* User can go to the detail card from here.
* User can remove the country from saved list.
