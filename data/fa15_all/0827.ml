
let lt10 q = q < 10;;

let rec additivePersistence n = if lt10 n then n else 55 :: 66;;


(* fix

let incre i = i + 1;;

let lt10 q = q < 10;;

let rec additivePersistence n =
  if lt10 n then n else (match n with | n -> incre n);;

*)

(* changed spans
(2,9)-(2,19)
fun i -> i + 1
LamG (BopG EmptyG EmptyG)

(4,54)-(4,56)
EMPTY
EmptyG

(4,54)-(4,62)
EMPTY
EmptyG

(4,60)-(4,62)
match n with
| n -> incre n
CaseG VarG (fromList [(Nothing,AppG (fromList [EmptyG]))])

*)
