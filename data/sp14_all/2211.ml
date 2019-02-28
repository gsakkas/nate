
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = "[" ^ (sepConcat ^ (";" ^ ((List.map f l) ^ "]")));;


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
(9,47)-(9,48)
sepConcat
VarG

(9,50)-(9,64)
List.map
VarG

(9,50)-(9,64)
f
VarG

(9,50)-(9,64)
l
VarG

*)

(* changed exprs
Var (Just (9,31)-(9,40)) "sepConcat"
Var (Just (9,46)-(9,54)) "List.map"
Var (Just (9,55)-(9,56)) "f"
Var (Just (9,57)-(9,58)) "l"
*)

(* typed spans
(9,31)-(9,40)
(9,46)-(9,54)
(9,55)-(9,56)
(9,57)-(9,58)
*)

(* correct types
string -> string list -> string
('a -> string) -> 'a list -> string list
'a -> string
'a list
*)

(* bad types
string -> string -> string
'a list
'a list
'a list
*)
