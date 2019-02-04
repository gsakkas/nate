
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
(9,23)-(9,74)
let newList = List.map f l in
"[" ^ (sepConcat "; "
                 newList ^ "]")
LetG NonRec (fromList [AppG (fromList [EmptyG])]) (AppG (fromList [EmptyG]))

(9,27)-(9,28)
"[" ^ (sepConcat "; "
                 newList ^ "]")
AppG (fromList [AppG (fromList [EmptyG]),LitG])

(9,30)-(9,67)
sepConcat "; " newList
AppG (fromList [VarG,LitG])

(9,41)-(9,66)
EMPTY
EmptyG

(9,48)-(9,65)
EMPTY
EmptyG

(9,49)-(9,57)
EMPTY
EmptyG

(9,58)-(9,64)
EMPTY
EmptyG

(9,59)-(9,60)
EMPTY
EmptyG

(9,62)-(9,63)
newList
VarG

*)
