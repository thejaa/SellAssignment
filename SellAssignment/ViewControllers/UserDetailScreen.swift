//
//  UserDetailScreen.swift
//  SellAssignment
//
//  Created by Thejeswara Reddy on 23/03/21.
//

import UIKit

class UserDetailScreen: UIViewController {
    
    var userModel : UserModel?
    var dataSource : UserModel?
    
    @IBOutlet weak var favoriteBtn: UIBarButtonItem!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var street: UILabel!
    @IBOutlet weak var suite: UILabel!
    @IBOutlet weak var city: UILabel!
    @IBOutlet weak var zipcode: UILabel!
    @IBOutlet weak var companyName: UILabel!
    @IBOutlet weak var companyCatch: UILabel!
    @IBOutlet weak var companyBs: UILabel!
    @IBOutlet weak var phoneNumber: UILabel!
    @IBOutlet weak var website: UILabel!
    
    private let userVM = UserDetailVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = userModel
        setUp()
        isFavorite()
    }
    @IBAction func addToFavoritesAction(_ sender: Any) {
        if userVM.isUseraddedAsFavorite(user: User(emailID: dataSource?.email ?? "")) {
            favoriteBtn.image = UIImage(named: "unfavorites")
           _ = userVM.deleteFavorite(user: User(emailID: dataSource?.email ?? ""))
            
        }else{
            if userVM.addToFavorites(user: User(emailID: dataSource?.email ?? "")){
                favoriteBtn.image = UIImage(named: "favorites")
            }
        }
    }
    
    private func isFavorite(){
        if userVM.isUseraddedAsFavorite(user: User(emailID: dataSource?.email ?? "")) {
            favoriteBtn.image = UIImage(named: "favorites")
        }else{
            favoriteBtn.image = UIImage(named: "unfavorites")
        }
    }
}
extension UserDetailScreen{
    private func setUp(){
        name.text = dataSource?.name
        username.text = dataSource?.username
        street.text = dataSource?.address.street
        suite.text = dataSource?.address.suite
        city.text = dataSource?.address.city
        zipcode.text = dataSource?.address.zipcode
        companyName.text = dataSource?.company.name
        companyCatch.text = dataSource?.company.catchPhrase
        companyBs.text = dataSource?.company.bs
        phoneNumber.text = dataSource?.phone
        website.text = dataSource?.website
        
    }
}
