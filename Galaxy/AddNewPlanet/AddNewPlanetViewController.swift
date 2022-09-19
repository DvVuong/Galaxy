//
//  AddNewPlanetViewController.swift
//  Galaxy
//
//  Created by mr.root on 9/15/22.
//

import UIKit
protocol AddNewPlanetViewControllerDelegate: AnyObject {
    func addNewPlanetViewController(_ vc: AddNewPlanetViewController, didAdd: GalaxyLits)
    func addNewPlanetViewController(_ vc: AddNewPlanetViewController)
}

class AddNewPlanetViewController: UIViewController {
    static func instance() -> AddNewPlanetViewController {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AddPlanetScreen") as! AddNewPlanetViewController
        vc.presenter = AddNewPlanetPresenter(with: vc)
        return vc
    }
    private var imgPicker = UIImagePickerController()
    @IBOutlet private  var tfTitle: UITextField!
    @IBOutlet private  var tfDescription: UITextField!
    @IBOutlet private  var imgPlanet: UIImageView!

    private var presenter: AddNewPlanetPresenter!
    weak var addPlanetdelegate: AddNewPlanetViewControllerDelegate?
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imgPlanet.image = UIImage(named: "placeholder")
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .reply,
                                                           target: self,
                                                           action: #selector(didTapBack))
        setupImgePlane()
        setupTftitle()
        setupTfDescription()
    }
    private func setupTftitle(){
        tfTitle.attributedPlaceholder = NSAttributedString(string: "Enter Title", attributes: [.foregroundColor: UIColor.systemGray])
        
    }
    private func setupTfDescription(){
        tfDescription.attributedPlaceholder = NSAttributedString(string: "Enter Description", attributes: [.foregroundColor: UIColor.systemGray])
       
    }
    @IBAction func didTapSaveImage(_ sender: Any) {
        if tfTitle.text == "" && tfDescription.text == "" {
            return
        }
        else{
            
            if let imageData = imgPlanet.image?.pngData() {
                let item =  presenter.addNewPlanet(title: tfTitle.text!, img: imageData , planetdescription: tfDescription.text!)
                addPlanetdelegate?.addNewPlanetViewController(self, didAdd: item)
            }
        }
    }
    @objc func didTapBack(_ sender: Any){
        addPlanetdelegate?.addNewPlanetViewController(self)
    }
    private func setupImgePlane(){
        imgPlanet.layer.cornerRadius = 30
        imgPlanet.layer.masksToBounds = true
        imgPlanet.contentMode = .scaleToFill
        imgPlanet.isUserInteractionEnabled = true
        let tapGesChooseImg = UITapGestureRecognizer(target: self, action: #selector(didTapChooseImage))
        imgPlanet.addGestureRecognizer(tapGesChooseImg)
    }
    @objc func didTapChooseImage(){
       let pickImagPlanet = UIAlertController(title: "Choose Image",
                                              message: nil,
                                              preferredStyle: .actionSheet)
        let chooseImageAcction = UIAlertAction(title: "From Librabri", style: .default) { _ in
            self.imgPicker.delegate = self
            self.imgPicker.allowsEditing = true
            self.imgPicker.sourceType = .photoLibrary
            self.present(self.imgPicker, animated: true)
        }
        let cancelChooseImage = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        pickImagPlanet.addAction(chooseImageAcction)
        pickImagPlanet.addAction(cancelChooseImage)
        self.present(pickImagPlanet, animated: true)
    }
}
extension AddNewPlanetViewController: AddNewPlanetPresenterView {
    func showImagePlanet() {
        print("asd")
    }
    func addPlanet() {
        print("asd")
    }
}
extension AddNewPlanetViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let newImage = info[.editedImage] as? UIImage {
            imgPlanet.image = newImage
        }
        imgPicker.dismiss(animated: true)
    }
}

