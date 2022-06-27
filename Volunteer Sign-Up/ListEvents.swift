//
//  ListEvents.swift
//  Volunteer Sign-Up
//
//  Created by Nathan Mayne on 6/13/22.
//

import Foundation

class ListEvents: ObservableObject, Identifiable {
    @Published var listEventsSigned: [Day] = []
    @Published var listEventsCreated: [Day] = []
    //var date: Date
    //var dateString: String
        //var sections: [Day]
    
    var id = UUID()
    
    // Replace this default constructor to what you need, but make sure this class contains a default constructor
   /* init() {
        listEventsSigned = [EventInfo(eventName: "Milk Day", at: "Epic Dr.", timeAndDate: Date(), notes: "Bring sandiwches"), EventInfo(eventName: "Milk Maid", at: "Pog Ch.", timeAndDate: Date(), notes: "Lol Nerd")]
        listEventsCreated = [EventInfo(eventName: "Ray William Johnson Meet and Greet", at: "Doinyur, Mom CA.", timeAndDate: Date(), notes: "Meet Ray, the creator of the hit youtube song \"Doin Your Mom\"!!!")]
        */
        //sections
    //    date = Date()
    //    dateString = date.formatted(date: .abbreviated, time: .omitted)
  //  }
    init() {
        let events = [EventInfo(eventName: "Milk Day", at: "Epic Dr.", timeAndDate: Date(), notes: "Bring sandiwches"), EventInfo(eventName: "Milk Maid", at: "Pog Ch.", timeAndDate: Date(), notes: "Lol Nerd")]
        //listEventsCreated = [EventInfo(eventName: "Ray William Johnson Meet and Greet", at: "Doinyur, Mom CA.", timeAndDate: Date(), notes: "Meet Ray, the creator of the hit youtube song \"Doin Your Mom\"!!!")]
        var day = Day(events: events)
        listEventsSigned.append(day)

        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd HH:mm"
        if let date = formatter.date(from: "2016/10/08 22:31") {
            let events2 = [EventInfo(eventName: "Ray William Johnson Meet and Greet", at: "Doinyur, Mom CA.", timeAndDate: date, notes: "Meet Ray, the creator of the hit youtube song \"Doin Your Mom\"!!!")]
            day = Day(events: events2)
        }
        listEventsCreated.append(day)
    }
    
   /* init(dateString: String, eventsSigned: [EventInfo], eventsCreated: [EventInfo], date: Date) {
        self.date = date
        self.dateString = dateString
        self.listEventsSigned = eventsSigned
        self.listEventsCreated = eventsCreated
    }*/
    
   /* func EditList(_ list: [Day]) throws -> ObservableObject {
        return self
    }
    */
    
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
    
    /*func Add(event: EventInfo, to list: [Day]) {
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
        }
        
    }*/
    
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

class Day: Identifiable {
    var id = UUID()
    var events: [EventInfo] = []
    //var events2: ListEvents
    var date: Date
    var dateString: String
    
    init() {
        date = Date()
        dateString = date.formatted(date: .abbreviated, time: .omitted)
        //events2 = ListEvents()
    }
    
    init(events: [EventInfo]) {
        date = events[0].dateTime
        dateString = date.formatted(date: .abbreviated, time: .omitted)
        self.events = events
        //events2 = ListEvents()
    }
    
    init(dateString: String, events: [EventInfo], date: Date) {
        self.date = date
        self.dateString = dateString
        self.events = events
        //events2 = ListEvents()
    }
    
    //func add(event: EventInfo)
}

/*
class ListDays: ObservableObject, Identifiable {
    @Published var days: [ListEvents] = []
    //@Published var days =
    //@Published var listEvents: = []
    
    func convertDays(events listEventsSigned: [EventInfo]) -> Void {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        let dict = Dictionary(grouping: listEventsSigned) {
            (event: EventInfo) -> String in
            dateFormatter.string(from: event.dateTime)
        }
        self.days = dict.map { event -> ListEvents in
            ListEvents(dateString: event.key, eventsSigned: event.value, eventsCreated: event.value, date: event.value[0].dateTime)
        }.sorted { $0.date < $1.date }
    }
    
    init() {
        
    }
    init(listEvents: [ListEvents]) {
        self.days = listEvents
    }
    
    /*
    init(listEvents listEventsSigned: [EventInfo]){
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        let dict = Dictionary(grouping: listEventsSigned) {
            (event: EventInfo) -> String in
            dateFormatter.string(from: event.dateTime)
        }
        self.days = dict.map { day -> Day in
            Day(dateString: day.key, events: day.value, date: day.value[0].dateTime)
        }.sorted { $0.date < $1.date }
    }*/
}
*/
