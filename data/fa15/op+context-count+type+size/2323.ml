
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sepConcat sep x) in
      let base = h in let l = t in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ sep in
      let base = h in let l = t in List.fold_left f base l;;

*)

(* changed spans
(6,22)-(6,39)
(6,23)-(6,32)
(6,37)-(6,38)
*)

(* type error slice
(2,3)-(7,60)
(2,18)-(7,58)
(2,22)-(7,58)
(3,2)-(7,58)
(3,2)-(7,58)
(3,8)-(3,10)
(6,6)-(7,58)
(6,12)-(6,39)
(6,14)-(6,39)
(6,22)-(6,39)
(6,23)-(6,32)
(6,37)-(6,38)
(7,22)-(7,58)
(7,30)-(7,31)
(7,35)-(7,49)
(7,35)-(7,58)
(7,50)-(7,51)
(7,57)-(7,58)
*)
