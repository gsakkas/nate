
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = "[" ^ ((List.map f (sepConcat "; " l)) ^ "]");;


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
(9,42)-(9,60)
sepConcat
VarG

(9,42)-(9,60)
"; "
LitG

(9,42)-(9,60)
List.map f l
AppG (fromList [VarG])

*)

(* changed exprs
Var (Just (9,31)-(9,40)) "sepConcat"
Lit (Just (9,41)-(9,45)) (LS "; ")
App (Just (9,46)-(9,60)) (Var (Just (9,47)-(9,55)) "List.map") [Var (Just (9,56)-(9,57)) "f",Var (Just (9,58)-(9,59)) "l"]
*)

(* typed spans
(9,31)-(9,40)
(9,41)-(9,45)
(9,46)-(9,60)
*)

(* correct types
string -> string list -> string
string
string list
*)

(* bad types
string
string
string
*)
