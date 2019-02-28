
let rec assoc (d,k,l) =
  match [(k, d)] with
  | [] -> d
  | h::t -> if (k, d) = l then d else assoc (d, k, [t]);;


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

(5,51)-(5,54)
t
VarG

*)

(* changed exprs
Var (Just (5,24)-(5,25)) "h"
Var (Just (5,51)-(5,52)) "t"
*)

(* typed spans
(5,24)-(5,25)
(5,51)-(5,52)
*)

(* correct types
('a * 'b)
('a * 'b) list
*)

(* bad types
('a * 'b)
('a * 'b) list list
*)
