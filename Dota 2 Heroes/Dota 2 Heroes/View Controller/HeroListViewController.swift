//
//  HeroListViewController.swift
//  Dota 2 Heroes
//
//  Created by Adriaan van Schalkwyk on 2021/05/21.
//

import UIKit

class HeroListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet private weak var heroListTableView: UITableView!
    private lazy var viewModel = HeroListViewModel(interactor: HeroListInteractor(),
                                                   delegate: self)
        
    override func viewDidLoad() {
        super.viewDidLoad()
        let logo = UIImage(named: "dota2Logo")
        let imageView = UIImageView(image:logo)
        imageView.contentMode = .scaleAspectFit
        self.navigationItem.titleView = imageView
        viewModel.fetcHeroList()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let nav = self.navigationController?.navigationBar
        nav?.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(red: 167/255, green: 39/255, blue: 20/255, alpha: 1.0),
                                    NSAttributedString.Key.font: UIFont(name: "Georgia-Bold", size: 25)!]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (viewModel.heroList?.count ?? 1)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "heroListTableViewCell", for: indexPath) as! HeroListTableViewCell
        if let heroList = viewModel.heroList?[indexPath.row] {
            cell.configure(with: heroList.imageURL ?? "",
                           primartyAttribute: heroList.primaryAttribute ?? "")
            cell.title.text = heroList.heroName
            cell.attackType.text = heroList.attackType
            cell.role.text = heroList.roles?.first
        }
        return cell
    }

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

extension HeroListViewController: HeroListViewModelDelegate {
    func didFetchHeroList() {
        DispatchQueue.main.async {
            self.heroListTableView.reloadData()
        }
    }
}
