CaseG VarG (fromList [(Nothing,IteG EmptyG EmptyG EmptyG),(Nothing,ListG EmptyG Nothing)])
match l with
| [] -> []
| h :: t -> if h = 0
            then removeZero t
            else l
match y with
| [] -> []
| hd :: tl -> if tl = []
              then [(hd , x)]
              else (hd , x) :: (argmaker x
                                         tl)
match y with
| [] -> []
| hd :: tl -> if tl = []
              then [(hd , x)]
              else (hd , x) :: (argmaker x
                                         tl)
match y with
| [] -> []
| hd :: tl -> if tl = []
              then [(hd , x)]
              else (hd , x) :: (argmaker x
                                         tl)
match y with
| [] -> []
| hd :: tl -> if tl = []
              then [(hd , x)]
              else (hd , x) :: (argmaker x
                                         tl)
match l with
| [] -> []
| h :: t -> if h = 0
            then removeZero t
            else l
match l with
| [] -> []
| h :: t -> if h = 0
            then removeZero t
            else l
match l with
| [] -> []
| h :: t -> if h = 0
            then removeZero t
            else l
