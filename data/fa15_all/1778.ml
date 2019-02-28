
let rec wwhile (f,b) =
  let (b',c') = f b in if c' = true then wwhile f b' else b';;


(* fix

let rec wwhile (f,b) =
  let (b',c') = f b in if c' = true then wwhile (f, b') else b';;

*)

(* changed spans
(3,41)-(3,52)
wwhile (f , b')
AppG (fromList [TupleG (fromList [EmptyG])])

*)

(* changed exprs
App (Just (3,41)-(3,55)) (Var (Just (3,41)-(3,47)) "wwhile") [Tuple (Just (3,48)-(3,55)) [Var (Just (3,49)-(3,50)) "f",Var (Just (3,52)-(3,54)) "b'"]]
*)

(* typed spans
(3,41)-(3,55)
*)

(* correct types
'a
*)

(* bad types
'a
*)
