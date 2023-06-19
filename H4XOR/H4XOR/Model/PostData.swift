//
//  PostData.swift
//  H4XOR
//
//  Created by Deepanshu Gautam on 13/11/22.
//

import Foundation

struct Results : Codable {
    let hits : [Post]
}

struct Post : Codable, Identifiable {
    var id: String {
        objectID
    }
    let objectID: String
    let points: Int
    let url: String
    let title: String
}
