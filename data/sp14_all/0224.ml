
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  if depth = 0 then (if (rand (0, 1)) = 0 then buildX () else buildY ());;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  if depth = 0
  then (if (rand (0, 1)) = 0 then buildX () else buildY ())
  else (let y = rand (2, 6) in buildX ());;

*)

(* changed spans
(16,2)-(16,72)
let y = rand (2 , 6) in
buildX ()
LetG NonRec (fromList [AppG (fromList [EmptyG])]) (AppG (fromList [EmptyG]))

*)

(* changed exprs
Let (Just (18,7)-(18,41)) NonRec [(VarPat (Just (18,12)-(18,13)) "y",App (Just (18,16)-(18,27)) (Var (Just (18,16)-(18,20)) "rand") [Tuple (Just (18,21)-(18,27)) [Lit (Just (18,22)-(18,23)) (LI 2),Lit (Just (18,25)-(18,26)) (LI 6)]])] (App (Just (18,31)-(18,40)) (Var (Just (18,31)-(18,37)) "buildX") [ConApp (Just (18,38)-(18,40)) "()" Nothing (Just (TApp "unit" []))])
*)

(* typed spans
(18,7)-(18,41)
*)

(* correct types
expr
*)

(* bad types
unit
*)
