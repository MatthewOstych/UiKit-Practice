//
//  ProfileStorageManager.swift
//  Instagram Main Page
//
//  Created by Mathew Lantsov on 26.03.2024.
//

import Foundation

public enum UserPostType {
    case photo, video
}

public enum profilePart {
    case header
    case body
    case stories
}
/// Represent a userpost
public struct UserPost {
    let image: String
}

public struct UserProfileStoriesCellInfo {
    let image: String
}

struct PostLikes {
    let username: String
    let postIdentifier: String
}

public enum jobList {
    case enterprenur
    case blogger
}


public struct ProfileInfo {
    let username: String
    let profileImage: String
    let subscribers: Int
    let subscribed: Int
    let name: String
    let job: jobList
    let description: String
    
    
}
