
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sl ^ x) in
      let base = h in let l = t in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

*)

(* changed spans
(6,23)-(6,25)
sep
VarG

*)

(* changed exprs
Var (Just (6,23)-(6,26)) "sep"
*)

(* typed spans
(6,23)-(6,26)
*)

(* correct types
string
*)

(* bad types
string
*)
