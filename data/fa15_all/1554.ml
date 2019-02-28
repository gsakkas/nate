
let rec wwhile (f,b) =
  match f b with | (h1,h2) -> if h2 then wwhile (f, h1) else h1;;

let fixpoint (f,b) =
  wwhile
    ((let f' b = if (f b) = b then (b, false) else ((f b), true) in f' b), b);;


(* fix

let rec wwhile (f,b) =
  match f b with | (h1,h2) -> if h2 then wwhile (f, h1) else h1;;

let fixpoint (f,b) =
  wwhile
    ((let f' b = if (f b) = b then (b, false) else ((f b), true) in f'), b);;

*)

(* changed spans
(7,68)-(7,72)
f'
VarG

(7,68)-(7,72)
b
VarG

*)

(* changed exprs
Var (Just (7,68)-(7,70)) "f'"
Var (Just (7,73)-(7,74)) "b"
*)

(* typed spans
(7,68)-(7,70)
(7,73)-(7,74)
*)

(* correct types
'a -> ('a * bool)
'a
*)

(* bad types
('a * bool)
('a * bool)
*)
