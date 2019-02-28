
let rec sumList xs = match xs with | [] -> [] | x::xs' -> x + (sumList xs');;


(* fix

let rec sumList xs = match xs with | [] -> 0 | x::xs' -> x + (sumList xs');;

*)

(* changed spans
(2,43)-(2,45)
0
LitG

*)

(* changed exprs
Lit (Just (2,43)-(2,44)) (LI 0)
*)

(* typed spans
(2,43)-(2,44)
*)

(* correct types
int
*)

(* bad types
'a list
*)
