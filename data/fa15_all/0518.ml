
let sqsum xs = List.fold_right (fun x  -> fun n  -> n * n) 0;;


(* fix

let sqsum xs =
  let f a x = a + (x * x) in let base = 0 in List.fold_left f base xs;;

*)

(* changed spans
(2,15)-(2,60)
let f =
  fun a ->
    fun x -> a + (x * x) in
let base = 0 in
List.fold_left f base xs
LetG NonRec (fromList [LamG EmptyG]) (LetG NonRec (fromList [EmptyG]) EmptyG)

*)

(* changed exprs
Let (Just (3,2)-(3,69)) NonRec [(VarPat (Just (3,6)-(3,7)) "f",Lam (Just (3,8)-(3,25)) (VarPat (Just (3,8)-(3,9)) "a") (Lam (Just (3,10)-(3,25)) (VarPat (Just (3,10)-(3,11)) "x") (Bop (Just (3,14)-(3,25)) Plus (Var (Just (3,14)-(3,15)) "a") (Bop (Just (3,18)-(3,25)) Times (Var (Just (3,19)-(3,20)) "x") (Var (Just (3,23)-(3,24)) "x"))) Nothing) Nothing)] (Let (Just (3,29)-(3,69)) NonRec [(VarPat (Just (3,33)-(3,37)) "base",Lit (Just (3,40)-(3,41)) (LI 0))] (App (Just (3,45)-(3,69)) (Var (Just (3,45)-(3,59)) "List.fold_left") [Var (Just (3,60)-(3,61)) "f",Var (Just (3,62)-(3,66)) "base",Var (Just (3,67)-(3,69)) "xs"]))
*)

(* typed spans
(3,2)-(3,69)
*)

(* correct types
int
*)

(* bad types
'a
*)
