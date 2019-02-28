
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
  match depth with
  | 0 -> if (rand (0, 1)) = 0 then buildX () else buildY ()
  | _ -> let y = rand (2, 6) in if y == 2 then buildX ();;


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
(16,2)-(18,56)
if depth = 0
then if rand (0 , 1) = 0
     then buildX ()
     else buildY ()
else (let y = rand (2 , 6) in
      buildX ())
IteG (BopG EmptyG EmptyG) (IteG EmptyG EmptyG EmptyG) (LetG NonRec (fromList [EmptyG]) EmptyG)

*)

(* changed exprs
Ite (Just (16,2)-(18,41)) (Bop (Just (16,5)-(16,14)) Eq (Var (Just (16,5)-(16,10)) "depth") (Lit (Just (16,13)-(16,14)) (LI 0))) (Ite (Just (17,7)-(17,59)) (Bop (Just (17,11)-(17,28)) Eq (App (Just (17,11)-(17,24)) (Var (Just (17,12)-(17,16)) "rand") [Tuple (Just (17,17)-(17,23)) [Lit (Just (17,18)-(17,19)) (LI 0),Lit (Just (17,21)-(17,22)) (LI 1)]]) (Lit (Just (17,27)-(17,28)) (LI 0))) (App (Just (17,34)-(17,43)) (Var (Just (17,34)-(17,40)) "buildX") [ConApp (Just (17,41)-(17,43)) "()" Nothing (Just (TApp "unit" []))]) (App (Just (17,49)-(17,58)) (Var (Just (17,49)-(17,55)) "buildY") [ConApp (Just (17,56)-(17,58)) "()" Nothing (Just (TApp "unit" []))])) (Let (Just (18,7)-(18,41)) NonRec [(VarPat (Just (18,12)-(18,13)) "y",App (Just (18,16)-(18,27)) (Var (Just (18,16)-(18,20)) "rand") [Tuple (Just (18,21)-(18,27)) [Lit (Just (18,22)-(18,23)) (LI 2),Lit (Just (18,25)-(18,26)) (LI 6)]])] (App (Just (18,31)-(18,40)) (Var (Just (18,31)-(18,37)) "buildX") [ConApp (Just (18,38)-(18,40)) "()" Nothing (Just (TApp "unit" []))]))
*)

(* typed spans
(16,2)-(18,41)
*)

(* correct types
expr
*)

(* bad types
expr
*)
