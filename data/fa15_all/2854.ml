
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = ("[" sepConcat "" (List.map f l)) ^ "]";;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = "[" ^ ((sepConcat " " (List.map f l)) ^ "]");;

*)

(* changed spans
(9,24)-(9,57)
"["
LitG

(9,60)-(9,63)
sepConcat " " (List.map f
                        l) ^ "]"
AppG [AppG [EmptyG,EmptyG],LitG]

*)

(* type error slice
(9,24)-(9,57)
(9,25)-(9,28)
*)
