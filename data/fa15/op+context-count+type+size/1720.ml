
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = let y x = List.map f l in sepConcat "[" y;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = let fix l x = List.map f l in sepConcat "[" l;;

*)

(* changed spans
(9,23)-(9,64)
(9,29)-(9,45)
(9,63)-(9,64)
*)

(* type error slice
(2,3)-(7,60)
(2,18)-(7,58)
(2,22)-(7,58)
(3,2)-(7,58)
(3,2)-(7,58)
(3,8)-(3,10)
(9,23)-(9,64)
(9,29)-(9,45)
(9,49)-(9,58)
(9,49)-(9,64)
(9,63)-(9,64)
*)
