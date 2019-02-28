
let rec wwhile (f,b) =
  let func = f b in
  let (value,boo) = func in if boo then wwhile (f, value) else value;;

let fixpoint (f,b) =
  wwhile ((let d x = let xx = f x in (xx, (xx = b)) in d b), b);;


(* fix

let rec wwhile (f,b) =
  let func = f b in
  let (value,boo) = func in if boo then wwhile (f, value) else value;;

let fixpoint (f,b) =
  wwhile ((let d x = let xx = f x in (xx, (xx = b)) in d), b);;

*)

(* changed spans
(7,55)-(7,58)
d
VarG

(7,55)-(7,58)
b
VarG

*)

(* changed exprs
Var (Just (7,55)-(7,56)) "d"
Var (Just (7,59)-(7,60)) "b"
*)

(* typed spans
(7,55)-(7,56)
(7,59)-(7,60)
*)

(* correct types
'a -> ('a * bool)
'a
*)

(* bad types
('a * bool)
('a * bool)
*)
