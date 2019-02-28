
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = "[" ^ ((List.map (f l)) ^ ((sepConcat (";" l)) ^ "]"));;


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
(9,50)-(9,69)
sepConcat
VarG

(9,50)-(9,69)
";"
LitG

(9,50)-(9,69)
List.map f l
AppG (fromList [VarG])

*)

(* changed exprs
Var (Just (9,31)-(9,40)) "sepConcat"
Lit (Just (9,41)-(9,44)) (LS ";")
App (Just (9,45)-(9,59)) (Var (Just (9,46)-(9,54)) "List.map") [Var (Just (9,55)-(9,56)) "f",Var (Just (9,57)-(9,58)) "l"]
*)

(* typed spans
(9,31)-(9,40)
(9,41)-(9,44)
(9,45)-(9,59)
*)

(* correct types
string -> string list -> string
string
string list
*)

(* bad types
string list -> string
string list -> string
string list -> string
*)
