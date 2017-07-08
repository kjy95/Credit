//
//  SecondView.swift
//  first0107
//
//  Created by mju on 2016. 1. 7..
//  Copyright © 2016년 mju. All rights reserved.
//

import UIKit
//delegate

class SecondView: UIViewController, UITableViewDataSource,UITableViewDelegate{
    

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

     //학년.학기 버튼 -BB학년학기
    @IBOutlet var BB11: UIButton!
    @IBOutlet var BB12: UIButton!
    @IBOutlet var BB21: UIButton!
    @IBOutlet var BB22: UIButton!
    @IBOutlet var BB31: UIButton!
    @IBOutlet var BB32: UIButton!
    @IBOutlet var BB41: UIButton!
    @IBOutlet var BB42: UIButton!

    //button click시 실행할 함수 구현.
    func ChangeBack(_ sender:UIButton){
        //모든 배경색 흰색으로 전환
        BB11.backgroundColor=UIColor.white;BB12.backgroundColor=UIColor.white;BB21.backgroundColor=UIColor.white;BB22.backgroundColor=UIColor.white;BB31.backgroundColor=UIColor.white;BB32.backgroundColor=UIColor.white;BB41.backgroundColor=UIColor.white;BB42.backgroundColor=UIColor.white
            sender.backgroundColor=UIColor.yellow
        }
   //Anyobject-> UIButton로 변경.
    @IBAction func B11(_ sender: UIButton) {
        //배경바꿈
        ChangeBack(BB11)
        //자신고유색.
       // sender.backgroundColor=UIColor.redColor()
    }
    @IBAction func B12(_ sender: UIButton) {
        ChangeBack(BB12)
       // sender.backgroundColor=UIColor.orangeColor()
    }
    @IBAction func B21(_ sender: UIButton) {
        ChangeBack(BB21)
      //  sender.backgroundColor=UIColor.yellowColor()
    }
    @IBAction func B22(_ sender: UIButton) {
        ChangeBack(BB22)
      //  sender.backgroundColor=UIColor.greenColor()
    }
    @IBAction func B31(_ sender: UIButton) {
        ChangeBack(BB31)
      //  sender.backgroundColor=UIColor.cyanColor()
    }
    @IBAction func B32(_ sender: UIButton) {
        ChangeBack(BB32)
       // sender.backgroundColor=UIColor.blueColor()
    }
    @IBAction func B41(_ sender: UIButton) {
        ChangeBack(BB41)
      //  sender.backgroundColor=UIColor.magentaColor()
    }
    @IBAction func B42(_ sender: UIButton) {
        ChangeBack(BB42)
       // sender.backgroundColor=UIColor.purpleColor()
    }
    
    
    
    
    
//테이블뷰 설정!
    @IBOutlet var tableview1: UITableView!
    @IBOutlet var tableview2: UITableView!
    @IBOutlet var tableview3: UITableView!
    @IBOutlet var tableview4: UITableView!
    //앞 학점표에 넘길 값을 배열로 선언.
    var JunMonKo = [Float](repeating: 0, count: 50)//전문교양21
    var JunKong = [Float](repeating: 0, count: 50)//전공 학점 저장84
    var Gicho = [Float](repeating: 0, count: 50)//기초 학점 저장33
    var others = [Float](repeating: 0, count: 50)//기타 학점 저장14
    var all = [Float](repeating: 0, count: 50)//총 학점 저장144
    //테이블뷰에 보일 강좌들
    var Lect1:[String]=["글쓰기","발표와토의","철학과인간","한국근현대사의 이해","역사와문명","세계화와사회변화","민주주의와현대사회","여성문제의이해","동서문화의이해","한국전통문화의이해","예술과사회","첨단과학의이해","환경과인간","창업입문","벤처창업과사업성평가","영어3","영어4","영어회화3","영어회화4"]
    var Cred1:[Float]=[3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,2,2,1,1]
    var Choi1:[String]=["사고와표현 택1 필수","사고와표현 택1 필수","역사와철학 택1 필수","역사와철학 택1 필수","역사와철학 택1 필수","사회와공동체 택1 필수","사회와공동체 택1 필수","사회와공동체 택1 필수","문화 택1 필수","문화 택1 필수","문화 택1 필수","과학 택1 필수","과학 택1 필수","과학 택1 필수","필수","필수","필수","필수","필수"]
    
