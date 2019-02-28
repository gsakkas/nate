
let rec wwhile (f,b) =
  let (b',c) = f b in if not c then b' else wwhile (f, b');;

let fixpoint (f,b) =
  wwhile ((let f' b = ((f b), (((f b) not) = b)) in f'), b);;


(* fix

let rec wwhile (f,b) =
  let (b',c) = f b in if not c then b' else wwhile (f, b');;

let fixpoint (f,b) = wwhile ((let f' b = ((f b), ((f b) != b)) in f'), b);;

*)

(* changed spans
(6,30)-(6,47)
f b <> b
BopG (AppG (fromList [EmptyG])) VarG

*)

(* changed exprs
Bop (Just (5,49)-(5,61)) Neq (App (Just (5,50)-(5,55)) (Var (Just (5,51)-(5,52)) "f") [Var (Just (5,53)-(5,54)) "b"]) (Var (Just (5,59)-(5,60)) "b")
*)

(* typed spans
(5,49)-(5,61)
*)

(* correct types
bool
*)

(* bad types
bool
*)
