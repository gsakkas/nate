
let rec wwhile (f,b) =
  let (value,result) = f b in if not result then value else wwhile (f, value);;

let fixpoint (f,b) =
  wwhile ((let func output = ((f output), ((f output) = b)) in func b), b);;


(* fix

let rec wwhile (f,b) =
  let (value,result) = f b in if not result then value else wwhile (f, value);;

let fixpoint (f,b) =
  wwhile ((let func output = ((f output), ((f output) = b)) in func), b);;

*)

(* changed spans
(6,63)-(6,69)
func
VarG

(6,63)-(6,69)
b
VarG

*)

(* changed exprs
Var (Just (6,63)-(6,67)) "func"
Var (Just (6,70)-(6,71)) "b"
*)

(* typed spans
(6,63)-(6,67)
(6,70)-(6,71)
*)

(* correct types
'a -> ('a * bool)
'a
*)

(* bad types
('a * bool)
('a * bool)
*)
