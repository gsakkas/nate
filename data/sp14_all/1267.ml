
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = ("[" ^ (sepConcat "; " (List.map f l))) & "]";;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = "[" ^ ((sepConcat "; " (List.map f l)) ^ "]");;

*)

(* changed spans
(9,23)-(9,62)
(^)
VarG

(9,23)-(9,62)
"["
LitG

(9,23)-(9,62)
sepConcat "; " (List.map f
                         l) ^ "]"
AppG (fromList [AppG (fromList [EmptyG]),LitG])

(9,23)-(9,62)
(^)
VarG

(9,31)-(9,40)
sepConcat "; " (List.map f l)
AppG (fromList [AppG (fromList [EmptyG]),LitG])

*)

(* changed exprs
Var (Just (9,27)-(9,28)) "^"
Lit (Just (9,23)-(9,26)) (LS "[")
App (Just (9,29)-(9,68)) (Var (Just (9,62)-(9,63)) "^") [App (Just (9,30)-(9,61)) (Var (Just (9,31)-(9,40)) "sepConcat") [Lit (Just (9,41)-(9,45)) (LS "; "),App (Just (9,46)-(9,60)) (Var (Just (9,47)-(9,55)) "List.map") [Var (Just (9,56)-(9,57)) "f",Var (Just (9,58)-(9,59)) "l"]],Lit (Just (9,64)-(9,67)) (LS "]")]
Var (Just (9,62)-(9,63)) "^"
App (Just (9,30)-(9,61)) (Var (Just (9,31)-(9,40)) "sepConcat") [Lit (Just (9,41)-(9,45)) (LS "; "),App (Just (9,46)-(9,60)) (Var (Just (9,47)-(9,55)) "List.map") [Var (Just (9,56)-(9,57)) "f",Var (Just (9,58)-(9,59)) "l"]]
*)

(* typed spans
(9,27)-(9,28)
(9,23)-(9,26)
(9,29)-(9,68)
(9,62)-(9,63)
(9,30)-(9,61)
*)

(* correct types
string -> string -> string
string
string
string -> string -> string
string
*)

(* bad types
string
string
string
string
string -> string list -> string
*)
