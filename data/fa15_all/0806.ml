
let rec listReverse l =
  match l with | [] -> [] | h::t -> let r = listReverse t in r :: h;;


(* fix

let rec listReverse l =
  match l with | [] -> [] | h::t -> let r = listReverse t in r @ [h];;

*)

(* changed spans
(3,61)-(3,67)
r @ [h]
AppG (fromList [VarG,ListG EmptyG])

*)

(* changed exprs
App (Just (3,61)-(3,68)) (Var (Just (3,63)-(3,64)) "@") [Var (Just (3,61)-(3,62)) "r",List (Just (3,65)-(3,68)) [Var (Just (3,66)-(3,67)) "h"] Nothing]
*)

(* typed spans
(3,61)-(3,68)
*)

(* correct types
'a list
*)

(* bad types
'a list
*)
