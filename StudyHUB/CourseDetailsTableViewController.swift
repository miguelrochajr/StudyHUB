//
//  CourseDetailsTableViewController.swift
//  StudyHUB
//
//  Created by Miguel Silva da Rocha Junior on 4/18/17.
//  Copyright © 2017 StudyHUB. All rights reserved.
//

import UIKit

class CourseDetailsTableViewController: UITableViewController {
    
    var files = [File]() //all files
    //var courses = [Course]() //
    var course2bDetailed: Course?
    
    var filesToShow = [File]()
    
    var selectedIndex: Int = 0
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //courses.append(Course.init(name: "Calculo 1", code: "ECT0121", university: "UFRN", semester: "2017.1", images: "michigan_wolverines"))
        
        
        //Files that are Questions
        files.append(File.init(name: "Questões 1a un", type: "question_icon", course: "Calculo 1", author: "@miguelrochajr"))
        files.append(File.init(name: "Lista 1a un", type: "question_icon", course: "Calculo 1", author: "@miguelrochajr"))
        files.append(File.init(name: "Revisão 1a un", type: "question_icon", course: "Calculo 4", author: "@ramonfava"))
        files.append(File.init(name: "Questões 2a un", type: "question_icon", course: "Calculo 1", author: "@miguelrochajr"))
        
        //Files that are Class Notes
        files.append(File.init(name: "Digital Image Process 1a un", type: "file_icon", course: "Calculo1", author: "@ramonfava"))
        files.append(File.init(name: "Lista transformada Z", type: "file_icon", course: "Processamento Digital de Sinais", author: "@miguelrochajr"))
        files.append(File.init(name: "Direito Civil 2", type: "file_icon", course: "Direito Civil 2", author: "@MatheusAndrade"))
        files.append(File.init(name: "Direito Eleitoral", type: "file_icon", course: "Direito Eleitoral 1", author: "@IagoDiogenes"))
        files.append(File.init(name: "Aula 25/09", type: "file_icon", course: "Inteligência Artificial", author: "@carlosGabriel"))
        
        //Files that are Videos
        files.append(File.init(name: "Transformada Z", type: "video_icon", course: "Calculo1", author: "@ramonfava"))
        files.append(File.init(name: "Séries de Fourier", type: "video_icon", course: "Processamento Digital de Sinais", author: "@miguelrochajr"))
        files.append(File.init(name: "Direito de ir e vir", type: "video_icon", course: "Direito Civil 2", author: "@MatheusAndrade"))
        files.append(File.init(name: "Eleição Municipal", type: "video_icon", course: "Direito Eleitoral 1", author: "@IagoDiogenes"))
        files.append(File.init(name: "Aula 25/09", type: "video_icon", course: "Inteligência Artificial", author: "@carlosGabriel"))
        
        filesToShow = files
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if(section == 0) {
            return 1
        }
        
        return filesToShow.count
        
    }
    
    //Defining the header
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        if section != 1{
            return nil
        }
        
        let headerView = UIView()
        headerView.backgroundColor = .white
        
        let segmentedControl = UISegmentedControl(frame: CGRect(x: 5, y: 5, width: tableView.frame.width - 20, height: 30))
        segmentedControl.insertSegment(withTitle: "Todos", at: 0, animated: false)
        segmentedControl.insertSegment(withTitle: "Questões", at: 1, animated: false)
        segmentedControl.insertSegment(withTitle: "Videos", at: 2, animated: false)
        
        segmentedControl.selectedSegmentIndex = self.selectedIndex
        segmentedControl.addTarget(nil, action: #selector(changeList(sender:)), for: .valueChanged)
        
        headerView.addSubview(segmentedControl)

        return headerView;
    }
    
//    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        
//        let headerView = Bundle.main.loadNibNamed("HeaderView", owner: self, options: nil)?.first as! HeaderView
//        
//        return headerView
//    }
//    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
       
        if(section == 1){
            return CGFloat(35)
        } else {
            return 0
        }
        
    }
    
    //End of header definition

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if (indexPath.section == 0){
            let cell = tableView.dequeueReusableCell(withIdentifier: "courseDetails", for: indexPath) as! CourseDetailsTableViewCell
            
            cell.name.text = course2bDetailed!.name
            cell.university.text = course2bDetailed!.university
            cell.semester.text = course2bDetailed!.semester
            cell.courseCode.text = course2bDetailed!.code
            cell.photo.image = UIImage(named: course2bDetailed!.images)
            
            return cell
            
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "files", for: indexPath) as! FileDetailsTableViewCell
            
            cell.fileName.text = filesToShow[indexPath.row].name
            cell.author.text = filesToShow[indexPath.row].author
            cell.course.text = filesToShow[indexPath.row].course
            cell.typeImage.image = UIImage(named: filesToShow[indexPath.row].type)
            
            return cell
        }
        
    }
    
    func searchByType(type: String) -> [File] {
        return files.filter { $0.type == type }
    }
    
    
    
    func changeList(sender: UISegmentedControl){
        
        self.selectedIndex = sender.selectedSegmentIndex
        
        switch self.selectedIndex {
        case 0:
            filesToShow = files
        case 1:
            filesToShow = searchByType(type: "file_icon")
        default:
            filesToShow = searchByType(type: "video_icon")
        }
        
        tableView.reloadData()
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
