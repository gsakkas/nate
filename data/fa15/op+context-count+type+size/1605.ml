
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = "[" ^ ((sepConcat ("; ", (List.map (f, l)))) ^ "]");;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l =
  let newList = List.map f l in "[" ^ ((sepConcat "; " newList) ^ "]");;

*)

(* changed spans
(9,24)-(9,74)
(9,28)-(9,29)
(9,32)-(9,64)
(9,43)-(9,64)
(9,50)-(9,58)
(9,50)-(9,64)
(9,60)-(9,61)
(9,60)-(9,64)
(9,63)-(9,64)
*)

(* type error slice
(2,4)-(7,61)
(2,19)-(7,59)
(6,24)-(6,27)
(6,24)-(6,31)
(6,28)-(6,29)
(9,32)-(9,41)
(9,32)-(9,64)
(9,43)-(9,64)
(9,50)-(9,58)
(9,50)-(9,64)
(9,60)-(9,64)
*)