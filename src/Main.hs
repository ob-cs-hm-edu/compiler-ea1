module Main where

import System.IO (hSetBuffering, BufferMode(NoBuffering), stdout)

import EA (accept)

main :: IO ()
main = do
    hSetBuffering stdout NoBuffering
    putStr "Bitte Wort eingeben: "
    word <- getLine
    putStrLn $ "===> " ++ if accept word then "accepted" else "rejected"
    main
