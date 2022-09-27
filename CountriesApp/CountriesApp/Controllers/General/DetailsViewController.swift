//
//  DetailViewController.swift
//  CountriesApp
//
//  Created by Ensar Batuhan Ünverdi on 24.09.2022.
//

import UIKit
import SafariServices
import Kingfisher
import SVGKit

final class DetailsViewController: UIViewController {
    
    private var countryDetail: CountryDetailModel? {
        didSet {
            configureComponents()
        }
    }
    var countryID = ""
    
    @IBOutlet private weak var countryFlagImageView: UIImageView!
    @IBOutlet private weak var countryCodeLabel: UILabel!
    @IBOutlet weak var favouriteButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureComponents()
        fetchCountryDetails()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        CoreDataManager.shared.checkIsFavourite(with: countryID) { result in
            switch result {
            case .success(let bool):
                if bool {
                    self.favouriteButton.image = UIImage(systemName: "heart.fill")
                } else {
                    self.favouriteButton.image = UIImage(systemName: "heart")
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    private func fetchCountryDetails() {
        let endPoint = EndpointCases.getCountryDetail(countryCode: countryID)
        NetworkManager.shared.request(from: endPoint, completionHandler: { [weak self] (result: Result<CountryDetailModel, Error>) in
            switch result {
            case .success(let dataArray):
                self?.countryDetail = dataArray
                self?.configureComponents()
            case .failure(let error):
                print(error)
            }
        })
    }
    
    private func configureComponents() {
        guard let imageURL = URL(string: countryDetail?.data?.flagImageURI ?? "") else {
            return
        }
        countryFlagImageView.kf.setImage(with: imageURL, options: [.processor(SVGImgProcessor())])
        countryCodeLabel.text = countryDetail?.data?.code
    }
    
    @IBAction func moreInformationButtonTapped(_ sender: Any) {
        let wikiID = countryDetail?.data?.wikiDataID
        if let url = URL(string: "https://www.wikidata.org/wiki/\(wikiID ?? countryDetail?.data?.wikiDataID ?? "")" ) {
            let webVC = SFSafariViewController(url: url)
            present(webVC, animated: true)
        }
    }
    
    @IBAction func favouriteButtonTapped(_ sender: Any) {
        CoreDataManager.shared.checkIsFavourite(with: countryID ) { result in
            switch result {
            case .success(let bool):
                if bool {
                    CoreDataManager.shared.deleteMovie(with: self.countryID) { error in
                        print(error)
                    }
                    self.favouriteButton.image = UIImage(systemName: "heart")
                } else {
                    CoreDataManager.shared.createFavouriteCountryFromDetailPage(with: Country(code: (self.countryDetail?.data?.code)!, name: (self.countryDetail?.data?.name)!))
                    self.favouriteButton.image = UIImage(systemName: "heart.fill")
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
