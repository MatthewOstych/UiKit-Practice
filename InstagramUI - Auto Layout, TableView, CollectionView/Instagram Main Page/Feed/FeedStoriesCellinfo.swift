//
//  FeedStoriesCellinfo.swift
//  Instagram Main Page
//
//  Created by Mathew Lantsov on 16.03.2024.
//

import Foundation
import UIKit

struct FeedStoriesItemCellinfo {
    let image: UIImage
    let username: String
    let isAddButtonVisible: Bool
    let isNewStories: Bool
}


typealias FeedStoriesCellinfo = [FeedStoriesItemCellinfo]
