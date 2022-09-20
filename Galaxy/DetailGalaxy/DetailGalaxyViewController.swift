//
//  DetailGalaxyViewController.swift
//  Galaxy
//
//  Created by mr.root on 9/15/22.
//

import UIKit
protocol DetailGalaxyViewControllerDelegate: AnyObject {
    func detailGalaxyViewController(_ vc: DetailGalaxyViewController, data: Note)
}

class DetailGalaxyViewController: UIViewController {
    static func instance(_ data: Note) -> DetailGalaxyViewController {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DetailScreen") as! DetailGalaxyViewController
        vc.presenter = DetailGalaxyPresenter(with: vc, planet: data)
        return vc
    }
    @IBOutlet private  var imgPlanets: UIImageView!
    @IBOutlet private var tvDescription: UITextView!
    
    
    var delegate: DetailGalaxyViewControllerDelegate?
    private  var presenter: DetailGalaxyPresenter!
    private var imgpicker = UIImagePickerController()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupImgPlanet()
        presenter.showPlanet()
        setupImgPlanets()
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit,
                                                           target: self,
                                                           action: #selector(didTapEdit))
    }
    @objc func didTapEdit(){
//        if let newImagePlanet = imgPlanets.image?.pngData() {
//            let data =  presenter.editPlanet(planetDescription: tvDescription.text!, imagePlanet: newImagePlanet)
//            delegate?.detailGalaxyViewController(self, data: data)
//        }
    }
    private func setupImgPlanets(){
        let tapGes = UITapGestureRecognizer(target: self, action: #selector(didTapeditImage))
        imgPlanets.addGestureRecognizer(tapGes)
        imgPlanets.isUserInteractionEnabled = true
        
    }
    @objc func didTapeditImage(){
        let alert = UIAlertController(title: "Choose Image From", message: nil, preferredStyle: .actionSheet)
        
        let chooseFromLibrabri = UIAlertAction(title: "Photolibarbri", style: .default) { _ in
            
            self.imgpicker.delegate = self
            self.imgpicker.sourceType = .photoLibrary
            self.present(self.imgpicker, animated: true)
        }
        alert.addAction(chooseFromLibrabri)
        present(alert, animated: true)
    }
    private func setupImgPlanet(){
        imgPlanets.layer.cornerRadius = 20
        imgPlanets.layer.masksToBounds = true
        imgPlanets.contentMode = .scaleToFill
    }
}
extension DetailGalaxyViewController: DetailGalaxyPresenterView {
    func loadData(data: Note) {
        imgPlanets.image = data.img
        tvDescription.text = data.planetdescription
    }
}
extension DetailGalaxyViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let newPlanet = info[.originalImage] as? UIImage {
            imgPlanets.image = newPlanet
        }
        imgpicker.dismiss(animated: true, completion: nil)
        
    }

}

