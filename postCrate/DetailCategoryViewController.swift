//
//  DetailCategoryViewController.swift
//  postCrate
//
//  Created by Kimberly Sejas on 11/11/23.
//


import UIKit
import NukeExtensions



class DetailCategoryViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
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
        let imageUrl = post.content[0].media[0].url
        NukeExtensions.loadImage(with: imageUrl, into: cell.postImage)
        return cell
        
    }
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         let post = posts[indexPath.row]
//         if let url = URL(string: post.post_url){
         if UIApplication.shared.canOpenURL(post.post_url){
                 UIApplication.shared.open(post.post_url, options: [:], completionHandler: nil)
             }else{
                 // url cannot be opened
                 showInvalidURL()
             }
//         }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // Adjust this value to the desired height for your cells
        return 152.0
    }

    
    
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var categoryName: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
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
    
    private func showInvalidURL(){
        let alert = UIAlertController(title: "Error", message: "URL is invalid.", preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
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
