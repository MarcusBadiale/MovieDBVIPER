//
//  MovieSearchViewUI.swift
//  MovieDbNanoChallenge
//
//  Created Marcus Vinicius Vieira Badiale on 14/08/19.
//  Copyright © 2019 Marcus Vinicius Vieira Badiale. All rights reserved.
//

import UIKit

// MARK: MovieSearchViewUI Delegate -
/// MovieSearchViewUI Delegate
protocol MovieSearchViewUIDelegate {
    // Send Events to Module View, that will send events to the Presenter; which will send events to the Receiver e.g. Protocol OR Component.
}

// MARK: MovieSearchViewUI Data Source -
/// MovieSearchViewUI Data Source
protocol MovieSearchViewUIDataSource {
    // This will be implemented in the Module View.
    /// Set Object for the UI Component
    func objectFor(ui: MovieSearchViewUI) -> MovieSearchEntity
}

class MovieSearchViewUI: UIView {
    
    var delegate: MovieSearchViewUIDelegate?
    var dataSource: MovieSearchViewUIDataSource?
    
    var object : MovieSearchEntity?
    
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
