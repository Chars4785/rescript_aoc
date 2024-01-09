open NodeJs
open RescriptCore

let input =
  Fs.readFileSyncWith(Global.dirname ++ "/input/day2", {encoding: "utf8"})
  ->Buffer.toString
  ->String.split("\n")

// let inputArray = Belt.Array.map(input, int_of_string)

let red = 12
let green = 13
let blue = 14

// let gameDict = Map.fromArray([])

// let getValueByKey = (key, myDict) => {
//   switch (Belt.Map.get(key, myDict)) {
//   | Some(value) => value
//   | None => "Key not found"
//   }
// }

Array.forEach(input, game => {
  let games = String.split(game, ": ")
  switch games {
  | [gameInfo, cubeInfo] => {
      let redCount = ref(0)
      let greenCount = ref(0)
      let blueCount = ref(0)
      let gameNumber = String.split(gameInfo, " ")[1]
      Js.log(gameNumber)
      String.split(cubeInfo, "; ")->Array.forEach(gamer =>
        String.split(gamer, ", ")->Array.forEach(
          cube =>
            switch String.split(cube, " ") {
            | [count, color] =>
              switch (count, color) {
              | (_, "red") => redCount.contents + count->Int.fromString->Option.getOr(0)
              | (_, "green") => greenCount.contents + count->Int.fromString->Option.getExn
              | (_, "blue") => blueCount.contents + count->Int.fromString->Option.getOr(0)
              | _ => 0
              }
            | _ => 0
            }->ignore,
        )
      )
    }
  | _ => Js.log("None!!")
  }

  // Belt.Map.set(gameNumber[1], , gameDict)
})
