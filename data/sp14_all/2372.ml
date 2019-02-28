
let stringOfList f l = failwith List.map (fun x  -> "") l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = sepConcat "," (List.map f l);;

*)

(* changed spans
(2,17)-(2,57)
fun sep ->
  fun sl ->
    match sl with
    | [] -> ""
    | h :: t -> (let f =
                   fun a ->
                     fun x -> a ^ (sep ^ x) in
                 let base = h in
                 let l = t in
                 List.fold_left f base l)
LamG (LamG EmptyG)

(2,23)-(2,57)
sepConcat "," (List.map f l)
AppG (fromList [AppG (fromList [EmptyG]),LitG])

*)

(* changed exprs
Lam (Just (2,18)-(7,58)) (VarPat (Just (2,18)-(2,21)) "sep") (Lam (Just (2,22)-(7,58)) (VarPat (Just (2,22)-(2,24)) "sl") (Case (Just (3,2)-(7,58)) (Var (Just (3,8)-(3,10)) "sl") [(ConPat (Just (4,4)-(4,6)) "[]" Nothing,Nothing,Lit (Just (4,10)-(4,12)) (LS "")),(ConsPat (Just (5,4)-(5,8)) (VarPat (Just (5,4)-(5,5)) "h") (VarPat (Just (5,7)-(5,8)) "t"),Nothing,Let (Just (6,6)-(7,58)) NonRec [(VarPat (Just (6,10)-(6,11)) "f",Lam (Just (6,12)-(6,31)) (VarPat (Just (6,12)-(6,13)) "a") (Lam (Just (6,14)-(6,31)) (VarPat (Just (6,14)-(6,15)) "x") (App (Just (6,18)-(6,31)) (Var (Just (6,20)-(6,21)) "^") [Var (Just (6,18)-(6,19)) "a",App (Just (6,22)-(6,31)) (Var (Just (6,27)-(6,28)) "^") [Var (Just (6,23)-(6,26)) "sep",Var (Just (6,29)-(6,30)) "x"]]) Nothing) Nothing)] (Let (Just (7,6)-(7,58)) NonRec [(VarPat (Just (7,10)-(7,14)) "base",Var (Just (7,17)-(7,18)) "h")] (Let (Just (7,22)-(7,58)) NonRec [(VarPat (Just (7,26)-(7,27)) "l",Var (Just (7,30)-(7,31)) "t")] (App (Just (7,35)-(7,58)) (Var (Just (7,35)-(7,49)) "List.fold_left") [Var (Just (7,50)-(7,51)) "f",Var (Just (7,52)-(7,56)) "base",Var (Just (7,57)-(7,58)) "l"]))))]) Nothing) Nothing
App (Just (9,23)-(9,51)) (Var (Just (9,23)-(9,32)) "sepConcat") [Lit (Just (9,33)-(9,36)) (LS ","),App (Just (9,37)-(9,51)) (Var (Just (9,38)-(9,46)) "List.map") [Var (Just (9,47)-(9,48)) "f",Var (Just (9,49)-(9,50)) "l"]]
*)

(* typed spans
(2,18)-(7,58)
(9,23)-(9,51)
*)

(* correct types
string -> string list -> string
string
*)

(* bad types
'a -> 'b -> 'c
'a
*)
