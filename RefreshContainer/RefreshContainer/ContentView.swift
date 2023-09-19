//
//  ContentView.swift
//  RefreshContainer
//
//  Created by Sinuhé Ruedas on 11/09/23.
//

import SwiftUI
import Combine

public struct RefreshContainer: View {
    @ObservedObject private var viewModel: ViewModel
    // MARK: - Public methods
    // Parameter viewModel: Content to display
    public var body: some View {
        VStack {
           loaderView
        }
        .padding(.vertical, 24)
        .padding(.top, 16)
        .padding(.bottom, 64)
        .background(Color.gray)
        .frame(maxWidth: .infinity)
        .accessibilityElement(children: ignore)
        .accessibilityIdentifier(viewModel.accessibility.identifier)
        .accessibilityLabel(viewModel.accessibility.loaderIdentifier)
    }
}

// MARK: - UI Customization
private extension RefreshContainer {
    @ViewBuilder var loaderView: some View {
        MyLoader(MyLoader.ViewModel(variant: .regular))
            .accessibilityIdentifier(viewModel.accessibility.identifier)
    }
}

struct RefreshContainer_Previews: PreviewProvider {
    static let accessibility = RefreshContainer.Accessibility(
        identifier: "RefreshContainer")
    
    static let viewModel = RefreshContainer.ViewModel(accessibility: accessibility)
    static var previews: some View {
        RefreshContainer(viewModel: ViewModel)
    }
}
