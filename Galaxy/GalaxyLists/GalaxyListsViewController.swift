//
//  ViewController.swift
//  Galaxy
//
//  Created by mr.root on 9/15/22.
//

import UIKit

class GalaxyListsViewController: UIViewController{
    @IBOutlet private  var tbGalaxy: UITableView!
    private lazy var presenter = GalaxyListsPresenter(with: self)
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupTbGalaxy()
        presenter.showGalaxyLists()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add,
                                                            target: self,
                                                            action: #selector(didTapMe))
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Sort", style: .done, target: self, action: #selector(ditaptrash))
    }

    @objc func ditaptrash(){
        if tbGalaxy.isEditing {
            tbGalaxy.isEditing = false
        }else {
            tbGalaxy.isEditing = true
        }
    }
    @objc func didTapMe(){
        let vc = AddNewPlanetViewController.instance()
        vc.title = "AddNew"
        vc.addPlanetdelegate = self
        navigationController?.pushViewController(vc, animated: true)
    }
    private func setupTbGalaxy(){
        tbGalaxy.delegate = self
        tbGalaxy.dataSource = self
        tbGalaxy.tableFooterView = UIView()
    }
}
extension GalaxyListsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return presenter.numberOfRow()
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tbGalaxy.dequeueReusableCell(withIdentifier: "GalaxyCell", for: indexPath) as! GalaxyTableViewCell
        cell.updateUI(presenter.itemForRowAt(indexPath.row)!)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let item = presenter.itemForRowAt(indexPath.row) else { return }
        let vc = DetailGalaxyViewController.instance(item)
        vc.delegate = self
        vc.title = presenter.itemForRowAt(indexPath.row)?.title
        navigationController?.pushViewController(vc, animated: true)
    }
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        true
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            presenter.deletePlane(index: indexPath.row)
        }
    }
}
extension GalaxyListsViewController: GalaxyListsPresenterView {
    func updatePlanets() {
        tbGalaxy.reloadData()
    }
    
    func deletePlanet(at index: Int) {
        tbGalaxy.deleteRows(at: [IndexPath(row: index, section: 0)], with: .automatic)
    }
    func addNewPlanet() {
        tbGalaxy.reloadData()
    }
    
    func loadData() {
        tbGalaxy.reloadData()
    }
}
extension GalaxyListsViewController: DetailGalaxyViewControllerDelegate {
    func detailGalaxyViewController(_ vc: DetailGalaxyViewController, data: GalaxyLits) {
        if let indexPath = tbGalaxy.indexPathForSelectedRow {
            presenter.updatePlanet(data: data, index: indexPath.row)
        }
        navigationController?.popViewController(animated: true)
        
    }
}
extension GalaxyListsViewController: AddNewPlanetViewControllerDelegate {
    func addNewPlanetViewController(_ vc: AddNewPlanetViewController) {
        navigationController?.popViewController(animated: true)
    }
    
    func addNewPlanetViewController(_ vc: AddNewPlanetViewController, didAdd: GalaxyLits) {
        presenter.addPlanet(data: didAdd)
        navigationController?.popViewController(animated: true)
    }
    
    
}
