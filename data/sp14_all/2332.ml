
let rec clone x n =
  let accum = [] in if n < 1 then [] else (clone x) :: (accum (n - 1));;


(* fix

let rec clone x n =
  let accum = [] in
  let helper x n = if n < 1 then accum else x :: accum in helper x (n - 1);;

*)

(* changed spans
(3,20)-(3,70)
let helper =
  fun x ->
    fun n ->
      if n < 1
      then accum
      else x :: accum in
helper x (n - 1)
LetG NonRec (fromList [LamG EmptyG]) (AppG (fromList [EmptyG]))

*)

(* changed exprs
Let (Just (4,2)-(4,74)) NonRec [(VarPat (Just (4,6)-(4,12)) "helper",Lam (Just (4,13)-(4,54)) (VarPat (Just (4,13)-(4,14)) "x") (Lam (Just (4,15)-(4,54)) (VarPat (Just (4,15)-(4,16)) "n") (Ite (Just (4,19)-(4,54)) (Bop (Just (4,22)-(4,27)) Lt (Var (Just (4,22)-(4,23)) "n") (Lit (Just (4,26)-(4,27)) (LI 1))) (Var (Just (4,33)-(4,38)) "accum") (ConApp (Just (4,44)-(4,54)) "::" (Just (Tuple (Just (4,44)-(4,54)) [Var (Just (4,44)-(4,45)) "x",Var (Just (4,49)-(4,54)) "accum"])) Nothing)) Nothing) Nothing)] (App (Just (4,58)-(4,74)) (Var (Just (4,58)-(4,64)) "helper") [Var (Just (4,65)-(4,66)) "x",Bop (Just (4,67)-(4,74)) Minus (Var (Just (4,68)-(4,69)) "n") (Lit (Just (4,72)-(4,73)) (LI 1))])
*)

(* typed spans
(4,2)-(4,74)
*)

(* correct types
'a list
*)

(* bad types
'a list
*)
