
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
  | l -> List.map (f, (sepConcat ";" l));;


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
(13,9)-(13,17)
EMPTY
EmptyG

(13,9)-(13,40)
EMPTY
EmptyG

(13,18)-(13,40)
EMPTY
EmptyG

(13,19)-(13,20)
EMPTY
EmptyG

(13,33)-(13,36)
""
LitG

(13,37)-(13,38)
List.map f l
AppG (fromList [VarG])

*)
