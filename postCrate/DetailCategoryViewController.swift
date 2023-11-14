//
//  DetailCategoryViewController.swift
//  postCrate
//
//  Created by Kimberly Sejas on 11/11/23.
//


import UIKit



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
        cell.postUrlLabel.text = post.url
        return cell
        
    }
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         let post = posts[indexPath.row]
         if let url = URL(string: post.url){
             if UIApplication.shared.canOpenURL(url){
                 UIApplication.shared.open(url, options: [:], completionHandler: nil)
             }else{
                 // url cannot be opened
                 showInvalidURL()
             }
         }
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
    
//    private func getInstagramPostImage(url: String){
//        var urlMedia = url + "media?size=l"
//        
//        let url = URL(string: urlMedia)
//        let task = URLSession.shared.dataTask(with: url!){ (data, resp, error) in
//            guard let data = data else{
//                print("data is nill")
//                return
//            }
//            guard let htmlString = String(data: data, encoding: String.Encoding.utf8) else{
//                print("cannot cast data into string")
//                return
//            }
//            print(htmlString)
//        }
//        task.resume()
//    }

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
