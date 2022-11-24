//
//  main.swift
//  MyCreditManager
//
//  Created by Wonhyuk Choi on 2022/11/24.
//

import Foundation

private var onLoop = true
private var gradeDict = [String: [String: Grade]]()

while onLoop {
    print("원하는 기능을 입력해주세요")
    print("1: 학생추가, 2: 학생삭제, 3: 성적추가(변경), 4: 성적삭제, 5: 평점보기, X: 종료")
    
    guard let line = readLine(), line.trimmingCharacters(in: .whitespacesAndNewlines) != "" else {
        print("뭔가 입력이 잘못되었습니다. 1~5 사이의 숫자 혹은 X를 입력해주세요.")
        continue
    }
    switch line {
    case Input.addStudent.rawValue:
        addStudentProgram()
    case Input.deleteStudent.rawValue:
        deleteStudentProgram()
    case Input.addGrade.rawValue:
        addGradeProgram()
    case Input.deleteGrade.rawValue:
        deleteGradeProgram()
    case Input.fetchAverage.rawValue:
        fetchAverageProgram()
    case Input.exit.rawValue:
        print("프로그램을 종료합니다...")
        onLoop = false
    default:
        print("뭔가 입력이 잘못되었습니다. 1~5 사이의 숫자 혹은 X를 입력해주세요.")
        continue
    }
}

func addStudentProgram() {
    print("추가할 학생의 이름을 입력해주세요")
    
    guard let line = readLine(), line.trimmingCharacters(in: .whitespacesAndNewlines) != "" else {
        print("입력이 잘못되었습니다. 다시 확인해주세요.")
        return
    }
    
    if gradeDict[line] == nil {
        gradeDict[line] = [String: Grade]()
        print("\(line) 학생을 추가했습니다.")
    } else {
        print("\(line)은 이미 존재하는 학생입니다. 추가하지 않습니다.")
    }
}

func deleteStudentProgram() {
    print("삭제할 학생의 이름을 입력해주세요")
    
    guard let line = readLine(), line.trimmingCharacters(in: .whitespacesAndNewlines) != "" else {
        print("입력이 잘못되었습니다. 다시 확인해주세요.")
        return
    }
    
    if gradeDict[line] != nil {
        gradeDict.removeValue(forKey: line)
        print("\(line) 학생을 삭제하였습니다.")
    } else {
        print("\(line) 학생을 찾지 못했습니다.")
    }
}

func addGradeProgram() {
    print("성적을 추가할 학생의 이름, 과목 이름, 성적(A+, A, F 등)을 띄어쓰기로 구분하여 차례로 작성해주세요.")
    print("입력예) Mickey Swift A+")
    print("만약에 학생의 성적 중 해당 과목이 존재하면 기존 점수가 갱신됩니다.")
    
    guard let line = readLine(), line.trimmingCharacters(in: .whitespacesAndNewlines) != "" else {
        print("입력이 잘못되었습니다. 다시 확인해주세요.")
        return
    }
    
    let inputArr = line.components(separatedBy: " ")
    if inputArr.count == 3 {
        let student = inputArr[0]
        let subject = inputArr[1]
        let grade = inputArr[2]
        
        guard gradeDict[student] != nil else {
            print("\(student) 학생을 찾지 못했습니다.")
            return
        }
        
        switch grade {
        case Grade.aPlus.rawValue:
            gradeDict[student]?[subject] = Grade.aPlus
            print("\(student) 학생의 \(subject) 과목이 \(grade)로 추가(변경)되었습니다.")
        case Grade.aZero.rawValue:
            gradeDict[student]?[subject] = Grade.aZero
            print("\(student) 학생의 \(subject) 과목이 \(grade)로 추가(변경)되었습니다.")
        case Grade.bPlus.rawValue:
            gradeDict[student]?[subject] = Grade.bPlus
            print("\(student) 학생의 \(subject) 과목이 \(grade)로 추가(변경)되었습니다.")
        case Grade.bZero.rawValue:
            gradeDict[student]?[subject] = Grade.bZero
            print("\(student) 학생의 \(subject) 과목이 \(grade)로 추가(변경)되었습니다.")
        case Grade.cPlus.rawValue:
            gradeDict[student]?[subject] = Grade.cPlus
            print("\(student) 학생의 \(subject) 과목이 \(grade)로 추가(변경)되었습니다.")
        case Grade.cZero.rawValue:
            gradeDict[student]?[subject] = Grade.cZero
            print("\(student) 학생의 \(subject) 과목이 \(grade)로 추가(변경)되었습니다.")
        case Grade.dPlus.rawValue:
            gradeDict[student]?[subject] = Grade.dPlus
            print("\(student) 학생의 \(subject) 과목이 \(grade)로 추가(변경)되었습니다.")
        case Grade.dZero.rawValue:
            gradeDict[student]?[subject] = Grade.dZero
            print("\(student) 학생의 \(subject) 과목이 \(grade)로 추가(변경)되었습니다.")
        case Grade.fail.rawValue:
            gradeDict[student]?[subject] = Grade.fail
            print("\(student) 학생의 \(subject) 과목이 \(grade)로 추가(변경)되었습니다.")
        default:
            print("입력이 잘못되었습니다. 다시 확인해주세요.")
        }
    } else {
        print("입력이 잘못되었습니다. 다시 확인해주세요.")
    }
}

