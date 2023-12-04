import SwiftUI

private typealias Configuration = MBPullToRefreshContainer<MBPullToRefreshContainerDummyView>.Configuration
private typealias Accesibility = MBPullToRefreshContainer<MBPullToRefreshContainerDummyView>.Accessibility
private typealias Interaction = MBPullToRefreshContainer<MBPullToRefreshContainerDummyView>.Interaction

struct MBPullToRefreshContainerPreview: View {
    var body: some View {
        VStack {
            Text("Regular")
            regularSection
        }
    }
}

private struct MBPullToRefreshContainerDummyView: View {
    var body: some View {
        HStack {
            Spacer()
            VStack {
                Group {
                    Text("Lorem Ipsum")
                        .frame(height: 440)
                        .background(Color.red)
                    Text("Lorem Ipsum")
                        .frame(height: 440)
                        .background(Color.blue)
                    Text("Lorem Ipsum")
                        .frame(height: 440)
                        .background(Color.gray)
                    Text("Lorem Ipsum")
                        .frame(height: 440)
                        .background(Color.green)
                    Text("Lorem Ipsum")
                        .frame(height: 440)
                        .background(Color.purple)
                    Text("Lorem Ipsum")
                        .frame(height: 440)
                        .background(Color.brown)
                    Text("Lorem Ipsum")
                        .frame(height: 440)
                        .background(Color.yellow)
                    Text("Lorem Ipsum")
                        .frame(height: 440)
                        .background(Color.white)
                    Text("Lorem Ipsum")
                        .frame(height: 440)
                        .background(Color.indigo)
                    Text("Lorem Ipsum")
                        .frame(height: 440)
                        .background(Color.red)
                }
            }
            Spacer()
        } .frame(alignment: .center)
    }
}

private struct RefreshRegularSection: View {
    @State var configuration = Configuration()
    var accesibility: Accesibility

    var body: some View {
        Text("MBPullToRefreshContainer Regular")
            let interaction = Interaction {
                self.configuration.isLoading = true
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    self.configuration.isLoading = false
                }
            }
            MBPullToRefreshContainer(
                viewModel: MBPullToRefreshContainer.ViewModel(
                    configuration: configuration,
                    accessibility: Accesibility(),
                    interaction: interaction)) {
                        MBPullToRefreshContainerDummyView()
            }
    }
}

private struct RefreshAlternativeSection: View {
    @State var configuration: Configuration
    var accesibility: Accesibility

    var body: some View {
        Text("MBPullToRefreshContainer Alternative")
            let interaction = Interaction {
                self.configuration.isLoading = true
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    configuration.isLoading = false
                }
            }
            MBPullToRefreshContainer(
                viewModel: MBPullToRefreshContainer.ViewModel(
                    configuration: configuration,
                    variant: .alternative,
                    accessibility: Accesibility(),
                    interaction: interaction)) {
                        MBPullToRefreshContainerDummyView()
            }
    }
}

@ViewBuilder private var regularSection: some View {
    RefreshRegularSection(
        configuration: .init(),
        accesibility: .init())
}

@ViewBuilder private var alternativeSection: some View {
    RefreshAlternativeSection(
        configuration: .init(),
        accesibility: .init())
}

struct MBPullToRefreshContainerPreviews: PreviewProvider {
    static var previews: some View {
        MBPullToRefreshContainerPreview()
    }
}
