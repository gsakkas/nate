
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sepConcat a x) in
      let base = h ^ sep in let l = List.rev t in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (x ^ a) in
      let base = h ^ sep in let l = List.rev t in List.fold_left f base l;;

*)

(* changed spans
(6,23)-(6,32)
EMPTY
EmptyG

(6,33)-(6,34)
(^)
VarG

(7,6)-(7,73)
a
VarG

*)
