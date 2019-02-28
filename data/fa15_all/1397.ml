
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  wwhile (let fin bt = (bt, ((f bt) = bt)) in ((fin b), b));;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile (let fin bt = (bt, ((f bt) = bt)) in (fin, b));;

*)

(* changed spans
(5,47)-(5,54)
fin
VarG

(5,47)-(5,54)
b
VarG

*)

(* changed exprs
Var (Just (4,66)-(4,69)) "fin"
Var (Just (4,71)-(4,72)) "b"
*)

(* typed spans
(4,66)-(4,69)
(4,71)-(4,72)
*)

(* correct types
'a -> ('a * bool)
'a
*)

(* bad types
('a * bool)
('a * bool)
*)
