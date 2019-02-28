
let wwhile (f,b) =
  let rec helper (f,b) (x,y) =
    match y with | true  -> helper (f, x) (f b) | false  -> x in
  helper (f, b) (b, true);;

let fixpoint (f,b) = let f x = (f, ((f b) = b)) in wwhile (f, b);;


(* fix

let wwhile (f,b) =
  let rec helper (f,b) (x,y) =
    match y with | true  -> helper (f, x) (f b) | false  -> x in
  helper (f, b) (b, true);;

let fixpoint (f,b) = let f x = ((f x), ((f b) = b)) in wwhile (f, b);;

*)

(* changed spans
(7,32)-(7,33)
f x
AppG (fromList [VarG])

*)

(* changed exprs
App (Just (7,32)-(7,37)) (Var (Just (7,33)-(7,34)) "f") [Var (Just (7,35)-(7,36)) "x"]
*)

(* typed spans
(7,32)-(7,37)
*)

(* correct types
'a
*)

(* bad types
'a -> 'a
*)
