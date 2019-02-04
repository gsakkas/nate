
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ x in
      let base = if t = sep then sep else h ^ sep in
      let l = sl in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ x in
      let base = if t = [] then sep else h in
      let l = sl in List.fold_left f base l;;

*)

(* changed spans
(7,24)-(7,27)
[]
ListG EmptyG Nothing

(7,42)-(7,49)
EMPTY
EmptyG

(7,44)-(7,45)
EMPTY
EmptyG

(7,46)-(7,49)
EMPTY
EmptyG

*)
