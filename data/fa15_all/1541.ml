
let rec wwhile (f,b) =
  match f b with | (h1,h2) -> if h2 then wwhile (f, h1) else h1;;

let fixpoint (f,b) = wwhile ((let f' b = (f b) = b in f'), b);;


(* fix

let rec wwhile (f,b) =
  match f b with | (h1,h2) -> if h2 then wwhile (f, h1) else h1;;

let fixpoint (f,b) =
  wwhile
    ((let f' b = if (f b) = b then (b, true) else ((f b), false) in f'), b);;

*)

(* changed spans
(5,41)-(5,50)
if f b = b
then (b , true)
else (f b , false)
IteG (BopG EmptyG EmptyG) (TupleG (fromList [EmptyG])) (TupleG (fromList [EmptyG]))

*)

(* changed exprs
Ite (Just (7,17)-(7,64)) (Bop (Just (7,20)-(7,29)) Eq (App (Just (7,20)-(7,25)) (Var (Just (7,21)-(7,22)) "f") [Var (Just (7,23)-(7,24)) "b"]) (Var (Just (7,28)-(7,29)) "b")) (Tuple (Just (7,35)-(7,44)) [Var (Just (7,36)-(7,37)) "b",Lit (Just (7,39)-(7,43)) (LB True)]) (Tuple (Just (7,50)-(7,64)) [App (Just (7,51)-(7,56)) (Var (Just (7,52)-(7,53)) "f") [Var (Just (7,54)-(7,55)) "b"],Lit (Just (7,58)-(7,63)) (LB False)])
*)

(* typed spans
(7,17)-(7,64)
*)

(* correct types
('a * bool)
*)

(* bad types
bool
*)
