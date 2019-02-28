
let stringOfList f l =
  let fx a b = match b with | [] -> "" | h::t -> List.append a (f b) in
  let base = [""] in List.fold_left fx base l;;


(* fix

let stringOfList f l =
  let fx a b = a ^ b in let base = "" in List.fold_left fx base l;;

*)

(* changed spans
(3,15)-(3,68)
a ^ b
AppG (fromList [VarG])

(4,13)-(4,17)
""
LitG

*)

(* changed exprs
App (Just (3,15)-(3,20)) (Var (Just (3,17)-(3,18)) "^") [Var (Just (3,15)-(3,16)) "a",Var (Just (3,19)-(3,20)) "b"]
Lit (Just (3,35)-(3,37)) (LS "")
*)

(* typed spans
(3,15)-(3,20)
(3,35)-(3,37)
*)

(* correct types
string
string
*)

(* bad types
string
string list
*)
