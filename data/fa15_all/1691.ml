
let rec sumList xs =
  match xs with | [] -> [] | h::t -> let h::t = xs in h + (sumList t);;


(* fix

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

*)

(* changed spans
(3,37)-(3,69)
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
int
*)
