
let stringOfList f l = "[" ^ ((List.map f l) ^ "]");;


(* fix

let stringOfList f l = "[" ^ ((List.fold_left (^) "" (List.map f l)) ^ "]");;

*)

(* changed spans
(2,30)-(2,44)
List.fold_left (^) ""
               (List.map f l)
AppG (fromList [VarG,AppG (fromList [EmptyG]),LitG])

*)

(* changed exprs
App (Just (2,30)-(2,68)) (Var (Just (2,31)-(2,45)) "List.fold_left") [Var (Just (2,46)-(2,49)) "^",Lit (Just (2,50)-(2,52)) (LS ""),App (Just (2,53)-(2,67)) (Var (Just (2,54)-(2,62)) "List.map") [Var (Just (2,63)-(2,64)) "f",Var (Just (2,65)-(2,66)) "l"]]
*)

(* typed spans
(2,30)-(2,68)
*)

(* correct types
string
*)

(* bad types
'a list
*)
