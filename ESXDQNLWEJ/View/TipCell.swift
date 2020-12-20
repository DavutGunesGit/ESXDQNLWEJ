import UIKit

class TipCell: UITableViewCell {
    @IBOutlet weak var lblText: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setContent(tip:TipModel?) {
        self.lblText.text = tip?.text
    }
    
}
