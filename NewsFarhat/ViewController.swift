//
//  ViewController.swift
//  NewsFarhat
//
//  Created by Фархат Сталбек уулу on 24/3/23.
//

import UIKit
import SnapKit
import Kingfisher

class ViewController: UIViewController {
    
    private lazy var mainTitle: UILabel = {
        let mainTitle = UILabel()
        mainTitle.text = "News"
        return mainTitle
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    
    private var timeData: [Product] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupConstraints()
        
        APIManager.shared.getData { [weak self] result in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    guard let self else {return}
                    self.timeData = data.products
                    self.tableView.reloadData()
                }
            case .failure(let error):
                print (error.localizedDescription)
            }
        }
    }
    
    private func setupTableView() {
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.idCell)
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func setupConstraints() {
        view.addSubview(mainTitle)
        mainTitle.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().inset(70)
        }
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.top.equalTo(mainTitle.snp.bottom).inset(-10)
            make.left.right.bottom.equalToSuperview()
        }
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        timeData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.idCell) as! CustomTableViewCell
        let value = timeData[indexPath.row]
        cell.configure(with: value)
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        CGFloat(156)
    }

}

