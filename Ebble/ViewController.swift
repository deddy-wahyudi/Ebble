import UIKit
import AVFoundation

class ViewController: UIViewController {
    let scanner = Scanner()
    //let camera = UIImagePickerController()
    
    override func viewDidLoad() {
        //AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback, error: nil)
        //AVAudioSession.sharedInstance().setActive(true, error: nil)
        UIApplication.sharedApplication().beginReceivingRemoteControlEvents()
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_: Bool) {
        //  scanner.printDiscovered()
    }

    
    @IBAction func startScanningForDevices() {
        scanner.start()
    }
    
    @IBAction func check() {
        if(scanner.foundDevice){
            // found a device
            //performSegueWithIdentifier("Connected", sender: nil)
            println("Connected to a device")
        } else {
            // device not found
            //performSegueWithIdentifier("ConnectFailed", sender: nil)
            println("Not connected to a device")
        }
    }
    
    
}
