
let rec additivePersistence n = if n < 10 then n else ();;


(* fix

let rec digitsOfInt n =
  if n > 0 then (digitsOfInt ((n - (n mod 10)) / 10)) @ [n mod 10] else [];;

let rec sumList xs = match xs with | [] -> 0 | x::xs' -> x + (sumList xs');;

let rec additivePersistence n =
  if n < 10 then n else additivePersistence (sumList (digitsOfInt n));;

*)

(* changed spans
(2,35)-(2,41)
fun n ->
  if n < 10
  then n
  else additivePersistence (sumList (digitsOfInt n))
LamG (IteG EmptyG EmptyG EmptyG)

(2,54)-(2,56)
additivePersistence (sumList (digitsOfInt n))
AppG (fromList [AppG (fromList [EmptyG])])

*)
