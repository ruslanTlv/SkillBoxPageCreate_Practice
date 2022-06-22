//
//  CustomTableViewCell.swift
//  AllOverAgain
//
//  Created by Ruslan on 20/06/22.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    static let ID = "CustomTableViewCell"

    var info: Info? {
        didSet{
            guard let info = info else { return }
            image.image = info.image
            headerLabel.text = info.header
            descriptionLabel.text = info.description
            timeText.text = info.time
        }
    }
    
    let image: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.layer.cornerRadius = 10
        return image
    }()
    
    let headerLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.ThonburiLight16
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.ThonburiLight14
        label.numberOfLines = 0
        return label
    }()
    
    let timeText: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .light)
        label.textColor = .lightGray
        return label
    }()
    
    let like: UIImageView = {
        let like = UIImageView()
        like.image = UIImage(named: "suit.heart")
        like.tintColor = .lightGray
        return like
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(image)
        contentView.addSubview(headerLabel)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(timeText)
        contentView.addSubview(like)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        image.snp.makeConstraints { make in
            make.top.equalTo(contentView).inset(2)
            make.left.equalTo(contentView).inset(16)
            make.width.height.equalTo(50)
        }
        
        headerLabel.snp.makeConstraints { make in
            make.top.equalTo(contentView).inset(2)
            make.left.equalTo(image.snp_rightMargin).inset(-16)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(headerLabel.snp_bottomMargin).inset(-8)
            make.left.equalTo(image.snp_rightMargin).inset(-16)
            make.width.equalTo(300)
        }
        
        timeText.snp.makeConstraints { make in
            make.top.equalTo(contentView).inset(2)
            make.right.equalTo(contentView).inset(16)
        }
        
        like.snp.makeConstraints { make in
            make.bottom.equalTo(contentView).inset(8)
            make.right.equalTo(contentView).inset(8)
            make.width.height.equalTo(20)
        }
        
        if info?.isLiked == false {
            like.image = UIImage(named: "suit.heart")
            like.tintColor = .lightGray
        } else {
            like.image = UIImage(named: "heart.fill")
            like.tintColor = .red
        }
    }
}
