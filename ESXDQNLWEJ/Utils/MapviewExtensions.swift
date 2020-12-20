//
//  DictionaryExtensions.swift
//  ESXDQNLWEJ
//
//  Created by davut.gunes on 12/20/20.
//

import Foundation
import MapKit
extension MKMapView {
    func centerToLocation(
        _ location: CLLocation,
        regionRadius: CLLocationDistance = 1000
    ) {
        let coordinateRegion = MKCoordinateRegion(
            center: location.coordinate,
            latitudinalMeters: regionRadius,
            longitudinalMeters: regionRadius)
        setRegion(coordinateRegion, animated: true)
    }
}
