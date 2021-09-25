//
//  RepoResponse.swift
//  GitClient
//
//  Created by Mozhgan on 9/24/21.
//

import Foundation
struct RepoResponse : Codable {
    let id : Int
    let name : String
    let description : String?
}
//"id": 1296269,
//    "node_id": "MDEwOlJlcG9zaXRvcnkxMjk2MjY5",
//    "name": "Hello-World",
//    "full_name": "octocat/Hello-World",
//    "owner": {
//      "login": "octocat",
//      "id": 1,
//      "node_id": "MDQ6VXNlcjE=",
//      "avatar_url": "https://github.com/images/error/octocat_happy.gif",
//      "gravatar_id": "",
//      "url": "https://api.github.com/users/octocat",
//      "html_url": "https://github.com/octocat",
//      "followers_url": "https://api.github.com/users/octocat/followers",
//      "following_url": "https://api.github.com/users/octocat/following{/other_user}",
//      "gists_url": "https://api.github.com/users/octocat/gists{/gist_id}",
//      "starred_url": "https://api.github.com/users/octocat/starred{/owner}{/repo}",
//      "subscriptions_url": "https://api.github.com/users/octocat/subscriptions",
//      "organizations_url": "https://api.github.com/users/octocat/orgs",
//      "repos_url": "https://api.github.com/users/octocat/repos",
//      "events_url": "https://api.github.com/users/octocat/events{/privacy}",
//      "received_events_url": "https://api.github.com/users/octocat/received_events",
//      "type": "User",
//      "site_admin": false
//    },
