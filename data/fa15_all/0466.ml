
let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) =
  let gs x =
    let isFPoint s = ((f s) - s) < 0 in
    let iterate (t,y) = t y in
    let rec go r = if isFPoint r then r else go (iterate (x, r)) in x in
  wwhile (gs, b);;


(* fix

let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) =
  let gs x = let isFPoint s = ((f s) - s) < 0 in ((f x), (isFPoint x)) in
  wwhile (gs, b);;

*)

(* changed spans
(9,4)-(10,69)
(f x , isFPoint x)
TupleG (fromList [AppG (fromList [EmptyG])])

*)

(* changed exprs
Tuple (Just (7,49)-(7,70)) [App (Just (7,50)-(7,55)) (Var (Just (7,51)-(7,52)) "f") [Var (Just (7,53)-(7,54)) "x"],App (Just (7,57)-(7,69)) (Var (Just (7,58)-(7,66)) "isFPoint") [Var (Just (7,67)-(7,68)) "x"]]
*)

(* typed spans
(7,49)-(7,70)
*)

(* correct types
(int * bool)
*)

(* bad types
int -> int
*)
