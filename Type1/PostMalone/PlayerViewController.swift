import AVFoundation
import UIKit

class PlayerViewController: UIViewController {

    public var position: Int = 0
    public var songs: [Song] = []

    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var musicNameLabel: UILabel!
    @IBOutlet weak var albumNameLabel: UILabel!
    
    var player: AVAudioPlayer?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback)
            try AVAudioSession.sharedInstance().setActive(true)
        } catch {
            print(error)
        }
        
        configure()
    }


    func configure() {
        // set up player
        let song = songs[position]

        let urlString = Bundle.main.path(forResource: song.trackName, ofType: "mp3")

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
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if let player = player {
            player.stop()
        }
    }

}
