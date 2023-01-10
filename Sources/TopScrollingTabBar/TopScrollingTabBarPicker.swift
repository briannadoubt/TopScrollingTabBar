//
//  TopScrollingTabBarPicker.swift
//  TopScrollingTabBar
//
//  Created by Bri on 1/10/23.
//

import SwiftUI

struct TopScrollingTabBarPicker<Tab: TopTab>: View {
    @Binding var selection: Tab

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack {
                ForEach(Tab.allCases) { tab in
                    Group {
                        if tab == selection {
                            Text(tab.title)
                                .bold()
                                .foregroundColor(.accentColor)
                                .padding(.top, 12)
                                .padding(.horizontal, 12)
                                .padding(.bottom, 8)
                                .background {
                                    TabBackground()
                                    #if os(macOS)
                                        .fill(Color(nsColor: .windowBackgroundColor))
                                    #else
                                        .fill(Color(.systemBackground))
                                    #endif
                                }
                        } else {
                            Text(tab.title)
                                .padding(10)
                                .foregroundColor(.white)
                        }
                    }
                    .tag(tab)
                    .onTapGesture {
                        selection = tab
                    }
                    .padding(.top, 4)
                }
            }
            .padding(.horizontal, 10)
        }
        .background(Color.accentColor)
    }
}

struct TopScrollingTabBarPicker_Previews: PreviewProvider {
    struct Preview: View {
        @State var tab: PreviewTab = .saved
        var body: some View {
            TopScrollingTabBarPicker(selection: $tab)
                .fixedSize()
                .padding()
        }
    }
    static var previews: some View {
        Preview()
            
    }
}
