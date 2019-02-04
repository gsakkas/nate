
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = h ^ sep in
      let base = h in let l = sepConcat sep t in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = h ^ (sepConcat sep t) in
      let base = h in let l = t in List.fold_left f base l;;

*)

(* changed spans
(6,22)-(6,25)
sepConcat sep t
AppG (fromList [VarG])

(7,6)-(7,72)
t
VarG

(7,30)-(7,39)
EMPTY
EmptyG

(7,30)-(7,45)
EMPTY
EmptyG

(7,40)-(7,43)
EMPTY
EmptyG

*)