    var Lect2:[String]=["C언어프로그래밍","공학입문설계","객체지향프로그래밍1","객체지향프로그래밍2","자료구조","컴퓨터하드웨어","C언어연습","웹프로그래밍","고급객체지향프로그래밍","팀프로젝트1","컴퓨터공학콜로키움","공개SW실무","컴퓨터네트워크","데이터베이스","운영체제","소프트웨어공학","컴퓨터아키텍쳐","팀프로젝트2"]
    var Cred2:[Float]=[4,3,4,3,3,3,1,3,3,3,1,3,3,3,3,3,3,4]
    var Choi2:[String]=["필수","필수","필수","필수","필수","필수","선택","선택","필수","필수","선택","필수","필수","필수","필수","필수","필수","선택"]
    
    var Lect3:[String]=["미적분학1","이산수학개론","고급이산수학","선형대수학개론","공학수학1","통계학개론","물리학","물리학실험1","일반생물학"]
    var Cred3:[Float]=[3,3,3,3,3,3,3,1,3]
    var Choi3:[String]=["필수","필수","필수","필수","필수","필수","필수","필수","필수"]
    
    var Lect4:[String]=["성경개론","채플1","채플2","채플3","채플4","현대사회와 기독교윤리","종교와과학","기독교와 문화","영화와철학","미학의이해","색채학"]
    var Cred4:[Float]=[2,0.5,0.5,0.5,0.5,2,2,2,3,3,3]
    var Choi4:[String]=["필수","필수","필수","필수","필수","종교과목택1","종교과목택1","종교과목택1","선택","선택","선택"]
 
