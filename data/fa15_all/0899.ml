
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l =
  match l with | [] -> "[]" | l -> "[" ^ (sepConcat ";" (List.map f l) "]");;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l =
  match l with
  | [] -> "[]"
  | l -> "[" ^ ((sepConcat ";" (List.map f l)) ^ "]");;

*)

(* changed spans
(10,41)-(10,75)
sepConcat ";" (List.map f
                        l) ^ "]"
AppG (fromList [AppG (fromList [EmptyG]),LitG])

*)

(* changed exprs
App (Just (12,15)-(12,53)) (Var (Just (12,47)-(12,48)) "^") [App (Just (12,16)-(12,46)) (Var (Just (12,17)-(12,26)) "sepConcat") [Lit (Just (12,27)-(12,30)) (LS ";"),App (Just (12,31)-(12,45)) (Var (Just (12,32)-(12,40)) "List.map") [Var (Just (12,41)-(12,42)) "f",Var (Just (12,43)-(12,44)) "l"]],Lit (Just (12,49)-(12,52)) (LS "]")]
*)

(* typed spans
(12,15)-(12,53)
*)

(* correct types
string
*)

(* bad types
string
*)
