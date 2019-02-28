
let rec assoc (d,k,l) =
  match (d, k, l) with
  | (ki,vi)::t -> if k = ki then vi else assoc (d, k, t)
  | [] -> d;;


(* fix

let rec assoc (d,k,l) =
  match l with
  | (ki,vi)::t -> if k = ki then vi else assoc (d, k, t)
  | [] -> d;;

*)

(* changed spans
(3,8)-(3,17)
l
VarG

*)

(* changed exprs
Var (Just (3,8)-(3,9)) "l"
*)

(* typed spans
(3,8)-(3,9)
*)

(* correct types
('a * 'b) list
*)

(* bad types
('a * 'b * ('b * 'a) list)
*)
