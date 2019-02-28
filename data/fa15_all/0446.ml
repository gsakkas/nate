
let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) =
  let gs x =
    let xx = f x in
    match xx with | xx when (xx - x) > 0 -> (x, b) | _ -> ((f x), b) in
  wwhile (gs, b);;


(* fix

let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) =
  let gs x = let xx = f x in (xx, (xx = x)) in wwhile (gs, b);;

*)

(* changed spans
(9,4)-(9,68)
f x
AppG (fromList [VarG])

(9,4)-(9,68)
xx
VarG

(9,34)-(9,35)
xx = x
BopG VarG VarG

*)

(* changed exprs
App (Just (7,22)-(7,25)) (Var (Just (7,22)-(7,23)) "f") [Var (Just (7,24)-(7,25)) "x"]
Var (Just (7,30)-(7,32)) "xx"
Bop (Just (7,34)-(7,42)) Eq (Var (Just (7,35)-(7,37)) "xx") (Var (Just (7,40)-(7,41)) "x")
*)

(* typed spans
(7,22)-(7,25)
(7,30)-(7,32)
(7,34)-(7,42)
*)

(* correct types
'a
'a
bool
*)

(* bad types
(int * bool)
(int * bool)
int
*)
