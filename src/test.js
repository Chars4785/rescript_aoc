let a =
  "Game 1: 13 red, 18 green; 5 green, 3 red, 5 blue; 5 green, 9 red, 6 blue; 3 blue, 3 green";

// console.log(a.split(`/^(Game (\d):)/$`));
console.log(a.split(r`Game (\d+)`));
