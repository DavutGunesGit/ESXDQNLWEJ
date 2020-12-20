import UIKit
import MapKit
class DetailViewController: UIViewController {
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var tblTips: UITableView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var conTblTipsHeight: NSLayoutConstraint!
    var detailViewModel:DetailViewModel?
    var item:ItemModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tblTips.register(UINib(nibName: "\(TipCell.self)", bundle: nil), forCellReuseIdentifier:"TipCell")
        detailViewModel = DetailViewModel(model: item)
        detailViewModel?.setMatView(mapView: mapView)
        detailViewModel?.setName(lblName: lblName)

    }
    @IBAction func onClickClose(_ sender: Any) {
        self.dismiss(animated: false, completion: nil)
    }
}
extension DetailViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.item?.tips?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TipCell", for: indexPath) as! TipCell
        detailViewModel?.setCellContent(cell: cell, indexPath: indexPath)
        detailViewModel?.setTableViewHeight(constraint: conTblTipsHeight, indexPath: indexPath)
        return cell
    }
}
