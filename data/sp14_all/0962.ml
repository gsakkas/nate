
let rec sumList xs = match xs with | [] -> [] | hd::tl -> hd + (sumList tl);;


(* fix

let rec sumList xs = match xs with | [] -> 0 | hd::tl -> hd + (sumList tl);;

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
