//
//  AddNewPlanetViewController.swift
//  Galaxy
//
//  Created by mr.root on 9/15/22.
//

import UIKit
protocol AddNewPlanetViewControllerDelegate: AnyObject {
    func addNewPlanetViewController(_ vc: AddNewPlanetViewController, didAdd: GalaxyLits)
}

class AddNewPlanetViewController: UIViewController {
    static func instance() -> AddNewPlanetViewController {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AddPlanetScreen") as! AddNewPlanetViewController
        vc.presenter = AddNewPlanetPresenter(with: vc)
        return vc
    }
    @IBOutlet private  var tfTitle: UITextField!
    @IBOutlet private  var tfDescription: UITextField!
    @IBOutlet private  var imgPlanet: UIImageView!
    private var presenter: AddNewPlanetPresenter!
    weak var addPlanetdelegate: AddNewPlanetViewControllerDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
        imgPlanet.image = UIImage(named: "placeholder")
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .reply,
                                                           target: self,
                                                           action: #selector(didTapBack))
    }
    @objc func didTapBack(_ sender: Any){
       let item =  presenter.addNewPlanet(title: tfTitle.text!, description: tfDescription.text!)
        addPlanetdelegate?.addNewPlanetViewController(self, didAdd: item)
    }
}
extension AddNewPlanetViewController: AddNewPlanetPresenterView {
    func addPlanet() {
        print("asd")
    }
    
    
}
