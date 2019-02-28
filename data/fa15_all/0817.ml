
let rec digitsOfInt n =
  let rec loop x listX =
    if x = 0 then listX else loop (x / 10) ((x mod 10) :: listX) in
  match n with | 0 -> [0] | x' -> loop x' [];;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec additivePersistence n =
  let rec itt x i =
    if x < 10
    then i
    else
      (let x' = sumList (digitsOfInt x) in
       if x' > 9 then (i + 1) + (itt x') else 1) in
  match n with | 0 -> 0 | y' -> itt y';;


(* fix

let rec digitsOfInt n =
  let rec loop x listX =
    if x = 0 then listX else loop (x / 10) ((x mod 10) :: listX) in
  match n with | 0 -> [0] | x' -> loop x' [];;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec additivePersistence n =
  let rec itt x i =
    if x < 10
    then i
    else
      (let x' = sumList (digitsOfInt x) in
       if x' > 9 then 1 + (itt x' i) else 1) in
  match n with | 0 -> 0 | y' -> itt y' 0;;

*)

(* changed spans
(15,22)-(15,29)
1
LitG

(15,32)-(15,40)
itt x' i
AppG (fromList [VarG])

(16,32)-(16,38)
itt y' 0
AppG (fromList [VarG,LitG])

*)

(* changed exprs
Lit (Just (15,22)-(15,23)) (LI 1)
App (Just (15,26)-(15,36)) (Var (Just (15,27)-(15,30)) "itt") [Var (Just (15,31)-(15,33)) "x'",Var (Just (15,34)-(15,35)) "i"]
App (Just (16,32)-(16,40)) (Var (Just (16,32)-(16,35)) "itt") [Var (Just (16,36)-(16,38)) "y'",Lit (Just (16,39)-(16,40)) (LI 0)]
*)

(* typed spans
(15,22)-(15,23)
(15,26)-(15,36)
(16,32)-(16,40)
*)

(* correct types
int
int
int
*)

(* bad types
int
int
int
*)
