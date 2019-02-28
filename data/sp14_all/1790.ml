
let pipe fs =
  let f a x g = a (x g) in
  let base = match fs with | [] -> (fun x  -> x) | h::t -> f t h in
  List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x g = a (x g) in
  let base = match fs with | [] -> (fun x  -> x) | h::t -> f (fun x  -> x) h in
  List.fold_left f base fs;;

*)

(* changed spans
(4,61)-(4,62)
fun x -> x
LamG VarG

*)

(* changed exprs
Lam (Just (4,61)-(4,74)) (VarPat (Just (4,66)-(4,67)) "x") (Var (Just (4,72)-(4,73)) "x") Nothing
*)

(* typed spans
(4,61)-(4,74)
*)

(* correct types
'a -> 'a
*)

(* bad types
'a -> 'a list
*)
