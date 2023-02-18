//
//  Model.swift
//  HW14CollectionView
//
//  Created by Олег Стригунов on 01.02.2023.
//

import Foundation

struct PackImages {
    var image: String
}

struct Model {
    var title: String
    var image: String
    var number: String
    var addIcon: Icon
    var cellType: CellType
    var images: [String]
}


enum Icon: String {
    case heart = "heart.fill"
    case lock = "lock.fill"
    case none = ""
}

enum CellType {
    case map, people, none
}


let datalPeopleImg: [String] = [
   "img05", "img04", "img03", "img06"
]

