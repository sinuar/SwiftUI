//
//  OnboardingView.swift
//  MovieApp
//
//  Created by Sinuar on 03/02/26.
//

import SwiftUI

struct OnboardingView: View {
    var movie: Movie
    let movieImage = "image001"
    
    var body: some View {
        VStack(spacing: 16) {
            Group {
                Text(movie.title)
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                
                Text(movie.unwrappedReleaseDate, format: .dateTime.day().month().year())
                    .font(.title2)
            }
            .foregroundColor(.white)
            .multilineTextAlignment(.center)
            
            Button("Enter now") {
                print("Enter now")
            }
            .font(.title3)
            .foregroundColor(.yellow)
            
        }
        .background {
            Image(movieImage)
        }
        .padding()
    }
}

#Preview {
    OnboardingView(movie: Movie.sample)
}
