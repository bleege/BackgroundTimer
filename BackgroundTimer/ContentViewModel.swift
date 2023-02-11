//
//  ContentViewModel.swift
//  BackgroundTimer
//
//  Created by Brad Leege on 2/11/23.
//

import Combine
import Foundation

@MainActor
class ContentViewModel: ObservableObject {
    
    @Published var textToDisplay = "Howdy"
    
    private var cancellables = Set<AnyCancellable>()
    
    
    init() {
        BackgroundDataManager.shared.$currentTime.sink(receiveValue: { [weak self] value in
            guard let value = value else {
                return
            }
            self?.textToDisplay = String(format: "%.0f", value)
        }).store(in: &cancellables)
        
    }
    
}
