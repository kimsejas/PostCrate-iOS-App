//
//  AddCategoriesViewController.swift
//  postCrate
//
//  Created by Kimberly Sejas on 11/10/23.
//

import UIKit

class AddCategoriesViewController: UIViewController {
    
    @IBOutlet weak var categoryName: UITextField!
    
    @IBAction func doneAddCategory(_ sender: Any) {
        var curUserData = UserData.getUserdata()
        curUserData.categories.append(Category(name: categoryName.text ?? ""))
        UserData.saveUserData(curUserData)
        print("added category🎁")
        print(UserData.getUserdata().categories)

    }
    override func viewDidLoad() {
        super.viewDidLoad()
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
