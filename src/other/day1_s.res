open RescriptCore

let input = "/2023/input/day2"->Utils.makeInput

// part1 -----------------------------------
// 12 red cubes, 13 green cubes, and 14 blue

let _ =
  input
  ->Array.map(line => line->String.split(":"))
  ->Array.map(game => {
    // ([_, cubeGroups])
    let temp =
      game
      ->Array.get(1)
      ->Option.map(item => item->String.split(";"))
      ->Option.map(cubeGroups =>
        cubeGroups->Array.map(
          cubeGroup =>
            cubeGroup
            ->String.trim
            ->String.split(", "),
        )
      )

    Console.log2("here", temp)

    // [
    //   [ '10 blue', '5 green' ],
    //   [ '4 green', '3 red', '6 blue' ],
    //   [ '2 green', '4 red', '1 blue' ]
    // ]

    temp
    // let _ = cubeGroup->String.split(";")
  })




// part2 -----------------------------------
