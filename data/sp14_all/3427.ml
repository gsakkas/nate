
let rec listReverse l =
  match l with | [] -> [] | x::l -> (listReverse l) :: x;;


(* fix

let rec listReverse l =
  match l with | [] -> [] | x::l -> x :: (listReverse l);;

*)

(* changed spans
(3,36)-(3,51)
x
VarG

*)

(* changed exprs
Var (Just (3,36)-(3,37)) "x"
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
