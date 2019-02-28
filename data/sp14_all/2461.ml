
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = List.map f (sepConcat f l);;


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
(9,32)-(9,33)
(^)
VarG

(9,34)-(9,49)
"["
LitG

(9,35)-(9,44)
(^)
VarG

(9,35)-(9,44)
sepConcat ";" (List.map f l)
AppG (fromList [AppG (fromList [EmptyG]),LitG])

(9,45)-(9,46)
";"
LitG

(9,45)-(9,46)
List.map f l
AppG (fromList [VarG])

*)

(* changed exprs
Var (Just (9,27)-(9,28)) "^"
Lit (Just (9,23)-(9,26)) (LS "[")
Var (Just (9,61)-(9,62)) "^"
App (Just (9,30)-(9,60)) (Var (Just (9,31)-(9,40)) "sepConcat") [Lit (Just (9,41)-(9,44)) (LS ";"),App (Just (9,45)-(9,59)) (Var (Just (9,46)-(9,54)) "List.map") [Var (Just (9,55)-(9,56)) "f",Var (Just (9,57)-(9,58)) "l"]]
Lit (Just (9,41)-(9,44)) (LS ";")
App (Just (9,45)-(9,59)) (Var (Just (9,46)-(9,54)) "List.map") [Var (Just (9,55)-(9,56)) "f",Var (Just (9,57)-(9,58)) "l"]
*)

(* typed spans
(9,27)-(9,28)
(9,23)-(9,26)
(9,61)-(9,62)
(9,30)-(9,60)
(9,41)-(9,44)
(9,45)-(9,59)
*)

(* correct types
string -> string -> string
string
string -> string -> string
string
string
string list
*)

(* bad types
string
string
string -> string list -> string
string -> string list -> string
string
string
*)
