//
//  AddPostViewController.swift
//  postCrate
//
//  Created by Kimberly Sejas on 11/11/23.
//

import UIKit

class AddPostViewController: UIViewController {
    var category: Category!
    var post: Post?

    @IBOutlet weak var storePostLabel: UILabel!
    @IBOutlet weak var enterPostDetail: UITextField!
    
    @IBAction func addPostButton(_ sender: Any) {
        var curUserData = UserData.getUserdata()
        let userCategories = UserData.getUserdata().categories
        if enterPostDetail.text == ""{
            showInvalidMessage(message: "Please paste a URL.")

        }
        if let selectedCategoryIndex = userCategories.firstIndex(where: {$0.name == category.name}){
            
            if Post.isURL(url: enterPostDetail.text!){
                fetchPost { post in
                            if let post = post {
//                                self?.post = post
                                curUserData.categories[selectedCategoryIndex].posts.append(post)
                                UserData.saveUserData(curUserData)
//                                print(self?.post)
                                print("added post🎁")
                                print(UserData.getUserdata().categories[selectedCategoryIndex].posts)
                            } else {
                                print("❌fetching failed.")
                                // Handle the case where post fetching failed
                            }
                        }
//                curUserData.categories[selectedCategoryIndex].posts.append(self.post!)
//                UserData.saveUserData(curUserData)
//                print(UserData.getUserdata().categories[selectedCategoryIndex].posts)
            }else{
                showInvalidMessage(message: "URL is invalid, please try again.")
            }
            
        }
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setStorePostLabel()

        // Do any additional setup after loading the view.
    }
    
    private func fetchPost(completion: @escaping (Post?) -> Void){
        let postURL = URL(string: enterPostDetail.text!)?.pathComponents
        let postURLBlog = postURL![1]
        let postURLID = postURL![2]
        let urlString = "https://api.tumblr.com/v2/blog/" + postURLBlog + "/posts?" + "id="+postURLID + "&npf=true&api_key=rZ9KyDFqL2nZwEIj5I8FqvjmhNbflrf94Xm8dqy6DwS7A4PkvI"
        print(urlString)
        let postAPIUrl = URL(string: urlString)!
        let session = URLSession.shared.dataTask(with: postAPIUrl) { data, response, error in
            
            if let error = error{
                print("❌ Error: \(error.localizedDescription)")
                return
            }
            guard let statusCode = (response as? HTTPURLResponse)?.statusCode, (200...299).contains(statusCode) else {
                print("❌ Response error: \(String(describing: response))")
                return
            }
            guard let data = data else{
                print("❌ Data is NIL")
                return
            }
            do {
                let decoder = JSONDecoder()
                let blog = try decoder.decode(Blog.self, from: data)
                DispatchQueue.main.async{
                    //should only be one post
                    let post = blog.response.posts.first
                    completion(post)
                }
            }catch{
                print("❌ Error decoding JSON: \(error.localizedDescription)")
                completion(nil)
            }
        }
        session.resume()
    }
    
    private func setStorePostLabel(){
        storePostLabel.text = "Store your post in " + category.name + " 📥"
    }
    
    private func showInvalidMessage(message: String){
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: UIAlertController.Style.alert)
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
