
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sl ^ x) in
      let base = h in let l = t in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ x in
      let base = h in let l = t in List.fold_left f base l;;

*)

(* changed spans
(6,22)-(6,30)
EMPTY
EmptyG

(6,23)-(6,25)
EMPTY
EmptyG

(6,26)-(6,27)
EMPTY
EmptyG

*)
