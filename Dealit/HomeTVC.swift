//
//  HomeTVC.swift
//  Dealit
//
//  Created by Mohammed Ismayil on 10/01/22.
//

import UIKit

class HomeTVC: UITableViewCell {

    @IBOutlet weak var profileLbl: UILabel!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var profileImg: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func setCellData(data:HomeUserProfileModel){
        self.nameLbl.text = data.name
        self.profileLbl.text = data.desc
        self.profileImg.load(url: URL(string: data.image) ?? URL(fileURLWithPath: ""))
    }

}
