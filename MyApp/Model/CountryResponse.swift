//
//  CountryResponse.swift
//  MyApp
//
//  Created by Vijay Guruju on 24/06/24.
//

import Foundation
import CountriesAPI

struct CountryResponse {
    var countries: [Country] = []
    
    init(countryList:[GetAllCountriesQuery.Data.Country]) {
        for country in countryList {
            self.countries.append(Country(name: country.name, code: country.code, emoji: country.emoji))
        }
    }
}

struct Country {
    var name:String
    var code:String
    var emoji:String
}
