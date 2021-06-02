//  BeerOfCountry
//  Created by MEWO on 2.06.2021.


import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var beerNames = [String]()
    var beerImages = [UIImage]()
    var chosenBeerName = ""
    var chosenBeerImage = UIImage()
    
    @IBOutlet weak var beerTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        beerTableView.delegate = self
        beerTableView.dataSource =  self
        
        beerNames.append("Mexico City, Meksika: Babiliona")
        beerNames.append("Moskova, Rusya: Baltika")
        beerNames.append("Budapeşte, Macaristan: Barsodi")
        beerNames.append("Amsterdam, Hollanda: Heineken")
        beerNames.append("Münih, Almanya: Kellerbier")
        beerNames.append("Dublin, İrlanda: Kilkenny")
        beerNames.append("Yeni Zelanda: Orange Roughy")
        beerNames.append("Brüksel, Belçika: Oude Kriek Vieille")
        beerNames.append("Prag, Çek Cumhuriyeti: Pilssner Urquell")
        beerNames.append("Portland, ABD: Rogue")
        beerNames.append("Kopenhag, Danimarka: Tuborg")
        
        beerImages.append(UIImage(named: "babiliona.png")!)
        beerImages.append(UIImage(named: "baltika.png")!)
        beerImages.append(UIImage(named: "borsodi.png")!)
        beerImages.append(UIImage(named: "heineken.png")!)
        beerImages.append(UIImage(named: "kellerbier.png")!)
        beerImages.append(UIImage(named: "kilkenny.jpg")!)
        beerImages.append(UIImage(named: "orange-roughy.png")!)
        beerImages.append(UIImage(named: "oude-kriek-vieille.png")!)
        beerImages.append(UIImage(named: "pilssner-urquell.png")!)
        beerImages.append(UIImage(named: "rogue.png")!)
        beerImages.append(UIImage(named: "tuborg.jpg")!)


    }
    //delete functions
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            beerNames.remove(at: indexPath.row)
            beerImages.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade)
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = beerNames[indexPath.row]
        return cell
    }
    //satır sayısını belirliyoruz
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return beerNames.count
    }
    //seçilen satıra göre isim ve görseli bir diğer viewcontroller ile bağlıyoruz
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenBeerName = beerNames[indexPath.row]
        chosenBeerImage = beerImages[indexPath.row]
        performSegue(withIdentifier: "toDetails", sender: nil)
    }
    //
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    if segue.identifier == "toDetails"{
            let DestinationVC  = segue.destination as! imageViewController
            DestinationVC.selectedBeerName = chosenBeerName
            DestinationVC.selectedBeerImage = chosenBeerImage
        }
    }


}

