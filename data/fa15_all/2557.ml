
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let sizDif = (List.length l1) - (List.length l2) in
  if sizDif > 0
  then let pad = clone 0 sizDif in l1 ^ ("],[" ^ (pad @ l2))
  else (let pad = clone 0 (- sizDif) in (pad @ l1) ^ ("],[" ^ l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let sizDif = (List.length l1) - (List.length l2) in
  if sizDif > 0
  then let pad = clone 0 sizDif in (l1, (pad @ l2))
  else (let pad = clone 0 (- sizDif) in ((pad @ l1), l2));;

*)

(* changed spans
(7,35)-(7,60)
(l1 , pad @ l2)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

(8,40)-(8,65)
(pad @ l1 , l2)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

*)

(* changed exprs
Tuple (Just (7,35)-(7,51)) [Var (Just (7,36)-(7,38)) "l1",App (Just (7,40)-(7,50)) (Var (Just (7,45)-(7,46)) "@") [Var (Just (7,41)-(7,44)) "pad",Var (Just (7,47)-(7,49)) "l2"]]
Tuple (Just (8,40)-(8,56)) [App (Just (8,41)-(8,51)) (Var (Just (8,46)-(8,47)) "@") [Var (Just (8,42)-(8,45)) "pad",Var (Just (8,48)-(8,50)) "l1"],Var (Just (8,53)-(8,55)) "l2"]
*)

(* typed spans
(7,35)-(7,51)
(8,40)-(8,56)
*)

(* correct types
(int list * int list)
(int list * int list)
*)

(* bad types
'a
'a
*)
