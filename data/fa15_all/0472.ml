
let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) =
  let gs x =
    let isFPoint s = (f s) = s in
    let rec go r = if isFPoint r then r else go (f r) in
    ((go x), (isFPoint x)) in
  wwhile ((gs b), b);;


(* fix

let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) =
  let gs x =
    let isFPoint s = (f s) = s in
    let rec go r = if isFPoint r then r else go (f r) in
    ((go x), (isFPoint x)) in
  wwhile (gs, b);;

*)

(* changed spans
(11,10)-(11,16)
wwhile (gs , b)
AppG (fromList [TupleG (fromList [EmptyG])])

(11,18)-(11,19)
EMPTY
EmptyG

*)

(* changed exprs
App (Just (11,2)-(11,16)) (Var (Just (11,2)-(11,8)) "wwhile") [Tuple (Just (11,9)-(11,16)) [Var (Just (11,10)-(11,12)) "gs",Var (Just (11,14)-(11,15)) "b"]]
Var (Just (11,18)-(11,19)) "EMPTY"
*)

(* typed spans
(11,2)-(11,16)
*)

(* correct types
'a
*)

(* bad types
('a * bool)
*)
