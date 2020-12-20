import UIKit

class ListViewModel: NSObject {
    var groups = [GroupsModel]()

    init(model: [GroupsModel]? = nil) {
        if let inputModel = model {
            groups = inputModel
        }
    }
    public func setCellContent(cell: ListCell, indexPath: IndexPath) {
        let group = groups[indexPath.section]
        if let items = group.items{
            let item = items[indexPath.row]
            cell.setContent(veneu: item.venue)
        }
    }
}
