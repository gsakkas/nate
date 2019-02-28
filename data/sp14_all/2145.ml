
let rec wwhile (f,b) =
  match f b with | (a,b) -> if not b then a else wwhile (f, a);;

let fixpoint (f,b) = wwhile (b, b);;


(* fix

let fixpoint (f,b) = b;;

*)

(* changed spans
(3,2)-(3,62)
b
VarG

*)

(* changed exprs
Var (Just (2,21)-(2,22)) "b"
*)

(* typed spans
(2,21)-(2,22)
*)

(* correct types
'a
*)

(* bad types
'a
*)
