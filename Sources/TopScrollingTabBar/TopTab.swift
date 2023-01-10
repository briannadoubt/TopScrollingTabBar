//
//  TopTab.swift
//  TopScrollingTabBar
//
//  Created by Bri on 1/10/23.
//

import Foundation

protocol TopTab: RawRepresentable, Identifiable, CaseIterable, Hashable where AllCases == Array<Self> {
    var title: String { get }
}
