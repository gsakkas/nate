
let sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = sepConcat ";" (List.map (fun t  -> ((f t) ^ "]") l));;


(* fix

let sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = sepConcat ";" (List.map (fun t  -> f t) l);;

*)

(* changed spans
(9,37)-(9,75)
List.map (fun t -> f t) l
AppG (fromList [VarG,LamG EmptyG])

*)

(* changed exprs
App (Just (9,37)-(9,65)) (Var (Just (9,38)-(9,46)) "List.map") [Lam (Just (9,47)-(9,62)) (VarPat (Just (9,52)-(9,53)) "t") (App (Just (9,58)-(9,61)) (Var (Just (9,58)-(9,59)) "f") [Var (Just (9,60)-(9,61)) "t"]) Nothing,Var (Just (9,63)-(9,64)) "l"]
*)

(* typed spans
(9,37)-(9,65)
*)

(* correct types
string list
*)

(* bad types
'a list -> 'b list
*)
