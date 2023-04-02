//
//  DeviceTableViewCell.swift
//  SmartHomeApp
//
//  Created by Berkan Kesman on 01/04/2023.
//

import Foundation
import UIKit

class DeviceTableViewCell: UITableViewCell {
    
    private lazy var deviceNameLabel = createLabel()
    private lazy var currentStateLabel = createLabel()
    private lazy var currentStateImageView = createCurrentStateImageView()

    //MARK: - Life cycle

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUp()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUp()
    }
    
    func configure(with viewModel: DeviceViewModel) {
        deviceNameLabel.text = viewModel.deviceName
        currentStateLabel.text = viewModel.currentState
        currentStateImageView.image = viewModel.currentStateIcon
        if viewModel.isWorking {
            currentStateLabel.textColor = .green
        } else {
            currentStateLabel.textColor = .red
        }
    }
    
    private func createLabel() -> UILabel {
        let label = UILabel()
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    
    private func createCurrentStateImageView() -> UIImageView {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }
    
    private func setUp() {
        contentView.addSubview(deviceNameLabel)
        contentView.addSubview(currentStateLabel)
        contentView.addSubview(currentStateImageView)
        selectionStyle = .gray
        setUpDisclosureIndicator()
        setUpLayout()
        currentStateImageView.setContentCompressionResistancePriority(.defaultHigh + 1, for: .horizontal)
    }
    
    private func setUpLayout() {
        currentStateImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12).isActive = true
        currentStateImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12).isActive = true
        currentStateImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12).isActive = true
        deviceNameLabel.centerYAnchor.constraint(equalTo: currentStateImageView.centerYAnchor).isActive = true
        deviceNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12).isActive = true
        deviceNameLabel.trailingAnchor.constraint(lessThanOrEqualTo: currentStateImageView.leadingAnchor, constant: -12).isActive = true
        currentStateLabel.bottomAnchor.constraint(equalTo: currentStateImageView.bottomAnchor).isActive = true
        currentStateLabel.trailingAnchor.constraint(equalTo: currentStateImageView.leadingAnchor, constant: -8).isActive = true
    }
    
    private func setUpDisclosureIndicator() {
        guard let image: UIImage = .chevronRight else {
            return
        }
        let accessory  = UIImageView(frame:CGRect(x:0, y:0, width: image.size.width, height:image.size.height))
        accessory.image = image
        accessoryView = accessory
    }
}
