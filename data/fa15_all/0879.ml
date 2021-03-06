
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = sepConcat ("", (List.map (f, l)));;


(* fix

let stringOfList f l = match l with | x::[] -> "[" ^ (x ^ "]");;

*)

(* changed spans
(9,24)-(9,57)
match l with
| x :: [] -> "[" ^ (x ^ "]")
CaseG VarG [(ConsPatG EmptyPatG EmptyPatG,Nothing,AppG [EmptyG,EmptyG])]

*)

(* type error slice
(2,4)-(7,61)
(2,19)-(7,59)
(6,23)-(6,32)
(6,24)-(6,27)
(6,28)-(6,29)
(9,24)-(9,33)
(9,24)-(9,57)
(9,34)-(9,57)
(9,39)-(9,56)
(9,40)-(9,48)
(9,49)-(9,55)
*)
