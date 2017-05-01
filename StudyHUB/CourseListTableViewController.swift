//
//  CourseListTableViewController.swift
//  StudyHUB
//
//  Created by Miguel Silva da Rocha Junior on 4/18/17.
//  Copyright © 2017 StudyHUB. All rights reserved.
//

import UIKit

class CourseListTableViewController: UITableViewController {

    var searchedKeyword: String?
    var courses = [Course]() //inicializa alguns
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initializeCourses() //initial setup for the courses
        if(!searchedKeyword!.isEmpty){
            courses = searchResult(keyword: searchedKeyword!)
        }
        
    }
    
    private func initializeCourses(){
        courses.append(Course.init(name: "Calculus", code: "ECE103", university: "Michigan", semester: "Winter 2015", images: "michigan_wolverines"))
        courses.append(Course.init(name: "Physics", code: "ECE101", university: "MIT", semester: "Fall 2016", images: "mit"))
        courses.append(Course.init(name: "Calculo 3", code: "ECT0321", university: "UFRN", semester: "2018.1", images: "UFRN-PNG"))
    }
    
    private func searchResult(keyword: String) -> [Course] {
        
        var coursesMatched = [Course]()
        
        for currentcCourse in courses {
            if currentcCourse.name == keyword {
                coursesMatched.append(currentcCourse)
            }
        }
        return coursesMatched
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return courses.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "courseCell", for: indexPath) as! CourseListTableViewCell

        // Configure the cell...
        
        cell.couseName.text = courses[indexPath.row].name
        cell.courseUniversity.text = courses[indexPath.row].university
        cell.courseCode.text = courses[indexPath.row].code
        cell.courseImage.image = UIImage(named: courses[indexPath.row].images)

        return cell
    }

    

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showCourseDetails"{
            let index = tableView.indexPathForSelectedRow?.row
            if let newView = segue.destination as? CourseDetailsTableViewController {
                newView.course2bDetailed = courses[index!]
            }
            
        }
    }


}
