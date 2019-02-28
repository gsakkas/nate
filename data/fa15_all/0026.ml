
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = "[" ^ ((sepConcat "; " List.map (f, l)) ^ "]");;


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
(9,23)-(9,69)
let newList = List.map f l in
"[" ^ (sepConcat "; "
                 newList ^ "]")
LetG NonRec (fromList [AppG (fromList [EmptyG])]) (AppG (fromList [EmptyG]))

(9,27)-(9,28)
"[" ^ (sepConcat "; "
                 newList ^ "]")
AppG (fromList [AppG (fromList [EmptyG]),LitG])

(9,30)-(9,62)
sepConcat "; " newList
AppG (fromList [VarG,LitG])

(9,46)-(9,54)
newList
VarG

*)

(* typed spans
(10,2)-(10,70)
(10,32)-(10,70)
(10,39)-(10,63)
(10,55)-(10,62)
*)

(* typed spans
string
string
string
string list
*)

(* typed spans
string
string -> string -> string
string
('a -> 'b) -> 'a list -> 'b list
*)
