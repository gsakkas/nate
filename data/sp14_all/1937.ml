
let wwhile (f,b) =
  let rec helper (f,b) (x,y) =
    match y with | true  -> helper (f, x) (f b) | false  -> x in
  helper (f, b) (b, true);;

let fixpoint (f,b) = let y = ((f b), (b = (f b))) in wwhile (y, b);;


(* fix

let wwhile (f,b) =
  let rec helper (f,b) (x,y) =
    match y with | true  -> helper (f, x) (f b) | false  -> x in
  helper (f, b) (b, true);;

let fixpoint (f,b) = let y x = ((f b), (b = (f b))) in wwhile (y, b);;

*)

(* changed spans
(7,29)-(7,49)
fun x -> (f b , b = f b)
LamG (TupleG (fromList [EmptyG]))

*)

(* changed exprs
Lam (Just (7,27)-(7,51)) (VarPat (Just (7,27)-(7,28)) "x") (Tuple (Just (7,31)-(7,51)) [App (Just (7,32)-(7,37)) (Var (Just (7,33)-(7,34)) "f") [Var (Just (7,35)-(7,36)) "b"],Bop (Just (7,39)-(7,50)) Eq (Var (Just (7,40)-(7,41)) "b") (App (Just (7,44)-(7,49)) (Var (Just (7,45)-(7,46)) "f") [Var (Just (7,47)-(7,48)) "b"])]) Nothing
*)

(* typed spans
(7,27)-(7,51)
*)

(* correct types
'a -> ('a * bool)
*)

(* bad types
('a * bool)
*)
