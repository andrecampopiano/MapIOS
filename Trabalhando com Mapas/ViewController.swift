//
//  ViewController.swift
//  Trabalhando com Mapas
//
//  Created by André Luís  Campopiano on 22/02/17.
//  Copyright © 2017 André Luís  Campopiano. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate{

    @IBOutlet weak var mapa: MKMapView!
    var gerenciadorLocal = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        gerenciadorLocal.delegate = self
        gerenciadorLocal.desiredAccuracy = kCLLocationAccuracyBest
        gerenciadorLocal.requestWhenInUseAuthorization()
        gerenciadorLocal.startUpdatingLocation()
        
        
        
        
        /*
        
        let latitude:CLLocationDegrees = -23.587489//-21.818355
        let longitude:CLLocationDegrees = -46.657667//-48.159924
        
        let localizacao: CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
        
        let deltaLatitude : CLLocationDegrees = 0.01
        let deltaLongitude : CLLocationDegrees = 0.01
        
        let areaVisualizacao: MKCoordinateSpan = MKCoordinateSpanMake(deltaLatitude, deltaLongitude)
        
        let regiao: MKCoordinateRegion = MKCoordinateRegionMake(localizacao, areaVisualizacao)
        
        mapa.setRegion(regiao, animated: true)
        
        let anotacao = MKPointAnnotation()
        
        //configurar
        
        anotacao.coordinate = localizacao
        anotacao.title = "Parque do ibirapuera"
        anotacao.subtitle = "Maior parque da america latina"
        mapa.addAnnotation(anotacao)
        */
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let localizacaoUsuario: CLLocation = locations.last!
        
        let latitude:CLLocationDegrees = -23.587489//-21.818355
        let longitude:CLLocationDegrees = -46.657667//-48.159924
        
        let localizacao: CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
        
        let deltaLatitude : CLLocationDegrees = 0.01
        let deltaLongitude : CLLocationDegrees = 0.01
        
        let areaVisualizacao: MKCoordinateSpan = MKCoordinateSpanMake(deltaLatitude, deltaLongitude)
        
        let regiao: MKCoordinateRegion = MKCoordinateRegionMake(localizacao, areaVisualizacao)
        
        mapa.setRegion(regiao, animated: true)

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

