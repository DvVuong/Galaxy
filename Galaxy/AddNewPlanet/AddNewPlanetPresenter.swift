//
//  AddNewPlanetPresenter.swift
//  Galaxy
//
//  Created by mr.root on 9/15/22.
//

import Foundation
import UIKit
protocol AddNewPlanetPresenterView: AnyObject {
    func addPlanet()
}
class AddNewPlanetPresenter {
    private var view: AddNewPlanetPresenterView?
    init(with view: AddNewPlanetPresenterView) {
        self.view = view
    }
    func addNewPlanet(title: String, description: String) -> GalaxyLits {
        let data = GalaxyLits(description: description, img: "asd", title: title)
        return data
    }
    func choosesImage(){
        
    }
    
}
