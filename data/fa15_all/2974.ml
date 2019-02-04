
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = match x with | [] -> x | hd::tl -> a ^ (sep ^ hd) in
      let base = h in let l = t in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = x in let base = h in let l = t in List.fold_left f base l;;

*)

(* changed spans
(6,18)-(6,67)
EMPTY
EmptyG

(6,39)-(6,40)
EMPTY
EmptyG

(6,53)-(6,54)
EMPTY
EmptyG

(6,53)-(6,67)
EMPTY
EmptyG

(6,55)-(6,56)
EMPTY
EmptyG

(6,57)-(6,67)
EMPTY
EmptyG

(6,58)-(6,61)
EMPTY
EmptyG

(6,62)-(6,63)
EMPTY
EmptyG

(6,64)-(6,66)
EMPTY
EmptyG

*)
