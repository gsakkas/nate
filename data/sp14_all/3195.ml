
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
EMPTY
EmptyG

(6,27)-(6,28)
EMPTY
EmptyG

(6,29)-(6,48)
EMPTY
EmptyG

(6,30)-(6,39)
EMPTY
EmptyG

(6,40)-(6,47)
EMPTY
EmptyG

(6,41)-(6,44)
EMPTY
EmptyG

(6,45)-(6,46)
EMPTY
EmptyG

*)
