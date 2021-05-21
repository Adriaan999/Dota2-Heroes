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
        viewModel.fetcHeroList()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.heroList?.count ?? 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "heroListTableViewCell", for: indexPath) as! HeroListTableViewCell
        if let heroName = viewModel.heroList?[indexPath.row].heroName {
        cell.title.text = heroName
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
