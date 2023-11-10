//
//  HomeViewController.swift
//  postCrate
//
//  Created by Kimberly Sejas on 11/7/23.
//

import UIKit


class HomeViewController: UIViewController, UITableViewDataSource {
    var categories = [Category]()


    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var helloUsername: UILabel!
    @IBAction func addCategory(_ sender: Any) {
        self.performSegue(withIdentifier: "addCategories", sender: self)
    }
    
    // Refresh the categories
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        refreshCategories()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath) as! CategoryCell


        let category = categories[indexPath.row]

        cell.label.text = category.name

        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        setHelloUsername()
        
    }
    
    private func setHelloUsername(){
        helloUsername.text = "Hello " + (Username.shared.username ?? "") + " 👋"
    }
    
    private func refreshCategories(){
        self.categories = UserData.getUserdata().categories
        tableView.reloadData()
        print("refreshed 🛍️")
        print(self.categories)
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
