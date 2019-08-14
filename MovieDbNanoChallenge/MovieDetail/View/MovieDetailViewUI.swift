//
//  MovieDetailViewUI.swift
//  MovieDbNanoChallenge
//
//  Created Marcus Vinicius Vieira Badiale on 14/08/19.
//  Copyright © 2019 Marcus Vinicius Vieira Badiale. All rights reserved.
//

import UIKit

// MARK: MovieDetailViewUI Delegate -
/// MovieDetailViewUI Delegate
protocol MovieDetailViewUIDelegate {
    // Send Events to Module View, that will send events to the Presenter; which will send events to the Receiver e.g. Protocol OR Component.
}

// MARK: MovieDetailViewUI Data Source -
/// MovieDetailViewUI Data Source
protocol MovieDetailViewUIDataSource {
    // This will be implemented in the Module View.
    /// Set Object for the UI Component
    func objectFor(ui: MovieDetailViewUI) -> MovieDetailEntity
}

class MovieDetailViewUI: UIView {
    
    var delegate: MovieDetailViewUIDelegate?
    var dataSource: MovieDetailViewUIDataSource?
    
    var object : MovieDetailEntity?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUIElements()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func didMoveToWindow() {
        super.didMoveToWindow()
        setupConstraints()
    }
    
    fileprivate func setupUIElements() {
        // arrange subviews
    }
    
    fileprivate func setupConstraints() {
        // add constraints to subviews
    }
    
    /// Reloading the data and update the ui according to the new data
    func reloadData() {
        self.object = dataSource?.objectFor(ui: self)
        // Should update UI
    }
}
