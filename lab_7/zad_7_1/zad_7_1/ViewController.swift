//
//  ViewController.swift
//  zad_7_1
//
//  Created by Rafał Kuźmiczuk on 04/04/2022.
//  Copyright © 2022 Rafał Kuźmiczuk. All rights reserved.
//

import UIKit

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Row of table view")
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Houses"
        }
        else if section == 1 {
            return "Flats"
        }
        return nil
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return houses.count
        }
        else if section == 1 {
            return flats.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "houses", for: indexPath) as! HouseCell
            cell.houseName.text = houses[indexPath.row].name
            cell.housePhoto.image = UIImage(named:  houses[indexPath.row].photoPath)
            return cell
        }
        else if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "flats", for: indexPath) as! FlatCell
            cell.flatName.text = flats[indexPath.row].name
            cell.flatPhoto.image = UIImage(named: flats[indexPath.row].photoPath)
            return cell
        }
        return UITableViewCell()
    }
}

class HouseCell: UITableViewCell {
    @IBOutlet weak var houseName: UILabel!
    @IBOutlet weak var housePhoto: UIImageView!
}

class FlatCell: UITableViewCell {
    @IBOutlet weak var flatName: UILabel!
    @IBOutlet weak var flatPhoto: UIImageView!
}

class ViewController: UIViewController {
    
    @IBOutlet weak var myTableView: UITableView!
    
    var houses = [
        House(name: "House 1", houseArea: 111.1, roomCount: 3, floorCount: 1, landArea: 154.15, photoPath: "house1"),
        House(name: "House 2", houseArea: 222.2, roomCount: 4, floorCount: 2, landArea: 423.45, photoPath: "house2"),
        House(name: "House 3", houseArea: 111.1, roomCount: 5, floorCount: 3, landArea: 245.46, photoPath: "house3"),
    ]
    var flats = [
        Flat(name: "Flat 1", area: 89.45, roomCount: 6, isDuplex: true, photoPath: "flat1"),
        Flat(name: "Flat 2", area: 75.45, roomCount: 5, isDuplex: false, photoPath: "flat2"),
        Flat(name: "Flat 3", area: 71.54, roomCount: 3, isDuplex: false, photoPath: "flat3"),
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        myTableView.delegate = self
        myTableView.dataSource = self
    }
}
