//
//  ViewController.swift
//  QuizApp
//

import UIKit
class ViewController: UIViewController {

    @IBOutlet weak var questionView: UITextView!
    @IBOutlet weak var answerOneBtn: UIButton!
    @IBOutlet weak var answerTwoBtn: UIButton!
    @IBOutlet weak var answerThreeBtn: UIButton!
    @IBOutlet weak var answerFourBtn: UIButton!
    @IBOutlet weak var heightCon: NSLayoutConstraint!
    @IBOutlet weak var widthCon: NSLayoutConstraint!
    @IBOutlet weak var progreeView: UIProgressView!
    @IBOutlet weak var tapBtn: UIButton!
   // @IBOutlet weak var btnContainer: UIView!
    @IBOutlet weak var ansGridImgView: UIImageView!
    @IBOutlet weak var ans3GridImgView: UIImageView!
    @IBOutlet weak var ans2GridImgView: UIImageView!
    
    @IBOutlet weak var screenLoadingIndicator: UIProgressView!
    @IBOutlet weak var loadingIndicatorView: UIView!
    @IBOutlet var primaryView: UIView!
    
    @IBOutlet weak var loadingIndicatorCategoryName: UILabel!
    
    
    var progressTimer:Timer? = nil
    var dataModel:[Questions]?=[]
    var i:Int = 0
    var random:Int = Int(arc4random_uniform(3) + 1);
    var questionNum:Int=0
    var ansBtn:[String:String]=[:]
    var gridBtn:[String:UIImageView]=[:]
    var isUserSelectedAns:Bool = false
    var totalCorrectAns:Int = 0
    
    let PROGRESS_BAR_INITIAL_VALUE = 5.0 as Float
    
    @IBOutlet var dummyBtn: UIButton!
    var categoryId:Int = 0
    var categoryName:String?=nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
  
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
                
        questionView?.text = ""
        tapBtn?.isHidden = true

        customizeAnswerButtons()
        
        gridBtn.updateValue(ansGridImgView, forKey: "tag0")
        gridBtn.updateValue(ans2GridImgView, forKey: "tag1")
        gridBtn.updateValue(ans3GridImgView, forKey: "tag2")

        
        self.progreeView?.progress=PROGRESS_BAR_INITIAL_VALUE;
        self.progreeView?.transform = self.progreeView.transform.scaledBy(x: 1, y: 5)

        
        self.loadingIndicatorView.isHidden = false
        self.loadingIndicatorView.alpha = 0.8
        self.loadingIndicatorCategoryName.text = categoryName
        
        getQuestions()
        
//        dummyBtn.setTitle("This text is too much", for: .normal)

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   
    //MARK:- Tap button methods
    
    @IBAction func tapBtnClicked(_ sender: UIButton) {
        
        self.view.isOpaque = false
        clearView()
        hideTapButtons()
        
        if (questionNum<2){
            questionNum = questionNum + 1
            showNextQuestion(num: questionNum)
        }
        else{
            let adVC=AdsViewController()
            adVC.totalAnswers = totalCorrectAns
            self.present(adVC, animated: true, completion: nil)
            
        }
    }
    
    private func hideTapButtons(){
        
        if (questionNum>2){ //number of questions to be shown is 3 else hide progress view and tap button
            tapBtn.isHidden = true
            self.progreeView.isHidden = true
        }
        else{
            tapBtn.isHidden = true
            self.progreeView.isHidden = false
        }

    }

    //MARK:- action methods
    
    func customizeAnswerButtons(){
        
       
        answerTwoBtn?.titleLabel?.textAlignment = .left
        answerFourBtn?.titleLabel?.textAlignment = .left

        answerThreeBtn?.titleLabel?.text = "8"
        answerFourBtn?.titleLabel?.text = "8"

        ansBtn.updateValue("answerOneBtn", forKey: "tag0")
        ansBtn.updateValue("answerTwoBtn", forKey: "tag1")
        ansBtn.updateValue("answerThreeBtn", forKey: "tag2")
        ansBtn.updateValue("answerFourBtn", forKey: "tag3")
        
        answerOneBtn?.layer.cornerRadius = 5.0
        answerTwoBtn?.layer.cornerRadius = 5.0
        answerThreeBtn?.layer.cornerRadius = 5.0
        answerFourBtn?.layer.cornerRadius = 5.0
        
        answerOneBtn?.titleLabel?.numberOfLines = 0
        answerTwoBtn?.titleLabel?.numberOfLines = 0
        answerThreeBtn?.titleLabel?.numberOfLines = 0
        answerFourBtn?.titleLabel?.numberOfLines = 0
        
        answerOneBtn?.titleLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping
        answerTwoBtn?.titleLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping
        answerThreeBtn?.titleLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping
        answerFourBtn?.titleLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping
    }
    
    
    
