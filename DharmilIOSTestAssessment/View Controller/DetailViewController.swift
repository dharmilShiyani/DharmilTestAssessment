//
//  DetailViewController.swift
//  DharmilIOSTestAssessment
//
//  Created by Shiyani on 02/05/24.
//

import UIKit

class DetailViewController: UIViewController {

    //MARK: - Variable Declaration
    var modelData: ModelData?
    
    //MARK: - Outlet Declaration
    @IBOutlet var lblUserId: UILabel!
    @IBOutlet var lblid: UILabel!
    @IBOutlet var lblTitle: UILabel!
    @IBOutlet var lblBody: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.initConfig()
    }
    
}

//MARK: - Init Config
extension DetailViewController {
    
    private func initConfig() {
        self.dataBind()
    }
    
    private func dataBind(){
        guard let data = modelData else { return  }
        self.lblUserId.text = "\(data.userId)"
        self.lblid.text = "\(data.id)"
        self.lblTitle.text = data.title.localizedCapitalized
        self.lblBody.text = data.body.capitalizedSentence
    }
}

//MARK: - UI Button Action
extension DetailViewController {
    
    @IBAction func btnback(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
}

//MARK: - Extension
extension String {
    var capitalizedSentence: String {
        // 1
        let firstLetter = self.prefix(1).capitalized
        // 2
        let remainingLetters = self.dropFirst().lowercased()
        // 3
        return firstLetter + remainingLetters
    }
}
