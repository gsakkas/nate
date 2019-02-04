
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = "[" ^ ((List.map (f l)) ^ ((sepConcat (";" l)) ^ "]"));;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = "[" ^ ((sepConcat ";" (List.map f l)) ^ "]");;

*)

(* changed spans
(9,30)-(9,46)
EMPTY
EmptyG

(9,31)-(9,39)
EMPTY
EmptyG

(9,40)-(9,45)
EMPTY
EmptyG

(9,41)-(9,42)
EMPTY
EmptyG

(9,43)-(9,44)
EMPTY
EmptyG

(9,50)-(9,69)
EMPTY
EmptyG

(9,61)-(9,68)
EMPTY
EmptyG

(9,66)-(9,67)
List.map f l
AppG (fromList [VarG])

(9,70)-(9,71)
EMPTY
EmptyG

*)
