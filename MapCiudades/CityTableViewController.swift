//
//  CityTableViewController.swift
//  MapCiudades
//
//  Created by KMMX on 27/10/20.
//

import UIKit
import MapKit
class CityTableViewController: UITableViewController {
    
    var citys: [City] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        cellSetup()
        tableViewSetup()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    func cellSetup(){
        let london = City(title: "Londres", coordinate: CLLocationCoordinate2D(latitude: 51.50722, longitude: -0.1275), info: "Juegos olimpicos 2012 :)")
        let paris = City(title: "Paris", coordinate: CLLocationCoordinate2D(latitude: 48.8567, longitude: 2.3508), info: "La ciudad de la luz :V")
        let oslo = City(title: "Oslo", coordinate: CLLocationCoordinate2D(latitude: 59.95, longitude: 10.75), info: "Capital de noruega")
        let rome = City(title: "Roma", coordinate: CLLocationCoordinate2D(latitude: 41.9, longitude: 12.5), info: "Tiene una ciudad dentro de ella.")
        let washington = City(title: "Washington DC", coordinate: CLLocationCoordinate2D(latitude: 38.895111, longitude: -77.036667), info: "Nombrada en por el mismo george.")
        let appleHq1 = City(title: "Apple's HQ", coordinate: CLLocationCoordinate2D(latitude: 37.334722, longitude: -122.00888), info: "La casa de apple.")
        let todoTask = [london,paris,oslo,rome,washington,appleHq1]
        
        citys=todoTask
    }
    
    func tableViewSetup(){
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 350
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return citys.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellCity", for: indexPath)
        cell.textLabel?.text = citys[indexPath.row].title
        // Configure the cell...
        /*let cell = UITableViewCell()
        cell.textLabel?.text = "lala"*/
        return cell
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "segueDetail") {
            let indexPath = tableView.indexPathForSelectedRow
            
            let yourNextViewController = segue.destination as! CityDetail
            yourNextViewController.ciudad = citys[indexPath?.row ?? 0]
           
        
        }
    }
    
  
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
