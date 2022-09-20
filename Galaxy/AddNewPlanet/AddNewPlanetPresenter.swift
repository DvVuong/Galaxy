//
//  AddNewPlanetPresenter.swift
//  Galaxy
//
//  Created by mr.root on 9/15/22.
//

import Foundation
import UIKit
protocol AddNewPlanetPresenterView: AnyObject {

}
class AddNewPlanetPresenter: NSObject {
    private var view: AddNewPlanetPresenterView?
    init(with view: AddNewPlanetPresenterView) {
        self.view = view
    }
    func addNewPlanet(title: String, img: Data, planetdescription: String, time: Date) -> GalaxyLits {
        let data = GalaxyLits(planetdescription: planetdescription, img: img , title: title, timeDay: time)
        return data
    }
    
    func convertImgaeToBase64(image: UIImage) -> String {
        
        
        return ""
    }


}
