
let rec wwhile (f,b) =
  match f b with | (num,b00l) -> if not b00l then num else wwhile (f, num);;

let fixpoint (f,b) = wwhile ((fun x  -> let y = (f, x) in (y, (y != b))), b);;


(* fix

let rec wwhile (f,b) =
  match f b with | (num,b00l) -> if not b00l then num else wwhile (f, num);;

let fixpoint (f,b) = wwhile ((fun x  -> let y = f x in (y, (y != x))), b);;

*)

(* changed spans
(5,48)-(5,54)
f x
AppG (fromList [VarG])

(5,68)-(5,69)
x
VarG

*)

(* changed exprs
App (Just (5,48)-(5,51)) (Var (Just (5,48)-(5,49)) "f") [Var (Just (5,50)-(5,51)) "x"]
Var (Just (5,65)-(5,66)) "x"
*)

(* typed spans
(5,48)-(5,51)
(5,65)-(5,66)
*)

(* correct types
'a
'a
*)

(* bad types
('a * 'b)
('a * 'b)
*)
