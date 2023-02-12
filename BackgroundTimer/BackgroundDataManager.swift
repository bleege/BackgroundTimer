//
//  BackgroundDataManager.swift
//  BackgroundTimer
//
//  Created by Brad Leege on 2/11/23.
//

import Combine
import Foundation

@MainActor
class BackgroundDataManager {
    
    public static let shared = BackgroundDataManager()
    
    @Published var currentTime: Double?
    
    private var cancellables = Set<AnyCancellable>()
    
    private lazy var timer: DispatchSourceTimer = {
        let t = DispatchSource.makeTimerSource(queue: .global(qos: .utility))
        t.schedule(deadline: .now(), repeating: .seconds(3))
        t.setEventHandler(handler: { [weak self] in
//            self?.eventHandler?()
            Task {
                self?.setCurrentTime()
            }
        })
        return t
    }()
    
    private init() {
        
//        let timer = DispatchQueue.global(qos: .utility)
//            .schedule(after: DispatchQueue.SchedulerTimeType(.now()), interval: .seconds(5),tolerance: .seconds(1)) { [weak self] in
//                print("Timer run - 1")
//                guard let self else { return }
//                Task {
//                    print("Timer run - 2")
//                    self.setCurrentTime()
//                    print("Timer run - 3")
//                } // Trampoline back into the actor context.
//            }.store(in: &cancellables)
        
//        let timer = DispatchSource.makeTimerSource(queue: .global(qos: .utility))
//        timer.schedule(deadline: .now(), repeating: .seconds(3))
//        timer.setEventHandler(handler: { [weak self] in
//            self?.setCurrentTime()
//        })
//        timer.resume()
        timer.resume()
    }
    
    func setCurrentTime() {
        let date = Date()
        currentTime = date.timeIntervalSince1970
    }
    
}
