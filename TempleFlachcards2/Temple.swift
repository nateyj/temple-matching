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
    
    private var filename: String
    private var name: String
    private var city: String
    private var state: String?
    private var country: String
    private var imageWidth: Int
    private var imageHeight: Int
    
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
    
    func getActualImageWidth(actualHeight: Int) -> Int {
        return (actualHeight * imageWidth) / imageHeight
    }
    
    func getImageWidth() -> Int {
        return imageWidth
    }
    
    func getImageHeight() -> Int {
        return imageHeight
    }
}