func deleteGradeProgram() {
    print("성적을 추가할 학생의 이름, 과목 이름을 띄어쓰기로 구분하여 차례로 작성해주세요.")
    print("입력예) Mickey Swift")
    
    guard let line = readLine(), line.trimmingCharacters(in: .whitespacesAndNewlines) != "" else {
        print("입력이 잘못되었습니다. 다시 확인해주세요.")
        return
    }
    
    let inputArr = line.components(separatedBy: " ")
    if inputArr.count == 2 {
        let student = inputArr[0]
        let subject = inputArr[1]
        
        guard var targetStudent = gradeDict[student] else {
            print("\(student) 학생을 찾지 못했습니다.")
            return
        }
        
        if targetStudent[subject] != nil {
            targetStudent.removeValue(forKey: subject)
            print("\(student) 학생의 \(subject) 과목의 성적이 삭제되었습니다.")
        } else {
            print("\(student) 학생의 \(subject) 과목을 찾지 못했습니다.")
        }
    } else {
        print("입력이 잘못되었습니다. 다시 확인해주세요.")
    }
}

func fetchAverageProgram() {
    print("평점을 알고싶은 학생의 이름을 입력해주세요")
    
    guard let line = readLine(), line.trimmingCharacters(in: .whitespacesAndNewlines) != "" else {
        print("입력이 잘못되었습니다. 다시 확인해주세요.")
        return
    }
    
    if let dict = gradeDict[line] {
        guard dict.count != 0 else {
            print("입력된 성적이 없습니다.")
            return
        }
        var totalPoint: Float = 0
        for (key, value) in dict {
            print("\(key): \(value.rawValue)")
            totalPoint += value.getPoints()
        }
        let averagePoint = totalPoint/Float(dict.count)
        print("평점 : \(floor(averagePoint*100)/100)")
    } else {
        print("\(line) 학생을 찾지 못했습니다.")
    }
}

enum Input: String {
    case addStudent = "1"
    case deleteStudent = "2"
    case addGrade = "3"
    case deleteGrade = "4"
    case fetchAverage = "5"
    case exit = "X"
}

enum Grade: String, CaseIterable {
    case aPlus = "A+"
    case aZero = "A"
    case bPlus = "B+"
    case bZero = "B"
    case cPlus = "C+"
    case cZero = "C"
    case dPlus = "D+"
    case dZero = "D"
    case fail = "F"
    
    func getPoints() -> Float {
        switch self {
        case .aPlus:
            return 4.5
        case .aZero:
            return 4
        case .bPlus:
            return 3.5
        case .bZero:
            return 3
        case .cPlus:
            return 2.5
        case .cZero:
            return 2
        case .dPlus:
            return 1.5
        case .dZero:
            return 1
        case .fail:
            return 0
        }
    }
}
