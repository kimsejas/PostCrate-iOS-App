//
//  DetailCategoryViewController.swift
//  postCrate
//
//  Created by Kimberly Sejas on 11/11/23.
//

import UIKit

class DetailCategoryViewController: UIViewController, UITableViewDataSource {
    var category: Category!
    
    var posts = [Post]()
    
    @IBAction func addPost(_ sender: Any) {
        self.performSegue(withIdentifier: "addPost", sender: self.category)
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        refreshPosts()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostTableViewCell", for: indexPath) as! PostTableViewCell
        let post = posts[indexPath.row]
        cell.postLabel.text = post.imageURL
        return cell
        
    }
    
    
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var categoryName: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        categoryName.text = category.name
    }
    
    
    private func refreshPosts(){
        var userCategories = UserData.getUserdata().categories
        if let selectedCategory = userCategories.first(where: {$0.name == category.name}){
            posts = selectedCategory.posts
        }
        tableView.reloadData()
        print("refreshed posts🛍️")
        print(self.posts)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addPost" {
            if let destinationVC = segue.destination as? AddPostViewController {
                if let selectedCategory = sender as? Category {
                    destinationVC.category = selectedCategory
                }
            }
        }
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
