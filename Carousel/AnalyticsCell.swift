//
//  AnalyticsCell.swift
//  DreamJob
//
//  Created by Igor on 18/03/2017.
//  Copyright © 2017 Igor. All rights reserved.
//

import UIKit
import SnapKit

class AnalyticsCell: UITableViewCell {

    let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()

    let detailLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont(name: "Avenir-Book", size: 12)
        return label
    }()

    // MARK: Initalizers
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(titleLabel)
        contentView.addSubview(detailLabel)
        setupConstraints()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupConstraints() {
        let marginGuide = contentView.layoutMarginsGuide
        titleLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(marginGuide.snp.leading)
            make.top.equalTo(marginGuide.snp.top)
            make.trailing.equalTo(marginGuide.snp.trailing)
        }
        detailLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(marginGuide.snp.leading)
            make.bottom.equalTo(marginGuide.snp.bottom)
            make.trailing.equalTo(marginGuide.snp.trailing)
            make.top.equalTo(titleLabel.snp.bottom)
        }
    }
}
