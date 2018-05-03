//PickerViewの使い方。挙動を観察。

import UIKit


class ViewController: UIViewController , UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var textField: UITextField!
    
    
    var dataList = [
        "ねこ式ロボット",
        "えもんどら",
        "がらんぐれん",
        "ピエール西山",
        "ちゃげ 飛鳥（チャゲアス）",
        "デビルさん",
        "トラ仮面　伊達何某",
        "変態仮面",
        "折り紙サイクロン",
        "RX-78-2 がんだも",
        "あむろうれい",
        "数見　肇",
        "エロティカセブン",
        "怒鳴るぞ！ダッコ"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Delegate設定
        pickerView.delegate = self
        pickerView.dataSource = self
        
        label.text = "愉快な仲間たち"
        
    }
    
    // UIPickerViewの列の数
    //PikcerViewをなんこ同じ列に表示するかを記している。
    //２に増やせばリールが二つならび、３つに増やせば同じリールが３つ並ぶという寸法。
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
        
    }
    
    // UIPickerViewの行数、リストの数
    /* 現実的にはあり得ないが、return 4にするとリールの中の選択肢に４つしか出てこない。
       下記設定のまんまだと、データリストに登録された全ての選択肢が選べるようになる。*/
    func pickerView(_ pickerView: UIPickerView,
                    numberOfRowsInComponent component: Int) -> Int {
//        return 4
        return dataList.count
    }
    
    // UIPickerViewの最初の表示??
    //というより、リール上に表示する名前みたい。
    //例えばreturn datalist[5]とかにすると、リールに表示される
    //名前が全て配列５番目の人になってしまう。
    //現実的にはreturn dataList[row]で固定されそう
    func pickerView(_ pickerView: UIPickerView,
                    titleForRow row: Int,
                    forComponent component: Int) -> String? {
//        return dataList[5]
        return dataList[row]
    }
    
    // UIPickerViewのRowが選択された時の挙動
    //下記だとラベルに選択された名前を表示する
    func pickerView(_ pickerView: UIPickerView,
                    didSelectRow row: Int,
                    inComponent component: Int) {
        
        
        label.text = dataList[row]
        
    }
    //メンバー追加ボタンを実装。　reloadさせないと追加しても表示上追加確認できなかった。
    @IBAction func addMember(_ sender: Any) {
        let newMember = textField.text
        dataList.append(newMember!)
        pickerView.reloadAllComponents()
    }
    
    @IBAction func deleteMember(_ sender: Any) {
        let index = dataList.index(of: label.text!)
        dataList.remove(at: index!)
        pickerView.reloadAllComponents()
        pickerView.selectRow(1, inComponent: 0, animated: true)

        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
