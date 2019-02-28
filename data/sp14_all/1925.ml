
let wwhile (f,b) =
  let rec helper (f,b) (x,y) =
    match y with | true  -> helper (f, x) (f b) | false  -> x in
  helper (f, b) (b, true);;

let fixpoint (f,b) = wwhile ((let f b = b in b), b);;


(* fix

let wwhile (f,b) =
  let rec helper (f,b) (x,y) =
    match y with | true  -> helper (f, x) (f b) | false  -> x in
  helper (f, b) (b, true);;

let fixpoint (f,b) = let g b = (b, (f b)) in wwhile (g, b);;

*)

(* changed spans
(7,21)-(7,51)
let g = fun b -> (b , f b) in
wwhile (g , b)
LetG NonRec (fromList [LamG EmptyG]) (AppG (fromList [EmptyG]))

*)

(* changed exprs
Let (Just (7,21)-(7,58)) NonRec [(VarPat (Just (7,25)-(7,26)) "g",Lam (Just (7,27)-(7,41)) (VarPat (Just (7,27)-(7,28)) "b") (Tuple (Just (7,31)-(7,41)) [Var (Just (7,32)-(7,33)) "b",App (Just (7,35)-(7,40)) (Var (Just (7,36)-(7,37)) "f") [Var (Just (7,38)-(7,39)) "b"]]) Nothing)] (App (Just (7,45)-(7,58)) (Var (Just (7,45)-(7,51)) "wwhile") [Tuple (Just (7,52)-(7,58)) [Var (Just (7,53)-(7,54)) "g",Var (Just (7,56)-(7,57)) "b"]])
*)

(* typed spans
(7,21)-(7,58)
*)

(* correct types
'a
*)

(* bad types
'a
*)
