
let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) :: h;;


(* fix

let rec listReverse l =
  match l with | [] -> [] | h::t -> h :: (listReverse l);;

*)

(* changed spans
(3,36)-(3,51)
h
VarG

(3,55)-(3,56)
l
VarG

*)

(* changed exprs
Var (Just (3,36)-(3,37)) "h"
Var (Just (3,54)-(3,55)) "l"
*)

(* typed spans
(3,36)-(3,37)
(3,54)-(3,55)
*)

(* correct types
'a
'a list
*)

(* bad types
'a
'a list
*)
