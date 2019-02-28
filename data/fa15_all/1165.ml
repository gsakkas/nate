
let rec assoc (d,k,l) =
  match [(k, d)] with
  | [] -> d
  | h::t -> if (k, d) = l then d else assoc (d, k, t);;


(* fix

let rec assoc (d,k,l) =
  match [(k, d)] with
  | [] -> d
  | h::t -> if (k, d) = h then d else assoc (d, k, t);;

*)

(* changed spans
(5,24)-(5,25)
h
VarG

*)

(* changed exprs
Var (Just (5,24)-(5,25)) "h"
*)

(* typed spans
(5,24)-(5,25)
*)

(* correct types
('a * 'b)
*)

(* bad types
('a * 'b)
*)
