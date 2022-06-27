//
//  ListEvents.swift
//  Volunteer Sign-Up
//
//  Created by Nathan Mayne on 6/13/22.
//
//Please fix

import Foundation

class ListEvents: Codable, ObservableObject, Identifiable {
    enum CodingKeys: CodingKey {
        case listEventsSigned, listEventsCreated, id
    }

    @Published var listEventsSigned: [Day] = []
    @Published var listEventsCreated: [Day] = []

    var id = UUID()

    //Initializes ListEvents with Dummy Data
    init() {
        let events = [EventInfo(eventName: "Dummy Event", at: "Epic Dr.", timeAndDate: Date(), notes: "Bring sandiwches", user: "father", zip: 100), EventInfo(eventName: "Milk Fest", at: "Pog Ch.", timeAndDate: Date(), notes: "Lol Nerd", user: "Dad", zip: 10)]
        var day = Day(events: events)
        listEventsSigned.append(day)

        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd HH:mm"
        if let date = formatter.date(from: "2016/10/08 22:31") {
            let events2 = [EventInfo(eventName: "Ray William Johnson Meet and Greet", at: "Doinyur, Mom CA.", timeAndDate: date, notes: "Meet Ray, the creator of the hit youtube song \"Doin Your Mom\"!!!", user: "Ray", zip: 299)]
            day = Day(events: events2)
        }
        listEventsCreated.append(day)
    }

    //conform to Codable
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        listEventsSigned = try container.decode(Array<Day>.self, forKey: .listEventsSigned)
        listEventsCreated = try container.decode(Array<Day>.self, forKey: .listEventsCreated)
        id = try container.decode(UUID.self, forKey: .id)

    }
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(listEventsSigned, forKey: .listEventsSigned)
        try container.encode(listEventsCreated, forKey: .listEventsCreated)
        try container.encode(id, forKey: .id)
    }

    func AddSigned(event: EventInfo) {
        var list = listEventsSigned
        let date = event.dateTime
        var added = false
        for day in list {
            if day.date == date {
                day.events.append(event)
                added = true
            }
        }
        if !added {
            list.append(Day(events: [event]))
            sortList()
        }
    }

    func AddCreated(event: EventInfo) {
        var list = listEventsCreated
        let date = event.dateTime
        var added = false
        for day in list {
            if day.date == date {
                day.events.append(event)
                added = true
            }
        }
        if !added {
            list.append(Day(events: [event]))
            sortList()
        }
    }

    func FindDay(_ date: Date, in list: [Day]) -> Day {
        for day in list {
            if day.date == date {
                return day
            }
        }
        return Day()
    }

    func DeleteEvent(at index: Int, in list: [Day]) throws -> Bool {
        return true
    }

    func sortList() -> Void {
        listEventsSigned = listEventsSigned.sorted(by: {$0.date.timeIntervalSince1970 < $1.date.timeIntervalSince1970})
        listEventsCreated = listEventsCreated.sorted(by: {$0.date.timeIntervalSince1970 < $1.date.timeIntervalSince1970})
    }
    /*
    func convertDays() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        let dict = Dictionary(grouping: listEventsSigned) {
            (event: EventInfo) -> String in
            dateFormatter.string(from: event.dateTime)
        }
        self.sections = dict.map { day -> Day in
            Day(dateString: day.key, events: day.value, date: day.value[0].dateTime)
        }.sorted { $0.date < $1.date }
    }
     */
}

class Day: Codable, Identifiable {
    var id = UUID()
    var events: [EventInfo] = []
    //var events2: ListEvents
    var date: Date
    var dateString: String

    init() {
        date = Date()
        dateString = date.formatted(date: .abbreviated, time: .omitted)
    }

    init(events: [EventInfo]) {
        date = events[0].dateTime
        dateString = date.formatted(date: .abbreviated, time: .omitted)
        self.events = events
    }

    init(dateString: String, events: [EventInfo], date: Date) {
        self.date = date
        self.dateString = dateString
        self.events = events
    }
}
