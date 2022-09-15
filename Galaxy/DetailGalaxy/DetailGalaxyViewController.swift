//
//  DetailGalaxyViewController.swift
//  Galaxy
//
//  Created by mr.root on 9/15/22.
//

import UIKit
protocol DetailGalaxyViewControllerDelegate: AnyObject {
    func detailGalaxyViewController(_ vc: DetailGalaxyViewController, data: GalaxyLits)
}

class DetailGalaxyViewController: UIViewController, DetailGalaxyPresenterView {
    func loadData(data: GalaxyLits) {
        imgPlanet.image = UIImage(named: data.img)
        tvDescription.text = data.description
    }
    static func instance(_ data: GalaxyLits) -> DetailGalaxyViewController {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DetailScreen") as! DetailGalaxyViewController
        vc.presenter = DetailGalaxyPresenter(with: vc, planet: data)
        return vc
    }
    @IBOutlet private  var imgPlanet: UIImageView!
    @IBOutlet private var tvDescription: UITextView!
    var delegate: DetailGalaxyViewControllerDelegate?
    private  var presenter: DetailGalaxyPresenter!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupImgPlanet()
        presenter.showPlanet()
    }
    private func setupImgPlanet(){
        imgPlanet.layer.cornerRadius = 20
        imgPlanet.layer.masksToBounds = true
    }
}

