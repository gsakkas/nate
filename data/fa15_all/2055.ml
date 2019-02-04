
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ (sepConcat (sep, x))) in
      let base = h in let l = t in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ sep in
      let base = h in let l = t in List.fold_left f base l;;

*)

(* changed spans
(6,22)-(6,50)
EMPTY
EmptyG

(6,27)-(6,28)
EMPTY
EmptyG

(6,29)-(6,49)
EMPTY
EmptyG

(6,30)-(6,39)
EMPTY
EmptyG

(6,40)-(6,48)
EMPTY
EmptyG

(6,41)-(6,44)
EMPTY
EmptyG

(6,46)-(6,47)
EMPTY
EmptyG

*)
