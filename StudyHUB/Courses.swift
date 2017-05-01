//
//  Courses.swift
//  StudyHUB
//
//  Created by Miguel Silva da Rocha Junior on 4/18/17.
//  Copyright © 2017 StudyHUB. All rights reserved.
//

import Foundation

class Course {
    var name: String
    var code: String
    var university: String
    var semester: String
    var images: String
    
    init(name: String, code: String, university: String, semester: String, images: String){
        self.name = name
        self.code = code
        self.university = university
        self.semester = semester
        self.images = images
    }
}
