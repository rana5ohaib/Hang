//
//  ReachabilityManager.swift
//  Hang
//
//  Created by Devfactori II on 8/10/20.
//  Copyright © 2020 Hang. All rights reserved.
//

import Foundation
import Network

final class ReachabilityManager {
    
    //==========================
    // MARK:- Shared Instance
    //==========================
    static let shared : ReachabilityManager = ReachabilityManager()
    
    //==========================
    // MARK:- Variables
    //==========================
    var isMonitoring = false
    
    var monitor: NWPathMonitor?
    
    var isConnected: Bool {
        guard let monitor = monitor else { return false }
        return monitor.currentPath.status == .satisfied
    }
    
    var interfaceType: NWInterface.InterfaceType? {
        guard let monitor = monitor else { return nil }
        
        return monitor.currentPath.availableInterfaces.filter {
            monitor.currentPath.usesInterfaceType($0.type) }.first?.type
    }
    
    var availableInterfacesTypes: [NWInterface.InterfaceType]? {
        guard let monitor = monitor else { return nil }
        return monitor.currentPath.availableInterfaces.map { $0.type }
    }
    
    var isExpensive: Bool {
        return monitor?.currentPath.isExpensive ?? false
    }
    
    //==========================
    // MARK:- Named Closures
    //==========================
    var didStartMonitoringHandler   : (() -> Void)?
    var didStopMonitoringHandler    : (() -> Void)?
    var netStatusChangeHandler      : (() -> Void)?
    
    //==========================
    // MARK:- Life Cycle
    //==========================
    init() {
        startMonitoring()
    }
    
    deinit {
        stopMonitoring()
    }
    
}

//==========================
// MARK:- Helper Functions
//==========================
extension ReachabilityManager {
    func startMonitoring() {
        guard !isMonitoring else { return }
        
        monitor = NWPathMonitor()
        let queue = DispatchQueue(label: "ReachabilityManager_Monitor")
        monitor?.start(queue: queue)
        
        monitor?.pathUpdateHandler = { _ in
            self.netStatusChangeHandler?()
        }
        
        isMonitoring = true
        didStartMonitoringHandler?()
    }
    
    
    func stopMonitoring() {
        guard isMonitoring, let monitor = monitor else { return }
        monitor.cancel()
        self.monitor = nil
        isMonitoring = false
        didStopMonitoringHandler?()
    }
}
