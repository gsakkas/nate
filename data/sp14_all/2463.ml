
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = (sepConcat "" l) List.map (f l);;


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
(9,23)-(9,39)
(^)
VarG

(9,23)-(9,39)
"["
LitG

(9,24)-(9,33)
(^)
VarG

(9,24)-(9,33)
sepConcat ";" (List.map f l)
AppG (fromList [AppG (fromList [EmptyG]),LitG])

(9,37)-(9,38)
";"
LitG

(9,40)-(9,48)
List.map f l
AppG (fromList [VarG])

(9,49)-(9,54)
f
VarG

(9,49)-(9,54)
l
VarG

(9,49)-(9,54)
"]"
LitG

*)

(* changed exprs
Var (Just (9,27)-(9,28)) "^"
Lit (Just (9,23)-(9,26)) (LS "[")
Var (Just (9,61)-(9,62)) "^"
App (Just (9,30)-(9,60)) (Var (Just (9,31)-(9,40)) "sepConcat") [Lit (Just (9,41)-(9,44)) (LS ";"),App (Just (9,45)-(9,59)) (Var (Just (9,46)-(9,54)) "List.map") [Var (Just (9,55)-(9,56)) "f",Var (Just (9,57)-(9,58)) "l"]]
Lit (Just (9,41)-(9,44)) (LS ";")
App (Just (9,45)-(9,59)) (Var (Just (9,46)-(9,54)) "List.map") [Var (Just (9,55)-(9,56)) "f",Var (Just (9,57)-(9,58)) "l"]
Var (Just (9,55)-(9,56)) "f"
Var (Just (9,57)-(9,58)) "l"
Lit (Just (9,63)-(9,66)) (LS "]")
*)

(* typed spans
(9,27)-(9,28)
(9,23)-(9,26)
(9,61)-(9,62)
(9,30)-(9,60)
(9,41)-(9,44)
(9,45)-(9,59)
(9,55)-(9,56)
(9,57)-(9,58)
(9,63)-(9,66)
*)

(* correct types
string -> string -> string
string
string -> string -> string
string
string
string list
'a -> string
'a list
string
*)

(* bad types
string
string
string -> string list -> string
string -> string list -> string
string list
('a -> 'b) -> 'a list -> 'b list
'a
'a
'a
*)
