
let rec wwhile (f,b) = if snd f b then wwhile f fst f b else fst f b;;


(* fix

let rec wwhile (f,b) =
  if snd (f b) then wwhile (f, (fst (f b))) else fst (f b);;

*)

(* changed spans
(2,26)-(2,33)
snd (f b)
AppG (fromList [AppG (fromList [EmptyG])])

(2,39)-(2,55)
wwhile (f , fst (f b))
AppG (fromList [TupleG (fromList [EmptyG])])

(2,61)-(2,68)
fst (f b)
AppG (fromList [AppG (fromList [EmptyG])])

*)

(* changed exprs
App (Just (3,5)-(3,14)) (Var (Just (3,5)-(3,8)) "snd") [App (Just (3,9)-(3,14)) (Var (Just (3,10)-(3,11)) "f") [Var (Just (3,12)-(3,13)) "b"]]
App (Just (3,20)-(3,43)) (Var (Just (3,20)-(3,26)) "wwhile") [Tuple (Just (3,27)-(3,43)) [Var (Just (3,28)-(3,29)) "f",App (Just (3,31)-(3,42)) (Var (Just (3,32)-(3,35)) "fst") [App (Just (3,36)-(3,41)) (Var (Just (3,37)-(3,38)) "f") [Var (Just (3,39)-(3,40)) "b"]]]]
App (Just (3,49)-(3,58)) (Var (Just (3,49)-(3,52)) "fst") [App (Just (3,53)-(3,58)) (Var (Just (3,54)-(3,55)) "f") [Var (Just (3,56)-(3,57)) "b"]]
*)

(* typed spans
(3,5)-(3,14)
(3,20)-(3,43)
(3,49)-(3,58)
*)

(* correct types
bool
'a
'a
*)

(* bad types
bool
'a
'a
*)
