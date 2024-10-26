//
//  CountryListVewModel.swift
//  MyApp
//
//  Created by Vijay Guruju on 22/06/24.
//

import Foundation
import CountriesAPI
import Combine

class CountryListVewModel:ObservableObject {
    @Published var countries: [Country] = []

    init() {
        fetchCountries()
    }
    
    func fetchCountries() {
        NetworkManager.shared.apollo.fetch(query: GetAllCountriesQuery()) { result in
            switch result {
                case .success(let graphQLResult):
                    if let countries = graphQLResult.data?.countries {
                        self.countries = CountryResponse(countryList: countries).countries
                    }
                case .failure(let error):
                    print(error)
            }
        }
    }
}

