//
//  KHLTeamsViewController.swift
//  KHL Teams
//
//  Created by Васлий Николаев on 26.01.2020.
//  Copyright © 2020 Васлий Николаев. All rights reserved.
//

import UIKit
import Alamofire

class KHLTeamsViewController: UITableViewController {
    
    var teams: [Team] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchDataWithAlamofire()

        
    }

    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return teams.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TeamCell
        let team = teams[indexPath.row]
        
        cell.configure(with: team)

        

        return cell
    }
    
    // MARK: - TableViewDelegate
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    

   

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    func fetchDataWithAlamofire() {
        
        guard let url = URL(string: "https://khl.api.webcaster.pro/api/khl_mobile/teams_v2.json") else { return }
        
        request(url).validate().responseData { (dataResponse) in
            
            switch dataResponse.result {
            case .success(let value):
                do{
                    self.teams = try JSONDecoder().decode([Team].self, from: value)
                    
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                } catch let error {
                    print(error)
                }
            case .failure(let error):
                print(error)

            }
        }
    }
}
