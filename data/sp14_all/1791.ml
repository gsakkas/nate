
let pipe fs =
  let f a x g = a (x g) in
  let base = match fs with | [] -> 0 | h::t -> f (fun x  -> x) h in
  List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x g = a (x g) in
  let base =
    match fs with | [] -> (fun x  -> x * 1) | h::t -> f (fun x  -> x * 1) h in
  List.fold_left f base fs;;

*)

(* changed spans
(4,35)-(4,36)
fun x -> x * 1
LamG (BopG EmptyG EmptyG)

(4,60)-(4,61)
x * 1
BopG VarG LitG

(4,63)-(4,64)
1
LitG

*)

(* changed exprs
Lam (Just (5,26)-(5,43)) (VarPat (Just (5,31)-(5,32)) "x") (Bop (Just (5,37)-(5,42)) Times (Var (Just (5,37)-(5,38)) "x") (Lit (Just (5,41)-(5,42)) (LI 1))) Nothing
Bop (Just (5,67)-(5,72)) Times (Var (Just (5,67)-(5,68)) "x") (Lit (Just (5,71)-(5,72)) (LI 1))
Lit (Just (5,71)-(5,72)) (LI 1)
*)

(* typed spans
(5,26)-(5,43)
(5,67)-(5,72)
(5,71)-(5,72)
*)

(* correct types
int -> int
int
int
*)

(* bad types
int
'a
'a -> 'a
*)
