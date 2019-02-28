
let rec wwhile (f,b) =
  let (b',c') = f b in if c' = true then wwhile f b' else b';;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

*)

(* changed spans
(3,26)-(3,35)
c'
VarG

(3,41)-(3,52)
wwhile (f , b')
AppG (fromList [TupleG (fromList [EmptyG])])

*)

(* changed exprs
Var (Just (2,47)-(2,49)) "c'"
App (Just (2,55)-(2,69)) (Var (Just (2,55)-(2,61)) "wwhile") [Tuple (Just (2,62)-(2,69)) [Var (Just (2,63)-(2,64)) "f",Var (Just (2,66)-(2,68)) "b'"]]
*)

(* typed spans
(2,47)-(2,49)
(2,55)-(2,69)
*)

(* correct types
bool
'a
*)

(* bad types
bool
'a
*)
