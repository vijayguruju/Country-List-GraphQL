//
//  Manager.swift
//  MyApp
//
//  Created by Vijay Guruju on 03/05/24.
//

import Foundation
import Apollo
import CountriesAPI


class NetworkManager {
    static let shared  = NetworkManager()
    
    private init(){}
    
    var apollo = ApolloClient(url: URL(string: "https://countries.trevorblades.com")!)

}
