
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
(3,9)-(3,18)
l
VarG

*)

(* type error slice
(3,3)-(5,12)
(3,9)-(3,18)
*)
