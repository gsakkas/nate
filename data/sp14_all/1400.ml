
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = h ^ (sep ^ a) in
      let base = [] in let l = sl in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = h ^ (sep ^ a) in
      let base = sep in let l = sl in List.fold_left f base l;;

*)

(* changed spans
(7,17)-(7,19)
sep
VarG

*)

(* changed exprs
Var (Just (7,17)-(7,20)) "sep"
*)

(* typed spans
(7,17)-(7,20)
*)

(* correct types
string
*)

(* bad types
'a list
*)
