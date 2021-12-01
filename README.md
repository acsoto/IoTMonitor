# IoTMonitor

用于展示IoT课程开发板的相关信息并进行控制

可以通过调用我们部署的服务器api及时获取开发板的温湿度数据，也可以发送开关电机的指令，并且可以设置温湿度超过某阈值后报警，同时有历史记录来提供任意时间段内好看的温湿度曲线

![](http://pic.mcatk.com/soto-pictures/2021-12/IoTMonitor展示gif.gif)


## 图片

![](https://tva1.sinaimg.cn/large/008i3skNly1gwuux5q5zhj30v90u0wgv.jpg)

## 简介

### 主页面

分为三个部分：设备状态，历史记录，设置

UI整体使用卡片式扁平设计

#### 设备状态

刷新按钮和更新温湿度数据，温湿度可以显示此时设备的温湿度传感器信息，打开电机和关闭电机功能用于控制控制板马达

其中，温湿度会每秒自动进行更新，2位小数点保留

![](https://tva1.sinaimg.cn/large/008i3skNly1gwuv4m8stbj30zu0u0gmq.jpg)

#### 历史记录

通过DatePicker选择起止时间，再点击获取，即可得到此段时间内的温湿度曲线，触摸曲线还可以动态显示任意一点的数值（此处使用了ChartView库）

默认显示2天前到现在的曲线，第一次打开app时会同步一次


![](https://tva1.sinaimg.cn/large/008i3skNly1gwuv6rhzk8j310g0u0jsq.jpg)

#### 设置

在设置页面，通过选择器选择阈值后点击保存，当温度高于此阈值时，开发板电机将会转动

同时，打开app后每次阈值的设置会被记录，以便查看设置情况

![](https://tva1.sinaimg.cn/large/008i3skNly1gwuvd7193mj30zu0u0752.jpg)

## 功能

- 实时显示开发板传感器温湿度
- 实时控制开发板电机马达转动与否
- 获取任意时间段开发板传感器温湿度历史曲线
- 通过设置过热阈值，当温度超过此值，进行报警
- 后台实时更新

## 实现

该app主要通过HTTP GET和POST请求像我们的服务器后端发送请求，后端通过电信平台的api调用来发送相关指令，电信平台再把指令下达到开发板，来实现app与开发板的交互

该app的UI其中一部分复用了我之前的项目[Memo](https://github.com/acsoto/Memo)的代码
