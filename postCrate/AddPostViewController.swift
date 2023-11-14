//
//  AddPostViewController.swift
//  postCrate
//
//  Created by Kimberly Sejas on 11/11/23.
//

import UIKit

class AddPostViewController: UIViewController {
    var category: Category!

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
                curUserData.categories[selectedCategoryIndex].posts.append(Post(url: enterPostDetail.text ?? ""))
                UserData.saveUserData(curUserData)
                print("added post🎁")
                print(UserData.getUserdata().categories[selectedCategoryIndex].posts)
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
