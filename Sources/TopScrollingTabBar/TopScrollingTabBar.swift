//
//  SwiftUIView.swift
//  TopScrollingTabBar
//
//  Created by Bri on 1/10/23.
//

import SwiftUI

struct TopScrollingTabBar<Tab: TopTab, Content: View>: View {
    var alignment: HorizontalAlignment = .leading
    @Binding var selection: Tab
    @ViewBuilder var content: (_ tab: Tab) -> Content

    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: alignment) {
                TopScrollingTabBarPicker(selection: $selection)
                    .fixedSize(horizontal: false, vertical: true)
                ZStack {
                    #if os(macOS)
                    Color(nsColor: NSColor.windowBackgroundColor)
                        .ignoresSafeArea()
                    #else
                    Color(.systemBackground)
                        .ignoresSafeArea()
                    #endif
                    self.content(selection)
                        .transition(.asymmetric(insertion: .move(edge: .leading), removal: .move(edge: .trailing)))
                }
            }
        }
    }
}

struct TopScrollingTabBar_Previews: PreviewProvider {

    struct PreviewContentView: View {
        @State var selection: PreviewTab = .saved

        var body: some View {
            TopScrollingTabBar(selection: $selection.animation()) { tab in
                // For demo purposes
                List {
                    Text(tab.title)
                        .bold()
                        .font(.largeTitle)
                    Text("Something that is \(tab.title)")
                }
                .listStyle(.plain)

                // In a full app I'd switch on the Tab enum and generate the appropriate view.
//                switch tab {
//                case .saved:
//                    SavedThings()
//                case .booked:
//                    ...etc
//                }
            }
        }
    }
    static var previews: some View {
        PreviewContentView()
    }
}
