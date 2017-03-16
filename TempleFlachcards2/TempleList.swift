//
//  TempleList.swift
//  TempleFlachcards2
//
//  Created by Nathan Johnson on 11/3/15.
//  Copyright © 2015 Nathan Johnson. All rights reserved.
//

import Foundation

class TempleList {
    // MARK: Properties
    
    let TEMPLES = [
        Temple(filename: "aba-nigeria-temple-lds-273999-mobile.jpg", name: "Aba Nigeria", city: "Aba", state: nil, country: "Nigeria", width: 960, height: 640),
        Temple(filename: "accra-ghana-temple-lds-249027-mobile.jpg", name: "Accra Ghana", city: "Accra", state: nil, country: "Ghana", width: 960, height: 640),
        Temple(filename: "albuquerque-temple-lds-137885-mobile.jpg", name: "Albuquerque New Mexico", city: "Albuquerque", state: "New Mexico", country: "United States", width: 875, height: 640),
        Temple(filename: "anchorage-temple-lds-253274-mobile.jpg", name: "Anchorage Alaska", city: "Anchorage", state: "Alaska", country: "United States", width: 928, height: 640),
        Temple(filename: "apia-samoa-temple-lds-460475-mobile.jpg", name: "Apia Samoa", city: "Apia", state: nil, country: "Samoa", width: 960, height: 640),
        Temple(filename: "asuncion-paraguay-temple-lds-298372-mobile.jpg", name: "Asunción Paraguay", city: "Asunción", state: nil, country: "Paraguay", width: 960, height: 639),
        Temple(filename: "atlanta-georgia-temple-sunset-1218213-mobile.jpg", name: "Atlanta Georgia", city: "Atlanta", state: "Georgia", country: "United States", width: 454, height: 640),
        Temple(filename: "baton-rouge-temple-lds-1078084-mobile.jpg", name: "Baton Rouge Louisiana", city: "Baton Rouge", state: "Louisiana", country: "United States", width: 856, height: 640),
        Temple(filename: "bern-switzerland-temple-lds-653038-mobile.jpg", name: "Bern Switzerland", city: "Bern", state: nil, country: "Switzerland", width: 960, height: 639),
        Temple(filename: "billings-temple-lds-946466-mobile.jpg", name: "Billings Montana", city: "Billings", state: "Montana", country: "United States", width: 956, height: 640),
        Temple(filename: "birmingham-temple-lds-130170-mobile.jpg", name: "Birmingham Alabama", city: "Birmingham", state: "Alabama", country: "United States", width: 811, height: 640),
        Temple(filename: "bismarck-temple-lds-408056-mobile.jpg", name: "Bismarck North Dakota", city: "Bismarck", state: "North Dakota", country: "United States", width: 844, height: 640),
        Temple(filename: "bogota-colombia-mormon-temple-856490-mobile.jpg", name: "Bogotá Colombia", city: "Bogotá", state: nil, country: "Colombia", width: 853, height: 640),
        Temple(filename: "boise-temple-lds-39439-mobile.jpg", name: "Boise Idaho", city: "Boise", state: "Idaho", country: "United States", width: 467, height: 640),
        Temple(filename: "boston-temple-lds-945541-mobile.jpg", name: "Boston Massachusetts", city: "Boston", state: "Massachusetts", country: "United States", width: 800, height: 640),
        Temple(filename: "bountiful-temple-766491-mobile.jpg", name: "Bountiful Utah", city: "Bountiful", state: "Utah", country: "United States", width: 853, height: 640),
        Temple(filename: "brigham-city-utah-temple-dedication-day-1027033-mobile.jpg", name: "Brigham City Utah", city: "Brigham City", state: "Utah", country: "United States", width: 426, height: 640),
        Temple(filename: "brisbane-australia-temple-lds-745088-mobile.jpg", name: "Brisbane Australia", city: "Brisbane", state: nil, country: "Australia", width: 797, height: 640),
        Temple(filename: "buenos-aires-argentina-temple-lds-82744-mobile.jpg", name: "Buenos Aires Argentina", city: "Buenos Aires", state: nil, country: "Argentina", width: 819, height: 640),
        Temple(filename: "calgary-alberta-temple-before-open-house-1033408-mobile.jpg", name: "Calgary Alberta", city: "Calgary", state: "Alberta", country: "Canada", width: 960, height: 640),
        Temple(filename: "campinas-brazil-temple-lighted-1029894-mobile.jpg", name: "Campinas Brazil", city: "Campinas", state: nil, country: "Brazil", width: 853, height: 640),
        Temple(filename: "cardston-alberta-temple-lds-782043-mobile.jpg", name: "Cardston Alberta", city: "Apia", state: nil, country: "Samoa", width: 960, height: 640),
        Temple(filename: "cebu-philippines-temple-lds-852837-mobile.jpg", name: "Cebu City Philippines", city: "Cebu City", state: nil, country: "Philippines", width: 881, height: 640),
        Temple(filename: "chicago-temple-lds-885844-mobile.jpg", name: "Chicago Illinois", city: "Chicago", state: "Illinois", country: "United States", width: 960, height: 640),
        Temple(filename: "ciudad-juarez-mexico-temple-lds-126122-mobile.jpg", name: "Ciudad Juárez Mexico", city: "Ciudad Juárez", state: nil, country: "Mexico", width: 904, height: 640),
        Temple(filename: "colonia-juarez-mexico-temple-lds-1039762-mobile.jpg", name: "Colonia Juárez Chihuahua Mexico", city: "Chihuahua", state: nil, country: "Mexico", width: 960, height: 637),
        Temple(filename: "columbia-river-temple-lds-761262-mobile.jpg", name: "Columbia River Washington", city: "Columbia River", state: "Washington", country: "United States", width: 960, height: 639),
        Temple(filename: "columbia-temple-lds-83400-mobile.jpg", name: "Columbia South Carolina", city: "Columbia", state: "South Carolina", country: "United States", width: 838, height: 630),
        Temple(filename: "columbus-temple-lds-406110-mobile.jpg", name: "Columbus Ohio", city: "Columbus", state: "Ohio", country: "United States", width: 960, height: 639),
        Temple(filename: "copenhagen-denmark-temple-895949-mobile.jpg", name: "Copenhagen Denmark", city: "Copenhagen", state: nil, country: "Denmark", width: 853, height: 640),
        Temple(filename: "cordoba-argentina-temple-rendering-780527-mobile.jpg", name: "Córdoba Argentina", city: "Córdoba", state: nil, country: "Argentina", width: 853, height: 640),
        Temple(filename: "curitiba-brazil-temple-lds-851199-mobile.jpg", name: "Curitiba Brazil", city: "Curitiba", state: nil, country: "Brazil", width: 853, height: 640),
        Temple(filename: "dallas-temple-lds-850748-mobile.jpg", name: "Dallas Texas", city: "Dallas", state: "Texas", country: "United States", width: 799, height: 640),
        Temple(filename: "denver-temple-lds-999518-mobile.jpg", name: "Denver Colorado", city: "Denver", state: "Colorado", country: "United States", width: 853, height: 640),
        Temple(filename: "detroit-temple-lds-837623-mobile.jpg", name: "Detroit Michigan", city: "Detroit", state: "Michigan", country: "United States", width: 853, height: 640),
        Temple(filename: "draper-utah-lds-temple-1079449-mobile.jpg", name: "Draper Utah", city: "Draper", state: "Utah", country: "United States", width: 853, height: 640),
        Temple(filename: "guatemala-lds-temple-82739-mobile.jpg", name: "Edmonton Alberta", city: "Edmonton", state: "Alberta", country: "Canada", width: 468, height: 640),
        Temple(filename: "helsinki-finland-temple-lds-354503-mobile.jpg", name: "Helsinki Finland", city: "Helsinki", state: nil, country: "Finland", width: 512, height: 640),
        Temple(filename: "kyiv-ukraine-temple-lds-774302-mobile.jpg", name: "Kyiv Ukraine", city: "Kyiv", state: nil, country: "Ukraine", width: 960, height: 629),
        Temple(filename: "hawaii-temple-761091-mobile.jpg", name: "Laie Hawaii", city: "Laie", state: "Hawaii", country: "United States", width: 426, height: 640),
        Temple(filename: "madrid-spain-temple-954939-mobile.jpg", name: "Madrid Spain", city: "Madrid", state: nil, country: "Spain", width: 960, height: 640),
        Temple(filename: "mexico-city-temple-lds-591669-mobile.jpg", name: "Mexico City Mexico", city: "Mexico City", state: nil, country: "Mexico", width: 960, height: 639)
    ]
    
    
    // MARK: getters
    
//    func getNames() -> [String : (String, String)] {
//        var stateOrCountry: String
//        var templeNames = [String : (String, String)]()
//        
//        for temple in TEMPLES {
//            if let state = temple.getState() {
//                stateOrCountry = state
//            } else {
//                stateOrCountry = temple.getCountry()
//            }
//            
//            templeNames[temple.getName()] = (temple.getCity(),  stateOrCountry)
//        }
//        
//        return templeNames
//    }
    
