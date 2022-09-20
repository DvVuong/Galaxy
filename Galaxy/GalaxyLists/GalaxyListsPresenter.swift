//
//  GalaxyListsPresenter.swift
//  Galaxy
//
//  Created by mr.root on 9/15/22.
//

import Foundation
protocol GalaxyListsPresenterView : AnyObject {
    func loadData()
    func addNewPlanet()
    func deletePlanet( at index: Int)
    func updatePlanets()
}
class GalaxyListsPresenter {
    private var galaxyArr = [Note]()
    private weak var persenter: GalaxyListsPresenterView?
    private var view: GalaxyListsPresenterView!
    init(with view: GalaxyListsPresenterView) {
        self.view = view
    }
    func showGalaxyLists(){
//        let galaxy = GalaxyLits(description: "Moon", img: "Moon", title: "Moon")
//        let galaxy2 = GalaxyLits(description: "Mars", img: "Mars", title: "Mars")
//        galaxyArr.append(galaxy)
//        galaxyArr.append(galaxy2)
         galaxyArr  = DataManager.sharedInstance.getNewPlanet()
        view.loadData()
    }
    func numberOfRow() -> Int {
        return galaxyArr.count
    }
    func itemForRowAt(_ index: Int) -> Note? {
        guard  index >= 0 && index < numberOfRow()  else {
            return nil
        }
        return galaxyArr[index]
    }
    func addPlanet(data: Note) {
        galaxyArr.insert(data, at: 0)
        print(data.img)
        DataManager.sharedInstance.saveTitleDescription(data: data)
        view?.addNewPlanet()
        
    }
    
    func updatePlanet(data: Note, index : Int) {
        guard let id = data.id else { return }
        galaxyArr[index] = data
        DataManager.sharedInstance.updatePlanet(data: data, with: id)
        view.updatePlanets()
        
    }
    func deletePlane(index: Int){
        guard  let id = itemForRowAt(index)?.id  else {return}
        DataManager.sharedInstance.deletePlanet(id: id)
        galaxyArr.remove(at: index)
        view?.deletePlanet(at: index)
    }
}
