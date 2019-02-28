
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
  | l -> sepConcat @ (List.map (f, l));;


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
(13,21)-(13,38)
""
LitG

(13,21)-(13,38)
List.map f l
AppG (fromList [VarG])

(13,31)-(13,37)
f
VarG

(13,31)-(13,37)
l
VarG

*)

(* changed exprs
Lit (Just (13,19)-(13,21)) (LS "")
App (Just (13,22)-(13,36)) (Var (Just (13,23)-(13,31)) "List.map") [Var (Just (13,32)-(13,33)) "f",Var (Just (13,34)-(13,35)) "l"]
Var (Just (13,32)-(13,33)) "f"
Var (Just (13,34)-(13,35)) "l"
*)

(* typed spans
(13,19)-(13,21)
(13,22)-(13,36)
(13,32)-(13,33)
(13,34)-(13,35)
*)

(* correct types
string
string list
string -> string
string list
*)

(* bad types
'a
'a
('a * string list)
('a * string list)
*)
