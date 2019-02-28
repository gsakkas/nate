
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = h ^ (sep ^ (sepConcat (sep t))) in
      let base = "" in let l = t in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = h ^ sep in
      let base = "" in let l = t in List.fold_left f base l;;

*)

(* changed spans
(6,22)-(6,49)
sep
VarG

*)

(* changed exprs
Var (Just (6,22)-(6,25)) "sep"
*)

(* typed spans
(6,22)-(6,25)
*)

(* correct types
string
*)

(* bad types
string
*)
