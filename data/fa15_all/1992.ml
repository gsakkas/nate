
let stringOfList f l =
  match l with
  | [] -> ""
  | h::t ->
      let f a x = (string_of_int a) ^ x in
      let base = h in let l = t in List.fold_left f base l;;


(* fix

let stringOfList f l =
  match l with
  | [] -> ""
  | h::t ->
      let f a x = a ^ x in
      let base = h in let l = t in List.fold_left f base l;;

*)

(* changed spans
(6,18)-(6,35)
EMPTY
EmptyG

(6,19)-(6,32)
EMPTY
EmptyG

*)
