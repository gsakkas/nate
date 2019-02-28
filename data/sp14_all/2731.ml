
let rec clone x n =
  if n < 0
  then []
  else (match n with | 0 -> [] | _ -> (clone (x (n - 1))) @ [x]);;


(* fix

let rec clone x n =
  if n < 0
  then []
  else (match n with | 0 -> [] | _ -> (clone x (n - 1)) @ [x]);;

*)

(* changed spans
(5,38)-(5,57)
clone x (n - 1)
AppG (fromList [VarG,BopG EmptyG EmptyG])

*)

(* changed exprs
App (Just (5,38)-(5,55)) (Var (Just (5,39)-(5,44)) "clone") [Var (Just (5,45)-(5,46)) "x",Bop (Just (5,47)-(5,54)) Minus (Var (Just (5,48)-(5,49)) "n") (Lit (Just (5,52)-(5,53)) (LI 1))]
*)

(* typed spans
(5,38)-(5,55)
*)

(* correct types
'a list
*)

(* bad types
int -> 'a list
*)
