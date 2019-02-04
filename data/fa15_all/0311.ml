
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = x ^ a in
      let base = sl in
      let l = failwith "to be implemented" in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = x ^ a in
      let base = h in let l = t in List.fold_left f base l;;

*)

(* changed spans
(7,17)-(7,19)
h
VarG

(8,14)-(8,22)
EMPTY
EmptyG

(8,14)-(8,42)
EMPTY
EmptyG

(8,23)-(8,42)
t
VarG

*)
