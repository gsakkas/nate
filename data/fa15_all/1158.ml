
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ h) in
      let base = "" in let l = sepConcat sep t in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ h) in
      let base = "" in let l = sl in List.fold_left f base l;;

*)

(* changed spans
(7,31)-(7,40)
EMPTY
EmptyG

(7,31)-(7,46)
EMPTY
EmptyG

(7,41)-(7,44)
EMPTY
EmptyG

(7,45)-(7,46)
sl
VarG

*)
