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
    func addNewPlanet(title: String, img: UIImage, planetdescription: String, time: Date) -> Note {
        let data = Note(planetdescription: planetdescription, img: img , title: title, timeDay: time)
        return data
    }
    
    func convertImgaeToBase64(image: UIImage) -> String {
        let imageData: Data? = image.jpegData(compressionQuality: 0.4)
        let imageStr = imageData?.base64EncodedString(options: .lineLength64Characters) ?? ""
        return imageStr
    }
    
}
