//
//  MovieSearchContracts.swift
//  MovieDbNanoChallenge
//
//  Created Marcus Vinicius Vieira Badiale on 14/08/19.
//  Copyright © 2019 Marcus Vinicius Vieira Badiale. All rights reserved.
//

import UIKit

//MARK: View -
/*
 Should replace "class" with "BaseViewProtocol" if available;
 & that will allow the View to act as a UIViewController;
 & Implement common view functions.
 */
/// MovieSearch Module View Protocol
protocol MovieSearchViewProtocol: class {
    // Update UI with value returned.
    /// Set the view Object of Type MovieSearchEntity
    func set(object: MovieSearchEntity)
}

//MARK: Interactor -
/// MovieSearch Module Interactor Protocol
protocol MovieSearchInteractorProtocol {
    // Fetch Object from Data Layer
    func fetch(objectFor presenter: MovieSearchPresenterProtocol)
}

//MARK: Presenter -
/// MovieSearch Module Presenter Protocol
protocol MovieSearchPresenterProtocol {
    /// The presenter will fetch data from the Interactor thru implementing the Interactor fetch function.
    func fetch(objectFor view: MovieSearchViewProtocol)
    /// The Interactor will inform the Presenter a successful fetch.
    func interactor(_ interactor: MovieSearchInteractorProtocol, didFetch object: MovieSearchEntity)
    /// The Interactor will inform the Presenter a failed fetch.
    func interactor(_ interactor: MovieSearchInteractorProtocol, didFailWith error: Error)
}

//MARK: Router (aka: Wireframe) -
/// MovieSearch Module Router Protocol
protocol MovieSearchRouterProtocol {
    // Show Details of Entity Object coming from ParentView Controller.
    // func showDetailsFor(object: MovieSearchEntity, parentViewController viewController: UIViewController)
}
