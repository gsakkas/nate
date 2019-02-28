
let sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ x in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = "[" ^ ((sepConcat (List.map f l)) ^ "]");;


(* fix

let sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ x in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = "[" ^ ((sepConcat "" (List.map f l)) ^ "]");;

*)

(* changed spans
(9,30)-(9,56)
sepConcat "" (List.map f l)
AppG (fromList [AppG (fromList [EmptyG]),LitG])

*)

(* changed exprs
App (Just (9,30)-(9,59)) (Var (Just (9,31)-(9,40)) "sepConcat") [Lit (Just (9,41)-(9,43)) (LS ""),App (Just (9,44)-(9,58)) (Var (Just (9,45)-(9,53)) "List.map") [Var (Just (9,54)-(9,55)) "f",Var (Just (9,56)-(9,57)) "l"]]
*)

(* typed spans
(9,30)-(9,59)
*)

(* correct types
string
*)

(* bad types
string list -> string
*)
