
let listReverse l =
  let rec lr l' = function | [] -> l' | h::t -> lr (h :: l') t in lr [] l;;

let rec digitsOfInt n =
  let this =
    match n with
    | 0 -> []
    | n -> if n < 0 then [] else (n mod 10) :: (digitsOfInt (n / 10)) in
  this listReverse n;;


(* fix

let listReverse l =
  let rec lr l' = function | [] -> l' | h::t -> lr (h :: l') t in lr [] l;;

let rec digitsOfInt n =
  let xxx n =
    match n with
    | 0 -> []
    | n -> if n < 0 then [] else (n mod 10) :: (digitsOfInt (n / 10)) in
  listReverse (xxx n);;

*)

(* changed spans
(6,2)-(10,20)
let xxx =
  fun n ->
    match n with
    | 0 -> []
    | n -> if n < 0
           then []
           else (n mod 10) :: (digitsOfInt (n / 10)) in
listReverse (xxx n)
LetG NonRec (fromList [LamG EmptyG]) (AppG (fromList [EmptyG]))

*)

(* changed exprs
Let (Just (6,2)-(10,21)) NonRec [(VarPat (Just (6,6)-(6,9)) "xxx",Lam (Just (6,10)-(9,69)) (VarPat (Just (6,10)-(6,11)) "n") (Case (Just (7,4)-(9,69)) (Var (Just (7,10)-(7,11)) "n") [(LitPat (Just (8,6)-(8,7)) (LI 0),Nothing,List (Just (8,11)-(8,13)) [] Nothing),(VarPat (Just (9,6)-(9,7)) "n",Nothing,Ite (Just (9,11)-(9,69)) (Bop (Just (9,14)-(9,19)) Lt (Var (Just (9,14)-(9,15)) "n") (Lit (Just (9,18)-(9,19)) (LI 0))) (List (Just (9,25)-(9,27)) [] Nothing) (ConApp (Just (9,33)-(9,69)) "::" (Just (Tuple (Just (9,33)-(9,69)) [Bop (Just (9,33)-(9,43)) Mod (Var (Just (9,34)-(9,35)) "n") (Lit (Just (9,40)-(9,42)) (LI 10)),App (Just (9,47)-(9,69)) (Var (Just (9,48)-(9,59)) "digitsOfInt") [Bop (Just (9,60)-(9,68)) Div (Var (Just (9,61)-(9,62)) "n") (Lit (Just (9,65)-(9,67)) (LI 10))]])) Nothing))]) Nothing)] (App (Just (10,2)-(10,21)) (Var (Just (10,2)-(10,13)) "listReverse") [App (Just (10,14)-(10,21)) (Var (Just (10,15)-(10,18)) "xxx") [Var (Just (10,19)-(10,20)) "n"]])
*)

(* typed spans
(6,2)-(10,21)
*)

(* correct types
int list
*)

(* bad types
int list
*)
