
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = x in let base = h in let l = [t] in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = x in let base = h in let l = t in List.fold_left f base l;;

*)

(* changed spans
(6,47)-(6,50)
*)

(* type error slice
(3,2)-(6,77)
(3,2)-(6,77)
(6,6)-(6,77)
(6,12)-(6,19)
(6,14)-(6,19)
(6,18)-(6,19)
(6,23)-(6,77)
(6,34)-(6,35)
(6,39)-(6,77)
(6,47)-(6,50)
(6,47)-(6,50)
(6,48)-(6,49)
(6,54)-(6,68)
(6,54)-(6,77)
(6,69)-(6,70)
(6,71)-(6,75)
(6,76)-(6,77)
*)
