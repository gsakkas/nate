
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sepConcat sep x) in
      let base = "" in let l = t in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ sep in
      let base = h in let l = t in List.fold_left f base l;;

*)

(* changed spans
(6,23)-(6,40)
sep
VarG

(7,18)-(7,20)
h
VarG

*)

(* type error slice
(2,4)-(7,62)
(2,19)-(7,60)
(2,23)-(7,60)
(3,3)-(7,60)
(3,9)-(3,11)
(6,7)-(7,60)
(6,13)-(6,40)
(6,15)-(6,40)
(6,23)-(6,40)
(6,24)-(6,33)
(6,38)-(6,39)
(7,24)-(7,60)
(7,32)-(7,33)
(7,37)-(7,51)
(7,37)-(7,60)
(7,52)-(7,53)
(7,59)-(7,60)
*)
