
let rec wwhile (f,b) =
  let func = f b in
  let (value,boo) = func in if boo then wwhile (f, value) else value;;

let fixpoint (f,b) =
  wwhile ((let g x = let d = f x in (d, (x = d)) in g b), b);;


(* fix

let rec wwhile (f,b) =
  let func = f b in
  let (value,boo) = func in if boo then wwhile (f, value) else value;;

let fixpoint (f,b) = wwhile ((let g x = let d = f x in (d, (x = d)) in g), b);;

*)

(* changed spans
(7,52)-(7,55)
g
VarG

(7,52)-(7,55)
b
VarG

*)

(* changed exprs
Var (Just (6,71)-(6,72)) "g"
Var (Just (6,75)-(6,76)) "b"
*)

(* typed spans
(6,71)-(6,72)
(6,75)-(6,76)
*)

(* correct types
'a -> ('a * bool)
'a
*)

(* bad types
('a * bool)
('a * bool)
*)
