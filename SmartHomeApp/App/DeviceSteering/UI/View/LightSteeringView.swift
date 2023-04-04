//TODO: Create plist for fonts
//  LightSteeringView.swift
//  SmartHomeApp
//
//  Created by Berkan Kesman on 02/04/2023.
//

import Foundation
import UIKit

protocol LightSteeringViewDelegate{
    func lightSteeringViewDelegate(didChangeIntensityValueForView: LightSteeringView,
                                   newValue: Int)
    func lightSteeringViewDelegate(didChangePowerSwitchForView: LightSteeringView,
                                   newValue: Bool)
}

class LightSteeringView: UIView {
    
    private lazy var sliderTitleLabel = createSliderTitleLabel()
    private lazy var slider = createSlider()
    private lazy var sliderValueLabel = createLabel()
    private lazy var powerSwitch = createPowerSwitch()
    private lazy var powerLabel = createLabel()
    var delegate: LightSteeringViewDelegate?
    
    //MARK: - Life cycle

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUp()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    func configure(with viewModel: LightSteeringViewModel) {
        sliderTitleLabel.text = viewModel.intensityTitle
        slider.value = Float(viewModel.intensity)
        sliderValueLabel.text = "\(viewModel.intensity)"
        powerSwitch.isOn = viewModel.mode == .On
        powerLabel.text = viewModel.modeTitle
        slider.isEnabled = powerSwitch.isOn
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
    
    private func createPowerSwitch() -> UISwitch {
        let powerSwitch = UISwitch()
        powerSwitch.translatesAutoresizingMaskIntoConstraints = false
        powerSwitch.addTarget(self, action: #selector(powerSwitchDidChange), for: .valueChanged)
        return powerSwitch
    }
    
    private func setUp() {
        addSubview(sliderTitleLabel)
        addSubview(slider)
        addSubview(sliderValueLabel)
        addSubview(powerSwitch)
        addSubview(powerLabel)
        NSLayoutConstraint.activate([
            sliderTitleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            sliderTitleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            slider.topAnchor.constraint(equalTo: sliderTitleLabel.bottomAnchor, constant: 32),
            slider.centerXAnchor.constraint(equalTo: centerXAnchor, constant: -12),
            slider.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.75),
            sliderValueLabel.centerYAnchor.constraint(equalTo: slider.centerYAnchor),
            sliderValueLabel.leadingAnchor.constraint(equalTo: slider.trailingAnchor, constant: 8),
            powerLabel.topAnchor.constraint(equalTo: topAnchor, constant: UIScreen.main.bounds.height * 0.25),
            powerLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            powerSwitch.centerYAnchor.constraint(equalTo: powerLabel.centerYAnchor),
            powerSwitch.leadingAnchor.constraint(equalTo: powerLabel.trailingAnchor, constant: 8)
        ])
    }
    
    @objc private func onSliderValChanged(slider: UISlider, event: UIEvent) {
        if let touchEvent = event.allTouches?.first {
            if touchEvent.phase == .moved {
                sliderValueLabel.text = "\(Int(slider.value))"
            }
            else if touchEvent.phase == .ended {
                delegate?.lightSteeringViewDelegate(didChangeIntensityValueForView: self, newValue: Int(slider.value))
            }
        }
    }
    
    @objc private func powerSwitchDidChange(slider: UISlider) {
        delegate?.lightSteeringViewDelegate(didChangePowerSwitchForView: self, newValue: powerSwitch.isOn)
    }
}
