
let digitsOfInt n =
  if n < 0
  then []
  else
    (let rec loop n acc =
       if n = 0 then acc else loop (n / 10) ((n mod 10) :: acc) in
     match n with | 0 -> [0] | _ -> loop n []);;

let digits n = digitsOfInt (abs n);;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec digitalRoot n =
  let x = sumList (digits n) in if x > 9 then digitalRoot x else sumList x;;


(* fix

let digitsOfInt n =
  if n < 0
  then []
  else
    (let rec loop n acc =
       if n = 0 then acc else loop (n / 10) ((n mod 10) :: acc) in
     match n with | 0 -> [0] | _ -> loop n []);;

let digits n = digitsOfInt (abs n);;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec digitalRoot n =
  if (sumList (digits n)) > 9
  then digitalRoot (sumList (digits n))
  else sumList (digits n);;

*)

(* changed spans
(15,2)-(15,74)
if sumList (digits n) > 9
then digitalRoot (sumList (digits n))
else sumList (digits n)
IteG (BopG EmptyG EmptyG) (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

*)

(* changed exprs
Ite (Just (15,2)-(17,25)) (Bop (Just (15,5)-(15,29)) Gt (App (Just (15,5)-(15,25)) (Var (Just (15,6)-(15,13)) "sumList") [App (Just (15,14)-(15,24)) (Var (Just (15,15)-(15,21)) "digits") [Var (Just (15,22)-(15,23)) "n"]]) (Lit (Just (15,28)-(15,29)) (LI 9))) (App (Just (16,7)-(16,39)) (Var (Just (16,7)-(16,18)) "digitalRoot") [App (Just (16,19)-(16,39)) (Var (Just (16,20)-(16,27)) "sumList") [App (Just (16,28)-(16,38)) (Var (Just (16,29)-(16,35)) "digits") [Var (Just (16,36)-(16,37)) "n"]]]) (App (Just (17,7)-(17,25)) (Var (Just (17,7)-(17,14)) "sumList") [App (Just (17,15)-(17,25)) (Var (Just (17,16)-(17,22)) "digits") [Var (Just (17,23)-(17,24)) "n"]])
*)

(* typed spans
(15,2)-(17,25)
*)

(* correct types
int
*)

(* bad types
'a
*)