    // MARK:- Timer methods
    
    func startTimer()
    {
        if self.progressTimer == nil {
            self.progressTimer = Timer.scheduledTimer(timeInterval: 1.5, target: self, selector: #selector(updateProgressView), userInfo: nil, repeats: true)
        }
    }
    
    func stopTimer()
    {
        if self.progressTimer != nil {
            self.progressTimer!.invalidate()
            self.progressTimer = nil
        }
    }
    
    @objc  func updateProgressView() {
        progreeView.progress -= 0.1
        progreeView.setProgress(progreeView.progress, animated: true)
       
        if (progreeView.progress == 0.0){
            if (isUserSelectedAns == false){
                getBtn(tag: questionNum)?.backgroundColor = UIColor.red
            }
            self.stopTimer()
            progreeView.progress=PROGRESS_BAR_INITIAL_VALUE
            progreeView.setProgress(progreeView.progress, animated: true)
            hideView()
        }
    }
 
    
    // MARK:- Set up views
    func clearView(){
        resetAllBtns()
        self.view.backgroundColor=UIColor.white
        self.view.alpha = 1.0
        tapBtn.isHidden = true
        self.progreeView.isHidden = false
        enableAnswerbuttons(isEnabled:true)
      //  btnContainer.isUserInteractionEnabled = true
        
    }
    
    func hideView(){
        resetAllBtns()
        self.view.backgroundColor=UIColor.gray
        self.view.alpha = 0.8
        self.questionView.alpha = 1.0
        
        tapBtn.isHidden = false
        self.progreeView.isHidden = true

        enableAnswerbuttons(isEnabled:false)

       // btnContainer.isUserInteractionEnabled = false
    }
    
    func resetAllBtns(){
        answerOneBtn.backgroundColor=UIColor.lightGray
        answerTwoBtn.backgroundColor=UIColor.lightGray
        answerThreeBtn.backgroundColor=UIColor.lightGray
        answerFourBtn.backgroundColor=UIColor.lightGray
        
    }
    
    func enableAnswerbuttons(isEnabled:Bool) {
        answerOneBtn.isUserInteractionEnabled = isEnabled
        answerTwoBtn.isUserInteractionEnabled = isEnabled
        answerThreeBtn.isUserInteractionEnabled = isEnabled
        answerFourBtn.isUserInteractionEnabled = isEnabled
        
    }
    
    @IBAction func helloButton(sender:UIButton){
        
        sender.setTitle("its growing",for:.normal)
      
    }
    
   func getBtn(tag:Int)->UIImageView?{
    
    var imgView:UIImageView? = nil
    if tag==0{
        imgView = gridBtn["tag0"]
    }
    else if tag==1{
        imgView = gridBtn["tag1"]
    }
    else if tag==2{
        imgView = gridBtn["tag2"]
    }
        return imgView
    }

   
    //MARK:- answer button click methods
    @IBAction func answerBtnClicked(_ sender: UIButton) {
       
        isUserSelectedAns = true //change the correct answer tracking view if time is up but user not answered
        self.stopTimer()
        self.progreeView.progress = PROGRESS_BAR_INITIAL_VALUE
       // btnContainer.isUserInteractionEnabled = false
        enableAnswerbuttons(isEnabled: false)
        if sender.tag == random{
            totalCorrectAns=totalCorrectAns+1
            sender.backgroundColor = UIColor.green
            getBtn(tag: questionNum)?.backgroundColor = UIColor.green
        }
        else{
        sender.backgroundColor = UIColor.red
        getBtn(tag: questionNum)?.backgroundColor = UIColor.red

        }
        
      //  hideTapButtons()
        self.tapBtn.isHidden = false
        self.progreeView.isHidden = true
        
        print("You clicked the answer \(String(describing: sender.titleLabel?.text))")
        print("But the answer \(String(describing:self.dataModel![random].correctAnswer))")

    }
    
    func adjustButton(){
        answerOneBtn.titleLabel?.numberOfLines = 0;
        answerOneBtn.titleLabel?.lineBreakMode = .byWordWrapping;
        answerOneBtn .setTitle("A real real real real real real real real long long name.", for:.normal)
        answerOneBtn.addTarget(self,
                               action: #selector(helloButton),
                               for: .touchUpInside
        )
        answerOneBtn.layoutIfNeeded() // need this to update the button's titleLabel's size
    }
    
    
    func showNextQuestion(num:Int){
        isUserSelectedAns = false
        resetAllBtns()
       // btnContainer.isUserInteractionEnabled = true
        enableAnswerbuttons(isEnabled: true)
        displayOptions(num: num)
        self.startTimer()
    }
    
  
    
    //MARK:- Networking methods
    
    private func getQuestions(){
        let url = URL(string:"https://opentdb.com/api.php?amount=10&category=\(categoryId)&difficulty=easy&type=multiple")
        let config = URLSessionConfiguration.ephemeral
        let session = URLSession(configuration: config)
        let task = session.dataTask(with: url!, completionHandler: { (data:Data?, response:URLResponse?, error:Error?) in
            
            guard let data=data else{
                return
            }
            
            guard let json=try? JSONSerialization.jsonObject(with: data, options: .mutableContainers)else{
                return
            }

            do{
                let jsonResponse:NSDictionary = try JSONSerialization.jsonObject(with:
                    data, options: []) as! NSDictionary
                
                let jsonArray = jsonResponse.value(forKey: "results") as! [[String:Any]]
                
                for resultDict in jsonArray{
                    self.parseJson(result: resultDict)
                }
                
               // Questions qtn = self.dataModel[0] as! Questions
                DispatchQueue.main.async {[weak self] in
                    sleep(5)
                    self?.loadingIndicatorView.isHidden = true;
                    self?.startTimer()
                    self?.displayOptions(num: 0)
                }

            }
            catch let parsingError{
                print(parsingError)
            }

            
            })
        task.resume()
    }
    
    func parseJson(result:[String:Any])
    {
        
        let data:Questions=Questions.init(category: result["category"] as! String, qtn: result["question"] as! String, ans: result["correct_answer"] as! String, wrongAns:result["incorrect_answers"] as! [String], type: result["type"] as! String, difficulty: result["difficulty"] as! String)
        self.dataModel?.append(data)

    }
    
    //MARK:- view styling methods
    
    func displayOptions(num:Int){
        
        self.questionView.text = self.dataModel![num].question

        
        switch random {
        case 0:
            self.answerOneBtn.setTitle(self.dataModel![num].correctAnswer, for: .normal)
            self.answerTwoBtn.setTitle(self.dataModel![num].incorrectAnswers![0], for: .normal)
            self.answerThreeBtn.setTitle(self.dataModel![num].incorrectAnswers![1], for: .normal)
            self.answerFourBtn.setTitle(self.dataModel![num].incorrectAnswers![2], for: .normal)
            break
        case 1:
            self.answerTwoBtn.setTitle(self.dataModel![num].correctAnswer, for: .normal)
            self.answerOneBtn.setTitle(self.dataModel![num].incorrectAnswers![0], for: .normal)
            self.answerThreeBtn.setTitle(self.dataModel![num].incorrectAnswers![1], for: .normal)
            self.answerFourBtn.setTitle(self.dataModel![num].incorrectAnswers![2], for: .normal)
            break
        case 2:
            self.answerThreeBtn.setTitle(self.dataModel![num].correctAnswer, for: .normal)
            self.answerOneBtn.setTitle(self.dataModel![num].incorrectAnswers![0], for: .normal)
            self.answerTwoBtn.setTitle(self.dataModel![num].incorrectAnswers![1], for: .normal)
            self.answerFourBtn.setTitle(self.dataModel![num].incorrectAnswers![2], for: .normal)
            break
        case 3:
            self.answerFourBtn.setTitle(self.dataModel![num].correctAnswer, for: .normal)
            self.answerOneBtn.setTitle(self.dataModel![num].incorrectAnswers![0], for: .normal)
            self.answerTwoBtn.setTitle(self.dataModel![num].incorrectAnswers![1], for: .normal)
            self.answerThreeBtn.setTitle(self.dataModel![num].incorrectAnswers![2], for: .normal)
            break
        default:
            break
        }
        
       //
        //dummyBtn.setTitle(self.answerOneBtn.titleLabel?.text, for: .normal)

       // resetAllBtns()
    }
    
    
    
    
}
