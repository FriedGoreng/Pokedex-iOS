import SwiftUI
import Charts
import Requests

struct StatsChart: View {
    let statList: Pokemon.Stats
    
    init?(_ statList: Pokemon.Stats) {
        self.statList = statList
    }
    
    var body: some View {
        VStack {
            Text("Stats")
                .font(.headline)
            Chart {
                BarMark(
                    x: .value("Stat", "hp"),
                    y: .value("Value", statList.hp.baseStat)
                ).foregroundStyle(.brown)
                BarMark(
                    x: .value("Stat", "atk"),
                    y: .value("Value", statList.atk.baseStat)
                ).foregroundStyle(.indigo)
                BarMark(
                    x: .value("Stat", "def"),
                    y: .value("Value", statList.def.baseStat)
                ).foregroundStyle(.green)
                BarMark(
                    x: .value("Stat", "spAtk"),
                    y: .value("Value", statList.spAtk.baseStat)
                ).foregroundStyle(.mint)
                BarMark(
                    x: .value("Stat", "spDef"),
                    y: .value("Value", statList.spDef.baseStat)
                ).foregroundStyle(.purple)
                BarMark(
                    x: .value("Stat", "speed"),
                    y: .value("Value", statList.speed.baseStat)
                ).foregroundStyle(.orange)
            }
        }
    }
}

struct StatsChart_Previews: PreviewProvider {
    static var previews: some View {
        StatsChart(Pokemon.Stats(hp: 35, atk: 35, def: 35, spAtk: 35, spDef: 35, speed: 35))
    }
}
