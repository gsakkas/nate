
let rec wwhile (f,b) =
  let (b',c') = f b in if c' = true then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile ((fun x  -> if b f b then b else f b), b);;


(* fix

let rec wwhile (f,b) =
  let (b',c') = f b in if c' = true then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile ((fun x  -> ((f b), ((f b) = b))), b);;

*)

(* changed spans
(5,40)-(5,64)
(f b , f b = b)
TupleG (fromList [AppG (fromList [EmptyG]),BopG EmptyG EmptyG])

*)

(* changed exprs
Tuple (Just (5,40)-(5,60)) [App (Just (5,41)-(5,46)) (Var (Just (5,42)-(5,43)) "f") [Var (Just (5,44)-(5,45)) "b"],Bop (Just (5,48)-(5,59)) Eq (App (Just (5,49)-(5,54)) (Var (Just (5,50)-(5,51)) "f") [Var (Just (5,52)-(5,53)) "b"]) (Var (Just (5,57)-(5,58)) "b")]
*)

(* typed spans
(5,40)-(5,60)
*)

(* correct types
('a * bool)
*)

(* bad types
('a * bool)
*)
