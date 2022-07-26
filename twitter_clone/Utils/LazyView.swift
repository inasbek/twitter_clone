//
//  LazyView.swift
//  twitter_clone
//
//  Created by SI MOHAMMED Sonia-taous (Canal Plus ) on 22/07/2022.
//

import SwiftUI

struct LazyView<Content: View>: View {
    let build: () -> Content
    init(_ build: @autoclosure @escaping() -> Content) {
        self.build = build
    }
   
    var body: Content {
        build()
    }
}
