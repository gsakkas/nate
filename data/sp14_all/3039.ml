
let stringOfList f l =
  match l with
  | [] -> "[]"
  | x::xs ->
      let g a x = a ^ ("; " ^ (f x)) in
      let base = f x in List.fold_left f base xs;;


(* fix

let stringOfList f l =
  match l with
  | [] -> "[]"
  | x::xs ->
      let g a x = a ^ ("; " ^ (f x)) in
      let base = f x in List.fold_left g base xs;;

*)

(* changed spans
(7,39)-(7,40)
g
VarG

*)

(* changed exprs
Var (Just (7,39)-(7,40)) "g"
*)

(* typed spans
(7,39)-(7,40)
*)

(* correct types
string -> 'a -> string
*)

(* bad types
'a -> string
*)
