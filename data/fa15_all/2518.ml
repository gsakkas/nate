
let rec wwhile (f,b) =
  let (value,result) = f b in if not result then value else wwhile (f, value);;

let fixpoint (f,b) =
  wwhile ((let func input = ((f input), ((f input) = b)) in func b), b);;


(* fix

let rec wwhile (f,b) =
  let (value,result) = f b in if not result then value else wwhile (f, value);;

let fixpoint (f,b) =
  wwhile ((let func input = ((f input), ((f input) = b)) in func), b);;

*)

(* changed spans
(6,60)-(6,66)
func
VarG

(6,60)-(6,66)
b
VarG

*)

(* changed exprs
Var (Just (6,60)-(6,64)) "func"
Var (Just (6,67)-(6,68)) "b"
*)

(* typed spans
(6,60)-(6,64)
(6,67)-(6,68)
*)

(* correct types
'a -> ('a * bool)
'a
*)

(* bad types
('a * bool)
('a * bool)
*)
