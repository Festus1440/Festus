//
//  HomeTableViewC.swift
//  Festus
//
//  Created by Festus Muberuka on 10/18/19.
//  Copyright © 2019 Festus Muberuka. All rights reserved.
//

import UIKit

class User: NSObject {
    //dynamic let dynamicColor = UIColor { (traitCollection: UITraitCollection) -> UIColor in
    }

class HomeTableViewC: UITableViewController {

    @IBOutlet weak var Call: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SetUpElements()
        //styleFilledButton(Call)
        //let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        //navigationController?.navigationBar.titleTextAttributes = textAttributes
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    @objc dynamic let dynamicColor = UIColor { (traitCollection: UITraitCollection) -> UIColor in
        switch traitCollection.userInterfaceStyle {
        case
          .unspecified,
          .light: return .black
        case .dark: return .white
        @unknown default:
            fatalError()
        }
    }
    
    /*
    func tableView(_tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let frame: CGRect = tableView.frame
        let button = UIButton(frame: CGRect(x: 5, y: 10, width: 15, height: 15))  // create button
        //UIButton(type: .roundedRect)
        button.setTitle("Edit", for: .normal)
        button.backgroundColor = UIColor.red
        button.tag = section
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height))  // create custom view
        headerView.addSubview(button)   // add the button to the view
        return headerView
    }
 */
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let vw = UIView()
        vw.backgroundColor = .red
        return vw
    }
    
    /*
    func styleFilledButton(_ button:UIButton) {
        button.layer.borderWidth = 1
        // Filled rounded corner style
        if self.traitCollection.userInterfaceStyle == .dark
        {
        // you are in the dark!
        button.backgroundColor = .systemBackground
        button.tintColor = UIColor.white
        button.setTitleColor(UIColor.white, for: .normal)
        button.layer.borderColor = UIColor.white.cgColor
        }
        else
        {
        // your are in the light!
        button.backgroundColor = .systemBackground
        button.tintColor = UIColor.black
        button.setTitleColor(UIColor.black, for: .normal)
        button.layer.borderColor = UIColor.black.cgColor
        }
    }
    */
    func SetUpElements(){
        //Hide the Error Label
        // Style the elements
        //Utilities.styleFilledButton(Call)
    }
    // MARK: - Table view data source


    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

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
