//
//  Movie.swift
//  MovieApp
//
//  Created by Sinuar on 03/02/26.
//

import SwiftUI

struct Movie: Codable, Identifiable {
    let id: Int
    let title: String
    let overview: String?
    let releaseDate: String?
    let posterPath: String?
    let adult: Bool?
    let popularity: Double?
    let revenue: Int?
    let budget: Int?
    let imdbID: String?
    let tagline: String?
    let genres: String?
    
    // Computed property that doesn't store value
    
    var imageURL: URL? {
        URL(string: posterPath ?? "")
    }
    
    var unwrappedReleaseDate: Date {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.date(from: releaseDate ?? "N/A") ?? Date()
    }
    
    var unwrappedPopularity: Double {
        popularity ?? 0.0
    }
    
    var unwrappedRevenue: Int {
        revenue ?? 0
    }
    
    var unwrappedBudget: Int {
        budget ?? 0
    }
    
    var genderArray: [String] {
        genres?.components(separatedBy: ",") ?? []
    }
    
    func showInfo() {
        print(title)
    }
}

extension Movie {
    static let sample = Movie(
        id: 1,
        title: "Sample Movie",
        overview: "Sample Movie Overview",
        releaseDate: "2020-01-01",
        posterPath: "https://lumiere-a.akamaihd.net/v1/images/02_kotpota_teaser_1sht_las_652fbe30.jpeg",
        adult: false,
        popularity: 8.5,
        revenue: 1_000_000,
        budget: 800_000,
        imdbID: "tt6793710",
        tagline: "Great movie",
        genres: "Action, Comedy")
}


