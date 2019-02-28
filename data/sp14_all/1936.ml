
let wwhile (f,b) =
  let rec helper (f,b) (x,y) =
    match y with | true  -> helper (f, x) (f b) | false  -> x in
  helper (f, b) (b, true);;

let fixpoint (f,b) = let g x = (f, (b = (f b))) in wwhile (g, (f b));;


(* fix

let wwhile (f,b) =
  let rec helper (f,b) (x,y) =
    match y with | true  -> helper (f, x) (f b) | false  -> x in
  helper (f, b) (b, true);;

let fixpoint (f,b) = let g x = ((f b), (b = (f b))) in wwhile (g, b);;

*)

(* changed spans
(7,32)-(7,33)
f b
AppG (fromList [VarG])

(7,62)-(7,67)
b
VarG

*)

(* changed exprs
App (Just (7,32)-(7,37)) (Var (Just (7,33)-(7,34)) "f") [Var (Just (7,35)-(7,36)) "b"]
Var (Just (7,66)-(7,67)) "b"
*)

(* typed spans
(7,32)-(7,37)
(7,66)-(7,67)
*)

(* correct types
'a
'a
*)

(* bad types
'a -> 'a
'a
*)
