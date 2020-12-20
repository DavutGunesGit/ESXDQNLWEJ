//
//  ListViewModel.swift
//  ESXDQNLWEJ
//
//  Created by davut.gunes on 12/20/20.
//

import UIKit
import MapKit

class DetailViewModel: NSObject {
    var item:ItemModel?
    var totalHeight:Float = 0
    var heights = [CGFloat]()

    init(model: ItemModel? = nil) {
        if let inputModel = model {
            item = inputModel
        }
    }
    public func setMatView(mapView: MKMapView) {
        let initialLocation = CLLocation(latitude: self.item?.venue?.location?.lat ?? 0, longitude: self.item?.venue?.location?.lng ?? 0)
        mapView.centerToLocation(initialLocation)
    }
    public func setName(lblName: UILabel) {
        lblName.text = item?.venue?.name
    }
    public func setCellContent(cell: TipCell, indexPath: IndexPath) {
        let tip = item?.tips?[indexPath.row]
        cell.setContent(tip: tip)
        if heights.count <= indexPath.row {
            heights.append(getCellHeight(lblText: cell.lblText))
        }
        print("\(heights), \(heights.count)")
    }
    public func setTableViewHeight(constraint: NSLayoutConstraint, indexPath: IndexPath) {
        var totalHeights:CGFloat = 32
        for height in heights {
            totalHeights = totalHeights + height + 30
        }
        constraint.constant = totalHeights
    }
    func getCellHeight(lblText: UILabel) -> CGFloat {
        return lblText.frame.height

    }
}
