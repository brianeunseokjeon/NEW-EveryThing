//
//  FAQViewModel.swift
//  UI_FloderTableView
//
//  Created by 맥북프로에임메드 on 2020/11/10.
//

import Foundation

class SideFAQViewModel {
    struct CellData {
        var opened:Bool = false
        let FAQTitle: String //챌린지 문의 / 걷기 문의 ..
        var FAQSectionData: [FAQGetDetail]
    }
    var tableViewData = [
    CellData(FAQTitle: "1 문의",
             FAQSectionData:
                [FAQGetDetail(id: "1", type: "", question: "챌린지 현황은 어디서 확인하나요?", answer: "김치요!", useYn: true),
                FAQGetDetail(id: "2", type: "", question: "챌린지 완료시 환급 절차는 어떻게 진해오디는 건가요???", answer: "김치요!", useYn: true),
                FAQGetDetail(id: "3", type: "", question: "졸린데 어떻게 하죠????", answer: "김치요!", useYn: true)
    ]),
        CellData(FAQTitle: "2 문의",
                 FAQSectionData:
                    [FAQGetDetail(id: "1", type: "", question: "라면 먹고 가요? 챌린지 현황은 어디서 확인하나요?", answer: "김치요!", useYn: true),
                    FAQGetDetail(id: "2", type: "", question: "밥은요? 챌린지 완료시 환급 절차는 어떻게 진해오디는 건가요???", answer: "김치요!", useYn: true),
                    FAQGetDetail(id: "3", type: "", question: "졸린데 어떻게 하죠????", answer: "김치요!", useYn: true)
        ]),
        CellData(FAQTitle: "3 문의",
                 FAQSectionData:
                    [FAQGetDetail(id: "1", type: "", question: "졸린데 3번째입니다, 챌린지 현황은 어디서 확인하나요?", answer: "김치요!", useYn: true)
        ]),
        CellData(FAQTitle: "기타 서비스 이용 문의",
                 FAQSectionData:
                   [
        ]),
    ]
    
    struct FAQGet:Codable {
        let etc: [FAQGetDetail]
        let challenge: [FAQGetDetail]
        let medication: [FAQGetDetail]
        let activity: [FAQGetDetail]
    }
    struct FAQGetDetail:Codable {
        let id: String
        let type: String
        let question: String
        let answer: String
        let useYn: Bool
    }
}
