
let rec digitsOfInt n =
  if n > 0 then (digitsOfInt (n / 10)) @ [n mod 10] else [];;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec additivePersistence n = sumList digitsOfInt n;;


(* fix

let rec digitsOfInt n =
  if n > 0 then (digitsOfInt (n / 10)) @ [n mod 10] else [];;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec additivePersistence n = sumList (digitsOfInt n);;

*)

(* changed spans
(7,32)-(7,53)
sumList (digitsOfInt n)
AppG (fromList [AppG (fromList [EmptyG])])

*)

(* changed exprs
App (Just (7,32)-(7,55)) (Var (Just (7,32)-(7,39)) "sumList") [App (Just (7,40)-(7,55)) (Var (Just (7,41)-(7,52)) "digitsOfInt") [Var (Just (7,53)-(7,54)) "n"]]
*)

(* typed spans
(7,32)-(7,55)
*)

(* correct types
int
*)

(* bad types
'a
*)
