//
//  MoviesView.swift
//  MovieApp
//
//  Created by Sinuar on 04/02/26.
//

import SwiftUI

struct MoviesView: View {
    @State private var model = MoviesModel()
    
    var body: some View {
        NavigationStack {
            // Display a simple placeholder while loading/fetching
            Text("We have \(model.movies.count) movies")
                .navigationTitle("Movies")
        }
        .task {
            await model.fetchMovies()
        }
    }
}

#Preview {
    MoviesView()
}
