
let helper (f,b) = let f b = let x = f in (x, (x != b)) in f b;;

let rec wwhile (f,b) =
  let (x,y) = f b in match y with | false  -> x | true  -> wwhile (f, x);;

let fixpoint (f,b) = wwhile ((helper (f, b)), b);;


(* fix

let helper (f,b) = let f b = let x = f b in (x, (x != b)) in f;;

let rec wwhile (f,b) =
  let (x,y) = f b in match y with | false  -> x | true  -> wwhile (f, x);;

let fixpoint (f,b) = wwhile ((helper (f, b)), b);;

*)

(* changed spans
(2,37)-(2,38)
f b
AppG (fromList [VarG])

(2,59)-(2,62)
f
VarG

*)

(* changed exprs
App (Just (2,37)-(2,40)) (Var (Just (2,37)-(2,38)) "f") [Var (Just (2,39)-(2,40)) "b"]
Var (Just (2,61)-(2,62)) "f"
*)

(* typed spans
(2,37)-(2,40)
(2,61)-(2,62)
*)

(* correct types
'a
'a -> ('a * bool)
*)

(* bad types
'a
('a * bool)
*)
