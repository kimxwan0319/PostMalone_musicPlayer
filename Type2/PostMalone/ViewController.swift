import UIKit

import AVFoundation

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var table: UITableView!
    @IBOutlet weak var playerView: UIView!
    @IBOutlet weak var playingMusicCover: UIImageView!
    @IBOutlet weak var playingMusicNameLabel: UILabel!
    @IBOutlet weak var playPauseBtnUI: UIButton!
    
    
    var musics = [Music]()
    var player: AVAudioPlayer?

    override func viewDidLoad() {
        super.viewDidLoad()
        configureMusics()
        table.delegate = self
        table.dataSource = self
    }

    // Table

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return musics.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let Music = musics[indexPath.row]
        // configure
        cell.textLabel?.text = Music.name
        cell.detailTextLabel?.text = Music.albumName
        cell.accessoryType = .disclosureIndicator
        cell.imageView?.image = UIImage(named: Music.imageName)
        cell.textLabel?.font = UIFont(name: "Helvetica-Bold", size: 18)
        cell.detailTextLabel?.font = UIFont(name: "Helvetica", size: 15)

        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        playerView.isHidden = false
        let playingMusic = musics[indexPath.row]
        // 노래 틀기
        let urlString = Bundle.main.path(forResource: playingMusic.trackName, ofType: "mp3")
        do {
            try AVAudioSession.sharedInstance().setMode(.default)
            try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)

            guard let urlString = urlString else {
                print("urlstring is nil")
                return
            }

            player = try AVAudioPlayer(contentsOf: URL(string: urlString)!)

            guard let player = player else {
                print("player is nil")
                return
            }
            player.volume = 0.5

            player.play()
        }
        catch {
            print("error occurred")
        }
        
        //UI바꾸기
        playingMusicCover.image = UIImage(named: playingMusic.imageName)
        playingMusicNameLabel.text = playingMusic.name
    }
    
    @IBAction func playPauseBtnAct(_ sender: Any) {
        if player?.isPlaying == true {
            // pause
            player?.pause()
            playPauseBtnUI.setBackgroundImage(UIImage(systemName: "play.fill"), for: .normal)
        }
        else {
            // play
            player?.play()
            playPauseBtnUI.setBackgroundImage(UIImage(systemName: "pause.fill"), for: .normal)
        }
    }
    
}

// MARK:- set musics
extension ViewController {
    func configureMusics() {
        musics.append(Music(name: "A Thousand Bad Times",
                          albumName: "Hollywood's Bleeding",
                          imageName: "cover1",
                          trackName: "aThousandBadTimes"))
        musics.append(Music(name: "Circles",
                          albumName: "Hollywood's Bleeding",
                          imageName: "cover1",
                          trackName: "Circles"))
        musics.append(Music(name: "Goodbyes (ft. Young Thug)",
                          albumName: "Hollywood's Bleeding",
                          imageName: "cover1",
                          trackName: "Goodbyes"))
        musics.append(Music(name: "Myself",
                          albumName: "Hollywood's Bleeding",
                          imageName: "cover1",
                          trackName: "MySelf"))
        musics.append(Music(name: "Psycho",
                          albumName: "beerbongs & bentleys",
                          imageName: "cover2",
                          trackName: "Psycho"))
        musics.append(Music(name: "Take What You Want",
                          albumName: "Hollywood's Bleeding",
                          imageName: "cover1",
                          trackName: "TakeWhatYouWant"))
        musics.append(Music(name: "Sunflower",
                          albumName: "Hollywood's Bleeding",
                          imageName: "cover1",
                          trackName: "Sunflower"))
        musics.append(Music(name: "Tommy Lee (ft. Post Malone)",
                          albumName: "",
                          imageName: "cover3",
                          trackName: "TommyLee"))
        musics.append(Music(name: "Hollywood's Bleeding",
                          albumName: "Hollywood's Bleeding",
                          imageName: "cover1",
                          trackName: "Hollywood'sBleeding"))
        musics.append(Music(name: "Better Now",
                          albumName: "beerbongs & bentleys",
                          imageName: "cover2",
                          trackName: "BetterNow"))
        musics.append(Music(name: "I'm Gonna Be",
                          albumName: "Hollywood's Bleeding",
                          imageName: "cover1",
                          trackName: "ImGonnaBe"))
        musics.append(Music(name: "rockstar",
                          albumName: "beerbongs & bentleys",
                          imageName: "cover2",
                          trackName: "rockstar"))
    }
}
