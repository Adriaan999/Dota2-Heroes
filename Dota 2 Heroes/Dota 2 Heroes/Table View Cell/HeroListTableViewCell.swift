//
//  HeroListTableViewCell.swift
//  Dota 2 Heroes
//
//  Created by Adriaan van Schalkwyk on 2021/05/21.
//

import UIKit
import Kingfisher

class HeroListTableViewCell: UITableViewCell {
    private let heroListURL = "https://api.opendota.com"
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var heroImage: UIImageView!
    @IBOutlet weak var attributeImage: UIImageView!
    
    func configure(with iconString: String,
                   primartyAttribute: String) {
        
        if let url = URL(string: heroListURL + iconString) {
            getImage(url: url)
        }
        
        switch primartyAttribute {
        case "str":
            attributeImage.image = UIImage(named: "strength")
        case "int":
            attributeImage.image = UIImage(named: "intelligence")
        case "agi":
            attributeImage.image = UIImage(named: "agility")
        default:
            break
        }
    }
    
    private func getImage(url: URL) {
        let processor = DownsamplingImageProcessor(size: heroImage.bounds.size)
        heroImage.kf.indicatorType = .activity
        heroImage.kf.setImage(
            with: url,
            placeholder: UIImage(named: "placeholderImage"),
            options: [
                .processor(processor),
                .scaleFactor(UIScreen.main.scale),
                .transition(.fade(1)),
                .cacheOriginalImage
            ])
        {
            result in
            switch result {
            case .success(let value):
                print("Task done for: \(value.source.url?.absoluteString ?? "")")
            case .failure(let error):
                print("Job failed: \(error.localizedDescription)")
            }
        }
    }
}
