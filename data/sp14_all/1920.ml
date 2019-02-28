
let wwhile (f,b) =
  let rec helper (f,b) (x,y) =
    match y with | true  -> helper (f, x) (f b) | false  -> x in
  helper (f, b) (b, true);;

let fixpoint (f,b) = wwhile ((wwhile (f, b)), b);;


(* fix

let fixpoint (f,b) = f b;;

*)

(* changed spans
(3,2)-(5,25)
f b
AppG (fromList [VarG])

*)

(* changed exprs
App (Just (2,21)-(2,24)) (Var (Just (2,21)-(2,22)) "f") [Var (Just (2,23)-(2,24)) "b"]
*)

(* typed spans
(2,21)-(2,24)
*)

(* correct types
'a
*)

(* bad types
'a
*)
