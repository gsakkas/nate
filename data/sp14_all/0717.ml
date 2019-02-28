
let rec sumList xs =
  if (List.hd xs) = [] then 0 else (let h::t = xs in h + (sumList t));;


(* fix

let rec sumList xs =
  if xs = [] then 0 else (let h::t = xs in h + (sumList t));;

*)

(* changed spans
(3,5)-(3,17)
xs
VarG

*)

(* changed exprs
Var (Just (3,5)-(3,7)) "xs"
*)

(* typed spans
(3,5)-(3,7)
*)

(* correct types
int list
*)

(* bad types
'a list
*)
