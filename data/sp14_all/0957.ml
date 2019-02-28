
let rec append xs x =
  match xs with | [] -> [x] | hd::tl -> hd :: (append tl x);;

let rec digitsOfInt n =
  if n <= 0 then [] else append digitsOfInt (n / 10) (n - ((n / 10) * 10));;


(* fix

let rec append xs x =
  match xs with | [] -> [x] | hd::tl -> hd :: (append tl x);;

let rec digitsOfInt n =
  if n <= 0 then [] else append (digitsOfInt (n / 10)) (n - ((n / 10) * 10));;

*)

(* changed spans
(6,25)-(6,74)
append (digitsOfInt (n / 10))
       (n - ((n / 10) * 10))
AppG (fromList [AppG (fromList [EmptyG]),BopG EmptyG EmptyG])

*)

(* changed exprs
App (Just (6,25)-(6,76)) (Var (Just (6,25)-(6,31)) "append") [App (Just (6,32)-(6,54)) (Var (Just (6,33)-(6,44)) "digitsOfInt") [Bop (Just (6,45)-(6,53)) Div (Var (Just (6,46)-(6,47)) "n") (Lit (Just (6,50)-(6,52)) (LI 10))],Bop (Just (6,55)-(6,76)) Minus (Var (Just (6,56)-(6,57)) "n") (Bop (Just (6,60)-(6,75)) Times (Bop (Just (6,61)-(6,69)) Div (Var (Just (6,62)-(6,63)) "n") (Lit (Just (6,66)-(6,68)) (LI 10))) (Lit (Just (6,72)-(6,74)) (LI 10)))]
*)

(* typed spans
(6,25)-(6,76)
*)

(* correct types
int list
*)

(* bad types
'a list
*)
