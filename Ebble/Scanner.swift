import Foundation
import CoreBluetooth
import UIKit

class Scanner: NSObject, CBCentralManagerDelegate {
    var manager: CBCentralManager!

    var connectingPeripheral: CBPeripheral?
    var discoveredPeripheral: [CBPeripheral]?
    var foundDevice: Bool = false;
    @IBOutlet var deviceName: UILabel!
    
    func start() {
        manager = CBCentralManager(delegate: self, queue: nil)
    }

    func centralManagerDidUpdateState(central: CBCentralManager!) {
        if central.state == .PoweredOn {
            //central.scanForPeripheralsWithServices([CBUUID(string: kServiceUUID)], options: nil)
            println("Bluetooth is on, Start scanning for devices")
            central.scanForPeripheralsWithServices(nil, options: nil)
        }
    }

    func centralManager(central: CBCentralManager!, didDiscoverPeripheral peripheral: CBPeripheral!, advertisementData: [NSObject : AnyObject]!, RSSI: NSNumber!) {
        central.stopScan()
        foundDevice = true;
        println("Found BLE device: "+peripheral.name)
        // this portion should be spinned off to another function with a UI segue, but cannot do it for now
        central.connectPeripheral(peripheral, options: nil)
        connectingPeripheral = peripheral
        println(peripheral.description)
        println(peripheral.name)
        println(peripheral.identifier)
        discoveredPeripheral?.append(peripheral)
        
    }

    func centralManager(central: CBCentralManager!, didConnectPeripheral peripheral: CBPeripheral!) {
        connectingPeripheral = nil
        println("Connected to "+peripheral.name)
    }
    
    func connectToPeripheral(central: CBCentralManager!, peripheral: CBPeripheral){
        central.connectPeripheral(peripheral, options: nil)
    }
    
    func printDiscovered() {
    
    }
}
