
let listReverse l =
  let rec reverseHelper l rl =
    match l with | [] -> rl | h::t -> reverseHelper t (h :: rl) in
  reverseHelper l [];;

let rec digitsOfInt n =
  let digOfInt n =
    match n > 0 with
    | false  -> []
    | true  ->
        (match n > 9 with
         | false  -> n :: (digitsOfInt (n / 10))
         | true  -> (n mod 10) :: (digitsOfInt (n / 10))) in
  listReverse n;;


(* fix

let listReverse l =
  let rec reverseHelper l rl =
    match l with | [] -> rl | h::t -> reverseHelper t (h :: rl) in
  reverseHelper l [];;

let rec digitsOfInt n =
  listReverse
    (match n > 0 with
     | false  -> []
     | true  ->
         (match n > 9 with
          | false  -> n :: (digitsOfInt (n / 10))
          | true  -> (n mod 10) :: (digitsOfInt (n / 10))));;

let rec digOfInt n =
  match n > 0 with
  | false  -> []
  | true  ->
      (match n > 9 with
       | false  -> n :: (digitsOfInt (n / 10))
       | true  -> (n mod 10) :: (digitsOfInt (n / 10)));;

let rec digitsOfInt n = digOfInt n;;

*)

(* changed spans
(8,2)-(15,15)
listReverse (match n > 0 with
             | false -> []
             | true -> match n > 9 with
                       | false -> n :: (digitsOfInt (n / 10))
                       | true -> (n mod 10) :: (digitsOfInt (n / 10)))
AppG (fromList [CaseG EmptyG (fromList [(Nothing,EmptyG)])])

(15,2)-(15,15)
fun n -> digOfInt n
LamG (AppG (fromList [EmptyG]))

(15,2)-(15,13)
digOfInt
VarG

*)

(* changed exprs
App (Just (8,2)-(14,59)) (Var (Just (8,2)-(8,13)) "listReverse") [Case (Just (9,4)-(14,59)) (Bop (Just (9,11)-(9,16)) Gt (Var (Just (9,11)-(9,12)) "n") (Lit (Just (9,15)-(9,16)) (LI 0))) [(LitPat (Just (10,7)-(10,12)) (LB False),Nothing,List (Just (10,17)-(10,19)) [] Nothing),(LitPat (Just (11,7)-(11,11)) (LB True),Nothing,Case (Just (12,9)-(14,58)) (Bop (Just (12,16)-(12,21)) Gt (Var (Just (12,16)-(12,17)) "n") (Lit (Just (12,20)-(12,21)) (LI 9))) [(LitPat (Just (13,12)-(13,17)) (LB False),Nothing,ConApp (Just (13,22)-(13,49)) "::" (Just (Tuple (Just (13,22)-(13,49)) [Var (Just (13,22)-(13,23)) "n",App (Just (13,27)-(13,49)) (Var (Just (13,28)-(13,39)) "digitsOfInt") [Bop (Just (13,40)-(13,48)) Div (Var (Just (13,41)-(13,42)) "n") (Lit (Just (13,45)-(13,47)) (LI 10))]])) Nothing),(LitPat (Just (14,12)-(14,16)) (LB True),Nothing,ConApp (Just (14,21)-(14,57)) "::" (Just (Tuple (Just (14,21)-(14,57)) [Bop (Just (14,21)-(14,31)) Mod (Var (Just (14,22)-(14,23)) "n") (Lit (Just (14,28)-(14,30)) (LI 10)),App (Just (14,35)-(14,57)) (Var (Just (14,36)-(14,47)) "digitsOfInt") [Bop (Just (14,48)-(14,56)) Div (Var (Just (14,49)-(14,50)) "n") (Lit (Just (14,53)-(14,55)) (LI 10))]])) Nothing)])]]
Lam (Just (24,20)-(24,34)) (VarPat (Just (24,20)-(24,21)) "n") (App (Just (24,24)-(24,34)) (Var (Just (24,24)-(24,32)) "digOfInt") [Var (Just (24,33)-(24,34)) "n"]) Nothing
Var (Just (24,24)-(24,32)) "digOfInt"
*)

(* typed spans
(8,2)-(14,59)
(24,20)-(24,34)
(24,24)-(24,32)
*)

(* correct types
int list
int -> int list
int -> int list
*)

(* bad types
'a list
'a list
'a list -> 'a list
*)
