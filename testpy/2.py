import binascii

from gmssl import sm4


class SM4:
    """
    国产加密 sm4加解密
    """

    def __init__(self):
        self.crypt_sm4 = sm4.CryptSM4()  # 实例化

    def str_to_hexStr(self, hex_str):
        """
        字符串转hex
        :param hex_str: 字符串
        :return: hex
        """
        hex_data = hex_str.encode('utf-8')
        str_bin = binascii.unhexlify(hex_data)
        return str_bin.decode('utf-8')

    def encryptSM4(self, encrypt_key, value):
        """
        国密sm4加密
        :param encrypt_key: sm4加密key
        :param value: 待加密的字符串
        :return: sm4加密后的十六进制值
        """
        crypt_sm4 = self.crypt_sm4
        crypt_sm4.set_key(encrypt_key.encode(), sm4.SM4_ENCRYPT)  # 设置密钥
        date_str = str(value)
        encrypt_value = crypt_sm4.crypt_ecb(date_str.encode())  # 开始加密。bytes类型
        return encrypt_value.hex()  # 返回十六进制值

    def decryptSM4(self, decrypt_key, encrypt_value):
        """
        国密sm4解密
        :param decrypt_key:sm4加密key
        :param encrypt_value: 待解密的十六进制值
        :return: 原字符串
        """
        crypt_sm4 = self.crypt_sm4
        crypt_sm4.set_key(decrypt_key.encode(), sm4.SM4_DECRYPT)  # 设置密钥
        decrypt_value = crypt_sm4.crypt_ecb(bytes.fromhex(encrypt_value))  # 开始解密。十六进制类型
        return decrypt_value.decode()
        # return self.str_to_hexStr(decrypt_value.hex())


# if __name__ == '__main__':
#     key = "0123456789ABCDEFFEDCBA9876543210"
#     # strData = "hello world! hello world!"
#     SM4 = SM4()
#     # print("原字符：", strData)
#     # encData = SM4.encryptSM4(key, strData)  # 加密后的数据，返回bytes类型
#     # print("sm4加密结果：", encData)
    
#     # decData = SM4.decryptSM4(key, encData)
#     # print("sm4解密结果：", decData)  # 解密后的数据s

#     with open('file_manage/1.txt','r') as f:
#         f_s = f.read()
#         print(f_s)
#         f_encrypt = SM4.encryptSM4(key,f_s)
#         print(f_encrypt)
#         f_decrypt = SM4.decryptSM4(key,f_encrypt)
#         print(f_decrypt)
#         with open('file_manage/2.txt','w') as f:
#             f.write(f_decrypt)