//
//  DashboardRouter.swift
//  RickMortyApp
//
//  Created by Nevilkumar Lad on 05/01/22.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol DashboardRoutingLogic {
    func showNextScene(action: Actions)
}

protocol DashboardDataPassing {
    var dataStore: DashboardDataStore? { get }
}

class DashboardRouter: NSObject, DashboardRoutingLogic, DashboardDataPassing {
    weak var viewController: DashboardViewController?
    var dataStore: DashboardDataStore?
    
    
    func showNextScene(action: Actions) {
        //Set selection action to the data store
        self.dataStore?.selectedAction = action
        
        let nextViewController = ListViewController.instantiateFromStoryboard()
        var destinationDS = nextViewController.router?.dataStore
        self.passDataTo(&destinationDS!, from: self.dataStore!)
        
        viewController?.navigationController?.pushViewController(nextViewController, animated: true)
        
    }
    
    // MARK: - Passing Data
    func passDataTo(_ destinationDS: inout ListDataStore, from sourceDS: DashboardDataStore) {
        var nextScreenType: ListType = .characters
        var title = ""
        
        switch sourceDS.selectedAction {
        case .characters:
            nextScreenType = .characters
            title = "Characters"
        case .episodes:
            nextScreenType = .episodes
            title = "Episodes"
        case .locations:
            nextScreenType = .locations
            title = "Locations"
        default:
            debugPrint("invalid action performed")
            return
        }
        
        destinationDS.listScreenType = nextScreenType
        destinationDS.screenTitle = title
    }
}

// MARK: Passing data
extension DashboardRouter {
    
    /*
     func passDataTo(_ destinationDS: inout <destinationDataStore>?, from sourceDS: DashboardDataStore?) {
     
     }
     */
}
