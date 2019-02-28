
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

let rec digitalRoot n = let (l,r) = additivePersAndRoot abs n 0 in r;;


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

let rec digitalRoot n = let (l,r) = additivePersAndRoot (abs n) 0 in r;;

*)

(* changed spans
(16,36)-(16,63)
additivePersAndRoot (abs n) 0
AppG (fromList [AppG (fromList [EmptyG]),LitG])

*)

(* changed exprs
App (Just (16,36)-(16,65)) (Var (Just (16,36)-(16,55)) "additivePersAndRoot") [App (Just (16,56)-(16,63)) (Var (Just (16,57)-(16,60)) "abs") [Var (Just (16,61)-(16,62)) "n"],Lit (Just (16,64)-(16,65)) (LI 0)]
*)

(* typed spans
(16,36)-(16,65)
*)

(* correct types
(int * int)
*)

(* bad types
('a * 'b)
*)
