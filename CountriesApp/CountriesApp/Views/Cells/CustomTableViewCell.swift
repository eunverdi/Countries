//
//  CustomTableViewCell.swift
//  CountriesApp
//
//  Created by Ensar Batuhan Ünverdi on 23.09.2022.
//

import UIKit

final class CustomTableViewCell: UITableViewCell {

    static let identifier = String(describing: CustomTableViewCell.self)
    var countryID = ""
    
    @IBOutlet private weak var countryNameLabel: UILabel!
    @IBOutlet private weak var favouriteButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        favouriteButton.addTarget(self, action: #selector(favouriteButtonTapped), for: .touchUpInside)
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        self.layer.cornerRadius = 15
        self.clipsToBounds = true
    }
    
    @objc func favouriteButtonTapped() {
        CoreDataManager.shared.checkIsFavourite(with: countryID ) { result in
            switch result {
            case .success(let bool):
                if bool {
                    CoreDataManager.shared.deleteMovie(with: self.countryID) { error in
                        print(error)
                    }
                    self.favouriteButton.setImage(UIImage(systemName: "heart"), for: .normal)
                } else {
                    CoreDataManager.shared.createFavouriteCountry(with: Country(code: self.countryID, name: self.countryNameLabel.text!))
                    self.favouriteButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
                }
            case .failure(let error):
                print(error)
            }
        }
    }

    func configureCountryComponents(model: Country) {
        countryNameLabel.text = model.name
        CoreDataManager.shared.checkIsFavourite(with: countryID) { result in
            switch result {
            case .success(let bool):
                bool ? self.favouriteButton.setImage(UIImage(systemName: "heart.fill"), for: .normal) : self.favouriteButton.setImage(UIImage(systemName: "heart"), for: .normal)
            case .failure(let error):
                print(error)
            }
        }
    }
}
