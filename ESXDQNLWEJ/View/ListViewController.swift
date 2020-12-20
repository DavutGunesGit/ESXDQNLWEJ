import UIKit

class ListViewController: BaseViewController {
    var foursquareResponse:FoursquareResponse?
    @IBOutlet weak var tblList: UITableView!
    var listViewModel:ListViewModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tblList.register(UINib(nibName: "\(ListCell.self)", bundle: nil), forCellReuseIdentifier:"ListCell")
        if let groups = self.foursquareResponse?.response?.groups {
            listViewModel = ListViewModel(model: groups)
        }

        // Do any additional setup after loading the view.
    }
}
extension ListViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let group = self.foursquareResponse?.response?.groups?[indexPath.section], let items = group.items{
            let item = items[indexPath.row]
            self.performSegue(withIdentifier: "DetailSegue", sender: item)
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.foursquareResponse?.response?.groups?.count ?? 0
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let group = self.foursquareResponse?.response?.groups?[section], let items = group.items{
            return items.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell", for: indexPath) as! ListCell
        listViewModel?.setCellContent(cell: cell, indexPath: indexPath)
        return cell
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "DetailSegue"{
            if let controller = segue.destination as? DetailViewController {
                controller.item = sender as? ItemModel
            }
        }
    }
    
}

