
let rec wwhile (f,b) =
  let (value,result) = f b in if not result then value else wwhile (f, value);;

let fixpoint (f,b) =
  wwhile ((let func output = ((f b), ((f b) = b)) in func b), b);;


(* fix

let rec wwhile (f,b) =
  let (value,result) = f b in if not result then value else wwhile (f, value);;

let fixpoint (f,b) =
  wwhile ((let func output = ((f b), ((f b) = b)) in func), b);;

*)

(* changed spans
(6,53)-(6,59)
func
VarG

(6,53)-(6,59)
b
VarG

*)

(* changed exprs
Var (Just (6,53)-(6,57)) "func"
Var (Just (6,60)-(6,61)) "b"
*)

(* typed spans
(6,53)-(6,57)
(6,60)-(6,61)
*)

(* correct types
'a -> ('a * bool)
'a
*)

(* bad types
('a * bool)
('a * bool)
*)
