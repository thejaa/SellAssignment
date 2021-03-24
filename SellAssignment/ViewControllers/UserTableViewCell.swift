//
//  UserTableViewCell.swift
//  SellAssignment
//
//  Created by Thejeswara Reddy on 22/03/21.
//

import UIKit

class UserTableViewCell: UITableViewCell {
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var companyWebsite: UILabel!
    @IBOutlet weak var company: UILabel!
    @IBOutlet weak var mobileNo: UILabel!
    @IBOutlet weak var view: UIView!
    @IBOutlet weak var isFavoriteImageView: UIImageView!
    private let userVM = UserDetailVM()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.view.layer.cornerRadius = 10.0
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(user : UserModel?){
        guard let user = user else {return}
        userName.text = user.username
        company.text = user.company.name
        mobileNo.text = user.phone
        companyWebsite.text = user.website
        isAddedToFavorite(emailId:user.email)
    }
    private func isAddedToFavorite(emailId:String){
        if userVM.isUseraddedAsFavorite(user: User(emailID: emailId)) {
            isFavoriteImageView.image = UIImage(named: "favorites")
        }else{
            isFavoriteImageView.image = UIImage(named: "unfavorites")
        }
    }
}
