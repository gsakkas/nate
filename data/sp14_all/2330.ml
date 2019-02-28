
let rec clone x n = let accum = [] in if n < 1 then [] else (clone x n) - 1;;


(* fix

let rec clone x n = let accum = [] in if n < 1 then [] else clone x n;;

*)

(* changed spans
(2,60)-(2,75)
clone x n
AppG (fromList [VarG])

*)

(* changed exprs
App (Just (2,60)-(2,69)) (Var (Just (2,60)-(2,65)) "clone") [Var (Just (2,66)-(2,67)) "x",Var (Just (2,68)-(2,69)) "n"]
*)

(* typed spans
(2,60)-(2,69)
*)

(* correct types
'a list
*)

(* bad types
int
*)
