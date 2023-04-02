//
//  LightSteeringViewModelMapper.swift
//  SmartHomeApp
//
//  Created by Berkan Kesman on 02/04/2023.
//

import Foundation

struct LightSteeringViewModelMapper {
    
    func map(product: LightProduct) -> LightSteeringViewModel {
        return LightSteeringViewModel(mode: product.mode, intensity: product.intensity)
    }
}
