
let rec digitsOfInt n =
  if n <= 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

let digits n = digitsOfInt (abs n);;

let rec sumList xs = match xs with | [] -> 0 | t::h -> t + (sumList h);;

let rec additivePersAndRoot num persCount =
  let absNum = abs num in
  if absNum < 10
  then (persCount, absNum)
  else
    (let xs = digits absNum in
     let theSum = sumList xs in additivePersAndRoot theSum (persCount + 1));;

let rec additivePersistence n = let (l,r) = additivePersAndRoot n in l;;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

let digits n = digitsOfInt (abs n);;

let rec sumList xs = match xs with | [] -> 0 | t::h -> t + (sumList h);;

let rec additivePersAndRoot absNum persCount =
  if absNum < 10
  then (persCount, absNum)
  else
    (let xs = digits absNum in
     let theSum = sumList xs in additivePersAndRoot theSum (persCount + 1));;

let rec additivePersistence n =
  let (l,r) = additivePersAndRoot (abs n) 0 in l;;

*)

(* changed spans
(9,28)-(15,75)
fun absNum ->
  fun persCount ->
    if absNum < 10
    then (persCount , absNum)
    else (let xs =
            digits absNum in
          let theSum = sumList xs in
          additivePersAndRoot theSum
                              (persCount + 1))
LamG (LamG EmptyG)

(17,44)-(17,65)
additivePersAndRoot (abs n) 0
AppG (fromList [AppG (fromList [EmptyG]),LitG])

*)

(* changed exprs
Lam (Just (9,28)-(14,75)) (VarPat (Just (9,28)-(9,34)) "absNum") (Lam (Just (9,35)-(14,75)) (VarPat (Just (9,35)-(9,44)) "persCount") (Ite (Just (10,2)-(14,75)) (Bop (Just (10,5)-(10,16)) Lt (Var (Just (10,5)-(10,11)) "absNum") (Lit (Just (10,14)-(10,16)) (LI 10))) (Tuple (Just (11,7)-(11,26)) [Var (Just (11,8)-(11,17)) "persCount",Var (Just (11,19)-(11,25)) "absNum"]) (Let (Just (13,4)-(14,75)) NonRec [(VarPat (Just (13,9)-(13,11)) "xs",App (Just (13,14)-(13,27)) (Var (Just (13,14)-(13,20)) "digits") [Var (Just (13,21)-(13,27)) "absNum"])] (Let (Just (14,5)-(14,74)) NonRec [(VarPat (Just (14,9)-(14,15)) "theSum",App (Just (14,18)-(14,28)) (Var (Just (14,18)-(14,25)) "sumList") [Var (Just (14,26)-(14,28)) "xs"])] (App (Just (14,32)-(14,74)) (Var (Just (14,32)-(14,51)) "additivePersAndRoot") [Var (Just (14,52)-(14,58)) "theSum",Bop (Just (14,59)-(14,74)) Plus (Var (Just (14,60)-(14,69)) "persCount") (Lit (Just (14,72)-(14,73)) (LI 1))])))) Nothing) Nothing
App (Just (17,14)-(17,43)) (Var (Just (17,14)-(17,33)) "additivePersAndRoot") [App (Just (17,34)-(17,41)) (Var (Just (17,35)-(17,38)) "abs") [Var (Just (17,39)-(17,40)) "n"],Lit (Just (17,42)-(17,43)) (LI 0)]
*)

(* typed spans
(9,28)-(14,75)
(17,14)-(17,43)
*)

(* correct types
int -> int -> (int * int)
(int * int)
*)

(* bad types
int -> int -> (int * int)
int -> (int * int)
*)
