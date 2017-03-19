//
//  ViewController.swift
//  Carousel
//
//  Created by Benjamin Emdon on 2016-09-01.
//  Copyright © 2016 Benjamin Emdon.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
	
	let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout())
	var flowLayout: CarouselCollectionViewFlowLayout!
	let cellPercentWidth: CGFloat = 0.85
	var currentCenteredPage = 0
	
	fileprivate var pageWidth: CGFloat {
		return flowLayout.itemSize.width + flowLayout.minimumLineSpacing
	}
	
	fileprivate var contentOffset: CGFloat {
		return collectionView.contentOffset.x + collectionView.contentInset.left
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = UIColor.lightGray
		collectionView.backgroundColor = UIColor.clear
		
		// delegate & data source
		collectionView.delegate = self
		collectionView.dataSource = self
		
		// layout subview
		view.addSubview(collectionView)
        //collectionView.frame = CGRect(x: 0, y: 64, width: view.bounds.width, height: view.bounds.height - 64)
		collectionView.frame = CGRect(origin: .zero, size: CGSize(width: view.bounds.width, height: view.bounds.height - 15))
		// register collection cells
		collectionView.register(CollectionCell.self, forCellWithReuseIdentifier: String(describing: CollectionCell.self))
		
		// configure layout
		flowLayout = CarouselCollectionViewFlowLayout.configureLayout(collectionView: collectionView, itemSize: CGSize(width: collectionView.bounds.width * cellPercentWidth, height: collectionView.bounds.height - 50), minimumLineSpacing: 10)
		collectionView.showsVerticalScrollIndicator = false
		collectionView.showsHorizontalScrollIndicator = false

        collectionView.snp.makeConstraints { (make) in
            make.top.equalTo(topLayoutGuide.snp.bottom)
            make.left.right.bottom.equalToSuperview()
        }
	}
	
	// MARK: - Helper actions
	
	fileprivate func scrollTo(_ page: Int, animated: Bool) {
		let pageOffset = CGFloat(page) * pageWidth - collectionView.contentInset.left
		collectionView.setContentOffset(CGPoint(x: pageOffset, y: 0), animated: animated)
		currentCenteredPage = page
		collectionView.isUserInteractionEnabled = false
	}

    let temp = ["", "", ""]
}

extension ViewController: UICollectionViewDelegate {
	func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
		currentCenteredPage = Int(contentOffset / pageWidth)
		print("Center page index: \(currentCenteredPage)")
	}
	
	func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
		collectionView.isUserInteractionEnabled = true
	}
}

extension ViewController: UICollectionViewDataSource {
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 6
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: CollectionCell.self), for: indexPath) as! CollectionCell
        //cell.titleLabel.text = "Cell #\(indexPath.row)"
		return cell
	}
	
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		guard !collectionView.isDragging && !collectionView.isDecelerating && !collectionView.isTracking else { return }
		if indexPath.row != currentCenteredPage {
			scrollTo(indexPath.row, animated: true)
			print("Center page index: \(currentCenteredPage)")
		}
		print("Selected page index: \(indexPath.row)")
	}
}
