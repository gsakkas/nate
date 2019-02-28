
let rec wwhile (f,b) =
  match f b with | (h1,h2) -> if h2 then wwhile (f, h1) else h1;;

let fixpoint (f,b) =
  wwhile ((let f' x = let b' = f b in (b', (b' = b)) in f' 1), b);;


(* fix

let rec wwhile (f,b) =
  match f b with | (h1,h2) -> if h2 then wwhile (f, h1) else h1;;

let fixpoint (f,b) =
  wwhile ((let f' x = let b' = f b in (b', (b' = b)) in f'), b);;

*)

(* changed spans
(6,56)-(6,60)
f'
VarG

*)

(* changed exprs
Var (Just (6,56)-(6,58)) "f'"
*)

(* typed spans
(6,56)-(6,58)
*)

(* correct types
'a -> ('a * bool)
*)

(* bad types
('a * bool)
*)
