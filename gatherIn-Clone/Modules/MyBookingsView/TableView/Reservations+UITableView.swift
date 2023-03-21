//
//  Reservations+UITableView.swift
//  gatherIn-Clone
//
//  Created by Mahmoud Hashim on 3/21/23.
//

import UIKit

extension ReservationsViewController: UITableViewDataSource, UITableViewDelegate  {
    
    func setupReservationTableView() {
        self.reservationsTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.reservationsTableView.dataSource   = self
        self.reservationsTableView.delegate     = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = reservationsTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        return cell
    }

}
