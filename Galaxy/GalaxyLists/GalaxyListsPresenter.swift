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
}
class GalaxyListsPresenter {
    private var galaxyArr = [GalaxyLits]()
    private weak var persenter: GalaxyListsPresenterView?
    private var view: GalaxyListsPresenterView!
    init(with view: GalaxyListsPresenterView) {
        self.view = view
    }
    func showGalaxyLists(){
        let galaxy = GalaxyLits(description: "Moon", img: "Moon", title: "Moon")
        let galaxy2 = GalaxyLits(description: "Mars", img: "Mars", title: "Mars")
        galaxyArr.append(galaxy)
        galaxyArr.append(galaxy2)
        view.loadData()
    }
    func numberOfRow() -> Int {
        return galaxyArr.count
    }
    func itemForRowAt(_ index: Int) -> GalaxyLits? {
        guard  index >= 0 && index < numberOfRow()  else {
            return nil
        }
        return galaxyArr[index]
    }
    func addPlanet(data: GalaxyLits) {
        galaxyArr.append(data)
        view?.addNewPlanet()
    }
}
