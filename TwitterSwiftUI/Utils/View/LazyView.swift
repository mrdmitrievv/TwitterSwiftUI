//
//  LazyView.swift
//  TwitterSwiftUI
//
//  Created by Артём Дмитриев on 22.11.2022.
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

