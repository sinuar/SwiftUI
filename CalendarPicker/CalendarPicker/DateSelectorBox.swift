//
//  CalPickerView.swift
//  CalendarPicker
//
//  Created by Sinuhé Ruedas on 22/05/23.
//

import SwiftUI

struct DateSelectorBox: View {
    // MARK: - Properties
    let viewModel: DateViewModel
    @State private var showCalendar: Bool = false
    
    // MARK: - Private properties
    @ViewBuilder
    private var leadingImage: some View {
        Image(systemName: viewModel.iconName)
            .resizable()
            .frame(width: 24, height: 24)
            .padding(.leading)
    }
    @ViewBuilder
    private var title: some View {
        Text(viewModel.title)
            .font(.subheadline)
            .fontWeight(.bold)
            .foregroundColor(Constant.textColor)
            .multilineTextAlignment(.leading)
            .padding(.top, 6)
    }
    
    @ViewBuilder
    private var date: some View {
        Text(viewModel.date)
            .font(.title3)
            .multilineTextAlignment(.leading)
            .padding(.bottom, 6)
    }
    
    var body: some View {
        HStack(spacing: 16) {
            leadingImage
            VStack(alignment: .leading, spacing: 3) {
                title
                date
            }
            Spacer()
        }
        .overlay(
            RoundedRectangle(cornerRadius: 14)
                .stroke(Constant.accentColor, lineWidth: 2)
        )
        .padding(.top, 8)
        .onTapGesture {
            showCalendar = true
        }
        .sheet(isPresented: $showCalendar) {
            Button {
                print("Button tapped")
            } label: {
                Text("Day")
            }

        }
        
    }
    
    // MARK: - Helpers
    private enum Constant {
        static let accentColor = Color(red: 146/255, green: 146/255, blue: 146/255)
        static let textColor = Color(red: 128/255, green: 128/255, blue: 11/255)
    }
}

struct DateSelectorBoxView_Previews: PreviewProvider {
    static var previews: some View {
        DateSelectorBox(viewModel: DateViewModel(iconName: "", title: "", date: ""))
    }
}
