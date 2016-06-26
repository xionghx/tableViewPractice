//
//  CustomTableViewCell.swift
//  tableViewPractice
//
//  Created by xionghuanxin on 6/24/16.
//  Copyright © 2016 xionghuanxin. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    lazy var headImage: UIImageView = {
        let view = UIImageView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        return view
    }()
    
    lazy var titleLabel : UILabel = {
        let label = UILabel(frame: CGRect(x: 80, y: 0, width: 200, height: 50))
        label.textAlignment = NSTextAlignment.Left
        return label
    }()
    
    lazy var discribe : UILabel = {
        let label = UILabel(frame: CGRect(x: 280, y: 0, width: 375-300, height: 50))
        label.textAlignment = NSTextAlignment.Left
        return label
    }()

    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
    super.init(style: style , reuseIdentifier: reuseIdentifier)
        self.contentView.addSubview(self.titleLabel)
        self.contentView.addSubview(self.discribe)
        self.contentView.addSubview(self.headImage)
    
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

  
}
