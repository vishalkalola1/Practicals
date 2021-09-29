#  Lyst Practical

### Requirement
- Xcode 12.5.1
- Swift 5

* Note:- For smooth process use bigger device to run project like (* iPhone 11,12, pro, max, plus etc etc...)  

### Steps to run project

1) Build whole project by pressing command + B or go to Product menu -> click on Analyze
2) Select any simulator and hit play icon or press command + R
3) Once app is launch it will call first api for get the All breeds and list down all into grid view.
4) Now User can search breed using name into search field.
5) Once you select any cat from grid it will redirect to you into detail page.
6) In the detail page user can see the all details of cat including external wikipedia link.
7) Once user click on wikipedia button it will open link into safari to read more in details.


### Limitation

1) User can not search remote using api in this project. only local search appear for breed using name. we can improve search by different criteria using name, breed id, height, weight, description key words, etc etc....
2) Graphics of app icon and other used as a local which is not good but if some designer porvide me then it will looks good into UX
3) Might be iPad design is not good due to more focus on iphone. but we can change using size class.
4) At looking into screen design we can improve by help of UI and UX designer.
5) Into detail screen we can improve by dividing into submodule and merge into this screen.
6) We can create reusable subcomponents and use into class.


### Code structure

1) I follow MVVM-C structure for integrate this project because it solve more problem likes readability, dirty code. it follow most solid principles.
2) In this project i devide code into more parts like views, viewmodels, services, network, models, coordinators and frameworks.


* Note: Added Diagram for understand architecture. It almost similar to images.
