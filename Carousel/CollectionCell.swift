//
//  CollectionCell.swift
//  Carousel
//
//  Created by Benjamin Emdon on 2016-09-01.
//  Copyright © 2016 Benjamin Emdon.
//

import UIKit

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

		// prepare subviews for layout
		contentView.addSubview(mainView)
		mainView.translatesAutoresizingMaskIntoConstraints = false
//		mainView.addSubview(titleLabel)
        mainView.addSubview(tableView)
//		titleLabel.translatesAutoresizingMaskIntoConstraints = false
		mainView.layoutMargins = UIEdgeInsets(top: 10, left: 10, bottom: 0, right: 10)
		
		NSLayoutConstraint.activate([
			mainView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
			mainView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 60),
			mainView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
			mainView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),

			//tableView.leadingAnchor.constraint(equalTo: mainView.layoutMarginsGuide.leadingAnchor),
			tableView.topAnchor.constraint(equalTo: mainView.layoutMarginsGuide.topAnchor),
			//tableView.trailingAnchor.constraint(equalTo: mainView.layoutMarginsGuide.trailingAnchor)
            tableView.bottomAnchor.constraint(equalTo: mainView.layoutMarginsGuide.bottomAnchor)
			
//			titleLabel.leadingAnchor.constraint(equalTo: mainView.layoutMarginsGuide.leadingAnchor),
//			titleLabel.bottomAnchor.constraint(equalTo: mainView.layoutMarginsGuide.bottomAnchor)
			])
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
