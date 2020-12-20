import UIKit

class ListCell: UITableViewCell {
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblCity: UILabel!
    @IBOutlet weak var lblState: UILabel!
    @IBOutlet weak var lblCountry: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setContent(veneu:VeneuModel?) {
        self.lblName.text = veneu?.name
        self.lblCity.text = veneu?.location?.city
        self.lblState.text = veneu?.location?.state
        self.lblCountry.text = veneu?.location?.country

    }
    
}
