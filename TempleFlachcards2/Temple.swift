//
//  Temple.swift
//  TempleFlachcards2
//
//  Created by Nathan Johnson on 10/28/15.
//  Copyright © 2015 Nathan Johnson. All rights reserved.
//

import Foundation

class Temple {
    //MARK: Properties
    
    fileprivate var filename: String
    fileprivate var name: String
    fileprivate var city: String
    fileprivate var state: String?
    fileprivate var country: String
    fileprivate var imageWidth: Int
    fileprivate var imageHeight: Int
    
    // MARK: Initialization
    
    init(filename: String, name: String, city: String, state: String?, country: String, width: Int, height: Int) {
        self.filename = filename
        self.name = name
        self.city = city
        self.state = state
        self.country = country
        imageWidth = width
        imageHeight = height
    }
    
    func getFilename() -> String {
        return filename
    }
    
    func getName() -> String {
        return name
    }
    
    func getCity() -> String {
        return city
    }
    
    func getState() -> String? {
        return state
    }
    
    func getCountry() -> String {
        return country
    }
    
    func getActualImageWidth(_ actualHeight: Int) -> Int {
        return (actualHeight * imageWidth) / imageHeight
    }
    
    func getImageWidth() -> Int {
        return imageWidth
    }
    
    func getImageHeight() -> Int {
        return imageHeight
    }
}


