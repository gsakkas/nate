
let rec wwhile (f,b) =
  let (i,c) = f b in if c = true then wwhile (f, i) else i;;

let fixpoint (f,b) =
  let g x = let xx = f x in (xx, (xx = x)) in g wwhile (g, b);;


(* fix

let rec wwhile (f,b) =
  let (i,c) = f b in if c = true then wwhile (f, i) else i;;

let fixpoint (f,b) =
  let g x = let xx = f x in (xx, (xx = x)) in wwhile (g, b);;

*)

(* changed spans
(6,46)-(6,61)
wwhile (g , b)
AppG (fromList [TupleG (fromList [EmptyG])])

*)

(* changed exprs
App (Just (6,46)-(6,59)) (Var (Just (6,46)-(6,52)) "wwhile") [Tuple (Just (6,53)-(6,59)) [Var (Just (6,54)-(6,55)) "g",Var (Just (6,57)-(6,58)) "b"]]
*)

(* typed spans
(6,46)-(6,59)
*)

(* correct types
'a
*)

(* bad types
'a
*)
