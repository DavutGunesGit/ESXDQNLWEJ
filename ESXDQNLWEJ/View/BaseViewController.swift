import UIKit
import NVActivityIndicatorView
class BaseViewController: UIViewController {
    var viewLoading: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    func addLoader() {
        viewLoading = self.getLoader()
        self.view.addSubview(viewLoading)
    }
    func getLoader() -> UIView {
        let screenFrame = UIScreen.main.bounds

        let viewLoading = UIView(frame: CGRect(x: screenFrame.origin.x, y: screenFrame.origin.y, width: screenFrame.width, height: screenFrame.height))
        viewLoading.backgroundColor=UIColor.white
        viewLoading.alpha=0
        viewLoading.layer.zPosition = 1000

        let frame = CGRect(x: (screenFrame.size.width-30)/2, y: (screenFrame.size.height-30)/2, width: 30, height: 30)
        let intype = NVActivityIndicatorType.ballPulse
        let activityIndicatorView = NVActivityIndicatorView(frame: frame, type: intype)
        activityIndicatorView.color = UIColor.darkGray
        activityIndicatorView.startAnimating()
        viewLoading.addSubview(activityIndicatorView)

        return viewLoading
    }

    func startLoadingFull(_ isTransparent: Bool = false) {
        viewLoading.alpha = isTransparent ? 0.5 : 1
    }

    func stopLoadingFull() {
        UIView.animate(withDuration: 0.6) { //Constants.numbers.animationDuration
            self.viewLoading.alpha = 0
        }
    }

}
