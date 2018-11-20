//
//  ECCoffeeShopCell.swift
//  EnvoyCoffee
//
//  Created by Goran Tokovic on 11/19/18.
//  Copyright © 2018 Goran Tokovic. All rights reserved.
//

import Foundation
import UIKit
import SnapKit
import AlamofireImage

class ECCoffeeShopCell: UITableViewCell {
    
    //UI
    fileprivate lazy var coffeeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.gray.withAlphaComponent(0.5)
        return imageView
    }()
    
    fileprivate lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        label.numberOfLines = 2
        return label
    }()
    
    fileprivate lazy var addressLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    fileprivate lazy var ratingLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 1
        return label
    }()
    
    //Data
    static let imageHeight : Int = 250
    var viewModel: ECCoffeeShopCellViewModel!{
        didSet{
            configureData()
        }
    }
    
    //MARK: - Initializations
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func commonInit(){
        let defaultOffset: CGFloat = 20
        
        selectionStyle = .none
        //Coffee image view
        contentView.addSubview(coffeeImageView)
        coffeeImageView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(defaultOffset)
            make.centerX.equalToSuperview()
            make.size.equalTo(ECCoffeeShopCell.imageHeight)
        }
        
        //Name label
        contentView.addSubview(nameLabel)
        nameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(coffeeImageView.snp.bottom).offset(defaultOffset)
            make.leading.equalToSuperview().offset(defaultOffset)
            make.trailing.equalToSuperview().offset(-defaultOffset)
        }
        
        //Address label
        contentView.addSubview(addressLabel)
        addressLabel.snp.makeConstraints { (make) in
            make.top.equalTo(nameLabel.snp.bottom).offset(defaultOffset)
            make.leading.trailing.equalTo(nameLabel)
            make.bottom.equalToSuperview().offset(-defaultOffset)
        }
        
    }
    
    private func configureData(){
        nameLabel.text = viewModel.name()
        addressLabel.text = viewModel.formattedAddress()
        coffeeImageView.image = nil
        viewModel.imageURLString(imageHeight: ECCoffeeShopCell.imageHeight * 2) { [weak self](urlString) in
            if let urlString = urlString,let url = URL.init(string: urlString){
                self?.coffeeImageView.af_setImage(withURL: url)
            }
        }
        
        
    }
    
}
