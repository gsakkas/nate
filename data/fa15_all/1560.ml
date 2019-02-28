
let rec wwhile (f,b) =
  match b with | (h1,h2) -> if h2 then wwhile (f, h1) else h1;;


(* fix

let rec wwhile (f,b) =
  match f b with | (h1,h2) -> if h2 then wwhile (f, h1) else h1;;

*)

(* changed spans
(3,8)-(3,9)
f b
AppG (fromList [VarG])

*)

(* changed exprs
App (Just (3,8)-(3,11)) (Var (Just (3,8)-(3,9)) "f") [Var (Just (3,10)-(3,11)) "b"]
*)

(* typed spans
(3,8)-(3,11)
*)

(* correct types
('a * bool)
*)

(* bad types
('a * bool)
*)
