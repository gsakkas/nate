CaseG VarG (fromList [(Nothing,IteG EmptyG EmptyG EmptyG)])
match a with
| (a , b) -> if ((fst x + snd x) + a) > 9
             then (1 , (((fst x + snd x) + a) mod 10) :: b)
             else (0 , (((fst x + snd x) + a) mod 10) :: b)
| _ -> if (fst x + snd x) > 9
       then (1 , [(fst x + snd x) mod 10])
       else (0 , [(fst x + snd x) mod 10])
match a with
| (c , h :: t) -> if ((fst x + snd x) + c) > 9
                  then (1 , (((fst x + snd x) + c) mod 10) :: t)
                  else (0 , (((fst x + snd x) + c) mod 10) :: t)
match x with
| (x , y) -> if y = false
             then x
             else wwhile (f , x)
