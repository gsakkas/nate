
let pipe fs =
  let rec iter acc curr =
    match curr with | [] -> acc | h::tl -> iter (h curr) tl in
  iter (fun y  -> y) fs;;


(* fix

let id y = y;;

let pipe fs =
  let rec iter acc curr =
    match curr with | [] -> acc | h::tl -> iter (fun x  -> h (acc x)) tl in
  iter id fs;;

*)

(* changed spans
(2,9)-(5,23)
fun y -> y
LamG VarG

(4,48)-(4,56)
fun x -> h (acc x)
LamG (AppG (fromList [EmptyG]))

(4,51)-(4,55)
acc x
AppG (fromList [VarG])

(5,7)-(5,20)
id
VarG

*)

(* changed exprs
Lam (Just (2,7)-(2,12)) (VarPat (Just (2,7)-(2,8)) "y") (Var (Just (2,11)-(2,12)) "y") Nothing
Lam (Just (6,48)-(6,69)) (VarPat (Just (6,53)-(6,54)) "x") (App (Just (6,59)-(6,68)) (Var (Just (6,59)-(6,60)) "h") [App (Just (6,61)-(6,68)) (Var (Just (6,62)-(6,65)) "acc") [Var (Just (6,66)-(6,67)) "x"]]) Nothing
App (Just (6,61)-(6,68)) (Var (Just (6,62)-(6,65)) "acc") [Var (Just (6,66)-(6,67)) "x"]
Var (Just (7,7)-(7,9)) "id"
*)

(* typed spans
(2,7)-(2,12)
(6,48)-(6,69)
(6,61)-(6,68)
(7,7)-(7,9)
*)

(* correct types
'a -> 'a
'a -> 'a
'a
'a -> 'a
*)

(* bad types
'a list -> 'b -> 'b list -> 'b -> 'b
'a -> 'a
'a list
'a -> 'a
*)
