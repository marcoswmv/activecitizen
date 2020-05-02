//
//  ReportDetailsViewController.swift
//  ActiveCitizen
//
//  Created by Dmitry Byankin on 03.12.2019.
//  Copyright © 2019 Antares Software. All rights reserved.
//

import UIKit
import YandexMapKit
import Auk

class ReportDetailsViewController: BaseReportDetailsViewController, UITableViewDelegate {
    
    @IBOutlet weak var mapView: YMKMapView!
    @IBOutlet weak var reportDetailsView: ReportDetailsView?
    
    @IBOutlet weak var tableView: UITableView!
    
    lazy var map: YMKMap = { return self.mapView.mapWindow.map }()
    
//    TODO: HOW TO ADD COMMENTS "ДОБАВИТЬ КОММЕНТРАИЙ"
    
    var dataSource: CommentsDataSource?
    
    var taskStatus = TaskStatus()
    var membersManager = MembersManager()
    var imagesManager = ImagesManager()
    var manager = ReportsManager()
    var report: Report?
    
    var memberName: String?
    var zoom: Float = 12.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupMapView()
        setupCommentsDataSource()
        setReportDetails()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if report == nil {
            print("TODO: error")
            self.navigationController?.popViewController(animated: true)
            return
        }
    }
    
    
    func setReportDetails() {
        
        reportDetailsView?.scrollView.delegate = self
        
        setupImageViewer()
        
        reportDetailsView?.categoryIcon.image = report?.categoryIcon
        reportDetailsView?.categoryName.text = report?.categoryName
        reportDetailsView?.subCategoryName.text = report?.subcategoryName
        reportDetailsView?.address.text = report?.address
        reportDetailsView?.indicatedPeriod.text = ""
        reportDetailsView?.reportCreationDate.text = report?.created?.string(format: "dd.MM.yyyy")
        reportDetailsView?.numberOfReport.text = report?.id?.description
        reportDetailsView?.reportDescription.text = report?.description
        setAutor()
        reportDetailsView?.status.text = taskStatus.setStatus(statusKey: report?.status)
        reportDetailsView?.status.textColor = taskStatus.setColor(statusKey: report?.status)
        
    }
    
    func setAutor() {
        membersManager.getMemberUsers { (members, error) in
            if error != nil  {
//                TODO: Show alert to user
                print(error?.localizedDescription as Any)
                return
            }
            
            if let name = members?.first(where: { $0.id == self.report?.userID })?.name, !name.isEmpty {
                self.reportDetailsView?.userID = self.report?.userID
                self.reportDetailsView?.autorButton.setTitle(name, for: .normal)
            } else {
                self.reportDetailsView?.autorButton.setTitle("", for: .normal)
                self.reportDetailsView?.autorButton.isHidden = true
                self.reportDetailsView?.autorButton.isEnabled = false
            }
        }
    }
    
    func setupCommentsDataSource() {
        dataSource = CommentsDataSource(tableView: self.tableView)
        dataSource?.onLoading = { (isLoading) in
            self.displayLoading(loading: isLoading)
        }
        dataSource?.caseID = report?.caseID
        dataSource?.reload()
    }
    
}
