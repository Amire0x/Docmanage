from sm4 import SM4
key = bytes.fromhex("0123456789ABCDEFFEDCBA9876543210")  # 128bit密钥
s1 = 'hello world! hello world!'
print(s1)
p1 = bytes(s1,encoding="utf-8")
print(p1)
# 加密
sm4 = SM4(key)
c1 = sm4.encrypt(p1)
print(c1)
print(c1.hex()) # 0c28642a96e9b188d5915e7ededa7a82
# 解密
b1 = sm4.decrypt(c1)
print(b1)
b_s1 = str(b1,encoding="utf-8")
print(b_s1)

# b2 = b'hello world!'
# print(b2)
# c2 = sm4.encrypt(b2)
# print(c2)
# p2 = sm4.decrypt(c2)
# print(p2)

# sm4 = SM4(key)
# with open('file_manage/1.txt','r') as f:
#     f_b = f.read()
#     print(f_b)
#     f_encrypt = sm4.encrypt(bytes(f_b,encoding="utf-8"))
#     print(f_encrypt)
#     f_decrypt = sm4.decrypt(f_encrypt)
#     print(str(f_decrypt,encoding="utf-8"))
#     with open('file_manage/2.txt','w') as f:
#         f.write(str(f_decrypt,encoding="utf-8"))

# with open('file_manage/2.txt','r') as f:
#     f_b = f.read()
#     print(f_b)