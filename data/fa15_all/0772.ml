
let rec clone x n =
  if n <= 0 then [] else if n = 1 then [x] else x :: ((clone x n) - 1);;


(* fix

let rec clone x n =
  if n <= 0 then [] else if n = 1 then [x] else [x] @ (clone x (n - 1));;

*)

(* changed spans
(3,48)-(3,70)
[x] @ clone x (n - 1)
AppG (fromList [AppG (fromList [EmptyG]),ListG EmptyG])

*)

(* changed exprs
App (Just (3,48)-(3,71)) (Var (Just (3,52)-(3,53)) "@") [List (Just (3,48)-(3,51)) [Var (Just (3,49)-(3,50)) "x"] Nothing,App (Just (3,54)-(3,71)) (Var (Just (3,55)-(3,60)) "clone") [Var (Just (3,61)-(3,62)) "x",Bop (Just (3,63)-(3,70)) Minus (Var (Just (3,64)-(3,65)) "n") (Lit (Just (3,68)-(3,69)) (LI 1))]]
*)

(* typed spans
(3,48)-(3,71)
*)

(* correct types
'a list
*)

(* bad types
'a list
*)
