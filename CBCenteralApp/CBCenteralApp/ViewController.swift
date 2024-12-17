//
//  ViewController.swift
//  CBCenteralApp
//
//  Created by Hitesh on 16/12/24.
//

import UIKit
import CoreBluetooth

final class ViewController: UIViewController {
    private var manager: CBCentralManager?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCenteralManager()
    }

    func setupCenteralManager() {
        manager = CBCentralManager(delegate: self, queue: nil)
    }
}

extension ViewController {
    func alert(msg: String) {
        let vc = UIAlertController(title: "Alert", message: msg, preferredStyle: .alert)
        self.present(vc, animated: true)
    }
}

// - MARK: - CBCentralManagerDelegate
extension ViewController: CBCentralManagerDelegate {
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        switch central.state {
        case .unknown:
            break
        case .resetting:
            alert(msg: "Bluetooth is resetting")
            break
        case .unsupported:
            alert(msg: "Bluetooth is not supported")
            break
        case .unauthorized:
            break
        case .poweredOff:
            debugPrint("Bluetooth power is off")
            alert(msg: "Bluetooth is off. Please turn on the bluetooth")
            break
        case .poweredOn:
            debugPrint("Bluetooth power is on")
            break
        @unknown default:
            break
        }
    }
}
