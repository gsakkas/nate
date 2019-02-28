
let rec sumList xs =
  match xs with | [] -> [] | head::tail -> head + (sumList tail);;


(* fix

let rec sumList xs =
  match xs with | [] -> 0 | head::tail -> head + (sumList tail);;

*)

(* changed spans
(3,24)-(3,26)
0
LitG

*)

(* changed exprs
Lit (Just (3,24)-(3,25)) (LI 0)
*)

(* typed spans
(3,24)-(3,25)
*)

(* correct types
int
*)

(* bad types
'a list
*)
