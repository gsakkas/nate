
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sepConcat (sep, x)) in
      let base = [] in let l = t in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ sep in
      let base = h in let l = t in List.fold_left f base l;;

*)

(* changed spans
(6,22)-(6,42)
EMPTY
EmptyG

(6,23)-(6,32)
EMPTY
EmptyG

(6,33)-(6,41)
EMPTY
EmptyG

(6,39)-(6,40)
EMPTY
EmptyG

(7,17)-(7,19)
h
VarG

*)
