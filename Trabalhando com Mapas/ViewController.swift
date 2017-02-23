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
    
    @IBOutlet weak var lblVelocidade: UILabel!
    @IBOutlet weak var lblLatitude: UILabel!
    @IBOutlet weak var lblLongitude: UILabel!
    @IBOutlet weak var lblEndereco: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        gerenciadorLocal.delegate = self
        gerenciadorLocal.desiredAccuracy = kCLLocationAccuracyBest
        gerenciadorLocal.requestWhenInUseAuthorization()
        gerenciadorLocal.startUpdatingLocation()
        
    }

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        
        if status != .authorizedWhenInUse {
            let alertController = UIAlertController(title: "Permissâo de localização", message: "Necessario permissâo para acesso à sua localização, por favor habilite", preferredStyle: .alert)
            let acaoConfig = UIAlertAction(title: "Abir Configurações", style: .default, handler: { (alertaConfiguracoes) in
                if let config = NSURL(string:UIApplicationOpenSettingsURLString){
                    UIApplication.shared.open(config as URL)
                }
            })
            let acaoCancelar = UIAlertAction(title: "Cancelar", style: .default, handler: nil)
            alertController.addAction(acaoConfig)
            alertController.addAction(acaoCancelar)
            
            present(alertController, animated: true, completion: nil)
        }
    }
    
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let localizacaoUsuario: CLLocation = locations.last!
        
        let latitude:CLLocationDegrees = localizacaoUsuario.coordinate.latitude
        let longitude:CLLocationDegrees = localizacaoUsuario.coordinate.longitude
        
        let localizacao: CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
        
        let deltaLatitude : CLLocationDegrees = 0.01
        let deltaLongitude : CLLocationDegrees = 0.01
        
        let areaVisualizacao: MKCoordinateSpan = MKCoordinateSpanMake(deltaLatitude, deltaLongitude)
        
        let regiao: MKCoordinateRegion = MKCoordinateRegionMake(localizacao, areaVisualizacao)
        
        mapa.setRegion(regiao, animated: true)

    }
   
}

