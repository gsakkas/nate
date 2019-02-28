
let wwhile (f,b) =
  let rec helper (f,b) (x,y) =
    match y with | true  -> helper (f, x) (f b) | false  -> x in
  helper (f, b) (b, true);;

let fixpoint (f,b) = let g b = b in wwhile (g, b);;


(* fix

let wwhile (f,b) =
  let rec helper (f,b) (x,y) =
    match y with | true  -> helper (f, x) (f b) | false  -> x in
  helper (f, b) (b, true);;

let fixpoint (f,b) = let g b = (b, (f b)) in wwhile (g, b);;

*)

(* changed spans
(7,31)-(7,32)
(b , f b)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

(7,36)-(7,42)
wwhile (g , b)
AppG (fromList [TupleG (fromList [EmptyG])])

*)

(* changed exprs
Tuple (Just (7,31)-(7,41)) [Var (Just (7,32)-(7,33)) "b",App (Just (7,35)-(7,40)) (Var (Just (7,36)-(7,37)) "f") [Var (Just (7,38)-(7,39)) "b"]]
App (Just (7,45)-(7,58)) (Var (Just (7,45)-(7,51)) "wwhile") [Tuple (Just (7,52)-(7,58)) [Var (Just (7,53)-(7,54)) "g",Var (Just (7,56)-(7,57)) "b"]]
*)

(* typed spans
(7,31)-(7,41)
(7,45)-(7,58)
*)

(* correct types
('a * bool)
'a
*)

(* bad types
'a
('a -> ('a * bool) * 'a) -> 'a
*)
