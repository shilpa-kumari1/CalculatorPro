//
//  historyViewController.swift
//  CalculatorPro
//
//  Created by Shilpa Kumari on 12/08/19.
//  Copyright © 2019 Shilpa Kumari. All rights reserved.
//

import UIKit
protocol clearHistory : class{
    func clear(type : [String])
}
class historyViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var items : [String] = []
    weak var clearHistoryDelegate : clearHistory?
    
    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var clearBtn: UIButton!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    @IBAction func clearButton(_ sender: Any) {
        items.removeAll()
        clearHistoryDelegate?.clear(type : items)
        clearBtn.isHidden = true
        table.reloadData()
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "Cell")
       cell.textLabel?.text = items[indexPath.row]
        
        return cell
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete{
            items.remove(at: indexPath.row)
            clearHistoryDelegate?.clear(type: items)
            table.reloadData()
            if items.count == 0{
                clearBtn.isHidden = true
                table.reloadData()
            }
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        if items.count == 0{
            clearBtn.isHidden = true
            table.reloadData()
        }
    }
    
}
