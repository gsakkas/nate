
let stringOfList f l =
  match l with | [] -> "[]" | x::[] -> "[" ^ (x ^ "]") | l -> List.map (f, l);;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l =
  match l with
  | [] -> "[]"
  | x::[] -> "[" ^ (x ^ "]")
  | l -> sepConcat "" (List.map f l);;

*)

(* changed spans
(3,63)-(3,78)
sepConcat "" (List.map f l)
AppG [LitG,AppG [EmptyG,EmptyG]]

*)

(* type error slice
(3,63)-(3,71)
(3,63)-(3,78)
(3,72)-(3,78)
*)
