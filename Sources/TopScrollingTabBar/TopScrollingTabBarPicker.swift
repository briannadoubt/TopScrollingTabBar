//
//  SwiftUIView.swift
//  
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
                                .padding(12)
                                .background {
                                    TabBackground(cornerRadius: 16)
                                        .fill(Color.white)
                                }
                        } else {
                            Text(tab.title)
                                .padding(4)
                                .foregroundColor(.white)
                        }
                    }
                    .tag(tab)
                    .onTapGesture {
                        selection = tab
                    }
                }
            }
            .padding(.horizontal, 10)
        }
        .background(Color.accentColor)
    }
}

struct TopScrollingTabBarPicker_Previews: PreviewProvider {
    static var previews: some View {
        TopScrollingTabBarPicker(.constant())
    }
}
