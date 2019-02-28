
let stringOfList f l =
  match l with
  | [] -> ""
  | h::t ->
      let f a x = (string_of_int a) ^ x in
      let base = h in let l = t in List.fold_left f base l;;


(* fix

let stringOfList f l =
  match l with
  | [] -> ""
  | h::t ->
      let f a x = a ^ x in
      let base = h in let l = t in List.fold_left f base l;;

*)

(* changed spans
(6,18)-(6,35)
a
VarG

*)

(* changed exprs
Var (Just (6,18)-(6,19)) "a"
*)

(* typed spans
(6,18)-(6,19)
*)

(* correct types
string
*)

(* bad types
string
*)
