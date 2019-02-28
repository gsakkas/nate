
let rec wwhile (f,b) =
  match f b with
  | (b',c') -> (match c' with | true  -> wwhile (f, b') | false  -> b');;

let fixpoint (f,b) = wwhile (let func x x = (0, true) in ((func f b), b));;


(* fix

let rec wwhile (f,b) =
  match f b with
  | (b',c') -> (match c' with | true  -> wwhile (f, b') | false  -> b');;

let fixpoint (f,b) = wwhile (let func x x = (0, true) in ((func b), b));;

*)

(* changed spans
(6,58)-(6,68)
func b
AppG (fromList [VarG])

*)

(* changed exprs
App (Just (6,58)-(6,66)) (Var (Just (6,59)-(6,63)) "func") [Var (Just (6,64)-(6,65)) "b"]
*)

(* typed spans
(6,58)-(6,66)
*)

(* correct types
int -> (int * bool)
*)

(* bad types
(int * bool)
*)
