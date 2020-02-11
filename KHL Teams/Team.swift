//
//  Team.swift
//  KHL Teams
//
//  Created by Васлий Николаев on 26.01.2020.
//  Copyright © 2020 Васлий Николаев. All rights reserved.
//

import Foundation

struct Team: Decodable {
    let team: TeamDetails
}

struct TeamDetails: Decodable {
    let name: String?
    let conference: String?
    let location: String?
    let image: String?
    let division: String?
    let division_key: String?
}
