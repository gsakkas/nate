
let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) =
  let gs x =
    let xx = f x in match xx with | xx when (xx - x) > 0 -> x | _ -> f x in
  wwhile (gs, b);;


(* fix

let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) =
  let gs x = let xx = f x in (xx, (xx = x)) in wwhile (gs, b);;

*)

(* changed spans
(8,20)-(8,72)
(xx , xx = x)
TupleG (fromList [VarG,BopG EmptyG EmptyG])

*)

(* changed exprs
Tuple (Just (7,29)-(7,43)) [Var (Just (7,30)-(7,32)) "xx",Bop (Just (7,34)-(7,42)) Eq (Var (Just (7,35)-(7,37)) "xx") (Var (Just (7,40)-(7,41)) "x")]
*)

(* typed spans
(7,29)-(7,43)
*)

(* correct types
('a * bool)
*)

(* bad types
int
*)
