
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  wwhile (let g x = let calcfx = f x in (calcfx, (calcfx = x)) in ((g b), b));;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  wwhile (let g x = let calcfx = f x in (calcfx, (calcfx = x)) in (g, b));;

*)

(* changed spans
(5,67)-(5,72)
g
VarG

(5,67)-(5,72)
b
VarG

*)

(* changed exprs
Var (Just (5,67)-(5,68)) "g"
Var (Just (5,70)-(5,71)) "b"
*)

(* typed spans
(5,67)-(5,68)
(5,70)-(5,71)
*)

(* correct types
'a -> ('a * bool)
'a
*)

(* bad types
('a * bool)
('a * bool)
*)
