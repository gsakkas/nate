
let rec digitsOfInt n =
  if n <= 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec additivePersistence n =
  if n < 10 then 1 else (additivePersistence sumList digitsOfInt n) + 1;;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec additivePersistence n =
  if n < 10 then 1 else (additivePersistence (sumList (digitsOfInt n))) + 1;;

*)

(* changed spans
(8,25)-(8,68)
additivePersistence (sumList (digitsOfInt n))
AppG [AppG [EmptyG]]

*)

(* type error slice
(7,4)-(8,74)
(7,29)-(8,72)
(8,3)-(8,72)
(8,25)-(8,68)
(8,25)-(8,72)
(8,26)-(8,45)
*)
