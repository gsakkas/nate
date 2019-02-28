
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = List.map (sepConcat f) (f l);;


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
(9,32)-(9,45)
(^)
VarG

(9,33)-(9,42)
"["
LitG

(9,33)-(9,42)
sepConcat ";" (List.map f
                        l) ^ "]"
AppG (fromList [AppG (fromList [EmptyG]),LitG])

(9,46)-(9,51)
";"
LitG

(9,47)-(9,48)
List.map f l
AppG (fromList [VarG])

*)

(* changed exprs
Var (Just (9,27)-(9,28)) "^"
Lit (Just (9,23)-(9,26)) (LS "[")
App (Just (9,29)-(9,67)) (Var (Just (9,61)-(9,62)) "^") [App (Just (9,30)-(9,60)) (Var (Just (9,31)-(9,40)) "sepConcat") [Lit (Just (9,41)-(9,44)) (LS ";"),App (Just (9,45)-(9,59)) (Var (Just (9,46)-(9,54)) "List.map") [Var (Just (9,55)-(9,56)) "f",Var (Just (9,57)-(9,58)) "l"]],Lit (Just (9,63)-(9,66)) (LS "]")]
Lit (Just (9,41)-(9,44)) (LS ";")
App (Just (9,45)-(9,59)) (Var (Just (9,46)-(9,54)) "List.map") [Var (Just (9,55)-(9,56)) "f",Var (Just (9,57)-(9,58)) "l"]
*)

(* typed spans
(9,27)-(9,28)
(9,23)-(9,26)
(9,29)-(9,67)
(9,41)-(9,44)
(9,45)-(9,59)
*)

(* correct types
string -> string -> string
string
string
string
string list
*)

(* bad types
string list -> string
string -> string list -> string
string -> string list -> string
string list list
string
*)
