






ｓｅｌｅｃｔ　ｔｉｔｌｅ，　ｃｏｕｎｔ（＊）
　　ｆｒｏｍ　ｔｉｔｌｅｓ
ｗｈｅｒｅ　ｔｏ＿ｄａｔｅ　＝　＇９９９９９－０１－０１＇　　　＃현재의　ｔｉｔｌｅ
ｇｒｏｕｐ　ｂｙ　１　　　　　　＃특정필드의　필드를　한개의　그룹으로　묶어줌
ｈａｖｉｎｇ　ｃｏｕｎｔ（＊）　＜　１０　　　　＃집계된　내용에　대한　조건문을　달수있다．　（한개의　그룹으로만　묶을경우　해당줄　생략가능）
；　　　　　　　　　　　　　　　　　　　　　　　　＃　집계함수에　ｗｈｅｒｅ를　쓸수없어　ｈａｖｉｎｇ절이　생겨남
　


＃　ｃａｓｅ　표현식　：　카테고리화함，　컨디션이　트루일경우　반환해　빠져나감
ｃａｓｅ
ｗｈｅｎ　ｃｏｎｄｉｔｉｏｎ１　ｔｈｅｎ　ｒｅｓｕｌｔ１　　　＃트루일경우　ｅｎｄ로　빠져나감
ｗｈｅｎ　ｃｏｎｄｉｔｉｏｎ２　ｔｈｅｎ　ｒｅｓｕｌｔ２　　　＃ｆａｌｓｅ일경우　ｎｕｌｌ됨
ｃａｓｅ　ｒｅｓｕｌｔ
ＥＮＤ；　





