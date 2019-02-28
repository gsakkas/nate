
let rec wwhile (f,b) =
  let (b',c') = f b in if c' = false then b' else wwhile (f, b');;

let fixpoint (f,b) =
  let f x = let xx = f b in (xx, (xx <> b)) in wwhile ((f b), b);;


(* fix

let rec wwhile (f,b) =
  let (b',c') = f b in if c' = false then b' else wwhile (f, b');;

let fixpoint (f,b) =
  let f x = let xx = f b in (xx, (xx <> b)) in wwhile (f, b);;

*)

(* changed spans
(6,55)-(6,60)
f
VarG

(6,55)-(6,60)
b
VarG

*)

(* changed exprs
Var (Just (6,55)-(6,56)) "f"
Var (Just (6,58)-(6,59)) "b"
*)

(* typed spans
(6,55)-(6,56)
(6,58)-(6,59)
*)

(* correct types
'a -> ('a * bool)
'a
*)

(* bad types
('a * bool)
('a * bool)
*)
