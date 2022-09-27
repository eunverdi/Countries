//
//  FavouritesViewController.swift
//  CountriesApp
//
//  Created by Ensar Batuhan Ünverdi on 23.09.2022.
//

import UIKit
import CoreData

final class FavouritesViewController: UIViewController {
    
    private var countries: [FavouriteCountry] = [] {
        didSet {
            tableView.reloadData()
        }
    }

    @IBOutlet private weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
            tableView.separatorStyle = .none
            tableView.showsVerticalScrollIndicator = false
            tableView.register(UINib(nibName: CustomTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: CustomTableViewCell.identifier)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchMoviesFromPersistance()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
        fetchMoviesFromPersistance()
    }
    
    private func fetchMoviesFromPersistance() {
        CoreDataManager.shared.getCountriesFromPersistance { result in
            switch result {
            case .success(let favourites):
                self.countries = favourites
                self.tableView.reloadData()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

extension FavouritesViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        countries.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as? CustomTableViewCell else {
            return UITableViewCell()
        }
        cell.countryID = countries[indexPath.section].code!
        cell.configureFavouriteCountryComponents(model: countries[indexPath.section])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        Constant.rowHeight
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let spaceView = UIView()
        spaceView.backgroundColor = view.backgroundColor
        return spaceView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        Constant.headerHeightInSection
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let detailVC = DetailsViewController.instantiate()
        detailVC.countryID = countries[indexPath.section].code ?? ""
        navigationController?.pushViewController(detailVC, animated: true)
    }
}
