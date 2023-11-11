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
        var userCategories = UserData.getUserdata().categories
        if let selectedCategoryIndex = userCategories.firstIndex(where: {$0.name == category.name}){
            curUserData.categories[selectedCategoryIndex].posts.append(Post(imageURL: enterPostDetail.text ?? ""))
            UserData.saveUserData(curUserData)
            print("added post🎁")
            print(UserData.getUserdata().categories[selectedCategoryIndex].posts)
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
