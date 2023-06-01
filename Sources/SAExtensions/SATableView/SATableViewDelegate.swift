import UIKit

final class SATableViewDelegate: NSObject, UITableViewDelegate, UITableViewDataSource {
    var numberOfSectionsCB: (()->Int)?
    var numberOfRowInSectionCB: ((Int)->Int)?
    var cellForRowCB: ((IndexPath)->UITableViewCell)?
    var didSelectRowCB: ((IndexPath)->Void)?



    func numberOfSections(in tableView: UITableView) -> Int {
        numberOfSectionsCB?() ?? 0
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        numberOfRowInSectionCB?(section) ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        cellForRowCB?(indexPath) ?? UITableViewCell()
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        didSelectRowCB?(indexPath)
    }
    
}
