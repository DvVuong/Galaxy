//
//  DetailGalaxyPresenter.swift
//  Galaxy
//
//  Created by mr.root on 9/15/22.
//

import Foundation
import UIKit
protocol DetailGalaxyPresenterView: AnyObject {
    func loadData( data: GalaxyLits)
}

class DetailGalaxyPresenter {
    private var view: DetailGalaxyPresenterView?
    private var planet: GalaxyLits
    init(with view: DetailGalaxyPresenterView, planet: GalaxyLits) {
        self.view = view
        self.planet = planet
    }
    
    func showPlanet(){
        view?.loadData( data: planet)
    }
    
    func editPlanet(planetDescription: String , imagePlanet : Data) -> GalaxyLits {
        planet.planetdescription = planetDescription
        planet.img = imagePlanet
        
        return planet
    }
}
