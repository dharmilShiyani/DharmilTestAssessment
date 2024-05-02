//
//  ViewController.swift
//  DharmilIOSTestAssessment
//
//  Created by Shiyani on 02/05/24.
//

import UIKit

class ViewController: UIViewController {

    //MARK: - Variable Declaration
    var viewModel = ViewModel()
    
    //MARK: - Outlet Declaration
    @IBOutlet var tblView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.initConfig()
    }


}

//MARK: - Init Config
extension ViewController {
    
    private func initConfig() {
        self.navigationController?.navigationBar.largeContentTitle = "Data List"
        self.viewModel.viewController = self
        self.tblView.register(UINib(nibName: "ListTCell", bundle: nil), forCellReuseIdentifier: "ListTCell")
        self.tblView.delegate = self
        self.tblView.dataSource = self
        self.viewModel.fetchDataFromServer()
    }
    
}

//MARK: - UITablview Delegate & Datasource Methods
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.viewModel.arrList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ListTCell", for: indexPath) as? ListTCell else { return UITableViewCell() }
        
        if self.viewModel.arrList.indices ~= indexPath.row {
            cell.dataBind(obj: self.viewModel.arrList[indexPath.row])
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController {
            vc.modelData = self.viewModel.arrList[indexPath.row]
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
