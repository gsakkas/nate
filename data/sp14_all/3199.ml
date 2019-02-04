
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = sepConcat (h ^ (sep t)) in
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
(6,18)-(6,27)
EMPTY
EmptyG

(6,18)-(6,41)
EMPTY
EmptyG

(6,33)-(6,40)
EMPTY
EmptyG

(6,38)-(6,39)
EMPTY
EmptyG

*)
