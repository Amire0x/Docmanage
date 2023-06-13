from sm4_c import SM4
key = "0123456789ABCDEFFEDCBA9876543210"
SM4 = SM4()

# p = b'hello world!'
# c = SM4.encryptSM4(key,p)
# print(c)
# print(SM4.decryptSM4(key,c))

# p = b'hello world hello world!'
# c = SM4.encryptSM4(key,p)
# print(c)
# print(SM4.decryptSM4(key,c))

# with open('testpy/1.docx','rb') as f:
#     f_s = f.read()
#     f_encrypt = SM4.encryptSM4(key,f_s) # 传入字节，返回的是字节
#     with open('testpy/2.docx','wb') as f:
#         f.write(f_encrypt)

# with open('testpy/2.docx','rb') as f:
#      f_decrypt = SM4.decryptSM4(key,f.read()) # 传入的是字节，返回字节
#      print(f_decrypt)
#      with open('testpy/3.docx','wb') as f:
#         f.write(f_decrypt)


# with open('testpy/1.txt','rb') as f:
#      f_encrypt = SM4.encryptSM4(key,f.read()) # 传入的是字节，返回字节
#      print(f_encrypt)
#      with open('testpy/2.txt','wb') as f:
#         f.write(f_encrypt)

with open('testpy/test.docx','rb') as f:
     f_decrypt = SM4.decryptSM4(key,f.read()) # 传入的是字节，返回字节
     print(f_decrypt)
     with open('testpy/test1.docx','wb') as f:
        f.write(f_decrypt)



    