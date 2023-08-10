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
    @State private var pullDownOnVoiceOver = true 
    @State private var offsets = [CGFloat]()
    @State private var label1Focused = false

    public init(viewModel: ViewModel, @ViewBuilder content: @escaping () -> Content) {
        self.viewModel = viewModel
        self.content = content
    }

    public var body: some View {
        VStack {
            GeometryReader { geometry in
                if UIAccessibility.isVoiceOverRunning {
                    wrappedViewOverlaidForVoiceOver(geometry: geometry)
                } else {
                    wrappedViewOverlaid(geometry: geometry)
                }
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                if
                    (UIAccessibility.isVoiceOverRunning) {
                    let message: NSAttributedString = NSAttributedString(
                        string: viewModel.accessibility.label ?? "",
                        attributes: [.accessibilitySpeechQueueAnnouncement: true])
                    UIAccessibility.post(notification: .announcement, argument: message)
                }
            }
        }
        .accessibilityAddTraits(.isSelected)
        .accessibilityIdentifier(viewModel.accessibility.identifier)
        .accessibilityLabel(viewModel.accessibility.label ?? "This is the first label")
        .accessibilityHint(viewModel.accessibility.hint ?? "This is the hint to be read")
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

    @ViewBuilder private func contentConfigured(geometry: GeometryProxy) -> some View {
        content()
            .overlay(
                loadMoreContainer.offset(y: dragAmount.height - 140),
                alignment: .top)
            .anchorPreference(key: OffsetPreferenceKey.self, value: .top) { geometry[$0].y }
    }


    @ViewBuilder private func wrappedViewOverlaidForVoiceOver(geometry: GeometryProxy) -> some View {
        VStack {
            loadingView
            if pullDownOnVoiceOver {
                ScrollView {
                    contentConfigured(geometry: geometry)
                        .accessibilityScrollAction { edge in
                            setupAccessibilityScrollAction(on: edge)
                        }
                }
                .onPreferenceChange(OffsetPreferenceKey.self) { offset in
                    setupOffsetPreferenceChange(offset)
                }
            } else {
                ScrollView {
                    contentConfigured(geometry: geometry)
                }
                .onPreferenceChange(OffsetPreferenceKey.self) { offset in
                    setupPreferenceChangeForVoiceOver(offset)
                }
            }

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

    private func setupPreferenceChangeForVoiceOver(_ offset: CGFloat) {
        offsets.append(offset)
        let shouldAllowPullDownToRefresh = offset > 0 && offsets.count > 1
        if shouldAllowPullDownToRefresh {
            pullDownOnVoiceOver = true
            offsets = []
            return
        }
        if offset < -100 { offsets = [] }
        setupOffsetPreferenceChange(offset)
    }

    private func setupAccessibilityScrollAction(on edge: Edge) {
        switch edge {
        case .top:
            viewModel.interaction.onPullDown()
        case .bottom:
            pullDownOnVoiceOver = false
        default:
            break
        }
    }
}

