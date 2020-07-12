import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var table: UITableView!

    var songs = [Song]()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureSongs()
        table.delegate = self
        table.dataSource = self
    }

    func configureSongs() {
        songs.append(Song(name: "A Thousand Bad Times",
                          albumName: "Hollywood's Bleeding",
                          artistName: "Post Malone",
                          imageName: "cover1",
                          trackName: "aThousandBadTimes"))
        songs.append(Song(name: "Circles",
                          albumName: "Hollywood's Bleeding",
                          artistName: "Post Malone",
                          imageName: "cover1",
                          trackName: "Circles"))
        songs.append(Song(name: "Goodbyes (ft. Young Thug)",
                          albumName: "Hollywood's Bleeding",
                          artistName: "Post Malone",
                          imageName: "cover1",
                          trackName: "Goodbyes"))
        songs.append(Song(name: "Myself",
                          albumName: "Hollywood's Bleeding",
                          artistName: "Post Malone",
                          imageName: "cover1",
                          trackName: "MySelf"))
        songs.append(Song(name: "Psycho",
                          albumName: "beerbongs & bentleys",
                          artistName: "Post Malone",
                          imageName: "cover2",
                          trackName: "Psycho"))
        songs.append(Song(name: "Take What You Want (ft. Ozzy Osbourne, Travis Scott)",
                          albumName: "Hollywood's Bleeding",
                          artistName: "Post Malone",
                          imageName: "cover1",
                          trackName: "TakeWhatYouWant"))
        songs.append(Song(name: "Sunflower",
                          albumName: "Hollywood's Bleeding",
                          artistName: "Post Malone",
                          imageName: "cover1",
                          trackName: "Sunflower"))
        songs.append(Song(name: "Tommy Lee (ft. Post Malone)",
                          albumName: "",
                          artistName: "Tyla Yaweh",
                          imageName: "cover3",
                          trackName: "TommyLee"))
        songs.append(Song(name: "Forever (ft. Post Malone, Clever)",
                          albumName: "Changes",
                          artistName: "Justin Bieber",
                          imageName: "cover4",
                          trackName: "Forever"))
        songs.append(Song(name: "Hollywood's Bleeding",
                          albumName: "Hollywood's Bleeding",
                          artistName: "Post Malone",
                          imageName: "cover1",
                          trackName: "Hollywood'sBleeding"))
        songs.append(Song(name: "Better Now",
                          albumName: "beerbongs & bentleys",
                          artistName: "Post Malone",
                          imageName: "cover2",
                          trackName: "BetterNow"))
        songs.append(Song(name: "I'm Gonna Be",
                          albumName: "Hollywood's Bleeding",
                          artistName: "Post Malone",
                          imageName: "cover1",
                          trackName: "ImGonnaBe"))
        songs.append(Song(name: "rockstar",
                          albumName: "beerbongs & bentleys",
                          artistName: "Post Malone",
                          imageName: "cover2",
                          trackName: "rockstar"))
        

    }

    // Table

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let song = songs[indexPath.row]
        // configure
        cell.textLabel?.text = song.name
        cell.detailTextLabel?.text = song.albumName
        cell.accessoryType = .disclosureIndicator
        cell.imageView?.image = UIImage(named: song.imageName)
        cell.textLabel?.font = UIFont(name: "Helvetica-Bold", size: 18)
        cell.detailTextLabel?.font = UIFont(name: "Helvetica", size: 15)

        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        // present the player
        let position = indexPath.row
        guard let vc = storyboard?.instantiateViewController(identifier: "player") as? PlayerViewController else {
            return
        }
        vc.songs = songs
        vc.position = position
        present(vc, animated: true)
    }


}

struct Song {
    let name: String
    let albumName: String
    let artistName: String
    let imageName: String
    let trackName: String
}
