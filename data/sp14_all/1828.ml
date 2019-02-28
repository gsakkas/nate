
let rec listReverse l = match l with | [] -> [] | h::t -> 0;;


(* fix

let rec listReverse l = match l with | [] -> [] | h::t -> [];;

*)

(* changed spans
(2,58)-(2,59)
[]
ListG EmptyG

*)

(* changed exprs
List (Just (2,58)-(2,60)) [] Nothing
*)

(* typed spans
(2,58)-(2,60)
*)

(* correct types
'a list
*)

(* bad types
int
*)
