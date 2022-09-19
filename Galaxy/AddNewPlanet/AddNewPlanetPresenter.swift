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
class AddNewPlanetPresenter: NSObject {
    private var view: AddNewPlanetPresenterView?
    init(with view: AddNewPlanetPresenterView) {
        self.view = view
    }
    func addNewPlanet(title: String, img: Data, planetdescription: String) -> GalaxyLits {
        let data = GalaxyLits(planetdescription: planetdescription, img: img , title: title)
        return data
    }


}