    //위에 있는 오버라이드함수 아래로 옮김.
    override func viewDidLoad() {
        //super.viewDidLoad()
        
       //배열로 CreditInform에 모아 놓는 대신, 위의 배열처럼 직접 선언하여 코드를 짧게 만듦
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView==self.tableview3{
            return self.Lect3.count
        }else if tableView==self.tableview4{
            return self.Lect4.count
        }
        //테이블뷰가 1일때 row 1반환 아닐때 2반환
        return (tableView==self.tableview1) ? self.Lect1.count : self.Lect2.count
    }
    
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //색변하게하기위해 기억하는 객체 불러오기
        let GetObject = UserDefaults.standard
        //cell변수를 CreditCell객체로 선언.
        if tableView==self.tableview1{
            
            let cell=self.tableview1.dequeueReusableCell(withIdentifier: "Cell1") as! CreditCell1
            
            cell.GangyiName?.text=self.Lect1[indexPath.row]
            cell.Credit?.text="\(self.Cred1[indexPath.row])"
            cell.Choice?.text=self.Choi1[indexPath.row]
            //저장소불러와서 색바꾸기.리로드하는것은 확인버튼안에 구현되어있다."(테이블뷰넘버)ColorCell\(indexPath.row)"
            if let ColorNum = GetObject.object(forKey: "1ColorCell\(indexPath.row)")as? Int {
                //버튼에서 저장한색 여기서 셀색으로 지정해줌
                if ColorNum==indexPath.row{
                    cell.backgroundColor=UIColor.yellow
                    JunMonKo[indexPath.row]=(self.Cred1[indexPath.row])//선택한 셀 학점저장
                    //객체의 인스턴스를 가져온다.
                    let SendSecondViewObject=UserDefaults.standard
                    //여기서 저장하고 앞에서 종합하여 다 빼서 라벨로 만든다.
                    SendSecondViewObject.set(JunMonKo[indexPath.row], forKey: "1\(indexPath.row)")
                }
            }
            return cell
        }else if tableView==self.tableview2{
         let cell=self.tableview2.dequeueReusableCell(withIdentifier: "Cell2") as! CreditCell2
            cell.GangyiName?.text=self.Lect2[indexPath.row]
            cell.Credit?.text="\(self.Cred2[indexPath.row])"
            cell.Choice?.text=self.Choi2[indexPath.row]
            if let ColorNum = GetObject.object(forKey: "2ColorCell\(indexPath.row)")as? Int {
                //버튼에서 저장한색 여기서 셀색으로 지정해줌
                if ColorNum==indexPath.row{
                    cell.backgroundColor=UIColor.yellow
                    JunKong[indexPath.row]=(self.Cred2[indexPath.row])//선택한 셀 학점저장
                    //객체의 인스턴스를 가져온다.
                    let SendSecondViewObject=UserDefaults.standard
                    //여기서 저장하고 앞에서 종합하여 다 빼서 라벨로 만든다.
                    SendSecondViewObject.set(JunKong[indexPath.row], forKey: "2\(indexPath.row)")
                }
            }
           
            return cell
        }else if tableView==self.tableview3{
            let cell=self.tableview3.dequeueReusableCell(withIdentifier: "Cell3") as! CreditCell3
            cell.GangyiName?.text=self.Lect3[indexPath.row]
            cell.Credit?.text="\(self.Cred3[indexPath.row])"
            cell.Choice?.text=self.Choi3[indexPath.row]
            if let ColorNum = GetObject.object(forKey: "3ColorCell\(indexPath.row)")as? Int {
                //버튼에서 저장한색 여기서 셀색으로 지정해줌
                if ColorNum==indexPath.row{
                    cell.backgroundColor=UIColor.yellow
                    Gicho[indexPath.row]=(self.Cred3[indexPath.row])//선택한 셀 학점저장
                    //객체의 인스턴스를 가져온다.
                    let SendSecondViewObject=UserDefaults.standard
                    //여기서 저장하고 앞에서 종합하여 다 빼서 라벨로 만든다.
                    SendSecondViewObject.set(Gicho[indexPath.row], forKey: "3\(indexPath.row)")
                }
            }
            return cell
        }else {
            let cell=self.tableview4.dequeueReusableCell(withIdentifier: "Cell4") as! CreditCell4
            cell.GangyiName?.text=self.Lect4[indexPath.row]
            cell.Credit?.text="\(self.Cred4[indexPath.row])"
            cell.Choice?.text=self.Choi4[indexPath.row]
            if let ColorNum = GetObject.object(forKey: "4ColorCell\(indexPath.row)")as? Int {
                //버튼에서 저장한색 여기서 셀색으로 지정해줌
                if ColorNum==indexPath.row{
                    cell.backgroundColor=UIColor.yellow
                    others[indexPath.row]=(self.Cred4[indexPath.row])//선택한 셀 학점저장
                    //객체의 인스턴스를 가져온다.
                    let SendSecondViewObject=UserDefaults.standard
                    //여기서 저장하고 앞에서 종합하여 다 빼서 라벨로 만든다.
                    SendSecondViewObject.set(others[indexPath.row], forKey: "4\(indexPath.row)")
                }
            }
            return cell
        }
    }
    
    
    func ChangeView(_ sender: UITableView){
        //반복되는 코드 함수로 모아놓음. UITableView를 받아서 그것만 보이게함.
        self.tableview1.isHidden=true
        self.tableview3.isHidden=true
        self.tableview2.isHidden=true
        self.tableview4.isHidden=true
        
        sender.isHidden=false
    }
    //AnyObject->UISegmentedControl????
    @IBAction func change1(_ sender: AnyObject) {
        ChangeView(tableview1)
    }
    
    @IBAction func change2(_ sender: AnyObject) {
        ChangeView(tableview2)
    }
    
    @IBAction func change3(_ sender: AnyObject) {
        ChangeView(tableview3)
    }
    
    @IBAction func change4(_ sender: AnyObject) {
        ChangeView(tableview4)
    }
    
    
    
    
    
    
    
 
    //앞 시간표에 넘길 값을 배열로 선언
    var LuctCell = [String](repeating: " ", count: 50)//강의명
    var RoomCell = [String](repeating: " ", count: 50)//강의실
    var GradeCell:[Int]=[0,1,2,3,4,5,6,7,8]//현제 학년,학기 ex.1학년1학기==0 1학년2학기=1
    //반복되는 확인,정보입력창 함수
    func AlertLoop(_ alert: UIAlertController, indexPath: IndexPath, GradeTemp: Int, Lect: [String],tablenum: String){
        //강의실 입력필드 추가
        alert.addTextField(){
            (textfield) in
            textfield.placeholder="강의실입력"
        }//요일 입력필드 추가
        alert.addTextField(){
            (textfield) in
            textfield.placeholder="일입력"
        }//교시 입력필드 추가
        alert.addTextField(){
            (textfield) in
            textfield.placeholder="교시입력"
        }
        let Add=UIAlertAction(title:"추가", style: .default){
            (_) in
            //입력받은 값을 저장
            let RoomTemp=alert.textFields?[0].text
            let DayTemp = alert.textFields?[1].text
            let TimeTemp=alert.textFields?[2].text
            let TimeRTemp = Int(TimeTemp!)
            //앞으로 넘어가서 시간표셀 넘버가 될 숫자 저장할 상수
            var CellNum = 0
            
            if DayTemp=="월"{
                CellNum=0+5*((TimeRTemp!) - 1)
            }else if DayTemp=="화"{
                CellNum=1+5*((TimeRTemp!) - 1)
            }else if DayTemp=="수"{
                CellNum=2+5*((TimeRTemp!) - 1)
            }else if DayTemp=="목"{
                CellNum=3+5*((TimeRTemp!) - 1)
            }else if DayTemp=="금"{
                CellNum=4+5*((TimeRTemp!) - 1)
            }else{
                //잘못입력시 경고메시지창
                let warring=UIAlertController(title: "입력예시", message: "요일입력 예: 월 \n 교시입력예: 8 ", preferredStyle: .alert)
                let ok=UIAlertAction(title: "확인", style: .cancel, handler: nil)
                warring.addAction(ok);
                self.present(warring, animated: false, completion: nil)
                return
            }
            self.LuctCell[CellNum]=Lect[indexPath.row]
            self.RoomCell[CellNum]=RoomTemp!
            
            //객체의 인스턴스를 가져온다.
            let SendSecondViewObject=UserDefaults.standard
            
            
            //값을 저장한다.
            //(보낼값,forkey:"(grade)send(cellnum)")
           
            SendSecondViewObject.set(self.LuctCell[CellNum], forKey: "\(GradeTemp)LuctCell\(CellNum)")
            SendSecondViewObject.set(self.RoomCell[CellNum], forKey: "\(GradeTemp)RoomCell\(CellNum)")
            //색변하게 할꺼기억하기
            let TableCellColor=indexPath.row
            SendSecondViewObject.set(TableCellColor, forKey: "\(tablenum)ColorCell\(indexPath.row)")
            print("\(tablenum)ColorCell\(indexPath.row)")
            

            self.tableview1.reloadData()
            self.tableview2.reloadData()
            self.tableview3.reloadData()
            self.tableview4.reloadData()
        }
        //취소버튼
        let cancelAction=UIAlertAction(title: "취소", style: .cancel, handler: nil)
        alert.addAction(Add);alert.addAction(cancelAction)//확인,취소버튼 추가.
        self.present(alert, animated: false, completion: nil)

    }
    //현제 테이블뷰 확인 루핑되는것 함수로 구현
    func CheckTableViewLoop(_ tableView: UITableView, indexPath: IndexPath, GradeTemp: Int){
        if tableView==tableview1{
            let alert=UIAlertController(title: "\(Lect1[indexPath.row])", message: "수강요일 강의실 입력", preferredStyle: .alert)
            //메시지창
            let tablenum="1"
            AlertLoop(alert, indexPath: indexPath, GradeTemp: GradeTemp, Lect: Lect1,tablenum: tablenum)
            
        }else if tableView==tableview2{
            let alert=UIAlertController(title: "\(Lect2[indexPath.row])", message: "수강요일 강의실 입력", preferredStyle: .alert)
            //메시지창
            let tablenum="2"
            AlertLoop(alert, indexPath: indexPath, GradeTemp: GradeTemp, Lect: Lect2,tablenum: tablenum)
        }else if tableView==tableview3{
            let alert=UIAlertController(title: "\(Lect3[indexPath.row])", message: "수강요일 강의실 입력", preferredStyle: .alert)
            //메시지창
            let tablenum="3"
            AlertLoop(alert, indexPath: indexPath, GradeTemp: GradeTemp, Lect: Lect3,tablenum: tablenum)
        }else if tableView==tableview4{
            let alert=UIAlertController(title: "\(Lect4[indexPath.row])", message: "수강요일 강의실 입력", preferredStyle: .alert)
            //메시지창
            let tablenum="4"
            AlertLoop(alert, indexPath: indexPath, GradeTemp: GradeTemp, Lect: Lect4,tablenum: tablenum)
        }
    }
    
    
    
    //
    //테이블뷰셀 터치
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //822.(터치한테이블뷰에대한참조값.그행의정보.)를 이용해서 터치시 알림창이뜨도록함.
        if (BB11.backgroundColor == UIColor.yellow){//버튼11눌렸을때
            //현제 학년학기 저장.
            let GradeTemp=GradeCell[0]
            //현제 테이블뷰확인
            CheckTableViewLoop(tableView, indexPath: indexPath, GradeTemp: GradeTemp)
            
        }else if (BB12.backgroundColor == UIColor.yellow){//버튼12눌렸을때
            let GradeTemp=GradeCell[1]
            CheckTableViewLoop(tableView, indexPath: indexPath, GradeTemp: GradeTemp)
        }else if (BB21.backgroundColor == UIColor.yellow){
            let GradeTemp=GradeCell[2]
            CheckTableViewLoop(tableView, indexPath: indexPath, GradeTemp: GradeTemp)
        }else if (BB22.backgroundColor == UIColor.yellow){
            let GradeTemp=GradeCell[3]
            CheckTableViewLoop(tableView, indexPath: indexPath, GradeTemp: GradeTemp)
        }else if (BB31.backgroundColor == UIColor.yellow){
            let GradeTemp=GradeCell[4]
            CheckTableViewLoop(tableView, indexPath: indexPath, GradeTemp: GradeTemp)
        }else if (BB32.backgroundColor == UIColor.yellow){
            let GradeTemp=GradeCell[5]
            CheckTableViewLoop(tableView, indexPath: indexPath, GradeTemp: GradeTemp)
        }else if (BB41.backgroundColor == UIColor.yellow){
            let GradeTemp=GradeCell[6]
            CheckTableViewLoop(tableView, indexPath: indexPath, GradeTemp: GradeTemp)
        }else if (BB42.backgroundColor == UIColor.yellow){
            let GradeTemp=GradeCell[7]
            CheckTableViewLoop(tableView, indexPath: indexPath, GradeTemp: GradeTemp)
        }else{
            let warring=UIAlertController(title: "학년/학기를 선택하세요", message: " ", preferredStyle: .alert)
            let ok=UIAlertAction(title: "확인", style: .cancel, handler: nil)
            warring.addAction(ok);
            self.present(warring, animated: false, completion: nil)
        }

 
    
    
    }
    
    
    
    
   
    
    
    //전화면으로 값을 넘겨주면서 돌아감.//NSUerDefault Object 사용
    func back(_ sender: AnyObject) {
 /*         //객체의 인스턴스를 가져온다.
      let SendCredit=NSUserDefaults.standardUserDefaults()
        let temp = 4
        //값을 저장한다.
        SendCredit.setObject(temp, forKey: "temp")
  */      self.navigationController?.popViewController(animated: true)
    
    
    }
    
    
}
