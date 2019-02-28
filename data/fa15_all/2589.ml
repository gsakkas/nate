
let rec wwhile (f,b) = let (x,y) = f b in if y then wwhile (f, x) else x;;

let fixpoint (f,b) = wwhile ((fun x  -> ((wwhile (f, b)), (b = (f b)))), b);;


(* fix

let rec wwhile (f,b) = let (x,y) = f b in if y then wwhile (f, x) else x;;

let fixpoint (f,b) = wwhile ((fun x  -> ((f b), (b = (f b)))), b);;

*)

(* changed spans
(4,49)-(4,55)
f
VarG

(4,49)-(4,55)
b
VarG

*)

(* changed exprs
Var (Just (4,42)-(4,43)) "f"
Var (Just (4,44)-(4,45)) "b"
*)

(* typed spans
(4,42)-(4,43)
(4,44)-(4,45)
*)

(* correct types
'a -> 'a
'a
*)

(* bad types
('a -> ('a * bool) * 'a)
('a -> ('a * bool) * 'a)
*)
