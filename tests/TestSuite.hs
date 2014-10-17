module Main where

import Test.Framework
import Test.Framework.Providers.HUnit
import Test.Framework.Providers.QuickCheck2

import Test.QuickCheck
import Test.HUnit

import EA (accept)

-- UnitTests for "new", "not" and "while"
acceptNew, acceptNot, acceptWhile :: Assertion
acceptNew   = assertBool "accepting new"   $ accept "new"
acceptNot   = assertBool "accepting not"   $ accept "not"
acceptWhile = assertBool "accepting while" $ accept "while"

-- QuickCheck for the rest
prop_doNotAccept :: String -> Property
prop_doNotAccept word =
    (word `notElem` ["new", "not", "while"])
        ==> not $ accept word

tests :: [Test.Framework.Test]
tests =
  [  testGroup "QuickCheck Tests"
    [ testProperty "do not accept anything else" prop_doNotAccept
    ]
  ,  testGroup "HUnit Tests"
    [ testCase "acceptNew"   acceptNew
    , testCase "acceptNot"   acceptNot
    , testCase "acceptWhile" acceptWhile
    ]
  ]

main :: IO ()
main = defaultMain tests

