
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l =
  "[" ^ ((List.map (fun t  -> sepConcat "; " l) l) ^ "]");;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = sepConcat "; " (List.map f l);;

*)

(* changed spans
(10,2)-(10,5)
EMPTY
EmptyG

(10,6)-(10,7)
EMPTY
EmptyG

(10,8)-(10,57)
EMPTY
EmptyG

(10,9)-(10,50)
EMPTY
EmptyG

(10,10)-(10,18)
EMPTY
EmptyG

(10,19)-(10,47)
EMPTY
EmptyG

(10,30)-(10,46)
EMPTY
EmptyG

(10,45)-(10,46)
List.map f l
AppG (fromList [VarG])

(10,48)-(10,49)
f
VarG

(10,51)-(10,52)
EMPTY
EmptyG

(10,53)-(10,56)
EMPTY
EmptyG

*)
