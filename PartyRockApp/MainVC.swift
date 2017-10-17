//
//  ViewController.swift
//  PartyRockApp
//
//  Created by Cookie on 8/29/17.
//  Copyright © 2017 Cookie. All rights reserved.
//

import UIKit

class MainVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var partyRocks = [PartyRock]()
    
    @IBOutlet weak var tableView: UITableView!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let urlTest = "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/SjmTFIHX1yo?list=PLtM4rw7sjPKXMOQgsDmhbnml9V5dRlNOp\" frameborder=\"0\" allowfullscreen></iframe>"
        let imageUrlTest = "http://www.wavefm.com.au/images/stories/2015/04/redfoo.jpg"
        let p1 = PartyRock(imageUrl: imageUrlTest, videoUrl: urlTest, videoTitle: "Where the Sun Goes Down")
        
        partyRocks.append(p1)
        
        tableView.delegate = self
        tableView.dataSource = self
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "PartyCell", for: indexPath) as? PartyCell {
            
            let partyRock = partyRocks[indexPath.row]
            cell.updateUI(partyRock: partyRock)
            return cell
        } else {
            return UITableViewCell()
        }
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return partyRocks.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let partyRock = partyRocks[indexPath.row]
        performSegue(withIdentifier: "VideoVC", sender: partyRock)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? VideoVC {
            if let party = sender as? PartyRock {
                destination.partyRock = party
            }
        }
    }


}

