
let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) :: l;;


(* fix

let rec listReverse l =
  match l with | [] -> [] | h::t -> h :: (listReverse t);;

*)

(* changed spans
(3,36)-(3,51)
h
VarG

*)

(* changed exprs
Var (Just (3,36)-(3,37)) "h"
*)

(* typed spans
(3,36)-(3,37)
*)

(* correct types
'a
*)

(* bad types
'a
*)
