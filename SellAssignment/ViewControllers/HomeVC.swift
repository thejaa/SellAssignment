//
//  HomeVC.swift
//  SellAssignment
//
//  Created by Thejeswara Reddy on 22/03/21.
//

import UIKit

class HomeVC: UIViewController {
    
    @IBOutlet weak var userTableView: UITableView!
    private let userVM = HomeViewModel()
    private var userDataSource = [UserModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print(applicationDirectoryPath())
        userVM.getUserData { (users) in
            guard let users = users else { return }
            self.userDataSource = users
            self.reloadTableView()
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        reloadTableView()
    }
}
extension HomeVC : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userDataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "userTableViewCell", for: indexPath) as? UserTableViewCell{
            cell.configureCell(user: userDataSource[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
    
}
extension HomeVC : UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if #available(iOS 13.0, *) {
            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
            if let vc = storyBoard.instantiateViewController(identifier: "userDetailScreen") as? UserDetailScreen {
                vc.userModel = userDataSource[indexPath.row]
                self.show(vc, sender: nil)
            }
        } else {
            // Fallback on earlier versions
        }
    }
}
extension HomeVC{
    //Get Directorypath
    private func applicationDirectoryPath() -> String {
        return NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).last! as String
    }
    
    private func reloadTableView(){
        DispatchQueue.main.async {
            self.userTableView.reloadData()
        }
    }
}
