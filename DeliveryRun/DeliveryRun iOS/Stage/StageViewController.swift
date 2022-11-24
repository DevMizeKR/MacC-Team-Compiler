//
//  StageViewController.swift
//  DeliveryRun iOS
//
//  Created by HWANG-C-K on 2022/10/16.
//

import UIKit

class StageViewController: UIViewController {
    @IBOutlet weak var stageCollectionView: UICollectionView!
    @IBOutlet weak var stageDetailView: UIView!
    @IBOutlet weak var startButton: CustomGameButton!
    @IBOutlet weak var stageNameLabel: UILabel!
    @IBOutlet weak var recordLabel: UILabel!
    
    @IBOutlet weak var starImageOne: UIImageView!
    @IBOutlet weak var starImageTwo: UIImageView!
    @IBOutlet weak var starImageThree: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        stageCollectionView.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        stageCollectionView.layer.cornerRadius = 10
        stageCollectionView.delegate = self
        stageCollectionView.dataSource = self
        stageCollectionView.allowsMultipleSelection = false
        
        setStageDetail()
    }
    
    // 기본 선택 위치 설정
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let selectedIndexPath = IndexPath(row: 0, section: 0)
        stageCollectionView.selectItem(at: selectedIndexPath, animated: false, scrollPosition: [])
        stageNameLabel.text = stageList[selectedIndexPath.row].stageName
        recordLabel.text = "목표기록 : \(stageList[selectedIndexPath.row].targetRecord)\n현재기록 : \(stageList[selectedIndexPath.row].myRecord)"
            
        // 별 개수에 따라 색 변경
        switch stageList[selectedIndexPath.row].star {
        case 1:
            starImageOne.tintColor = .deliveryrunYellow
            starImageTwo.tintColor = .systemGray
            starImageThree.tintColor = .systemGray
            break
        case 2:
            starImageOne.tintColor = .deliveryrunYellow
            starImageTwo.tintColor = .deliveryrunYellow
            starImageThree.tintColor = .systemGray
            break
        case 3:
            starImageOne.tintColor = .deliveryrunYellow
            starImageTwo.tintColor = .deliveryrunYellow
            starImageThree.tintColor = .deliveryrunYellow
            break
        default:
            starImageOne.tintColor = .systemGray
            starImageTwo.tintColor = .systemGray
            starImageThree.tintColor = .systemGray
            break
        }
    }
    
    // Stage Detail View 설정
    func setStageDetail() {
        stageDetailView.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        stageDetailView.layer.cornerRadius = 10
        
        startButton.setTitle("배달 출발", for: .normal)
        startButton.titleLabel?.font = UIFont(name: "BMJUAOTF", size: 30)
        startButton.layer.borderWidth = 2
        startButton.layer.borderColor = UIColor.white.cgColor
        
        stageNameLabel.text = "스테이지 이름"
        stageNameLabel.textColor = .white
        stageNameLabel.font = UIFont(name:"BMJUAOTF", size: 35)
        
        recordLabel.text = "목표기록 : 00:00:00\n현재기록 : 00:00:00"
        recordLabel.textAlignment = .center
        recordLabel.numberOfLines = 2
        recordLabel.textColor = .white
        recordLabel.font = UIFont(name:"BMJUAOTF", size: 20)
        
        starImageOne.tintColor = .systemGray
        starImageTwo.tintColor = .systemGray
        starImageThree.tintColor = .systemGray
    }
}


extension StageViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    // Cell 수
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 15
    }
    
    // Cell 초기화
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "stagecell", for: indexPath) as! StageCell
        cell.isLock = stageList[indexPath.row].isLock
        cell.stageLabel.text = String(format: "%d", indexPath.row + 1)
        cell.foodImageView.image = UIImage(named:stageList[indexPath.row].foodImageName)?.resized(to:CGSize(width:40, height:40))
        return cell
    }
}

// Cell Size & Insets
extension StageViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = CGFloat(Int((collectionView.frame.width - 120) / 5))
        let height = CGFloat(Int((collectionView.frame.height - 60) / 3))
        let size = CGSize(width: width, height: height)
        return size
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 15
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 15, left: 20, bottom: 15, right: 20)
    }
}

// Cell 선택 시 정보 변경
extension StageViewController {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // Label 수정
        stageNameLabel.text = stageList[indexPath.row].stageName
        recordLabel.text = "목표기록 : \(stageList[indexPath.row].targetRecord)\n현재기록 : \(stageList[indexPath.row].myRecord)"
        
        // 별 개수에 따라 색 변경
        switch stageList[indexPath.row].star {
        case 1:
            starImageOne.tintColor = .deliveryrunYellow
            starImageTwo.tintColor = .systemGray
            starImageThree.tintColor = .systemGray
            break
        case 2:
            starImageOne.tintColor = .deliveryrunYellow
            starImageTwo.tintColor = .deliveryrunYellow
            starImageThree.tintColor = .systemGray
            break
        case 3:
            starImageOne.tintColor = .deliveryrunYellow
            starImageTwo.tintColor = .deliveryrunYellow
            starImageThree.tintColor = .deliveryrunYellow
            break
        default:
            starImageOne.tintColor = .systemGray
            starImageTwo.tintColor = .systemGray
            starImageThree.tintColor = .systemGray
            break
        }
    }
}
