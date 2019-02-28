
let rec listReverse l =
  match l with | [] -> [] | h::t -> h :: (listReverse (listReverse h));;


(* fix

let rec listReverse l =
  match l with | [] -> [] | h::t -> h :: (listReverse (listReverse l));;

*)

(* changed spans
(3,67)-(3,68)
l
VarG

*)

(* changed exprs
Var (Just (3,67)-(3,68)) "l"
*)

(* typed spans
(3,67)-(3,68)
*)

(* correct types
'a list
*)

(* bad types
'a
*)
