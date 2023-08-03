//
//  MBPullToRefreshContainer.swift
//  LoadingRefresh
//
//  Created by Sinuhé Ruedas on 03/08/23.
//

import Combine
import SwiftUI

private struct OffsetPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = 0

    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}

public struct MBPullToRefreshContainer<Content: View>: View {
    var content: () -> Content
    private let pullDownThreshold: CGFloat = 72.0
    @ObservedObject private var viewModel: ViewModel
    @State private var dragAmount = CGSize.zero

    public init(viewModel: ViewModel, @ViewBuilder content: @escaping () -> Content) {
        self.viewModel = viewModel
        self.content = content
    }

    public var body: some View {
        VStack {
            if UIAccessibility.isVoiceOverRunning {
                Text("Voice Over is Here!")
            }
            GeometryReader { geometry in
                wrappedViewOverlaid(geometry: geometry)
            }
        }
        .accessibilityIdentifier(viewModel.accessibility.identifier)
        .accessibilityLabel(viewModel.accessibility.label ?? "")
        .accessibilityHint(viewModel.accessibility.hint ?? "")
    }

    @ViewBuilder private var loadMoreContainer: some View {
        ZStack {
            switch viewModel.variant.style {
            case .regular:
                    Color.blue
                    .frame(height: 46)
            case .alternative:
                    Color.black
            }
        }
    }

    @ViewBuilder private var wrappedView: some View {
        ScrollView {
            content()
        }
        .onPreferenceChange(OffsetPreferenceKey.self) { offset in
            setupOffsetPreferenceChange(offset)
        }
    }

    @ViewBuilder private var loadingView: some View {
        if viewModel.configuration.isLoading {
            loadMoreContainer
        }
    }

    @ViewBuilder private func wrappedViewOverlaid(geometry: GeometryProxy) -> some View {
        VStack {
            loadingView
            ScrollView {
                content()
                    .overlay(
                        loadMoreContainer.offset(y: dragAmount.height - 140),
                        alignment: .top)
                    .anchorPreference(key: OffsetPreferenceKey.self, value: .top) { geometry[$0].y }
            }
            .onPreferenceChange(OffsetPreferenceKey.self) { offset in
                setupOffsetPreferenceChange(offset)
            }
        }
    }

    // MARK: Helpers
    private func setupOffsetPreferenceChange(_ offset: CGFloat) {
        if viewModel.configuration.isLoading {
            dragAmount.height = 2 * pullDownThreshold - offset
            return
        }
        if offset < pullDownThreshold {
            dragAmount.height = offset
        }
        if offset > pullDownThreshold {
            viewModel.interaction.onPullDown()
            dragAmount.height = 2 * pullDownThreshold - offset
        }
    }
}
