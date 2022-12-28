import SwiftUI
import Charts

struct StatsChart: View {
    let statList: [Pokemon.Stats]
    
    init?(_ statList: [Pokemon.Stats]) {
        self.statList = statList
    }
    
    var body: some View {
        VStack {
            Text("Stats")
                .font(.headline)
            Chart {
                BarMark(
                    x: .value("Stat", "hp"),
                    y: .value("Value", 50)
                ).foregroundStyle(.brown)
                BarMark(
                    x: .value("Stat", "atk"),
                    y: .value("Value", 100)
                ).foregroundStyle(.indigo)
                BarMark(
                    x: .value("Stat", "def"),
                    y: .value("Value", 75)
                ).foregroundStyle(.green)
                BarMark(
                    x: .value("Stat", "spAtk"),
                    y: .value("Value", 36)
                ).foregroundStyle(.mint)
                BarMark(
                    x: .value("Stat", "spDef"),
                    y: .value("Value", 26)
                ).foregroundStyle(.purple)
                BarMark(
                    x: .value("Stat", "speed"),
                    y: .value("Value", 50)
                ).foregroundStyle(.orange)
            }
        }
    }
}

struct StatsChart_Previews: PreviewProvider {
    static var previews: some View {
        StatsChart([
            .hp(.init(baseStat: 50, effort: 0, stat: .init(name: "hp", url: "someURL"))),
            .atk(.init(baseStat: 50, effort: 0, stat: .init(name: "hp", url: "someURL"))),
            .def(.init(baseStat: 50, effort: 0, stat: .init(name: "hp", url: "someURL"))),
            .spAtk(.init(baseStat: 50, effort: 0, stat: .init(name: "hp", url: "someURL"))),
            .spDef(.init(baseStat: 50, effort: 0, stat: .init(name: "hp", url: "someURL"))),
        ])
    }
}
