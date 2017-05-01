//
//  Files.swift
//  StudyHUB
//
//  Created by Miguel Silva da Rocha Junior on 4/18/17.
//  Copyright © 2017 StudyHUB. All rights reserved.
//

import Foundation

class File {
    var name: String
    var type: String
    var course: String
    var author: String
    
    init(name: String, type: String, course: String, author: String) {
        self.name = name
        self.type = type
        self.course = course
        self.author = author
    }
}
