import UIKit
import CoreLocation
class ViewController: BaseViewController {
    @IBOutlet weak var txtSearch: UITextField!
    @IBOutlet weak var txtNear: UITextField!
    let locationManager = CLLocationManager()
    var location = CLLocation()
    var foursquareResponse:FoursquareResponse?
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        self.addLoader()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.retriveCurrentLocation()
    }
    @IBAction func onClickSerchResult(_ sender: Any) {
        self.getPlaces()
    }
    func retriveCurrentLocation(){
        locationManager.delegate = self
        let status = CLLocationManager.authorizationStatus()
        if(status == .denied || status == .restricted || !CLLocationManager.locationServicesEnabled()){
            return
        }
        if(status == .notDetermined){
            locationManager.requestWhenInUseAuthorization()
            locationManager.requestWhenInUseAuthorization()
            locationManager.requestAlwaysAuthorization()
            return
        }
        locationManager.requestLocation()
    }

    @objc func keyboardWillShow(notification: Notification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0{
                self.view.frame.origin.y -= keyboardSize.height/2
            }
        }

    }

    @objc func keyboardWillHide(notification: Notification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y != 0 {
                self.view.frame.origin.y += keyboardSize.height/2
            }
        }
    }
    func getPlaces()  {
        if let query = self.txtSearch.text, query.count > 0 {
            self.startLoadingFull()
            let request = FoursquareRequest()
            request.client_id = "RBY4T3YCWUR5NF5I1ALDL21LHVE1JKKROWNIZF3MAGFDR1JH"
            request.client_secret = "FW12L5E2L4BFN5OGLSPAQM4F1VNQRZFHLIGZCMRJZELHIXJD"
            request.v = "20201210"
            if let nearString = self.txtNear.text, nearString.count > 0 {
                request.near = nearString
            }else{
                request.ll = "\(location.coordinate.latitude),\(location.coordinate.longitude)"
            }
            request.query = query
            request.locale = "tr"
            ConnectionManager.sharedInstance.requestWithConnection(request: request) { (response: FoursquareResponse?, error) in
                self.foursquareResponse = response
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3) {
                    if response?.meta?.code == 200{
                        self.performSegue(withIdentifier: "ListSegue", sender: nil)
                    }else if let message = response?.meta?.errorDetail{
                        let alert = UIAlertController(title: "Uyarı", message: message, preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "Tamam", style: .default, handler: nil))
                        self.present(alert, animated: true, completion: nil)
                    }
                    self.stopLoadingFull()
                }
            }
        }else{
            let alert = UIAlertController(title: "Uyarı", message: "Lütfen, aramak istediğiniz anahtar kelimeyi giriniz!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Tamam", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "ListSegue"{
            if let controller = segue.destination as? ListViewController {
                controller.foursquareResponse = self.foursquareResponse
            }
        }
    }
}

extension ViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            self.location = location
        }
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
    }
}
