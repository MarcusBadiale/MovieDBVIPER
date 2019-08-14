//
//  MovieListContracts.swift
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
/// MovieList Module View Protocol
protocol MovieListViewProtocol: BaseViewProtocol {
    // Update UI with value returned.
    /// Set the view Object of Type MovieListEntity
    func set(object: MovieListEntity)
}

//MARK: Interactor -
/// MovieList Module Interactor Protocol
protocol MovieListInteractorProtocol {
    // Fetch Object from Data Layer
    func fetch(objectFor presenter: MovieListPresenterProtocol)
}

//MARK: Presenter -
/// MovieList Module Presenter Protocol
protocol MovieListPresenterProtocol {
    /// The presenter will fetch data from the Interactor thru implementing the Interactor fetch function.
    func fetch(objectFor view: MovieListViewProtocol)
    /// The Interactor will inform the Presenter a successful fetch.
    func interactor(_ interactor: MovieListInteractorProtocol, didFetch object: MovieListEntity)
    /// The Interactor will inform the Presenter a failed fetch.
    func interactor(_ interactor: MovieListInteractorProtocol, didFailWith error: Error)
}

//MARK: Router (aka: Wireframe) -
/// MovieList Module Router Protocol
protocol MovieListRouterProtocol {
    // Show Details of Entity Object coming from ParentView Controller.
    // func showDetailsFor(object: MovieListEntity, parentViewController viewController: UIViewController)
}
