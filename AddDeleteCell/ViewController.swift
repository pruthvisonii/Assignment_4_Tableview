//  Assignment 4 - Table View
//  Group
//  - Pruthvi - A00262875
//  - Sakshi  - A00262877
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var btnAdd: UIButton!
    @IBOutlet weak var txtInput: UITextField!
    @IBOutlet weak var tableView: UITableView!
//Declaring Array and inserting data
    var stringArr = ["Eternals", "Dune", "NO Time To Die", "Last Night in Soho","Ron's Done Wrong", "Venom", "The Addams Family 2", "Halloween Kills", "Antlers"]
    override func viewDidLoad() {
        super.viewDidLoad()
        btnAdd.layer.cornerRadius = 5

    }
//On click function for Add in table
    @IBAction func onClickAddButton(_ sender: Any) {
        if let txt = txtInput.text, !txt.isEmpty {
            self.stringArr.insert(txt, at: 0)
            tableView.beginUpdates()
            tableView.insertRows(at: [IndexPath(row: 0, section: 0)], with: .right)
            tableView.endUpdates()
            
            txtInput.text = nil
        }
    }
//On click function for delete in table
    @IBAction func onClickDeleteButton(_ sender: UIButton) {
        let point = sender.convert(CGPoint.zero, to: tableView)
        guard let indexpath = tableView.indexPathForRow(at: point) else {return}
        stringArr.remove(at: indexpath.row)
        tableView.beginUpdates()
        tableView.deleteRows(at: [IndexPath(row: indexpath.row, section: 0)], with: .left)
        tableView.endUpdates()
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stringArr.count
    }
//Table view Function

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "EditTableViewCell", for: indexPath) as? EditTableViewCell else {return UITableViewCell()}
        cell.lblName.text = stringArr[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}

