
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x acc x = x ^ acc in
      let base = h in let l = t in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ x in
      let base = "" in let l = t in List.fold_left f base l;;

*)

(* changed spans
(6,16)-(6,31)
EMPTY
EmptyG

(6,20)-(6,31)
EMPTY
EmptyG

(6,24)-(6,25)
a
VarG

(6,28)-(6,31)
EMPTY
EmptyG

(7,17)-(7,18)
""
LitG

*)
