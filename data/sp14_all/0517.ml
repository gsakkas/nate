
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = sepConcat "" List.map (f l);;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = let x = List.map f l in sepConcat ";" x;;

*)

(* changed spans
(9,23)-(9,32)
EMPTY
EmptyG

(9,23)-(9,50)
EMPTY
EmptyG

(9,33)-(9,35)
let x = List.map f l in
sepConcat ";" x
LetG NonRec (fromList [AppG (fromList [EmptyG])]) (AppG (fromList [EmptyG]))

(9,36)-(9,44)
List.map f l
AppG (fromList [VarG])

(9,45)-(9,50)
EMPTY
EmptyG

*)
