
let rec wwhile (f,b) =
  match f b with | (h1,h2) -> if h2 then wwhile (f, h1) else h1;;

let fixpoint (f,b) =
  wwhile ((let f' b = let b' = f b in (b', (b' = b)) in f' b), b);;


(* fix

let rec wwhile (f,b) =
  match f b with | (h1,h2) -> if h2 then wwhile (f, h1) else h1;;

let fixpoint (f,b) =
  wwhile ((let f' b = let b' = f b in (b', (b' = b)) in f'), b);;

*)

(* changed spans
(6,56)-(6,60)
f'
VarG

(6,56)-(6,60)
b
VarG

*)

(* changed exprs
Var (Just (6,56)-(6,58)) "f'"
Var (Just (6,61)-(6,62)) "b"
*)

(* typed spans
(6,56)-(6,58)
(6,61)-(6,62)
*)

(* correct types
'a -> ('a * bool)
'a
*)

(* bad types
('a * bool)
('a * bool)
*)
