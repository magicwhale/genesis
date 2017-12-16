; ModuleID = 'Genesis'
target datalayout = "e-m:o-i64:64-f80:128-n8:16:32:64-S128"

%color = type { i32, i32, i32 }

@cl = global i32 0
@fmt = private unnamed_addr constant [4 x i8] c"%d\0A\00"
@fmt.1 = private unnamed_addr constant [5 x i8] c"%lf\0A\00"
@fmt.2 = private unnamed_addr constant [4 x i8] c"%s\0A\00"
@fmt.3 = private unnamed_addr constant [4 x i8] c"%d\0A\00"
@fmt.4 = private unnamed_addr constant [5 x i8] c"%lf\0A\00"
@fmt.5 = private unnamed_addr constant [4 x i8] c"%s\0A\00"
@fmt.6 = private unnamed_addr constant [4 x i8] c"%d\0A\00"
@fmt.7 = private unnamed_addr constant [5 x i8] c"%lf\0A\00"
@fmt.8 = private unnamed_addr constant [4 x i8] c"%s\0A\00"

declare i32 @printf(i8*, ...)

declare i32 @printbig(i32)

declare i32 @initScreen(%color*, i32, i32)

declare void @startGame(%color*, i32, i32)

declare i1 @isKeyDown(i8*)

declare i1 @isKeyUp(i8*)

declare i1 @isKeyHeld(i8*)

declare i32 @newCluster(i32, i32, i32, i32, i32, i32, %color*)

declare i32 @randomInt(i32)

declare i1 @detectCollision(i32, i32)

declare i32 @getX(i32)

declare i32 @getY(i32)

declare i32 @getDX(i32)

declare i32 @getDY(i32)

declare i32 @getHeight(i32)

declare i32 @getWidth(i32)

declare %color* @getColor(i32)

declare i1 @getDraw(i32)

declare i32 @setX(i32, i32)

declare void @setY(i32, i32)

declare void @setDX(i32, i32)

declare void @setDY(i32, i32)

declare void @setHeight(i32, i32)

declare void @setWidth(i32, i32)

declare void @setColor(i32, %color*)

declare void @setDraw(i32, i1)

define void @update(i32 %f) {
entry:
  %f1 = alloca i32
  store i32 %f, i32* %f1
  %cl = load i32, i32* @cl
  %cl2 = load i32, i32* @cl
  %xVal = call i32 @getX(i32 %cl2)
  %tmp = add i32 %xVal, 50
  %0 = call i32 @setX(i32 %cl, i32 %tmp)
  ret void
}

define i32 @main() {
entry:
  %c = alloca %color*
  %c2 = alloca %color*
  %color_tmp = alloca %color
  %clr_ptr = alloca %color*
  %r = getelementptr inbounds %color, %color* %color_tmp, i32 0, i32 0
  store i32 0, i32* %r
  %g = getelementptr inbounds %color, %color* %color_tmp, i32 0, i32 1
  store i32 0, i32* %g
  %b = getelementptr inbounds %color, %color* %color_tmp, i32 0, i32 2
  store i32 255, i32* %b
  store %color* %color_tmp, %color** %clr_ptr
  %0 = load %color*, %color** %clr_ptr
  store %color* %0, %color** %c
  %c1 = load %color*, %color** %c
  %newClust = call i32 @newCluster(i32 50, i32 50, i32 100, i32 100, i32 0, i32 0, %color* %c1)
  store i32 %newClust, i32* @cl
  %color_tmp2 = alloca %color
  %clr_ptr3 = alloca %color*
  %r4 = getelementptr inbounds %color, %color* %color_tmp2, i32 0, i32 0
  store i32 0, i32* %r4
  %g5 = getelementptr inbounds %color, %color* %color_tmp2, i32 0, i32 1
  store i32 255, i32* %g5
  %b6 = getelementptr inbounds %color, %color* %color_tmp2, i32 0, i32 2
  store i32 0, i32* %b6
  store %color* %color_tmp2, %color** %clr_ptr3
  %1 = load %color*, %color** %clr_ptr3
  store %color* %1, %color** %c2
  %c27 = load %color*, %color** %c2
  call void @startGame(%color* %c27, i32 640, i32 480)
  %printf = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @fmt.3, i32 0, i32 0), i32 1)
  ret i32 0
}

define void @init() {
entry:
  ret void
}
