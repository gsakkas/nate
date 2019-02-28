
let rec listReverse l =
  match l with
  | [] -> []
  | head::[] -> [head]
  | head::tail -> (listReverse [tail]) @ [head];;


(* fix

let rec listReverse l =
  match l with
  | [] -> []
  | head::[] -> [head]
  | head::tail -> (listReverse tail) @ [head];;

*)

(* changed spans
(6,31)-(6,37)
tail
VarG

*)

(* changed exprs
Var (Just (6,31)-(6,35)) "tail"
*)

(* typed spans
(6,31)-(6,35)
*)

(* correct types
'a list
*)

(* bad types
'a list list
*)
