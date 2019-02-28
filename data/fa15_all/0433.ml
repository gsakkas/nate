
let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) =
  let rec funt x = ((funt b), ((f b) = b)) in wwhile (funt, b);;


(* fix

let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) =
  let rec funt x = ((f b), ((f b) = b)) in wwhile (funt, b);;

*)

(* changed spans
(7,21)-(7,25)
f
VarG

*)

(* changed exprs
Var (Just (7,21)-(7,22)) "f"
*)

(* typed spans
(7,21)-(7,22)
*)

(* correct types
'a -> 'a
*)

(* bad types
'a -> ('a * bool)
*)
