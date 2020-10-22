//
//  ViewController.swift
//  MyMap
//
//  Created by 岩渕真未 on 2020/10/22.
//  Copyright © 2020 岩渕真未. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController , UITextFieldDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Text Field のdelegate通知先を設定
        inputText.delegate = self
    }

    @IBOutlet weak var inputText: UITextField!
 
    
    @IBOutlet weak var dispMap: MKMapView!
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //キーボードを閉じる（１）        textField.resignFirstResponder()
        
        //入力された文字を取り出す（２）
        if let searchKey = textField.text{
            //入力された文字をデバックエリアに表示（３）
            print(searchKey)
            
            //CLGeocoderインスタンスを取得（５）
            let  geocoder = CLGeocoder()
            
            //入力された文字から位置情報を取得（６）
            geocoder.geocodeAddressString(searchKey , completionHandler: { (placemarks, error) in
                
                //位置情報が存在する場合は、unwraPlacemarkに取り出す（７）
                if let unwrapPlacemarks = placemarks {
                    
                    //l件目の情報を取り出す（８）
                    if let firstPlacemark = unwrapPlacemarks.first {
                        
                        //位置情報を取り出す（９）
                        if let location = firstPlacemark.location {
                            
                            //位置情報から緯度経度をtargetCoordinateに取り出す（１０）
                            let targetCoordinate = location.coordinate
                            
                            //緯度経度をデバックエリアに表示（１１）
                            print(targetCoordinate)
                            
                           }
                        
                       }
                    
                    }
                
                    
                })
            
        }
        
        //デフォルト動作を行うのでtrueを返す（４）
        return true
    }
}

