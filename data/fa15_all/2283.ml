
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x x' = a ^ (x' ^ x) in
      let base = h in let l = sl in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = sl in List.fold_left f base l;;

*)

(* changed spans
(6,16)-(6,33)
EMPTY
EmptyG

(6,26)-(6,28)
sep
VarG

*)
