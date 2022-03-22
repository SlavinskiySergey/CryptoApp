//
//  AssetDetailsDto.swift
//  ClientNetworkService
//

import Foundation

struct AssetDetailsDto: Decodable {
    let data: AssetDataDto
}

struct AssetDataDto: Decodable {
    let profile: ProfileDto
}

struct ProfileDto: Decodable {
    let general: GeneralDto
}

struct GeneralDto: Decodable {
    let overview: OverviewDto
}

struct OverviewDto: Decodable {
    let tagline: String?
    let projectDetails: String?
    let officialLinks: [OfficialLinkDto]?

    enum CodingKeys: String, CodingKey {
        case tagline
        case projectDetails = "project_details"
        case officialLinks = "official_links"
    }
}

struct OfficialLinkDto: Codable {
    let name: String
    let link: String
}
