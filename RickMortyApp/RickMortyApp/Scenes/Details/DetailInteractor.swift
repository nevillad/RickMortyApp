//
//  DetailInteractor.swift
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

protocol DetailBusinessLogic {
    func doDetailDetails(request: DetailModel.FetchDetails.Request)
    func fetchDetails(request: DetailModel.FetchDetails.Request)
    func fetchItemDetails(request: DetailModel.FetchItemDetails.Request)
    func initialise(showLoader: Bool)
}

protocol DetailDataStore {
    var screenTitle: String? { get set }
    var detailType: DetailType { get set }
    var character: Character? { get set }
    var episode: Episode? { get set }
    var locationDetails: LocationDetails? { get set }
}

class DetailInteractor: DetailBusinessLogic, DetailDataStore {

    var screenTitle: String?
    var detailType: DetailType = .characters
    var character: Character?
    var episode: Episode?
    var locationDetails: LocationDetails?


    var presenter: DetailPresentationLogic?
    var worker: DetailWorker?
    //var name: String = ""

    // MARK: Do DetailDetails

    func doDetailDetails(request: DetailModel.FetchDetails.Request) {
        worker = DetailWorker()
        worker?.doSomeWork()


    }

    func fetchDetails(request: DetailModel.FetchDetails.Request) {

        var response = DetailModel.FetchDetails.Response()
        switch detailType {
        case .characters:
            response.character = self.character
        case .episodes:
            response.episode = self.episode
        case .locations:
            response.locationDetails = self.locationDetails
        }

        presenter?.presentDetails(response: response)
    }

    func fetchItemDetails(request: DetailModel.FetchItemDetails.Request) {
        var url = ""

        switch detailType {
        case .characters:
            if let strUrl = self.character?.episode?[request.index] {
                getDetails(url: strUrl,responseObject: Episode.self)
            }
        case .episodes:
            if let strUrl = self.episode?.characters?[request.index] {
                getDetails(url: strUrl,responseObject: Character.self)
            }
        case .locations:
            if let strUrl = self.locationDetails?.residents?[request.index] {
                getDetails(url: strUrl,responseObject: Character.self)
            }
        }
    }

    private func getDetails<T: Decodable>(url: String, responseObject: T.Type)  {
        self.presenter?.presentLoader(type: .general)
        let resource = Resource<T>(url: url)
        debugPrint("Final url is: \(resource.url)")

        NetworkServices.fetchJson(resource: resource) { result in
            self.presenter?.hideLoader(type: .general)
            switch result {
            case .success(let itemDetails):

                var response = DetailModel.NextScene.Response()
                if let character =  itemDetails as? Character {
                    response.character = character
                    response.detailsType = .characters
                } else if let episode = itemDetails as? Episode {
                    response.episode = episode
                    response.detailsType = .episodes
                } else if let locationDetail = itemDetails as? LocationDetails{
                    response.locationDetails = locationDetail
                    response.detailsType = .locations
                }
                self.presenter?.presentNextScene(response: response)
                break
            case .failure(let error):
                self.presenter?.presentError(type: .custom(message: error.localizedDescription))
            }
        }
    }

    private func getCharacters(url: String) {

    }
/*
    private func getEpisodes() {
        let finalUrl = ApiActions.getEpisodes.finalURL + "?page=\(self.lastItemIndex)"
        let resource = Resource<EpisodesData>(url: finalUrl)
        debugPrint("Final url is: \(resource.url)")

        NetworkServices.fetchJson(resource: resource) { result in
            self.presenter?.hideLoader(type: .general)
            switch result {
            case .success(let episodesData):
                self.episodes?.append(contentsOf: episodesData.results ?? [])

                if episodesData.info.next != nil {
                    self.lastItemIndex += 1
                }
                let allowToPaginate = self.lastItemIndex != 1 && self.lastItemIndex <= episodesData.info.pages

                let response = ListModels.FetchFromRemoteDataStore.Response(episodes: self.episodes, characters: nil, locations: nil, didAllowToFetchNextData: allowToPaginate)
                self.presenter?.presentFetchFromRemoteDataStore(with: response)


                break
            case .failure(let error):
                self.presenter?.presentError(type: .custom(message: error.localizedDescription))
            }
        }
    }

    private func getLocations() {
        let finalUrl = ApiActions.getLocations.finalURL
        let resource = Resource<LocationData>(url: finalUrl)
        debugPrint("Final url is: \(resource.url)")

        NetworkServices.fetchJson(resource: resource) { result in
            self.presenter?.hideLoader(type: .general)
            switch result {
            case .success(let locationData):
                self.locations?.append(contentsOf: locationData.results)

                if locationData.info.next != nil {
                    self.lastItemIndex += 1
                }
                let allowToPaginate = self.lastItemIndex != 1 && self.lastItemIndex <= locationData.info.pages

                let response = ListModels.FetchFromRemoteDataStore.Response(episodes: nil, characters: nil, locations: self.locations, didAllowToFetchNextData: allowToPaginate)
                self.presenter?.presentFetchFromRemoteDataStore(with: response)


            case .failure(let error):
                self.presenter?.presentError(type: .custom(message: error.localizedDescription))
            }
        }
    }
*/

    func initialise(showLoader: Bool = true) {
    }
}
