
let rec wwhile (f,b) =
  let (b',c') = f b in if not c' then b' else wwhile f b';;


(* fix

let rec wwhile (f,b) =
  let (b',c') = f b in if not c' then b' else wwhile (f, b');;

*)

(* changed spans
(3,46)-(3,57)
wwhile (f , b')
AppG (fromList [TupleG (fromList [EmptyG])])

*)

(* changed exprs
App (Just (3,46)-(3,60)) (Var (Just (3,46)-(3,52)) "wwhile") [Tuple (Just (3,53)-(3,60)) [Var (Just (3,54)-(3,55)) "f",Var (Just (3,57)-(3,59)) "b'"]]
*)

(* typed spans
(3,46)-(3,60)
*)

(* correct types
'a
*)

(* bad types
'a
*)
