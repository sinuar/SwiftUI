//
//  MoviesModel.swift
//  MovieApp
//
//  Created by Sinuar on 04/02/26.
//

import Foundation
import SwiftUI

@Observable
class MoviesModel {
    var movies = [Movie]()
    var errorMessage: String?
    var isLoading = false
    
    // MARK: - Fetch Movies from JSON File
    
    func fetchMovies() async {
        guard let moviesResponseURL = Bundle.main.url(forResource: "MoviesResponse", withExtension: "json") else {
            movies = [Movie.sample]
            print("File not found")
            return
        }
        
        print("✅ Found file at: \(moviesResponseURL)")
        
        do {
            let moviesData = try Data(contentsOf: moviesResponseURL)
            print("✅ Loaded data: \(moviesData.count) bytes")
            
            let moviesFromResponse = try JSONDecoder().decode([Movie].self, from: moviesData)
            print("✅ Successfully decoded \(moviesFromResponse.count) movies")
            movies = moviesFromResponse
        } catch {
            print("Decoding of data failed \(error)")
        }

    }
}
