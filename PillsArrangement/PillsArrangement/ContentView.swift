//
//  ContentView.swift
//  PillsArrangement
//
//  Created by Sinuhé Ruedas on 15/09/23.
//

import SwiftUI
/*
struct ContentView: View {
    @State private var isSecondCapsuleWide = false

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color.blue // Background color
                
                VStack(spacing: 10) {
                    HStack(spacing: 10) {
                        Capsule()
                            .fill(Color.white) // First capsule color
                            .frame(width: isSecondCapsuleWide ? geometry.size.width - 30 : (geometry.size.width - 50) / 2, height: 60)
                        
                        if isSecondCapsuleWide {
                            Capsule()
                                .fill(Color.red) // Second capsule color
                                .frame(width: geometry.size.width - 30, height: 60)
                        }
                    }
                    
                    HStack(spacing: 10) {
                        Capsule()
                            .fill(Color.green) // Third capsule color
                            .frame(width: (geometry.size.width - 50) / 2, height: 60)
                        
                        Capsule()
                            .fill(Color.orange) // Fourth capsule color
                            .frame(width: (geometry.size.width - 50) / 2, height: 60)
                    }
                }
                .padding(.horizontal, 15) // Add horizontal padding
            }
        }
        .onAppear() {
            // Check if the second capsule is wider than 50% of the screen width
            DispatchQueue.main.async {
                if UIScreen.main.bounds.width - 30 > (UIScreen.main.bounds.width * 0.5) {
                    isSecondCapsuleWide = true
                }
            }
        }
        .frame(height: 150) // Container size (height)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
*/

/*
struct ContentView: View {
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color.blue // Background color
                
                VStack(spacing: 10) {
                    HStack {
                        Spacer()
                        Capsule()
                            .fill(Color.white) // First capsule color
                            .frame(width: geometry.size.width - 30, height: 60)
                        Spacer()
                    }
                    
                    if geometry.size.width > 2 * (geometry.size.width - 30) / 2 {
                        HStack {
                            Spacer()
                            Capsule()
                                .fill(Color.red) // Second capsule color
                                .frame(width: geometry.size.width - 30, height: 60)
                            Spacer()
                        }
                        
                        HStack {
                            Capsule()
                                .fill(Color.green) // Third capsule color
                                .frame(width: (geometry.size.width - 50) / 2, height: 60)
                            Spacer()
                            Capsule()
                                .fill(Color.orange) // Fourth capsule color
                                .frame(width: (geometry.size.width - 50) / 2, height: 60)
                        }
                    } else {
                        HStack {
                            Capsule()
                                .fill(Color.red) // Second capsule color
                                .frame(width: (geometry.size.width - 50) / 2, height: 60)
                            Spacer()
                            Capsule()
                                .fill(Color.green) // Third capsule color
                                .frame(width: (geometry.size.width - 50) / 2, height: 60)
                            Spacer()
                            Capsule()
                                .fill(Color.orange) // Fourth capsule color
                                .frame(width: (geometry.size.width - 50) / 2, height: 60)
                        }
                    }
                }
                .padding(.horizontal, 15) // Add horizontal padding
            }
        }
        .frame(height: 150) // Container size (height)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
*/

struct ContentView: View {
    var body: some View {
        GeometryReader { geometry in
            ZStack() {
                Color.blue // Background color
                
                VStack(spacing: 50) {
                    CapsuleWithText(title: "First Capsule sdAsdf saDF s saDf ASdf sdfsdf AsdfsSADfsdf SDfsdfsd  sajdhf usdfhg liksa l kjsdgfhj sd sjahdfs jks dfjksdhfkj asdjfkh sdjkfh  ksjdfhsjkdfh sjkdfh  jkhsd fjkasdhf  jksdhfjdshf kjasdhh  kasjdhf ", color: .white, width: geometry.size.width - 30)
                    
                    if geometry.size.width > 2 * (geometry.size.width - 30) / 2 {
                        CapsuleWithText(title: "Second and Bigger Capsule", color: .red, width: geometry.size.width - 30)
                        
                        HStack(spacing: 70) {
                            CapsuleWithText(title: "Third Capsule", color: .green, width: (geometry.size.width - 50) / 2)
                            CapsuleWithText(title: "Fourth Capsule", color: .orange, width: (geometry.size.width - 50) / 2)
                        }
                    } else {
                        HStack(spacing: 10) {
                            CapsuleWithText(title: "Second Capsule", color: .red, width: (geometry.size.width - 50) / 2)
                            CapsuleWithText(title: "Third Capsule", color: .green, width: (geometry.size.width - 50) / 2)
                            CapsuleWithText(title: "Fourth Capsule", color: .orange, width: (geometry.size.width - 50) / 2)
                        }
                    }
                }
                .padding(.horizontal, 15) // Add horizontal padding
            }
        }
        .frame(height: 250) // Container size (height)
    }
}

struct CapsuleWithText: View {
    let title: String
    let color: Color
    let width: CGFloat
    
    var body: some View {
        HStack {
            Text(title)
                .foregroundColor(.black) // Text color
                .font(.system(size: 14)) // Text font size
                .padding(.horizontal, 8) // Add horizontal padding to the text
        }
        .background(
            Capsule()
                .fill(color)
                .frame(width: width, height: 60)
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

