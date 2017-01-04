require 'simplecov'
SimpleCov.start

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'll_pay'

LlPay.oid_partner = '201103171000000000'

LlPay.rsa_pri_key = <<-EOF
-----BEGIN PRIVATE KEY-----
MIICdgIBADANBgkqhkiG9w0BAQEFAASCAmAwggJcAgEAAoGBANa4zOJbVHFp7T2c
fpiAbTYrghTpcPGt1ZetPeSoWa5d27+RofmV8QjhJq/PF5uKKRe2mjYySVQRi3/x
dXoPlWgGKWA8Yf0fbVIEsQiYjLJvPn856XHlXaDe0P+TJXYlu7fv2M0KDMDb3Vbb
DmloRrwehWfdbpfle3scL3M4U2dvAgMBAAECgYBogxyelKueZFuoIHLyEZiWxEiV
myZxTBZptFYq5NJ5749VSDJZxGTE2Ko26oroFzB3LVcUSBevBrcquEFg/xLN4W98
VvRh4K/fZoLGaq702qgLxi6GaT5D/qxCS5nR+ywD7x8HygKWEnLlcgJnYy+b23Bm
omy7jveK5GCsSBsmSQJBAPpa5CPjfjcWQ96mxDeWnHnaoEEfEIxpV4CvCG6hPs8z
6hN2GwjRgw212K+YN24C02UubnJjTYFmPcqGW3ln1h0CQQDbkDnd+9IU3+cJv9lL
CHetlpqJu889fHNRDKJjZN1TcuOoFbFpHcWRy8e9HVf2+6HyviviACjbAm/zkSfr
KQ37AkBfQMvCl+DCxtbl1N+dItHATx1gCZi7Q61GSdJUfUcvgNoTs4EPtt89DS43
iRu14J9bxPHC1eN8U1E5SCtvosFFAkAmRd3QdDUKrnz3lhmqmq9B8x69I5/cd/Ui
C7HC4bIy+bP1eNKUIDxwTbVjodnTk8mHJt8/Zge5JZOeQY9TzrRBAkEA4zz/xhlM
aFHWL/XRi/w6mxWEUSB0MaKznI1IQKxtmk4/dZnIi0CYRMOweQ5Z7srxL7IKlhEE
d2q+YV7MPK9i9Q==
-----END PRIVATE KEY-----
EOF

LlPay::YT_PUB_KEY = <<-EOF
-----BEGIN PUBLIC KEY-----
MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDWuMziW1Rxae09nH6YgG02K4IU
6XDxrdWXrT3kqFmuXdu/kaH5lfEI4SavzxebiikXtpo2MklUEYt/8XV6D5VoBilg
PGH9H21SBLEImIyybz5/Oelx5V2g3tD/kyV2Jbu379jNCgzA291W2w5paEa8HoVn
3W6X5Xt7HC9zOFNnbwIDAQAB
-----END PUBLIC KEY-----
EOF

LlPay.md5_key = '201408071000001543test_20140812'
