
let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec digitalRoot n =
  if n < 10 then n else (let summed = sumList n in digitalRoot summed);;


(* fix

let rec digitsOfInt n =
  if n <= 0
  then []
  else
    (let modded = n mod 10 in
     let quotient = n / 10 in
     let head = digitsOfInt quotient in head @ [modded]);;

let digits n = digitsOfInt (abs n);;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec digitalRoot n =
  if n < 10
  then n
  else
    (let intList = digits n in let sum = sumList intList in digitalRoot sum);;

*)

(* changed spans
(2,16)-(2,70)
fun n ->
  if n <= 0
  then []
  else (let modded = n mod 10 in
        let quotient = n / 10 in
        let head =
          digitsOfInt quotient in
        head @ [modded])
LamG (IteG EmptyG EmptyG EmptyG)

(5,24)-(5,70)
let intList = digits n in
let sum = sumList intList in
digitalRoot sum
LetG NonRec (fromList [AppG (fromList [EmptyG])]) (LetG NonRec (fromList [EmptyG]) EmptyG)

(5,38)-(5,45)
digits
VarG

(5,51)-(5,62)
digitalRoot sum
AppG (fromList [VarG])

(5,51)-(5,69)
let sum = sumList intList in
digitalRoot sum
LetG NonRec (fromList [AppG (fromList [EmptyG])]) (AppG (fromList [EmptyG]))

(5,63)-(5,69)
sum
VarG

*)
