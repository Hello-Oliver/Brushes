# Brushes
Using Processing: simulate the Chinese ink style &amp; free particle growing style

## 绘图结果
![image](https://github.com/Hello-Oliver/Code-Drawing/blob/master/snow.PNG)
## "绘画系统"主题绘图作业链接
#### [https://github.com/Hello-Oliver/Brushes](https://github.com/Hello-Oliver/Brushes)
## 写在前面
-   在这里我们的作画者限定为电脑的使用者。当然，在学习和实现的过程中，我也看了许多的画作发现：越简单的、越基本的作画工具反而能够创作出更多内容丰富的作品，而对于有些发非常漂亮的笔刷，虽然单单比起来确实要比简单的笔触要好看许多，但是在某种程度上也大大限制了画者的创作，可以说是因为它太具有特征了，任何创作都离不开那种风格。
在我所做的这个绘画系统中，我比较倾向于制作几种比较好玩的笔刷和交互效果，仅仅作为娱乐，其实并谈不上是在进行作画，因为我最终实现的结果是将3种笔刷分别放在3个不同的画纸上进行涂抹，相当于是对这种笔刷的展示。

## 内容介绍
# UI界面
![image](https://github.com/Hello-Oliver/Brushes/blob/master/a.png)
-  个人感觉这个界面是十分简洁且具有亲和力的，点击不同的button可以进入不同的笔刷界面，我总共整合了三种笔刷，分别是Chinese Ink Feel笔刷，Blue Free Growth笔刷，Chinese Brush笔刷，（info是有关这三个笔刷灵感来源以及参考来源的说明）
	实现这个UI界面的逻辑是用了State的原理，在全局定义几种状态（state），根据keyPressed以及buttonPressed的事件响应做出状态的转换，最后在Processing的draw函数中判断当前属于哪一种状态，进而进入相应状态的draw_n函数进行对当前显示框的刷新。
- 状态转换部分：
```ecmascript 6
//Sample
void mousePressed() {
  //General setting
  if (state == 0) {
    if (dist(mouseX, mouseY, 180, 180)<guideRoundr/2) {
      state = 1;
    }
  }
  //解释：若鼠标点击 & 此时状态是0（初始） & 点击在状态1按钮范围，则状态变为1
```
-  控制部分
```ecmascript 6
//Sample
void draw() {
  if (state == 0) { 
    drawZero();
  } 
}
```
# Chinese Ink Style笔刷
![image](https://github.com/Hello-Oliver/Brushes/blob/master/c.png)
-   这个笔刷算是一个尝试，可能结果并不是特别好，主要是为了尝试不同的交互方式里面用到的交互方式有左键点击、拖动（鼠标不按下）、右键点击、左键点击非常缓慢的拖动，等等
-左键点击可以生成从中心到鼠标位置的一个正方形，填充颜色在一个范围内随机。
```ecmascript 6
//Sample:
if (mousePressed && (mouseButton == LEFT)) {
    stroke (10) ;
    fill(random(150), 50, random(250), 25);
    noStroke ();
    rect (360, 270, mouseX - 360, mouseY - 270) ;
  }
  
```
-   右键点击可以在鼠标位置附近随机生成大小不一，颜色不一的圆点
```ecmascript 6
//Sample：
if (mousePressed && (mouseButton == RIGHT)) {
    fill(random(225), 50, random(150), random(150 ));
    ellipse(mouseX+random(-40, 40), mouseY+random(-40, 40), first_ellipse, first_ellipse);
  }

```
-  最后将更新过的雪花的位置画出来
```ecmascript 6
  void render() {
    // stroke(255);
    // strokeWeight(r);
    // point(pos.x, pos.y);
    pushMatrix();
    translate(pos.x + xOff, pos.y);
    rotate(angle);
    imageMode(CENTER);
    image(img, 0, 0, r, r);
    popMatrix();


  }
}
```
-   左键移动可以生成虽位置不同而大小变化的有一定透明度的灰色圆，左键点击并十分缓慢地拖动效果类似右键点击，只是生成的颜色有些不同
```ecmascript 6
//Sample:
  if (!mousePressed) {
    fill (10, 10, 10, 10);
    ellipse (mouseX, mouseY, first_ellipse, first_ellipse);
  };

```
# Particle Growth笔刷
![image](https://github.com/Hello-Oliver/Brushes/blob/master/d.png)
- 在这个笔刷中，我引用了开源网站上提供的一个粒子类Particle类，这个类可以生成粒子，记录这个粒子当前的位置信息，速度信息，加速度信息。
- 在这个笔刷中，用户可以通过案件（‘r’ ‘g’ ‘b’）来更改粒子的色系
- 位置信息由鼠标点击的位置决定。
- 速度信息随机产生：
```ecmascript 6
//Sample:
float randDegrees = random(360);
vel = new PVector(cos(radians(randDegrees)), sin(radians(randDegrees)));
vel.mult(random(5));
//也就是说，粒子运动的初始速度是随机的，可以指向平面内的任意方向

```
- 加速度信息初始默认值为（0，0），每次更新加速度的大小和方向
```ecmascript 6
//Sample:
float rn = (noise((loc.x+frameCount+xOffset)*0.01, (loc.y+frameCount+yOffset)*0.01)-0.5)*4*PI;
float mag = noise((loc.y+frameCount)*0.01, (loc.x+frameCount)*0.01);
PVector dir = new PVector(cos(rn), sin(rn));
acc.add(dir);
acc.mult(mag);

```
- 可以看出，加速度的更新也是具有随机性的，所以才能形成运动具有随机性的粒子，但是不可否认的，这种随机性反而使得画面自带着一种创造性，随意的点击，就可以形成十分洒脱、自由奔放的效果。
# Chinese Brush笔刷
![image](https://github.com/Hello-Oliver/Brushes/blob/master/e.png)
- 在这个笔刷中最为主要的就是墨色深浅和笔触的粗细这两种效果。
- 为了能够更加贴近实际体验，我设计了一个“墨盒”放在左上角，用于蘸墨水。
- 墨色深浅：这里用于控制墨色深浅的是stroke（）函数的透明度参数，初始时灰度值设置为0（即黑色），透明度设置为255（即不透明），当用户点击鼠标左键并拖动时，这时随着一帧一帧的更新，透明度每次递减1，直至为0（全透明），在这个过程中就基本模拟出了毛笔蘸墨水写字时墨色的变化。
```ecmascript 6
//Sample:
if (mousePressed == true) {
      //gradient
      if (alpha > 1){ 
        // disable option of no line at all
        alpha-=1;
    }
//其中alpha代表strokeColor（填充颜色）的透明度 

```
- 笔触的粗细：这里用于控制笔触粗细另外写了一个函数来控制，利用的是processing中（mouseX，mouseY）和（pmouseX，pmouseY）两个宏定义变量，分别是这一帧中的鼠标位置和上一帧中的鼠标位置。
	这两个作差就形成了一个速度，那么我就可以利用这个速度来决定笔触的粗细。
```ecmascript 6
//Sample:
float brushStroke(){
  		float speed = (abs(mouseX-pmouseX) + abs(mouseY-pmouseY))/10; //originally /5
  		speed = constrain(speed, 1, brushWidth);
  		speed *= -1;
  		sw += speed + 3;
  		sw = constrain(sw, 2 , 25);
  		return sw;
}
//其中speed就是作差得到的速度，使speed *= -1;  sw += speed + 3;
//得到的结果就是当速度越大时，笔触就越细，
//但也不至于是负值，因为我在sw = constrain(sw, 2 , 25); 中设置了笔触的范围，
//使其最小值为2，最大值为25。返回值sw就是计算得到的当前笔触粗细。

```
- 为了能够使得点与点之间不太突兀（因为每帧之间可能两个点的位置差距较大就会分离开，显得不像是一条连续的笔画，所以就又添加了点与点之间的连线）
```ecmascript 6
//Sample:
if (mousePressed == true) {
    if (pausing == false){
      //drawing
      strokeWeight(brushStroke()); 
      // change width according to speed of stroke
      stroke(strokeColor,alpha)；
      line(mouseX, mouseY, pmouseX, pmouseY);
	}
}
//其中pausing是一个boolean变量，用于判断鼠标是否处于静止不动的状态。

```
## 参考资料
- 什么是绘画？——以抽象思维理解绘画
- https://blog.csdn.net/magicbrushlv/article/details/83858469

- processing编程艺术|constrain使用方法
- http://iprocessing.cn/author/constrain/

