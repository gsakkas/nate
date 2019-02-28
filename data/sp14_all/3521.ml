
let rec wwhile (f,b) =
  match f b with
  | (b',c') -> (match c' with | true  -> wwhile (f, b') | false  -> b');;

let fixpoint (f,b) =
  wwhile (let func x x = ((f b), ((f b) = b)) in (func, b));;


(* fix

let rec wwhile (f,b) =
  match f b with
  | (b',c') -> (match c' with | true  -> wwhile (f, b') | false  -> b');;

let fixpoint (f,b) = wwhile (let func x = ((f x), ((f x) = x)) in (func, b));;

*)

(* changed spans
(7,21)-(7,45)
(f x , f x = x)
TupleG (fromList [AppG (fromList [EmptyG]),BopG EmptyG EmptyG])

*)

(* changed exprs
Tuple (Just (6,42)-(6,62)) [App (Just (6,43)-(6,48)) (Var (Just (6,44)-(6,45)) "f") [Var (Just (6,46)-(6,47)) "x"],Bop (Just (6,50)-(6,61)) Eq (App (Just (6,51)-(6,56)) (Var (Just (6,52)-(6,53)) "f") [Var (Just (6,54)-(6,55)) "x"]) (Var (Just (6,59)-(6,60)) "x")]
*)

(* typed spans
(6,42)-(6,62)
*)

(* correct types
('a * bool)
*)

(* bad types
'a -> ('b * bool)
*)
