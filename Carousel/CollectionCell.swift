//
//  CollectionCell.swift
//  Carousel
//
//  Created by Benjamin Emdon on 2016-09-01.
//  Copyright © 2016 Benjamin Emdon.
//

import UIKit
import SnapKit

class CollectionCell: UICollectionViewCell, UITableViewDataSource, UITableViewDelegate {
	
//	let titleLabel = UILabel()
	let mainView = UIView()

    lazy var tableView: UITableView = {
        let table = UITableView()
        table.backgroundColor = .yellow
        return table
    }()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		// subview config
        //titleLabel.textAlignment = .left
		mainView.backgroundColor = UIColor.white
		mainView.layer.cornerRadius = 3

        tableView.delegate = self
        tableView.dataSource = self

        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")

        // prepare subviews for layout
        contentView.addSubview(mainView)
        mainView.addSubview(tableView)
        mainView.layoutMargins = UIEdgeInsets(top: 10, left: 10, bottom: 0, right: 10)
        setupConstraints()
	}

    func setupConstraints() {
        mainView.snp.makeConstraints { (make) in
            make.edges.equalTo(contentView.snp.edges)
        }

        tableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "Implementing a TableView and CollectionView in Swift 3 - YouTube"
        return cell
    }
}
