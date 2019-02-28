
let rec clone x n = match n with | 0 -> [] | _ -> [clone x (n - 1); x];;


(* fix

let rec clone x n = match n with | 0 -> [] | _ -> (clone x (n - 1)) @ [x];;

*)

(* changed spans
(2,50)-(2,70)
clone x (n - 1) @ [x]
AppG (fromList [AppG (fromList [EmptyG]),ListG EmptyG])

*)

(* changed exprs
App (Just (2,50)-(2,73)) (Var (Just (2,68)-(2,69)) "@") [App (Just (2,50)-(2,67)) (Var (Just (2,51)-(2,56)) "clone") [Var (Just (2,57)-(2,58)) "x",Bop (Just (2,59)-(2,66)) Minus (Var (Just (2,60)-(2,61)) "n") (Lit (Just (2,64)-(2,65)) (LI 1))],List (Just (2,70)-(2,73)) [Var (Just (2,71)-(2,72)) "x"] Nothing]
*)

(* typed spans
(2,50)-(2,73)
*)

(* correct types
'a list
*)

(* bad types
'a list
*)
