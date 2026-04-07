//
//  MoviesList.swift
//  MovieApp
//
//  Created by Sinuar on 04/02/26.
//

import SwiftUI

struct MoviesList: View {
    @Environment(MoviesModel.self)
    private var model
    
    var body: some View {
        List(model.movies) { movie in
            NavigationLink {
                MovieDetailView(movie: movie)
            } label: {
                MovieRow(movie: movie)
            }
        }
        .task {
            model.fetchMovies()
        }
        .navigationTitle(Text("Films List"))
    }
}

#Preview {
    NavigationStack {
        MoviesList()
    }
}
