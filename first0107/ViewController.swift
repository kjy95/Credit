//
//  ViewController.swift
//  first0107
//
//  Created by mju on 2016. 1. 7..
//  Copyright © 2016년 mju. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate  {

    override func viewDidLoad() {
        super.viewDidLoad()
        //
       /*/초기화!
        //객체의 인스턴스를 가져온다.
        let SendSecondViewObject=NSUserDefaults.standardUserDefaults()

        for var CellNum=0;CellNum<50;CellNum++ {
            for var GradeTemp=0;GradeTemp<8;GradeTemp++ {
                SendSecondViewObject.setObject(" ", forKey: "\(GradeTemp)LuctCell\(CellNum)")
                SendSecondViewObject.setObject(" ", forKey: "\(GradeTemp)RoomCell\(CellNum)")
                SendSecondViewObject.setObject(100, forKey: "\(GradeTemp)ColorCell\(CellNum)")
                SendSecondViewObject.setObject(0, forKey: "\(GradeTemp)\(CellNum)")
                let defaults: NSUserDefaults = NSUserDefaults.standardUserDefaults()
                defaults.removeObjectForKey( "\(GradeTemp)LuctCell\(CellNum)")
                defaults.removeObjectForKey("\(CellNum)play")
            }
        }//"\(indexPath.row)play"*/
        
                 // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func MoveNext(_ sender: AnyObject) {
        //화면을 전환할 뷰 컨트롤러를 스토라보드 아이디 정보를 이용하여 읽어와 객체로 생성한다.
        if let uvc=self.storyboard?.instantiateViewController(withIdentifier: "SecondView"){
            //화면전환
            self.navigationController?.pushViewController(uvc, animated: true)
           
        }
        
    }
    

    

    
    
    
    
    @IBOutlet var GradeLabel: UILabel!
    //cell에서 현제 선택된 학년/학기를 할려주는 변수.ex 1-1:0,1-2:1
    var CurrentGrade=0//기본상태1-1
    @IBAction func SelectGrade(_ sender: UIButton){
        let alert=UIAlertController(title: "시간표 불러오기", message: "학년/학기 선택", preferredStyle: .alert)
        //cancel button
        let cancelAction=UIAlertAction(title: "취소", style: .cancel, handler: nil)
        alert.addAction(cancelAction)
        //학년.학기 배열에 입력
        var Grade=[String]()
        for i in 1 ..< 5 {
            for j in 1 ..< 3 {
                Grade.append("\(i)학년 \(j)학기")
            }
        }
        //Grade button 등록
        let ShowGrade0=UIAlertAction(title: Grade[0], style: .default){
            (action) in//클릭시동작
            self.GradeLabel.text!=Grade[0]
            self.CurrentGrade=0//cell에서 현제 선택된 학년/학기를 할려주는 변수.ex 1-1:0,1-2:1
            self.viewWillAppear(false)
        }
        let ShowGrade1=UIAlertAction(title: Grade[1], style: .default){
            (action) in//클릭시동작
            self.GradeLabel.text!=Grade[1]
            self.CurrentGrade=1
            self.viewWillAppear(false)
        }
        let ShowGrade2=UIAlertAction(title: Grade[2], style: .default){
            (action) in//클릭시동작
            self.GradeLabel.text!=Grade[2]
            self.CurrentGrade=2
            self.viewWillAppear(false)
        }
        let ShowGrade3=UIAlertAction(title: Grade[3], style: .default){
            (action) in//클릭시동작
            self.GradeLabel.text!=Grade[3]
            self.CurrentGrade=3
            self.viewWillAppear(false)
        }
        let ShowGrade4=UIAlertAction(title: Grade[4], style: .default){
            (action) in//클릭시동작
            self.GradeLabel.text!=Grade[4]
            self.CurrentGrade=4
            self.viewWillAppear(false)
        }
        let ShowGrade5=UIAlertAction(title: Grade[5], style: .default){
            (action) in//클릭시동작
            self.GradeLabel.text!=Grade[5]
            self.CurrentGrade=5
            self.viewWillAppear(false)
        }
        let ShowGrade6=UIAlertAction(title: Grade[6], style: .default){
            (action) in//클릭시동작
            self.GradeLabel.text!=Grade[6]
            self.CurrentGrade=6
            self.viewWillAppear(false)
        }
        let ShowGrade7=UIAlertAction(title: Grade[7], style: .default){
            (action) in//클릭시동작
            self.GradeLabel.text!=Grade[7]
            self.CurrentGrade=7
            self.viewWillAppear(false)
        }
        
        //추가
        alert.addAction(ShowGrade0)
        alert.addAction(ShowGrade1)
        alert.addAction(ShowGrade2)
        alert.addAction(ShowGrade3)
        alert.addAction(ShowGrade4)
        alert.addAction(ShowGrade5)
        alert.addAction(ShowGrade6)
        alert.addAction(ShowGrade7)
        //화면에 출력
        self.present(alert, animated: false, completion: nil)
    }
    
    
    
    
    
    
     //Produce CollectionView
    //달력 컬렉션뷰
    @IBOutlet var Calendar: UICollectionView!
    var day = [Int](repeating: 0, count: 31)//day 선언
    var Today=[Int](repeating: 1, count: 31)//셀에서 지정할 현제 날짜 값
    var play=[String](repeating: " ", count: 31)//paly decleration
    func ads(){
    for i in 1 ..< 31 {
        Today[i]  = i+1
        }
    }
   //시간표 컬렉션뷰
    @IBOutlet var TimeTable: UICollectionView!
    //viewWillAppear할때 콜렉션뷰컨트롤러 다시 호출시에 사용할 NSIndexPath!!&&화면 2번째 호출시부터 사용할TimeTableIndexPathNum
    var TimeTableIndexPath: IndexPath!; var TimeTableIndexPathNum=false
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //return 50////collectionview==calendar일때 31반환 아닐때 50반환
        return (collectionView==self.Calendar) ? 31 : 50
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        
        if collectionView==self.TimeTable{
        //cell==시간표에이용
        let cell=self.TimeTable.dequeueReusableCell(withReuseIdentifier: "Cell1", for: indexPath)as! TimeTableCell
        //viewWillAppear할때 콜렉션뷰컨트롤러 다시 호출시에 사용할 NSIndexPath!!
        TimeTableIndexPath=indexPath; TimeTableIndexPathNum=true;
        
        
        //저장소 객체에서 값 가져오기!
        let GetObject = UserDefaults.standard
        
        
        //이상한 값이 시간표에 나오는 오류가 나서 처음에 초기화를 시켜주니까 정상적으로 된다.
        cell.name?.text=" "
        cell.num?.text=" "
        cell.backgroundColor=UIColor.gray
        //버튼i가 선택되었을때
        for i in 0 ..< 8 {
        if CurrentGrade==i{
                if let LuctCell = GetObject.object(forKey: "\(i)LuctCell\(indexPath.row)")as? String {
                    cell.name?.text = LuctCell
                    //if i==0{
                        cell.backgroundColor=UIColor.init(colorLiteralRed: 215, green: 0, blue: 96, alpha: 0)
                   /* }else if i==2{
                        cell.backgroundColor=UIColor.yellowColor()
                    }else if i==3{
                        cell.backgroundColor=UIColor.greenColor()
                    }else if i==4{
                        cell.backgroundColor=UIColor.cyanColor()
                    }else if i==5{
                        cell.backgroundColor=UIColor.blueColor()
                    }else if i==6{
                        cell.backgroundColor=UIColor.magentaColor()
                    }else if i==7{
                        cell.backgroundColor=UIColor.purpleColor()
                    }else if i==1{
                        cell.backgroundColor=UIColor.orangeColor()
                    }*/

                }
                if let RoomCell = GetObject.object(forKey: "\(i)RoomCell\(indexPath.row)")as? String {
                    cell.num?.text = RoomCell
                }
            }
        }
        /*
        cell.name?.text=self.Lect[indexPath.row]
        cell.num?.text="\(self.Num[indexPath.row])"
        */
            
        
        return cell
        }
        /////////
        /////////
        
        
        
        
        
        
        
        //라벨등가져옴
        let cell=self.Calendar.dequeueReusableCell(withReuseIdentifier: "Cell2", for: indexPath)as! CalendarCell
        //저장소 객체에서 값 가져오기!
        let GetObject = UserDefaults.standard
        ads()//today 1~31
        day[indexPath.row]=Today[indexPath.row]
        cell.play.text=""
        if let playCell = GetObject.object(forKey: "\(indexPath.row)play")as? String {
            cell.play.text = playCell
        }
       // cell.play.text=play[indexPath.row]
        cell.day.text="\(Today[indexPath.row])"
        
        //여기서는 calender에 이용
        return cell
    }
    
    //셀 크기조정
    var seba:UICollectionViewLayout!
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: IndexPath) -> CGSize {
        seba=collectionViewLayout
        return CGSize(width: 264/5, height: 228/8)
    }
    
    //셀터치///////
    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        //달력이 선택되었을 때
        
        print("d")
         if collectionView==self.Calendar{
        let alert=UIAlertController(title: "\(day[indexPath.row])일 일정", message: "일정을 입력하세요", preferredStyle: .alert)
        //입력필드 추가
        alert.addTextField(){
            (textfield) in
            textfield.placeholder="일정"
        }
        let ok=UIAlertAction(title:"추가", style: .default){
            (_) in
            //라벨등가져옴
            let cell=self.Calendar.dequeueReusableCell(withReuseIdentifier: "Cell2", for: indexPath)as! CalendarCell
            //cell.play.text=alert.textFields?[0].text
            //객체의 인스턴스를 가져온다.
            let SendSecondViewObject=UserDefaults.standard
            
            
            //값을 저장한다.
            SendSecondViewObject.set(alert.textFields?[0].text, forKey: "\(indexPath.row)play")
            self.Calendar.reloadData()
        }
        alert.addAction(ok)
        self.present(alert, animated: false, completion: nil)
         }
    }

    
    @IBOutlet var JunMonKoLabel: UILabel!
    @IBOutlet var JunKongLabel: UILabel!
    @IBOutlet var KichoLabel: UILabel!
    @IBOutlet var OtherLabel: UILabel!
    @IBOutlet var AllLabel: UILabel!
    //뷰컨트롤러의 뷰가 화면에 표시될때마다 실행되는 메소드.(다른화면으로 기존화면을 가렸다가 다시표시하면 호출)

    override func viewWillAppear(_ animated: Bool) {
         if TimeTableIndexPathNum{
            //다시 시간표 갱신하기
            self.TimeTable.reloadData()
            print("button1")

        }
        
        
        
        //학점관리표
        let GetObject = UserDefaults.standard//저장소불러오기
        
        
        var JunMonKo:Float = 21//전문교양
        var Junkong:Float=84//전공
        var Kicho:Float=33//기초
        var other:Float=14//기타
        var all:Float=144
        //전문교양
        for i in 0 ..< 50 {
            if let LuctCell = GetObject.object(forKey: "1\(i)")as? Float {
                JunMonKo-=LuctCell
                all-=LuctCell//총점은계속빼줌
                JunMonKoLabel.text="\(JunMonKo)"
                
            }
        }
        //전공
        for i in 0 ..< 50 {
            if let LuctCell = GetObject.object(forKey: "2\(i)")as? Float {
                Junkong-=LuctCell
                all-=LuctCell//총점은계속빼줌
                JunKongLabel.text="\(Junkong)"
                
            }
        }//기초교양
        for i in 0 ..< 50 {
            if let LuctCell = GetObject.object(forKey: "3\(i)")as? Float {
                Kicho-=LuctCell
                all-=LuctCell//총점은계속빼줌
                KichoLabel.text="\(Kicho)"
            }
        }
        //기타
        for i in 0 ..< 50 {
            if let LuctCell = GetObject.object(forKey: "4\(i)")as? Float {
                other-=LuctCell
                all-=LuctCell//총점은계속빼줌
                OtherLabel.text="\(other)"
                
            }
        }
        //총점
        for i in 0 ..< 50 {
            
                AllLabel.text="\(all)"
        }

    }

}

