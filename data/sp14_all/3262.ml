
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = if a = "a" then a ^ (x ^ sep) in
      let base = "" in let l = sl in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (x ^ sep) in
      let base = "" in let l = sl in List.fold_left f base l;;

*)

(* changed spans
(6,18)-(6,47)
EMPTY
EmptyG

(6,21)-(6,22)
EMPTY
EmptyG

(6,21)-(6,28)
EMPTY
EmptyG

(6,25)-(6,28)
EMPTY
EmptyG

*)
