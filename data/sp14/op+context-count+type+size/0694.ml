
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = x ^ a in
      let base = sepConcat sep t in let l = "" in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = x ^ a in
      let base = sepConcat sep t in let l = t in List.fold_left f base l;;

*)

(* changed spans
(7,45)-(7,47)
*)

(* type error slice
(7,37)-(7,74)
(7,45)-(7,47)
(7,51)-(7,65)
(7,51)-(7,74)
(7,73)-(7,74)
*)