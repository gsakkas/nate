
let rec digitsOfInt n =
  if n <= 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

let digits n = digitsOfInt (abs n);;

let rec sumList xs = match xs with | [] -> 0 | x::xs' -> x + (sumList xs');;

let rec additivePersistence n =
  let rec counter c =
    if n < 10
    then c
    else counter (c + 1) additivePersistence (sumList (digits n)) in
  counter 0 n;;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

let digits n = digitsOfInt (abs n);;

let rec sumList xs = match xs with | [] -> 0 | x::xs' -> x + (sumList xs');;

let rec additivePersistence n =
  if n < 10 then 0 else 1 + (additivePersistence (sumList (digits n)));;

*)

(* changed spans
(10,2)-(14,13)
EMPTY
EmptyG

(10,18)-(13,65)
EMPTY
EmptyG

(12,9)-(12,10)
EMPTY
EmptyG

(13,9)-(13,16)
0
LitG

(13,9)-(13,65)
EMPTY
EmptyG

(13,18)-(13,19)
EMPTY
EmptyG

(13,25)-(13,44)
additivePersistence (sumList (digits n))
AppG (fromList [AppG (fromList [EmptyG])])

(14,2)-(14,9)
EMPTY
EmptyG

(14,2)-(14,13)
EMPTY
EmptyG

(14,10)-(14,11)
EMPTY
EmptyG

(14,12)-(14,13)
EMPTY
EmptyG

*)
