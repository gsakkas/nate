
let rec wwhile (f,b) =
  let (b',c') = f b in if c' = false then wwhile f b' else b';;


(* fix

let rec wwhile (f,b) =
  let (b',c') = f b in if c' = true then wwhile (f, b') else b';;

*)

(* changed spans
(3,42)-(3,53)
true
LitG

(3,42)-(3,48)
wwhile (f , b')
AppG (fromList [TupleG (fromList [EmptyG])])

(3,49)-(3,50)
(f , b')
TupleG (fromList [VarG])

*)

(* changed exprs
Lit (Just (3,31)-(3,35)) (LB True)
App (Just (3,41)-(3,55)) (Var (Just (3,41)-(3,47)) "wwhile") [Tuple (Just (3,48)-(3,55)) [Var (Just (3,49)-(3,50)) "f",Var (Just (3,52)-(3,54)) "b'"]]
Tuple (Just (3,48)-(3,55)) [Var (Just (3,49)-(3,50)) "f",Var (Just (3,52)-(3,54)) "b'"]
*)

(* typed spans
(3,31)-(3,35)
(3,41)-(3,55)
(3,48)-(3,55)
*)

(* correct types
bool
'a
('a -> ('a * bool) * 'a)
*)

(* bad types
'a
('a -> ('b * bool)) -> 'b -> 'b
'a -> ('b * bool)
*)
