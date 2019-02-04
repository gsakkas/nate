
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = List.append (List.append a sep) h in
      let base = "" in let l = sl in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ sep in
      let base = h in let l = t in List.fold_left f base l;;

*)

(* changed spans
(6,18)-(6,29)
EMPTY
EmptyG

(6,30)-(6,49)
EMPTY
EmptyG

(6,31)-(6,42)
(^)
VarG

(6,50)-(6,51)
EMPTY
EmptyG

(7,17)-(7,19)
h
VarG

(7,31)-(7,33)
t
VarG

*)
