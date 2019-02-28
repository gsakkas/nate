
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = List.map f (sepConcat "" l);;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = sepConcat " " (List.map f l);;

*)

(* changed spans
(9,23)-(9,31)
sepConcat
VarG

(9,23)-(9,31)
" "
LitG

(9,23)-(9,31)
List.map f l
AppG (fromList [VarG])

(9,34)-(9,50)
l
VarG

*)

(* changed exprs
Var (Just (9,23)-(9,32)) "sepConcat"
Lit (Just (9,33)-(9,36)) (LS " ")
App (Just (9,37)-(9,51)) (Var (Just (9,38)-(9,46)) "List.map") [Var (Just (9,47)-(9,48)) "f",Var (Just (9,49)-(9,50)) "l"]
Var (Just (9,49)-(9,50)) "l"
*)

(* typed spans
(9,23)-(9,32)
(9,33)-(9,36)
(9,37)-(9,51)
(9,49)-(9,50)
*)

(* correct types
string -> string list -> string
string
string list
'a list
*)

(* bad types
('a -> 'b) -> 'a list -> 'b list
('a -> 'b) -> 'a list -> 'b list
('a -> 'b) -> 'a list -> 'b list
string
*)
