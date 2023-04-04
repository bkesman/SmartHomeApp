//
//  RollerShutterSteeringView.swift
//  SmartHomeApp
//
//  Created by Berkan Kesman on 04/04/2023.
//

import Foundation
import UIKit

protocol RollerShutterSteeringViewDelegate{
    func rollerShutterSteeringViewDelegate(didChangePositionValueForView: RollerShutterSteeringView,
                                           newValue: Int)
    func rollerShutterSteeringViewDelegate(didRequestNewPositionValueForView: RollerShutterSteeringView,
                                           newValue: Int)
}

class RollerShutterSteeringView: UIView {
    
    private lazy var sliderTitleLabel = createSliderTitleLabel()
    public lazy var slider = createSlider()
    private lazy var sliderValueLabel = createLabel()
    var delegate: RollerShutterSteeringViewDelegate?
    var titleTopToSliderBottomConstraint: NSLayoutConstraint?
    var valueBottomToSliderTopConstraint: NSLayoutConstraint?
    
    //MARK: - Life cycle

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUp()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        updateLayout()
    }
    
    func configure(with viewModel: RollerShutterSteeringViewModel) {
        sliderTitleLabel.text = viewModel.positionTitle
        slider.value = Float(viewModel.positionValue)
        sliderValueLabel.text =  viewModel.positionValueTitle
    }
    
    private func createSliderTitleLabel() -> UILabel {
        let sliderTitleLabel = UILabel()
        sliderTitleLabel.numberOfLines = 1
        sliderTitleLabel.font = UIFont(name: "MarkerFelt-Thin", size: 30)
        sliderTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        return sliderTitleLabel
    }
    
    private func createSlider() -> UISlider {
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.transform = CGAffineTransform(rotationAngle: -CGFloat.pi / 2)
        slider.addTarget(self, action: #selector(onSliderValChanged(slider:event:)), for: .valueChanged)
        return slider
    }
    
    private func createLabel() -> UILabel {
        let label = UILabel()
        label.numberOfLines = 1
        label.font = UIFont(name: "MarkerFelt-Thin", size: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    
    private func setUp() {
        addSubview(sliderTitleLabel)
        addSubview(slider)
        addSubview(sliderValueLabel)
        NSLayoutConstraint.activate([
            slider.centerYAnchor.constraint(equalTo: centerYAnchor),
            slider.centerXAnchor.constraint(equalTo: centerXAnchor),
            slider.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.75),
            sliderValueLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            sliderTitleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
        ])
    }
    
    func updateLayout() {
        titleTopToSliderBottomConstraint?.isActive = false
        titleTopToSliderBottomConstraint = sliderTitleLabel.topAnchor.constraint(equalTo: slider.bottomAnchor, constant: 0.5*slider.frame.height)
        titleTopToSliderBottomConstraint?.isActive = true
        valueBottomToSliderTopConstraint?.isActive = false
        valueBottomToSliderTopConstraint = sliderValueLabel.bottomAnchor.constraint(equalTo: slider.topAnchor, constant: -0.5*slider.frame.height)
        valueBottomToSliderTopConstraint?.isActive = true
    }
    
    @objc private func onSliderValChanged(slider: UISlider, event: UIEvent) {
        if let touchEvent = event.allTouches?.first {
            /* To avoid excessively frequent read/write operations to UserDefaults, we only update the user defaults when the user has finished interacting with the slider*/
            if touchEvent.phase == .moved {
                delegate?.rollerShutterSteeringViewDelegate(didChangePositionValueForView: self, newValue: Int(slider.value))
            }
            else if touchEvent.phase == .ended {
                delegate?.rollerShutterSteeringViewDelegate(didRequestNewPositionValueForView: self, newValue: Int(slider.value))
            }
        }
    }
}
