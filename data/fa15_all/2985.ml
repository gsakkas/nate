
let stringOfList f l =
  let fx a b = match b with | [] -> "" | h::t -> List.append a b in
  let base = "" in List.fold_left fx base l;;


(* fix

let stringOfList f l =
  let fx a b = a ^ b in let base = "" in List.fold_left fx base l;;

*)

(* changed spans
(3,15)-(3,64)
a ^ b
AppG (fromList [VarG])

*)

(* changed exprs
App (Just (3,15)-(3,20)) (Var (Just (3,17)-(3,18)) "^") [Var (Just (3,15)-(3,16)) "a",Var (Just (3,19)-(3,20)) "b"]
*)

(* typed spans
(3,15)-(3,20)
*)

(* correct types
string
*)

(* bad types
string
*)
