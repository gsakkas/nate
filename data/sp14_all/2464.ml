
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = sepConcat List.map (f l) l;;


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
(9,23)-(9,49)
"[" ^ (sepConcat ";"
                 (List.map f l) ^ "]")
AppG (fromList [AppG (fromList [EmptyG]),LitG])

*)

(* changed exprs
App (Just (9,23)-(9,67)) (Var (Just (9,27)-(9,28)) "^") [Lit (Just (9,23)-(9,26)) (LS "["),App (Just (9,29)-(9,67)) (Var (Just (9,61)-(9,62)) "^") [App (Just (9,30)-(9,60)) (Var (Just (9,31)-(9,40)) "sepConcat") [Lit (Just (9,41)-(9,44)) (LS ";"),App (Just (9,45)-(9,59)) (Var (Just (9,46)-(9,54)) "List.map") [Var (Just (9,55)-(9,56)) "f",Var (Just (9,57)-(9,58)) "l"]],Lit (Just (9,63)-(9,66)) (LS "]")]]
*)

(* typed spans
(9,23)-(9,67)
*)

(* correct types
string
*)

(* bad types
'a
*)
