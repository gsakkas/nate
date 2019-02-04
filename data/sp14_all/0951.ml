
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x c = a ^ (sep ^ x) in
      let base = "" in let l = "" in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = "" in let l = [] in List.fold_left f base l;;

*)

(* changed spans
(6,16)-(6,33)
EMPTY
EmptyG

(7,31)-(7,33)
[]
ListG EmptyG Nothing

*)