    func getTemples() -> [Temple] {
        var temples = [Temple]()
        
        for temple in TEMPLES {
            temples.append(temple)
        }
        
        return temples
    }
    
    func getNames() -> [String] {
        var templeNames = [String]()
        
        for temple in TEMPLES {
            templeNames.append(temple.getName())
        }
        
        return templeNames
    }
    
    func getCities() -> [String] {
        var cities = [String]()
        
        for temple in TEMPLES {
            cities.append(temple.getCity())
        }
        
        return cities
    }
    
    func getStatesOrCountries() -> [String] {
        var statesOrCountries = [String]()
        
        for temple in TEMPLES {
            statesOrCountries.append(temple.getState() ?? temple.getCountry())
        }
        
        return statesOrCountries
    }
    
    func getImageHeights() -> [Int] {
        var imageHeights = [Int]()
        for temple in TEMPLES {
            imageHeights.append(temple.getImageHeight())
        }
        
        return imageHeights
    }
    
    func getImageWidths() -> [Int] {
        var imageWidths = [Int]()
        for temple in TEMPLES {
            imageWidths.append(temple.getImageWidth())
        }
        
        return imageWidths
    }
    
    func getPhotos() -> [String] {
        var templePhotos = [String]()
        
        for temple in TEMPLES {
            templePhotos.append(temple.getFilename())
        }
        
        return templePhotos
    }
    
    private func getRandomTemple(var temples: [Temple]) -> Temple? {
        //if there are still temples left to choose from randomly
        if temples.count > 0 {
            //choose a random temple index
            let index = Int(arc4random() % UInt32(temples.count))
            let randomTemple = temples[index]   //get the temple at that random index
            temples.removeAtIndex(index)        //remove the temple from the list of temples so it's not randomly chosen again
            
            return randomTemple
        }
        
        return nil
    }
    
    func getRandomTemples() -> [Temple] {
        var randomTemples = [Temple]()
        var temples = TEMPLES
        let templesCount = temples.count
        
        for _ in 1...templesCount {
            //if there are still temples left to choose from randomly
            if temples.count > 0 {
                //choose a random temple index
                let index = Int(arc4random() % UInt32(temples.count))
                let randomTemple = temples[index]   //get the temple at that random index
                temples.removeAtIndex(index)        //remove the temple from the list of temples so it's not randomly chosen again
                
                randomTemples.append(randomTemple)
            }
        }
        
        
        return randomTemples
    }
}
