module EA where

data State = S0 | S1 | S2 | S3 | S4 | S5 | S6 | S7 | S8 | S9 | S10 | Serror
    deriving (Eq, Show)

-- Sigma = e, h, i, l, n, o, t, w

sigma :: State -> Char -> State
-- verschiedene Lösungsmöglichkeiten für jeden Zustand
-- Pattern Matching
sigma S0 'n' = S1
sigma S0 'w' = S6
-- Verwendung von Guards
sigma S1 c
    | c == 'e' = S2
    | c == 'o' = S4
-- Alternative mit if then else
-- sigma S1 c = if c == 'e'
--                  then S2
--                  else if c == 'o'
--                           then S4
--                           else Serror
sigma S2 'w' = S3
sigma S4 't' = S5
sigma S6 'h' = S7
sigma S7 'i' = S8
sigma S8 'l' = S9
sigma S9 'e' = S10
sigma _  _   = Serror

start :: State
start = S0

sAccept :: [State]
sAccept = [S3, S5, S10]

accept :: String -> Bool
accept word =
  case foldl sigma start word of
    s | s `elem` sAccept -> True
    _ -> False

