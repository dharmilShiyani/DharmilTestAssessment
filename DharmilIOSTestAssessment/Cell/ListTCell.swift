//
//  ListTCell.swift
//  DharmilIOSTestAssessment
//
//  Created by Shiyani on 02/05/24.
//

import UIKit

class ListTCell: UITableViewCell {

    //MARK: - Outlet Declaration
    @IBOutlet var lblIndex: UILabel!
    @IBOutlet var lblTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //MARK: - DataBind Method
    func dataBind(obj: ModelData) {
        self.lblIndex.text = "\(obj.id)"
        self.lblTitle.text = obj.title.localizedCapitalized
    }
}
