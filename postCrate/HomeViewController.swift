//
//  HomeViewController.swift
//  postCrate
//
//  Created by Kimberly Sejas on 11/7/23.
//

import UIKit

var categories = [Category(name: "gift ideas"),
                  Category(name: "study hacks"),
                  Category(name: "personal finance")]

class HomeViewController: UIViewController, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath) as! CategoryCell


        let category = categories[indexPath.row]

        cell.label.text = category.name
        cell.label.textColor =  UIColor.blue


        return cell
    }
    
    @IBAction func addCategory(_ sender: Any) {
        
    }
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self


        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
