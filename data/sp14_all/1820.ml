
let rec digitsOfInt n =
  if n <= 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

let counter = 0;;

let digits n = digitsOfInt (abs n);;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec additivePersistence n =
  if n < 10
  then counter
  else
    (let myList = digits n in
     let num = sumList myList in
     let counter = 0 in
     counter = ((counter + (1 num)) + (additivePersistence num)));;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

let digits n = digitsOfInt (abs n);;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec additivePersistence n =
  if n < 10
  then 0
  else
    (let myList = digits n in
     let num = sumList myList in num + (additivePersistence num));;

*)

(* changed spans
(5,14)-(5,15)
EMPTY
EmptyG

(13,7)-(13,14)
0
LitG

(17,5)-(18,64)
EMPTY
EmptyG

(17,19)-(17,20)
EMPTY
EmptyG

(18,5)-(18,12)
EMPTY
EmptyG

(18,5)-(18,64)
EMPTY
EmptyG

(18,16)-(18,35)
EMPTY
EmptyG

(18,17)-(18,24)
EMPTY
EmptyG

(18,27)-(18,34)
EMPTY
EmptyG

(18,28)-(18,29)
EMPTY
EmptyG

*)
