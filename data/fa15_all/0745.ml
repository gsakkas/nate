
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  let f' b = let b' = f b in (b', (b == b')) in wwhile ((f' b), b);;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  let f' b = let b' = f b in (b', (b == b')) in wwhile (f', b);;

*)

(* changed spans
(5,56)-(5,62)
f'
VarG

(5,56)-(5,62)
b
VarG

*)

(* changed exprs
Var (Just (5,56)-(5,58)) "f'"
Var (Just (5,60)-(5,61)) "b"
*)

(* typed spans
(5,56)-(5,58)
(5,60)-(5,61)
*)

(* correct types
'a -> ('a * bool)
'a
*)

(* bad types
('a * bool)
('a * bool)
*)
