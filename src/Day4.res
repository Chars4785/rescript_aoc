open RescriptCore
let input = "/input/day4"->Utils.makeInput

let dict = Js.Dict.fromList(list{
    ("byr", 0),
    ("iyr", 0),
    ("eyr", 0),
    ("hgt", 0),
    ("hcl", 0),
    ("ecl", 0),
    ("pid", 0),
})

let passport = ["byr", "iyr", "eyr", "hgt", "hcl", "ecl","pid"]
let a = ref(0);
let _ =
  input->Array.forEach(t => {
    switch t == "" {
    | true =>  {
        // let a = Js.Dict.values(dict)->Js.Array2.reduce(0,(prev,current) => prev + current)
        let sumValue = Js.Dict.values(dict)->Js.Array2.reduce((p,c) => p+c,0)
        Js.log(dict)
        Js.log(sumValue)
        switch sumValue == passport->Js.Array.length {
            | true => a := a.contents + 1
            | false => ()
        }
        dict->Js.Dict.set("byr",0)
        dict->Js.Dict.set("iyr",0)
        dict->Js.Dict.set("eyr",0)
        dict->Js.Dict.set("hgt",0)
        dict->Js.Dict.set("hcl",0)
        dict->Js.Dict.set("ecl",0)
        dict->Js.Dict.set("pid",0)
    }
    | false =>
      t->String.split(" ")->Array.forEach(ss => {
        ss->String.split(":")->Array.forEach(item =>{
            switch passport->Array.includes(item) {
                | true => {
                let plus = dict->Js.Dict.get(item)
                switch plus{
                    | Some(plus) => dict->Js.Dict.set(item,plus + 1)
                    | None =>()
                }
                }
                | false => ()
            }
        })
      })
    }
})

Js.log(a)
