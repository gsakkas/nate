
let rec digitsOfInt n =
  let rec loop x listX =
    if x = 0 then listX else loop (x / 10) ((x mod 10) :: listX) in
  match n with | 0 -> [0] | x' -> loop x' [];;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec additivePersistence n =
  let rec loop x y =
    if x < 10 then y else loop ((sumList (digitsOfInt x)) + y) in
  match n with | 0 -> 0 | x' -> loop x' 0;;


(* fix

let rec digitsOfInt n =
  let rec loop x listX =
    if x = 0 then listX else loop (x / 10) ((x mod 10) :: listX) in
  match n with | 0 -> [0] | x' -> loop x' [];;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec additivePersistence n =
  let rec loop x y =
    if x < 10
    then y
    else loop (sumList (digitsOfInt x)) ((sumList (digitsOfInt x)) + y) in
  match n with | 0 -> 0 | x' -> loop x' 0;;

*)

(* changed spans
(11,26)-(11,62)
loop (sumList (digitsOfInt x))
     (sumList (digitsOfInt x) + y)
AppG (fromList [AppG (fromList [EmptyG]),BopG EmptyG EmptyG])

*)

(* changed exprs
App (Just (13,9)-(13,71)) (Var (Just (13,9)-(13,13)) "loop") [App (Just (13,14)-(13,39)) (Var (Just (13,15)-(13,22)) "sumList") [App (Just (13,23)-(13,38)) (Var (Just (13,24)-(13,35)) "digitsOfInt") [Var (Just (13,36)-(13,37)) "x"]],Bop (Just (13,40)-(13,71)) Plus (App (Just (13,41)-(13,66)) (Var (Just (13,42)-(13,49)) "sumList") [App (Just (13,50)-(13,65)) (Var (Just (13,51)-(13,62)) "digitsOfInt") [Var (Just (13,63)-(13,64)) "x"]]) (Var (Just (13,69)-(13,70)) "y")]
*)

(* typed spans
(13,9)-(13,71)
*)

(* correct types
int
*)

(* bad types
int
*)
