//
//  DetailModels.swift
//  RickMortyApp
//
//  Created by Nevilkumar Lad on 06/01/22.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit
enum DetailType {
    case characters
    case episodes
    case locations
}

enum DetailLoaderType {
    case general
}

enum DetailErrorType {
    case backend
    case custom(message: String)
}

enum DetailModel {
    // MARK: Use cases

    enum FetchDetails {
        struct Request {
        }

        struct Response {
            var character: Character?
            var episode: Episode?
            var locationDetails: LocationDetails?
        }

        struct ViewModel {

            struct DisplayedSection {
                var sectionTitle: String
                var displayedListItem: [DisplayedListItem]
            }

            struct DisplayedListItem {
                var title: String
                var subTitle: String
                var info: String?
                var imageURL: String?
                /// Set to `true`  if detailed data is present for the current item and allow to show next screen
                var showDetail: Bool
                var isLoadingCell: Bool = false
            }

            var displayedSections: [DisplayedSection]


        }
    }


    enum FetchItemDetails {
        struct Request {
            var index: Int
        }
        struct Response {
        }
        struct ViewModel {
        }
    }
    enum NextScene {
        struct Request {
        }
        struct Response {
            var character: Character?
            var episode: Episode?
            var locationDetails: LocationDetails?
            var detailsType: DetailType?
        }

        struct ViewModel {
            var character: Character?
            var episode: Episode?
            var locationDetails: LocationDetails?
            var detailsType: DetailType?
        }
    }
}
