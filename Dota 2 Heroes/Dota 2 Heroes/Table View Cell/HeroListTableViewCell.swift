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
    
    func setHeroImage(with iconString: String) {
        if let url = URL(string: heroListURL + iconString) {
            getImage(url: url)
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
