//
//
//  IMPORTANT NOTES:
//  Ini pake project calculator di app brewery
//  soalnya kalo bikin project baru entah kenapa mainnya ga keluar (masi ada launch screen nya juga)
//
//

import UIKit

class ViewController: UIViewController {
    
    //untuk timer
    @IBOutlet weak var TimerLabel: UILabel!
    @IBOutlet weak var startStopButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    
    //untuk puzzle
    //perhatikan nama button dan disini di tulis dari atas kiri
    //sedangkan di UI nya berbeda
    @IBOutlet weak var textView: UILabel!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button5: UIButton!
    @IBOutlet weak var button6: UIButton!
    @IBOutlet weak var button7: UIButton!
    @IBOutlet weak var button8: UIButton!
    @IBOutlet weak var button9: UIButton!
    
    //variable timer
    var timer:Timer = Timer()
    var count:Int = 0
    var timerCounting:Bool = false
    
    //array menampung informasi button
    var buttonArray:[Int] = [1, 2, 0, 3, 4, 5, 6, 7, 8]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startStopButton.setTitleColor(UIColor.green, for: .normal)
        
    }
    
    @IBAction func startPressed(_ sender: Any) {
        if(timerCounting){
            timerCounting = false
            timer.invalidate()
            startStopButton.setTitle("START", for: .normal)
            textView.text = "Permainan Dimulai!"
        }else{
            timerCounting = true
            startStopButton.setTitle("STOP", for: .normal)
            startStopButton.setTitleColor(UIColor.red, for: .normal)
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerCounter), userInfo: nil, repeats: true)
            textView.text = "Permainan Dihentikan"
        }
    }
    
    @IBAction func resetPressed(_ sender: Any) {
        self.count = 0
        self.timer.invalidate()
        self.TimerLabel.text = self.makeTimeString(hours: 0, minutes: 0, seconds: 0)
        startStopButton.setTitle("START", for: .normal)
        startStopButton.setTitleColor(UIColor.green, for: .normal)
    }
    
    //funciton timer
    @objc func timerCounter() -> Void
    	{
        count = count + 1
        let time = secondsToHourMinutesSeconds(seconds: count)
        let timeString = makeTimeString(hours: time.0, minutes: time.1, seconds: time.2)
        TimerLabel.text = timeString
    }
    
    //untuk ubah detik timer ke jam dan menit
    func secondsToHourMinutesSeconds(seconds:Int) -> (Int, Int, Int)
    {
        return ((seconds / 3600), ((seconds % 3600) / 60), ((seconds % 3600) % 60))
    }
    
    //to string nya secondsToHourMinutesSeconds
    func makeTimeString(hours: Int, minutes: Int, seconds: Int) -> String{
        var timeString = ""
        timeString += String(format: "%02d", hours)
        timeString += " : "
        timeString += String(format: "%02d", minutes)
        timeString += " : "
        timeString += String(format: "%02d", seconds)
        timeString += " : "
        return timeString
    }
    
    //action tiap button
    @IBAction func satuPressed(_ sender: UIButton) {
        let check1 = sender.currentTitle!
        
        if buttonArray[1] == 0{
            button1.setTitle("0", for: .normal)
            button1.backgroundColor = UIColor.lightGray
            
            button2.setTitle("\(check1)", for: .normal)
            button2.backgroundColor = UIColor.blue
            
            buttonArray[0] = 0
            buttonArray[1] = Int(check1)!
            
            textView.text = "Button 1 dipindahkan ke 2"
        } else if buttonArray[3] == 0{
            button1.setTitle("0", for: .normal)
            button1.backgroundColor = UIColor.lightGray
            
            button4.setTitle("\(check1)", for: .normal)
            button4.backgroundColor = UIColor.blue
            
            buttonArray[0] = 0
            buttonArray[3] = Int(check1)!
            
            textView.text = "Button 1 dipindahkan ke 4"
        }
    }
    
    @IBAction func duaPressed(_ sender: UIButton) {
        let check1 = sender.currentTitle!
        
        if buttonArray[0] == 0{
            button2.setTitle("0", for: .normal)
            button2.backgroundColor = UIColor.lightGray
            
            button1.setTitle("\(check1)", for: .normal)
            button1.backgroundColor = UIColor.blue
            
            buttonArray[1] = 0
            buttonArray[0] = Int(check1)!
            
            textView.text = "Button 2 dipindahkan ke 1"
        } else if buttonArray[2] == 0{
            button2.setTitle("0", for: .normal)
            button2.backgroundColor = UIColor.lightGray
            
            button3.setTitle("\(check1)", for: .normal)
            button3.backgroundColor = UIColor.blue
            
            buttonArray[1] = 0
            buttonArray[2] = Int(check1)!
            
            textView.text = "Button 2 dipindahkan ke 3"
        } else if buttonArray[4] == 0{
            button2.setTitle("0", for: .normal)
            button2.backgroundColor = UIColor.lightGray
            
            button5.setTitle("\(check1)", for: .normal)
            button5.backgroundColor = UIColor.blue
            
            buttonArray[1] = 0
            buttonArray[4] = Int(check1)!
            
            textView.text = "Button 2 dipindahkan ke 5"
        }
    }
    
    @IBAction func tigaPressed(_ sender: UIButton) {
        let check1 = sender.currentTitle!
        
        if buttonArray[1] == 0{
            button3.setTitle("0", for: .normal)
            button3.backgroundColor = UIColor.lightGray
            
            button2.setTitle("\(check1)", for: .normal)
            button2.backgroundColor = UIColor.blue
            
            buttonArray[2] = 0
            buttonArray[1] = Int(check1)!
            
            textView.text = "Button 3 dipindahkan ke 2"
        } else if buttonArray[5] == 0{
            button3.setTitle("0", for: .normal)
            button3.backgroundColor = UIColor.lightGray
            
            button6.setTitle("\(check1)", for: .normal)
            button6.backgroundColor = UIColor.blue
            
            buttonArray[2] = 0
            buttonArray[5] = Int(check1)!
            
            textView.text = "Button 3 dipindahkan ke 6"
        }
    }
    
    @IBAction func empatPressed(_ sender: UIButton) {
        let check1 = sender.currentTitle!
        
        if buttonArray[0] == 0{
            button4.setTitle("0", for: .normal)
            button4.backgroundColor = UIColor.lightGray
            
            button1.setTitle("\(check1)", for: .normal)
            button1.backgroundColor = UIColor.blue
            
            buttonArray[3] = 0
            buttonArray[0] = Int(check1)!
            
            textView.text = "Button 4 dipindahkan ke 1"
        } else if buttonArray[4] == 0{
            button4.setTitle("0", for: .normal)
            button4.backgroundColor = UIColor.lightGray
            
            button5.setTitle("\(check1)", for: .normal)
            button5.backgroundColor = UIColor.blue
            
            buttonArray[3] = 0
            buttonArray[4] = Int(check1)!
            
            textView.text = "Button 4 dipindahkan ke 5"
        } else if buttonArray[6] == 0{
            button4.setTitle("0", for: .normal)
            button4.backgroundColor = UIColor.lightGray
            
            button7.setTitle("\(check1)", for: .normal)
            button7.backgroundColor = UIColor.blue
            
            buttonArray[3] = 0
            buttonArray[6] = Int(check1)!
            
            textView.text = "Button 4 dipindahkan ke 7"
        }
    }
    
    @IBAction func limaPressed(_ sender: UIButton) {
        let check1 = sender.currentTitle!
        
        if buttonArray[1] == 0{
            button5.setTitle("0", for: .normal)
            button5.backgroundColor = UIColor.lightGray
            
            button2.setTitle("\(check1)", for: .normal)
            button2.backgroundColor = UIColor.blue
            
            buttonArray[4] = 0
            buttonArray[1] = Int(check1)!
            
            textView.text = "Button 5 dipindahkan ke 2"
        } else if buttonArray[3] == 0{
            button5.setTitle("0", for: .normal)
            button5.backgroundColor = UIColor.lightGray
            
            button4.setTitle("\(check1)", for: .normal)
            button4.backgroundColor = UIColor.blue
            
            buttonArray[4] = 0
            buttonArray[3] = Int(check1)!
            
            textView.text = "Button  5 dipindahkan ke 4"
        } else if buttonArray[5] == 0{
            button5.setTitle("0", for: .normal)
            button5.backgroundColor = UIColor.lightGray
            
            button6.setTitle("\(check1)", for: .normal)
            button6.backgroundColor = UIColor.blue
            
            buttonArray[4] = 0
            buttonArray[5] = Int(check1)!
            
            textView.text = "Button 5 dipindahkan ke 6"
        } else if buttonArray[7] == 0{
            button5.setTitle("0", for: .normal)
            button5.backgroundColor = UIColor.lightGray
            
            button8.setTitle("\(check1)", for: .normal)
            button8.backgroundColor = UIColor.blue
            
            buttonArray[4] = 0
            buttonArray[7] = Int(check1)!
            
            textView.text = "Button 5 dipindahkan ke 8"
        }
    }
    
    @IBAction func enamPressed(_ sender: UIButton) {
        let check1 = sender.currentTitle!
        
        if buttonArray[2] == 0{
            button6.setTitle("0", for: .normal)
            button6.backgroundColor = UIColor.lightGray
            
            button3.setTitle("\(check1)", for: .normal)
            button3.backgroundColor = UIColor.blue
            
            buttonArray[5] = 0
            buttonArray[2] = Int(check1)!
            
            textView.text = "Button 6 dipindahkan ke 3"
        } else if buttonArray[4] == 0{
            button6.setTitle("0", for: .normal)
            button6.backgroundColor = UIColor.lightGray
            
            button5.setTitle("\(check1)", for: .normal)
            button5.backgroundColor = UIColor.blue
            
            buttonArray[5] = 0
            buttonArray[4] = Int(check1)!
            
            textView.text = "Button 6 dipindahkan ke 5"
        } else if buttonArray[8] == 0{
            button6.setTitle("0", for: .normal)
            button6.backgroundColor = UIColor.lightGray
            
            button9.setTitle("\(check1)", for: .normal)
            button9.backgroundColor = UIColor.blue
            
            buttonArray[5] = 0
            buttonArray[8] = Int(check1)!
            
            textView.text = "Button 6 dipindahkan ke 9"
        }
    }
    
    @IBAction func tujuhPressed(_ sender: UIButton) {
        let check1 = sender.currentTitle!
        
        if buttonArray[3] == 0{
            button7.setTitle("0", for: .normal)
            button7.backgroundColor = UIColor.lightGray
            
            button4.setTitle("\(check1)", for: .normal)
            button4.backgroundColor = UIColor.blue
            
            buttonArray[6] = 0
            buttonArray[3] = Int(check1)!
            
            textView.text = "Button 7 dipindahkan ke 4"
        } else if buttonArray[7] == 0{
            button7.setTitle("0", for: .normal)
            button7.backgroundColor = UIColor.lightGray
            
            button8.setTitle("\(check1)", for: .normal)
            button8.backgroundColor = UIColor.blue
            
            buttonArray[6] = 0
            buttonArray[7] = Int(check1)!
            
            textView.text = "Button 7 dipindahkan ke 8"
        }
    }
    
    @IBAction func delapanPressed(_ sender: UIButton) {
        let check1 = sender.currentTitle!
        
        if buttonArray[4] == 0{
            button8.setTitle("0", for: .normal)
            button8.backgroundColor = UIColor.lightGray
            
            button5.setTitle("\(check1)", for: .normal)
            button5.backgroundColor = UIColor.blue
            
            buttonArray[7] = 0
            buttonArray[4] = Int(check1)!
            
            textView.text = "Button 8 dipindahkan ke 5"
        } else if buttonArray[6] == 0{
            button8.setTitle("0", for: .normal)
            button8.backgroundColor = UIColor.lightGray
            
            button7.setTitle("\(check1)", for: .normal)
            button7.backgroundColor = UIColor.blue
            
            buttonArray[7] = 0
            buttonArray[6] = Int(check1)!
            
            textView.text = "Button 8 dipindahkan ke 7"
        } else if buttonArray[8] == 0{
            button8.setTitle("0", for: .normal)
            button8.backgroundColor = UIColor.lightGray
            
            button9.setTitle("\(check1)", for: .normal)
            button9.backgroundColor = UIColor.blue
            
            buttonArray[7] = 0
            buttonArray[8] = Int(check1)!
            
            textView.text = "Button 8 dipindahkan ke 9"
        }
    }
    
    @IBAction func sembilanPressed(_ sender: UIButton) {
        let check1 = sender.currentTitle!
        
        if buttonArray[5] == 0{
            button9.setTitle("0", for: .normal)
            button9.backgroundColor = UIColor.lightGray
            
            button6.setTitle("\(check1)", for: .normal)
            button6.backgroundColor = UIColor.blue
            
            buttonArray[8] = 0
            buttonArray[5] = Int(check1)!
            
            textView.text = "Button 9 dipindahkan ke 6"
        } else if buttonArray[7] == 0{
            button9.setTitle("0", for: .normal)
            button9.backgroundColor = UIColor.lightGray
            
            button8.setTitle("\(check1)", for: .normal)
            button8.backgroundColor = UIColor.blue
            
            buttonArray[8] = 0
            buttonArray[7] = Int(check1)!
            
            textView.text = "Button 9 dipindahkan ke 8"
        }
    }
    
    //belum ada pengubahan status kalo dia tekan tombol yang tidak bisa geser
    
    //belum ada random solvable untuk launch pertama kali
    
    //kalo tekan reset, button balik ulang
    
    //check finish di setiap if statement dalam button dan di awal (siapa tau langsung jadi)
    
    //kasi hint kalo empty nya harus di button 1 atau 9 (tidak di button 3 dan 7)
    
    //kalo tekan reset, button balik ulang    //kalo bisa, saat tekan start > lalu mulai random dan bisa dimainkan. Kalo di stop > tidak bisa dimainkan dan jangan dirandom lagi

}
	

