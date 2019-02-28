
let rec clone x n =
  let rec clone_RT acc n = if n <= 0 then acc else clone (x :: acc) (n - 1) in
  clone_RT [] n;;


(* fix

let rec clone x n =
  let rec clone_RT acc n =
    if n <= 0 then acc else clone_RT (x :: acc) (n - 1) in
  clone_RT [] n;;

*)

(* changed spans
(3,51)-(3,56)
clone_RT
VarG

*)

(* changed exprs
Var (Just (4,28)-(4,36)) "clone_RT"
*)

(* typed spans
(4,28)-(4,36)
*)

(* correct types
'a list -> int -> 'a list
*)

(* bad types
'a list -> int -> 'a list
*)
