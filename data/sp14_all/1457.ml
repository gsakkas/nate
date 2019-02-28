
let rec wwhile (f,b) =
  let (f',b') = f b in if b' = true then wwhile (f, f') else f';;

let fixpoint (f,b) = wwhile ((let h x = ((f b), ((f b) != b)) in f), b);;


(* fix

let rec wwhile (f,b) =
  let (f',b') = f b in if b' = true then wwhile (f, f') else f';;

let fixpoint (f,b) = wwhile ((let h x = ((f b), ((f b) != b)) in h), b);;

*)

(* changed spans
(5,65)-(5,66)
h
VarG

*)

(* changed exprs
Var (Just (5,65)-(5,66)) "h"
*)

(* typed spans
(5,65)-(5,66)
*)

(* correct types
'a -> ('a * bool)
*)

(* bad types
'a -> 'a
*)
