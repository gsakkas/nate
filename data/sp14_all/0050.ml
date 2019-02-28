
let pipe fs =
  let f a x a x n = x a in let base = 0 in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x g b y n = match n with | [] -> n | _ -> y b in
  let base = f 0 [] in List.fold_left f base fs;;

*)

(* changed spans
(3,12)-(3,23)
fun g ->
  fun b ->
    fun y ->
      fun n ->
        match n with
        | [] -> n
        | _ -> y b
LamG (LamG EmptyG)

(3,38)-(3,39)
f 0 []
AppG (fromList [LitG,ListG EmptyG])

(3,43)-(3,67)
[]
ListG EmptyG

*)

(* changed exprs
Lam (Just (3,12)-(3,55)) (VarPat (Just (3,12)-(3,13)) "g") (Lam (Just (3,14)-(3,55)) (VarPat (Just (3,14)-(3,15)) "b") (Lam (Just (3,16)-(3,55)) (VarPat (Just (3,16)-(3,17)) "y") (Lam (Just (3,18)-(3,55)) (VarPat (Just (3,18)-(3,19)) "n") (Case (Just (3,22)-(3,55)) (Var (Just (3,28)-(3,29)) "n") [(ConPat (Just (3,37)-(3,39)) "[]" Nothing,Nothing,Var (Just (3,43)-(3,44)) "n"),(WildPat (Just (3,47)-(3,48)),Nothing,App (Just (3,52)-(3,55)) (Var (Just (3,52)-(3,53)) "y") [Var (Just (3,54)-(3,55)) "b"])]) Nothing) Nothing) Nothing) Nothing
App (Just (4,13)-(4,19)) (Var (Just (4,13)-(4,14)) "f") [Lit (Just (4,15)-(4,16)) (LI 0),List (Just (4,17)-(4,19)) [] Nothing]
List (Just (4,17)-(4,19)) [] Nothing
*)

(* typed spans
(3,12)-(3,55)
(4,13)-(4,19)
(4,17)-(4,19)
*)

(* correct types
'a -> 'b -> ('b -> 'c list) -> 'c list -> 'c list
'a -> 'b -> ('b -> 'c list) -> 'c list -> 'c list
'a list
*)

(* bad types
'a -> ('a -> 'b) -> 'c -> 'b
int
'a
*)
