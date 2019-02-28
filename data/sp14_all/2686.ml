
let rec assoc (d,k,l) =
  let acc = l in
  let rec helper acc (d,k,l) =
    match acc with
    | [] -> d
    | h::t ->
        (match h with | (s,v) -> if s = k then v else helper t (d, k, l)) in
  helper (d, k, l) acc;;


(* fix

let rec assoc (d,k,l) =
  let acc = l in
  let rec helper acc (d,k,l) =
    match acc with
    | [] -> d
    | h::t ->
        (match h with | (s,v) -> if s = k then v else helper t (d, k, l)) in
  helper acc (d, k, l);;

*)

(* changed spans
(9,9)-(9,18)
acc
VarG

*)

(* changed exprs
Var (Just (9,9)-(9,12)) "acc"
*)

(* typed spans
(9,9)-(9,12)
*)

(* correct types
('a * 'b) list
*)

(* bad types
('a * 'b * 'c)
*)
