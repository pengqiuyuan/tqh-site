tqh-site
=======================
2014-7-7
---------------------------------
1、tqh-site框架的搭建完成
2、使用tqh的会员模型，
	entity
	dao
	service
	controller的完成
3、会员的登录模块(service)
	(1)service添加findByEmailAndStatus（通过email查找用户）
	(2)iExist（判断邮箱登陆名是否存在）	
4、会员的快速注册模块(service)
2014-7-8
------------------------
1、登录、快速注册controller部 的完成(宏伟)
2、完成会员登录、快速注册模块(宏伟)
3、首页跳转
4、球房入驻模块(秋源)
2014-7-9
-----------------------------------
1、首页的添加
2、layouts布局的添加、上中下
3、首页展示的完成
2014-7-10
------------------------------------------
1、会员登录、注册部分已完成()
2、配置shiro 用户表改为member表，实现自动登录，及角色管理(宏伟)

2014-7-11
-----------------------------------
1、球房入驻完成  、图片预览、图片拖拽上传（使用 http://www.zhangxinxu.com/study/201109/html5-file-image-ajax-upload.html）
2、修改球房入驻 http://jasny.github.io/bootstrap/getting-started/
3、使用jasny，bootstrap的一个插件https://github.com/pengqiuyuan/tqh-site/blob/dev/tqh_image/4.png
![Image text](https://raw.githubusercontent.com/pengqiuyuan/tqh-site/dev/tqh_image/4.png)

2014-7-12
---------------------------------
1、实时聊天模块儿的添加（连接pomelo服务器已完成）
2、进入房间、发送消息、广播（未完成）
3、界面设计（未完成)

2014-7-14
----------------------------------
1、实时聊天模块儿的添加（连接pomelo服务器已完成） 2、进入房间、发送消息、广播（未完成） 3、界面设计（未完成)

2014-7-15
---------------------------------
1、聊天模块的修改、基本功能测试完成 2、删除多余样式 3、界面设计的完善

2014-7-16
---------------------------------
1、出现台球会原有用户无法登陆，查明原因Shiro去做的登录查询认证的时候,有多加一个盐值的参数验证，而本身台球会是没有这个字段的

2014-7-16
---------------------------------
1、聊天模块对服务器部分的修改，遇到一个麻烦的问题，
       单用户多客户端连接聊天服务器是出现的session不唯一的问题，
       只能sessionService.kick(uid)剔除当前的session，先这样解决吧

2014-7-17
---------------------------------
1、视频直播的完成
