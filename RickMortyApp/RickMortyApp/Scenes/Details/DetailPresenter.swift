//
//  DetailPresenter.swift
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

protocol DetailPresentationLogic {
    func presentDetails(response: DetailModel.FetchDetails.Response)
    func presentNextScene(response: DetailModel.NextScene.Response)
    func presentLoader(type: DetailLoaderType)
    func hideLoader(type: DetailLoaderType)
    func presentError(type: DetailErrorType)
}

class DetailPresenter: DetailPresentationLogic {
    weak var viewController: DetailDisplayLogic?

    // MARK: Do DetailDetails

    func presentDetails(response: DetailModel.FetchDetails.Response) {

        var viewModel = DetailModel.FetchDetails.ViewModel(displayedSections: [])
        if let charater = response.character {

            let spices = DetailModel.FetchDetails.ViewModel.DisplayedListItem(title: "Species", subTitle: "", info: charater.species.rawValue, imageURL: nil, showDetail: false, isLoadingCell: false)

            let gender = DetailModel.FetchDetails.ViewModel.DisplayedListItem(title: "Gender", subTitle: "", info: charater.gender.rawValue, imageURL: nil, showDetail: false, isLoadingCell: false)

            let status = DetailModel.FetchDetails.ViewModel.DisplayedListItem(title: "Status", subTitle: "", info: charater.status.rawValue, imageURL: nil, showDetail: false, isLoadingCell: false)

            let displayInfo = DetailModel.FetchDetails.ViewModel.DisplayedSection(sectionTitle: "Info", displayedListItem: [spices, gender, status])
            viewModel.displayedSections.append(displayInfo)


            //Locations
            let location = DetailModel.FetchDetails.ViewModel.DisplayedListItem(title: "Location", subTitle: "", info: charater.location.name, imageURL: nil, showDetail: false, isLoadingCell: false)

            let origin = DetailModel.FetchDetails.ViewModel.DisplayedListItem(title: "Origin", subTitle: "", info: charater.origin.name, imageURL: nil, showDetail: false, isLoadingCell: false)

            let locations = DetailModel.FetchDetails.ViewModel.DisplayedSection(sectionTitle: "Location", displayedListItem: [location, origin])
            viewModel.displayedSections.append(locations)


            let episodeItems = charater.episode.map({ DetailModel.FetchDetails.ViewModel.DisplayedListItem(title: $0, subTitle: "", showDetail: true)})


            let episode = DetailModel.FetchDetails.ViewModel.DisplayedSection(sectionTitle: "Episode", displayedListItem: episodeItems)
            viewModel.displayedSections.append(episode)
        }

        if let episode = response.episode {
            let name = DetailModel.FetchDetails.ViewModel.DisplayedListItem(title: "Name", subTitle: "", info: episode.name ?? "", imageURL: nil, showDetail: false, isLoadingCell: false)

            let airDate = DetailModel.FetchDetails.ViewModel.DisplayedListItem(title: "Air Date", subTitle: "", info: episode.airDate, imageURL: nil, showDetail: false, isLoadingCell: false)

            let code = DetailModel.FetchDetails.ViewModel.DisplayedListItem(title: "Code", subTitle: "", info: episode.episode, imageURL: nil, showDetail: false, isLoadingCell: false)

            let displayInfo = DetailModel.FetchDetails.ViewModel.DisplayedSection(sectionTitle: "Info", displayedListItem: [name, airDate, code])
            viewModel.displayedSections.append(displayInfo)


            var characterItems: [DetailModel.FetchDetails.ViewModel.DisplayedListItem] = []
            if let characters = episode.characters {
                characterItems = characters.map({ DetailModel.FetchDetails.ViewModel.DisplayedListItem(title: $0 , subTitle: "", showDetail: true)})
                let character = DetailModel.FetchDetails.ViewModel.DisplayedSection(sectionTitle: "Charactes", displayedListItem: characterItems)
                viewModel.displayedSections.append(character)
            }
        }
        if let locationDetails = response.locationDetails {
            let name = DetailModel.FetchDetails.ViewModel.DisplayedListItem(title: "Name", subTitle: "", info: locationDetails.name ?? "", imageURL: nil, showDetail: false, isLoadingCell: false)

            let dimension = DetailModel.FetchDetails.ViewModel.DisplayedListItem(title: "Dimension", subTitle: "", info: locationDetails.dimension, imageURL: nil, showDetail: false, isLoadingCell: false)

            let type = DetailModel.FetchDetails.ViewModel.DisplayedListItem(title: "Type", subTitle: "", info: locationDetails.type, imageURL: nil, showDetail: false, isLoadingCell: false)

            let displayInfo = DetailModel.FetchDetails.ViewModel.DisplayedSection(sectionTitle: "Info", displayedListItem: [name, dimension, type])
            viewModel.displayedSections.append(displayInfo)
            
            var residetnsItems: [DetailModel.FetchDetails.ViewModel.DisplayedListItem] = []
            if let residents = locationDetails.residents {
                residetnsItems = residents.map({ DetailModel.FetchDetails.ViewModel.DisplayedListItem(title: $0 , subTitle: "", showDetail: true)})
                let character = DetailModel.FetchDetails.ViewModel.DisplayedSection(sectionTitle: "Residents", displayedListItem: residetnsItems)
                viewModel.displayedSections.append(character)
            }


        }

        viewController?.displayDetails(viewModel: viewModel)
    }

    func presentNextScene(response: DetailModel.NextScene.Response) {
        let viewModel = DetailModel.NextScene.ViewModel()
        viewController?.displayNextScene(viewModel: viewModel)
    }

    func presentLoader(type: DetailLoaderType) {
        viewController?.displayLoader(type: type)
    }

    func hideLoader(type: DetailLoaderType) {
        viewController?.hideLoader(type: type)
    }

    func presentError(type: DetailErrorType) {
        viewController?.displayError(type: type)
    }
}
