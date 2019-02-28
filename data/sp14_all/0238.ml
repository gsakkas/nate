
let rec append x y = match y with | [] -> [x] | h::t -> h :: (append x t);;

let rec digitsOfInt n =
  if n < 0
  then []
  else
    (let (x,y) = ((n mod 10), (n / 10)) in
     if n < 10 then [n] else append x (digitsOfInt y));;

let digits n = digitsOfInt (abs n);;

let rec additivePersistence n =
  let x = 0 in if n < 10 then x else additivePersistence (digits n);;


(* fix

let rec additivePersistence n =
  let x = 0 in if n < 10 then x else additivePersistence (n - 50);;

*)

(* changed spans
(13,28)-(14,67)
let x = 0 in
if n < 10
then x
else additivePersistence (n - 50)
LetG NonRec (fromList [LitG]) (IteG EmptyG EmptyG EmptyG)

*)

(* changed exprs
Let (Just (3,2)-(3,65)) NonRec [(VarPat (Just (3,6)-(3,7)) "x",Lit (Just (3,10)-(3,11)) (LI 0))] (Ite (Just (3,15)-(3,65)) (Bop (Just (3,18)-(3,24)) Lt (Var (Just (3,18)-(3,19)) "n") (Lit (Just (3,22)-(3,24)) (LI 10))) (Var (Just (3,30)-(3,31)) "x") (App (Just (3,37)-(3,65)) (Var (Just (3,37)-(3,56)) "additivePersistence") [Bop (Just (3,57)-(3,65)) Minus (Var (Just (3,58)-(3,59)) "n") (Lit (Just (3,62)-(3,64)) (LI 50))]))
*)

(* typed spans
(3,2)-(3,65)
*)

(* correct types
int
*)

(* bad types
int -> int
*)
