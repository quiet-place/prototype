//
//  tree.swift
//  prototype
//
//  Created by κΉνμ on 2022/04/11.
//

import Foundation
import SwiftUI

struct Treedata: Hashable, Codable {
    var name: String

    private var imageName: String
    var image: Image {
        Image(imageName)
    }
}
