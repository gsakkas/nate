
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ x in
      let base = h in let l = h in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ x in
      let base = h in let l = t in List.fold_left f base l;;

*)

(* changed spans
(7,30)-(7,31)
*)

(* type error slice
(6,6)-(7,58)
(6,12)-(6,23)
(6,18)-(6,19)
(6,18)-(6,23)
(6,20)-(6,21)
(7,6)-(7,58)
(7,17)-(7,18)
(7,22)-(7,58)
(7,30)-(7,31)
(7,35)-(7,49)
(7,35)-(7,58)
(7,50)-(7,51)
(7,52)-(7,56)
(7,57)-(7,58)
*)
