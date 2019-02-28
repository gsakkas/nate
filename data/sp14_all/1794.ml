
let stringOfList f l =
  match l with
  | [] -> ""
  | h::t ->
      let m a b = "[" ^ (a ^ ((";" b) ^ "]")) in
      let base = f h in List.fold_left m base l;;


(* fix

let stringOfList f l =
  match l with
  | [] -> ""
  | h::t ->
      let m a b = "[" ^ (a ^ (";" ^ (b ^ "]"))) in
      let base = f h in List.fold_left m base l;;

*)

(* changed spans
(6,30)-(6,37)
";"
LitG

(6,30)-(6,37)
b ^ "]"
AppG (fromList [VarG,LitG])

*)

(* changed exprs
Lit (Just (6,30)-(6,33)) (LS ";")
App (Just (6,36)-(6,45)) (Var (Just (6,39)-(6,40)) "^") [Var (Just (6,37)-(6,38)) "b",Lit (Just (6,41)-(6,44)) (LS "]")]
*)

(* typed spans
(6,30)-(6,33)
(6,36)-(6,45)
*)

(* correct types
string
string
*)

(* bad types
string
string
*)
