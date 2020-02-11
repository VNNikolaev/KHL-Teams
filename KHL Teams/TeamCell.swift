//
//  TeamCell.swift
//  KHL Teams
//
//  Created by Васлий Николаев on 27.01.2020.
//  Copyright © 2020 Васлий Николаев. All rights reserved.
//

import UIKit

class TeamCell: UITableViewCell {

    @IBOutlet weak var teamImageView: UIImageView!
    @IBOutlet weak var teamNameLabel: UILabel!
    @IBOutlet weak var teamConferenceLabel: UILabel!
    @IBOutlet weak var teamLocationLabel: UILabel!
    
    func configure(with team: Team){
        
        teamNameLabel.text = team.team.name
        teamConferenceLabel.text = team.team.conference
        teamLocationLabel.text = team.team.location
        
        DispatchQueue.global().async {
            guard let url = team.team.image else {return}
            guard let imageUrl = URL(string: url) else { return }
            guard let imageData = try? Data(contentsOf: imageUrl) else { return }
            
            DispatchQueue.main.async {
                self.teamImageView.image = UIImage(data: imageData)
            }
        }
    }
}
