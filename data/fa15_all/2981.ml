
let stringOfList f l =
  let fx a b = List.append a [f b] in
  let base = [] in
  List.fold_left f base l f (f (f (f (f (f (f base 1) 2) 3) 4) 5) 6);;


(* fix

let stringOfList f l =
  let fx a b = a ^ b in let base = "" in List.fold_left fx base l;;

*)

(* changed spans
(3,15)-(3,26)
(^)
VarG

(3,29)-(3,34)
b
VarG

(5,2)-(5,68)
""
LitG

(5,2)-(5,68)
List.fold_left fx base l
AppG (fromList [VarG])

(5,17)-(5,18)
fx
VarG

*)

(* changed exprs
Var (Just (3,17)-(3,18)) "^"
Var (Just (3,19)-(3,20)) "b"
Lit (Just (3,35)-(3,37)) (LS "")
App (Just (3,41)-(3,65)) (Var (Just (3,41)-(3,55)) "List.fold_left") [Var (Just (3,56)-(3,58)) "fx",Var (Just (3,59)-(3,63)) "base",Var (Just (3,64)-(3,65)) "l"]
Var (Just (3,56)-(3,58)) "fx"
*)

(* typed spans
(3,17)-(3,18)
(3,19)-(3,20)
(3,35)-(3,37)
(3,41)-(3,65)
(3,56)-(3,58)
*)

(* correct types
string -> string -> string
string
string
string
string -> string -> string
*)

(* bad types
int -> 'a list list -> int -> 'a list list -> int -> 'a list list
int -> 'a list list
'a
'a
'a list -> int -> 'a list
*)
