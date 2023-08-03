import Combine

public extension MBPullToRefreshContainer {
    /// Visual configuration of MBPullToRefreshContainer
    struct Configuration {
        public var isLoading = false

        public init() { }
    }

    final class ViewModel: ObservableObject {
        /// Visual information of the component
        @Published public var configuration: Configuration
        @Published public var variant: Variant
        @Published public var accessibility: Accessibility
        @Published public var interaction: Interaction
        /// ViewModel initialization
        /// - Parameters:
        /// - configuration: Visual configuration.
        /// - variant: Visual variants.
        /// - accesibility: Accessibility data for the component.
        /// - interaction: user interaction of the component.
        public init(configuration: Configuration,
                    variant: Variant = .regular,
                    accessibility: Accessibility,
                    interaction: Interaction) {
            self.configuration = configuration
            self.variant = variant
            self.accessibility = accessibility
            self.interaction = interaction
        }
    }

    enum MBPullToRefreshScrollViewStyle {
        case regular
        case alternative
    }
    /// Variant Data
    struct Variant {
        let style: MBPullToRefreshScrollViewStyle

        private init(style: MBPullToRefreshScrollViewStyle = .regular) {
            self.style = style
        }
        /// This regular variant change setting to white background.
        public static var regular: Variant {
            Variant(style: .regular)
        }

        /// This alternative variant change setting to dark background.
        public static var alternative: Variant {
            Variant(style: .alternative)
        }
    }

    /// Accessibility Data
    struct Accessibility {
        public var identifier: String
        public var label: String?
        public var hint: String?

        /// Accessibility initialization
        /// - Parameters:
        ///   - identifier: Accessibility identifier for MBPullToRefreshContainer. It will be propagated to inner components.
        ///   - label: Accessibility label for MBPullToRefreshContainer header. If not set it'll be the content of its title.
        ///   - hint: accessibilityHint for MBQuickButton.
        ///   By default is MBPullToRefreshContainer

        public init(identifier: String = "MBPullToRefresh",
                    label: String? = "Loading more content",
                    hint: String? = "Waiting for the content to load") {
            self.identifier = identifier
            self.label = label
            self.hint = hint
        }
    }

    /// Interaction Data
    struct Interaction {
        /// Method triggered each time the user pulls down the page.
        var onPullDown: (() -> Void)

        public init(onPullDown: @escaping () -> Void) {
            self.onPullDown = onPullDown
        }
    }
}
