![image](https://github.com/TongFangyuan/IMGPickerManager/blob/master/IMGPickerManager.png)

![version](https://img.shields.io/badge/version-0.1.2-brightgreen.svg)
![liscense](https://img.shields.io/badge/license-MIT-lightgrey.svg)
![Language](https://img.shields.io/badge/Language-%20Objective%20C%20-blue.svg)

一个集成简单、高效、轻量级、持续更新的第三方图片选择框架



特性
-----

- [x] 支持选择图片（普通图片，GIF格式图片等）
- [x] 支持选择LivePhoto
- [x] 支持选择Video
- [x] 支持3D Touch预览
- [x] 集成简单高效

### 更多特性

有更多需求或发现bug的朋友欢迎新建 [Issues](https://github.com/TongFangyuan/IMGPickerManager/issues/new)，目前更多特性本人也在积极开发中...


环境要求
----

- iOS 8.0 及以上
- Xcode 8.0 及以上

如何使用
----
### 调用`IMGPickerManager`工具

```objective-c
#import "IMGPickerManager.h"
...
[IMGPickerManager startChoose:^(NSArray<PHAsset *> *results, NSError *error) {
    if (!error) {
        NSLog(@"user chosse %@",results);
    }else {
        NSLog(@"chosse error: %@",error.localizedDescription);
    }
}];
```
### `IMGPhotoManager`管理获取数据

获取`NSData`对象调用`requestDataForAsset:handler:`方法

获取缩略图`requestImageForAsset:targetSize:handler:`方法

获取原图`requestImageDataForAsset:handler:`方法

安装
----

- [x] 手动
- [x] cocopods集成

### 手动集成
将`IMGPickerManager`文件夹直接拖到项目中就可以了

### cocopods集成

```
platform :ios, '8.0'
    use_frameworks!
    target 'MyApp' do
    pod 'IMGPickerManager'
end
```

依赖
------
依赖第三方框架`Mansory`

效果图
------

<img src="https://github.com/TongFangyuan/IMGPickerManager/blob/master/images/2.png"/>
<!--<img src="https://github.com/TongFangyuan/IMGPickerManager/blob/master/images/3.jpg" width="235" height="417"/>-->
<!--<img src="https://github.com/TongFangyuan/IMGPickerManager/blob/master/images/4.jpg" width="235" height="417"/>-->
<img src="https://github.com/TongFangyuan/IMGPickerManager/blob/master/images/1.GIF" width="235" height="417"/>

Licenses
------

All source code is licensed under the [MIT License](https://github.com/TongFangyuan/IMGPickerManager/blob/master/LICENSE).

