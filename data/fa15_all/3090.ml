
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile ((let f' x = (f, ((f x) = x)) in f'), b);;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile ((let f' x = ((f x), ((f x) = x)) in f'), b);;

*)

(* changed spans
(4,42)-(4,43)
f x
AppG (fromList [VarG])

*)

(* changed exprs
App (Just (4,42)-(4,47)) (Var (Just (4,43)-(4,44)) "f") [Var (Just (4,45)-(4,46)) "x"]
*)

(* typed spans
(4,42)-(4,47)
*)

(* correct types
'a
*)

(* bad types
'a -> 'a
*)
