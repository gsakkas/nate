
let stringOfList f l =
  ("[" (fun x  -> fun acc  -> x ^ ("; " ^ acc)) List.fold_left (^) ""
     (List.map f l))
    ^ "]";;


(* fix

let stringOfList f l =
  "[" ^
    ((List.fold_left (fun x  -> fun acc  -> x ^ ("; " ^ acc)) ""
        (List.map f l))
       ^ "]");;

*)

(* changed spans
(3,2)-(4,20)
"["
LitG

(3,2)-(4,20)
List.fold_left (fun x ->
                  fun acc -> x ^ ("; " ^ acc))
               "" (List.map f l) ^ "]"
AppG (fromList [AppG (fromList [EmptyG]),LitG])

*)

(* changed exprs
Lit (Just (3,2)-(3,5)) (LS "[")
App (Just (4,4)-(6,13)) (Var (Just (6,7)-(6,8)) "^") [App (Just (4,5)-(5,23)) (Var (Just (4,6)-(4,20)) "List.fold_left") [Lam (Just (4,21)-(4,61)) (VarPat (Just (4,26)-(4,27)) "x") (Lam (Just (4,32)-(4,60)) (VarPat (Just (4,36)-(4,39)) "acc") (App (Just (4,44)-(4,60)) (Var (Just (4,46)-(4,47)) "^") [Var (Just (4,44)-(4,45)) "x",App (Just (4,48)-(4,60)) (Var (Just (4,54)-(4,55)) "^") [Lit (Just (4,49)-(4,53)) (LS "; "),Var (Just (4,56)-(4,59)) "acc"]]) Nothing) Nothing,Lit (Just (4,62)-(4,64)) (LS ""),App (Just (5,8)-(5,22)) (Var (Just (5,9)-(5,17)) "List.map") [Var (Just (5,18)-(5,19)) "f",Var (Just (5,20)-(5,21)) "l"]],Lit (Just (6,9)-(6,12)) (LS "]")]
*)

(* typed spans
(3,2)-(3,5)
(4,4)-(6,13)
*)

(* correct types
string
string
*)

(* bad types
string
string
*)
