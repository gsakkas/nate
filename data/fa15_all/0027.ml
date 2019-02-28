
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = ((sepConcat "; "), (List.map (f, l)));;


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
(9,23)-(9,60)
let newList = List.map f l in
"[" ^ (sepConcat "; "
                 newList ^ "]")
LetG NonRec (fromList [AppG (fromList [EmptyG])]) (AppG (fromList [EmptyG]))

(9,43)-(9,51)
List.map f l
AppG (fromList [VarG])

(9,52)-(9,58)
EMPTY
EmptyG

*)

(* typed spans
(10,2)-(10,70)
(10,16)-(10,28)
*)

(* typed spans
string
string list
*)

(* typed spans
(string list -> string * 'a)
('a -> 'b) -> 'a list -> 'b list
*)
