//
//  ViewController.swift
//  TableViewNotes
//
//  Created by Kelsey Collins on 10/23/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    
    @IBOutlet weak var textLable: UITextField!
    //var when theres change, let is same
var movie = ["Brave","Cars","Up"]
var selectedMovie = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //Connect them
        tableViewOutlet.dataSource = self
        tableViewOutlet.delegate = self
        
    }


    @IBOutlet weak var tableViewOutlet: UITableView!
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movie.count
    }
    
    //populate table
    //withIdentifier: "__" use the identifiyer
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableViewOutlet.dequeueReusableCell(withIdentifier: "myCell")!
        cell.detailTextLabel?.text = "Sad"
        cell.textLabel?.text = movie[indexPath.row]
        return cell
    }
    
    // Adding Movie
    
    //get what ever you selected
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //safly unwrap
        if let cat = tableViewOutlet.cellForRow(at: indexPath)?.textLabel?.text{
            selectedMovie = cat
            print(selectedMovie)
        }
    }
    
    
    
    @IBAction func addMovies(_ sender: UIBarButtonItem) {
        movie.append(textLable.text!)
        //refresh
        tableViewOutlet.reloadData()
    }
    
    //delete Movie when you swip left

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            movie.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    
}

